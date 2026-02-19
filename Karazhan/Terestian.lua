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

function mod:GetOptions()
	return {
		{30065, "COUNTDOWN"}, -- Broken Pact
		{30115, "ICON"}, -- Sacrifice
		"berserk",
	},nil,{
		[30065] = CL.weakened, -- Broken Pact (Weakened)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "SacrificeApplied", 30115)
	self:Log("SPELL_AURA_REMOVED", "SacrificeRemoved", 30115)

	self:Log("SPELL_AURA_APPLIED", "BrokenPactApplied", 30065)
	self:Log("SPELL_AURA_REMOVED", "BrokenPactRemoved", 30065)
end

function mod:OnEngage()
	self:Berserk(600, true)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:SacrificeApplied(args)
	self:TargetMessage(args.spellId, "yellow", args.destName)
	self:TargetBar(args.spellId, 30, args.destName)
	self:CDBar(args.spellId, 42)
	self:PrimaryIcon(args.spellId, args.destName)
	self:PlaySound(args.spellId, "warning", nil, args.destName)
end

function mod:SacrificeRemoved(args)
	self:StopBar(args.spellName, args.destName)
	self:PrimaryIcon(args.spellId)
end

function mod:BrokenPactApplied(args)
	self:Message(args.spellId, "green", CL.weakened)
	self:Bar(args.spellId, 45, CL.weakened)
	self:PlaySound(args.spellId, "long")
end

function mod:BrokenPactRemoved(args)
	self:Message(args.spellId, "red", CL.over:format(CL.weakened))
	self:StopBar(CL.weakened)
	self:PlaySound(args.spellId, "info")
end
