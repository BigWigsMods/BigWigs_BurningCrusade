
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Gurtogg Bloodboil", 796, 1586)
if not mod then return end
mod:RegisterEnableMob(22948)
mod.engageId = 605
--mod.respawnTime = 0

--------------------------------------------------------------------------------
-- Locals
--

local bloodCount = 1

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		42005, -- Bloodboil
		{40604, "ICON", "SAY"}, -- Fel Rage
		{40508, "ICON", "SAY"}, -- Fel-Acid Breath
		{40481, "TANK"}, -- Acidic Wound
		40491, -- Bewildering Strike
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Bloodboil", 42005)
	self:Log("SPELL_AURA_APPLIED", "FelRage", 40604)
	self:Log("SPELL_AURA_REMOVED", "FelRageRemoved", 40604)
	self:Log("SPELL_AURA_REMOVED", "FelRageRemovedFromBoss", 40594)
	self:Log("SPELL_CAST_START", "FelAcidBreath", 40508)

	self:Log("SPELL_AURA_APPLIED", "BewilderingStrikeApplied", 40491)
	self:Log("SPELL_AURA_APPLIED_DOSE", "AcidicWound", 40481)
	self:Log("SPELL_AURA_REMOVED", "AcidicWoundRemoved", 40481)
end

function mod:OnEngage()
	bloodCount = 1

	self:Berserk(600)
	self:CDBar(42005, 11, CL.count:format(self:SpellName(42005), bloodCount)) -- Bloodboil
	self:CDBar(40508, 24.3) -- Fel-Acid Breath
	if not self:Solo() then
		self:CDBar(40604, 49) -- Fel Rage
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Bloodboil(args)
	self:Message(args.spellId, "Attention", "Info", CL.count:format(args.spellName, bloodCount))
	if bloodCount == 3 then bloodCount = 0 end
	bloodCount = bloodCount + 1
	self:Bar(args.spellId, 10, CL.count:format(args.spellName, bloodCount))
end

function mod:FelRage(args)
	self:StopBar(args.spellName) -- Fel Rage
	self:StopBar(CL.count:format(args.spellName, bloodCount)) -- Bloodboil
	self:StopBar(40508) -- Fel-Acid Breath

	if self:Me(args.destGUID) then
		self:Say(args.spellId)
	end
	self:PrimaryIcon(args.spellId, args.destName)
	self:TargetMessage(args.spellId, args.destName, "Urgent", "Alarm", nil, nil, true)
	self:TargetBar(args.spellId, 28, args.destName)
end

function mod:FelRageRemoved(args)
	self:PrimaryIcon(args.spellId)
end

function mod:FelRageRemovedFromBoss(args)
	if self:MobId(args.destGUID) == 22948 then
		bloodCount = 1

		self:Bar(42005, 10, CL.count:format(self:SpellName(42005), bloodCount)) -- Bloodboil
		self:Bar(40604, 60) -- Fel Rage
		--self:Bar(40508, ?) -- Fel-Acid Breath
		self:Message(40604, "Neutral", "Info", CL.over:format(args.spellName)) -- Fel Rage Over
	end
end

do
	local function printTarget(self, player, guid)
		if self:Me(guid) then
			self:Say(40508, 18609) -- 18609 = "Breath"
		end
		self:TargetMessage(40508, player, "Important", "Alert")
		self:PrimaryIcon(40508, player)
		self:ScheduleTimer("PrimaryIcon", 5)
	end

	function mod:FelAcidBreath(args)
		self:GetBossTarget(printTarget, 0.4, args.sourceGUID)
		self:CDBar(args.spellId, 24.3)
	end
end

function mod:BewilderingStrikeApplied(args)
	self:TargetMessage(args.spellId, args.destName, "Positive", "Alert")
end

function mod:AcidicWound(args)
	if args.amount % 3 == 0 and args.amount > 8 then
		self:StackMessage(args.spellId, args.destName, args.amount, "Positive", args.amount > 14 and "Warning")
	end
end

function mod:AcidicWoundRemoved(args)
	if self:Me(args.destGUID) and self:Tank() then
		self:Message(args.spellId, "Positive", nil, CL.removed:format(args.spellName))
	end
end
