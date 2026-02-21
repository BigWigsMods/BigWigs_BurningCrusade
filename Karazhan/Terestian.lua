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

function mod:MarkDemonChains(_, unit, guid)
	if self:MobId(guid) == 17248 then -- Demon Chains
		self:CustomIcon(demonChainsMarker, unit, 8)
		self:UnregisterTargetEvents()
	end
end

function mod:SacrificeApplied(args)
	self:TargetMessage(args.spellId, "yellow", args.destName)
	self:TargetBar(args.spellId, 30, args.destName)
	self:CDBar(args.spellId, 42)
	-- Register events to auto-mark Demon Chains
	if self:GetOption(demonChainsMarker) then
		self:RegisterTargetEvents("MarkDemonChains")
	end
	if self:Me(args.destGUID) then
		self:Say(args.spellId, nil, nil, "Sacrifice")
	end
	self:PlaySound(args.spellId, "warning", nil, args.destName)
end

function mod:SacrificeRemoved(args)
	self:StopBar(args.spellName, args.destName)
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
