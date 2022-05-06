
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("The Eredar Twins", 580, 1594)
if not mod then return end
mod:RegisterEnableMob(25166, 25165) -- Grand Warlock Alythess, Lady Sacrolash
mod:SetEncounterID(727)
mod:SetRespawnTime(30)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		45230, -- Pyrogenics
		45256, -- Confounding Blow
		45248, -- Shadow Blades
		{45342, "ICON", "SAY"}, -- Conflagration
		{45329, "ICON", "SAY"}, -- Shadow Nova
		"proximity",
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Pyrogenics", 45230)
	self:Log("SPELL_DISPEL", "PyrogenicsDispelled", "*")
	self:Log("SPELL_CAST_SUCCESS", "ConfoundingBlow", 45256)
	self:Log("SPELL_CAST_START", "ShadowBlades", 45248)
	self:Log("SPELL_CAST_START", "ConflagrationStart", 45342)
	self:Log("SPELL_AURA_APPLIED", "Conflagration", 45342)
	self:Log("SPELL_AURA_REMOVED", "ConflagrationRemoved", 45342)
	self:Log("SPELL_CAST_START", "ShadowNovaStart", 45329)
	self:Log("SPELL_CAST_SUCCESS", "ShadowNovaSuccess", 45329)
end

function mod:OnEngage()
	self:Berserk(360)
	self:OpenProximity("proximity", 10)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Pyrogenics(args)
	if self:MobId(args.destGUID) == 25166 then -- Grand Warlock Alythess
		self:TargetMessageOld(args.spellId, args.destName, "orange")
		self:Bar(args.spellId, 15)
		if self:Dispeller("magic", true) then -- Offensive dispeller
			self:PlaySound(args.spellId, "info")
		end
	end
end

function mod:PyrogenicsDispelled(args)
	if args.extraSpellId == 45230 then
		self:MessageOld(45230, "green", "info", CL.removed_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
		self:StopBar(45230)
	end
end

function mod:ConfoundingBlow(args)
	self:CDBar(args.spellId, 20)
end

function mod:ShadowBlades(args)
	self:Bar(args.spellId, 10)
end

do
	local function printTarget(self, name, guid)
		self:TargetMessageOld(45342, name, "yellow", "warning")
		self:PrimaryIcon(45342, name)
		if self:Me(guid) then
			self:Say(45342)
		end
	end

	function mod:ConflagrationStart(args)
		self:GetUnitTarget(printTarget, 0.3, args.sourceGUID)
	end
end

function mod:Conflagration(args)
	self:TargetBar(args.spellId, 10, args.destName)
end

function mod:ConflagrationRemoved(args)
	self:PrimaryIcon(args.spellId)
end

do
	local function printTarget(self, name, guid)
		self:TargetMessageOld(45329, name, "red", "long", nil, nil, true)
		self:SecondaryIcon(45329, name)
		if self:Me(guid) then
			self:Say(45329)
		end
	end

	function mod:ShadowNovaStart(args)
		self:GetUnitTarget(printTarget, 0.3, args.sourceGUID)
	end
end

function mod:ShadowNovaSuccess(args)
	self:SecondaryIcon(args.spellId)
end
