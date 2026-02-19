--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("The Curator Raid", 532, 1557)
if not mod then return end
mod:RegisterEnableMob(15691)
mod:SetEncounterID(656)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{30254, "CASTBAR", "CASTBAR_COUNTDOWN"}, -- Evocation
		30403, -- Arcane Infusion
		"berserk",
	},nil,{
		[30254] = CL.weakened, -- Evocation (Weakened)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Evocation", 30254)
	self:Log("SPELL_CAST_SUCCESS", "ArcaneInfusion", 30403)
end

function mod:OnEngage()
	self:RegisterEvent("UNIT_HEALTH")
	self:Berserk(600, true)
	local evocation = self:SpellName(30254)
	self:CDBar(30254, 109, evocation) -- Evocation
	self:DelayedMessage(30254, 39, "yellow", CL.custom_sec:format(evocation, 70))
	self:DelayedMessage(30254, 79, "yellow", CL.custom_sec:format(evocation, 30))
	self:DelayedMessage(30254, 99, "yellow", CL.custom_sec:format(evocation, 10))
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Evocation(args)
	self:Message(args.spellId, "red", CL.other:format(args.spellName, CL.weakened))
	self:CastBar(args.spellId, 20)

	self:Bar(args.spellId, 115)
	self:DelayedMessage(args.spellId, 45, "yellow", CL.custom_sec:format(args.spellName, 70))
	self:DelayedMessage(args.spellId, 85, "yellow", CL.custom_sec:format(args.spellName, 30))
	self:DelayedMessage(args.spellId, 105, "yellow", CL.custom_sec:format(args.spellName, 10))
	self:PlaySound(args.spellId, "warning")
end

function mod:ArcaneInfusion(args)
	self:CancelAllTimers()
	self:StopBar(30254) -- Evocation
	self:StopCastBar(30254) -- Evocation

	self:Message(args.spellId, "orange", CL.percent:format(15, args.spellName))
	self:PlaySound(args.spellId, "long")
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 15691 then
		local hp = self:GetHealth(unit)
		if hp < 20 then
			self:UnregisterEvent(event)
			if hp > 15 then
				self:Message(30403, "orange", CL.soon:format(self:SpellName(30403)), false) -- Arcane Infusion
			end
		end
	end
end
