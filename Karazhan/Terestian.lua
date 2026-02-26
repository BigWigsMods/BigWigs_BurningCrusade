--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Terestian Illhoof", 532, 1560)
if not mod then return end
mod:RegisterEnableMob(15688)
mod:SetEncounterID(657)

--------------------------------------------------------------------------------
-- Initialization
--

local demonChainsMarker = mod:AddMarkerOption(true, "npc", 8, 30115, 8) -- Sacrifice
function mod:GetOptions()
	return {
		30065, -- Broken Pact
		{30115, "SAY"}, -- Sacrifice
		demonChainsMarker,
		"berserk",
	},nil,{
		[30065] = CL.weakened, -- Broken Pact (Weakened)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Sacrifice", 30115)
	self:Log("SPELL_AURA_APPLIED", "SacrificeApplied", 30115)
	self:Log("SPELL_AURA_REMOVED", "SacrificeRemoved", 30115)

	self:Log("SPELL_AURA_APPLIED", "BrokenPactApplied", 30065)
	self:Log("SPELL_AURA_REMOVED", "BrokenPactRemoved", 30065)
end

function mod:OnEngage()
	self:CDBar(30115, 30.5) -- Sacrifice
	self:Berserk(600, true)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MarkDemonChains(_, unit, guid)
	if self:MobId(guid) == 17248 then -- Demon Chains
		self:CustomIcon(demonChainsMarker, unit, 8)
		self:UnregisterTargetEvents()
	end
end

do
	local function printTarget(self, player, guid)
		self:TargetMessage(30115, "yellow", player)
		if self:Me(guid) then
			self:Say(30115, nil, nil, "Sacrifice")
		end
		self:PlaySound(30115, "warning", nil, player)
	end
	function mod:Sacrifice(args)
		self:GetUnitTarget(printTarget, 0.5, args.sourceGUID)
		self:CDBar(args.spellId, 42)
		-- Register events to auto-mark Demon Chains
		if self:GetOption(demonChainsMarker) then
			self:RegisterTargetEvents("MarkDemonChains")
		end
	end
end

function mod:SacrificeApplied(args)
	self:TargetBar(args.spellId, 30, args.destName)
end

function mod:SacrificeRemoved(args)
	self:StopBar(args.spellName, args.destName)
end

function mod:BrokenPactApplied(args)
	self:Message(args.spellId, "green", CL.weakened)
	self:Bar(args.spellId, 41, CL.weakened)
	self:PlaySound(args.spellId, "long")
end

function mod:BrokenPactRemoved(args)
	self:Message(args.spellId, "red", CL.over:format(CL.weakened))
	self:StopBar(CL.weakened)
	self:PlaySound(args.spellId, "info")
end
