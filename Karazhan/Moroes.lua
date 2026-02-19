--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Moroes Raid", 532, 1554)
if not mod then return end
-- Moroes, Baroness Dorothea Millstipe, Baron Rafe Dreuger, Lady Catriona Von'Indi,
-- Lady Keira Berrybuck, Lord Robin Daris, Lord Crispin Ference
mod:RegisterEnableMob(15687, 19875, 19874, 19872, 17007, 19876, 19873)
mod:SetEncounterID(653)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		29448, -- Vanish
		37066, -- Garrote
		37023, -- Frenzy / Enrage
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Garrote", 37066)
	self:Log("SPELL_AURA_APPLIED", "FrenzyEnrage", 37023)
	self:Log("SPELL_AURA_APPLIED", "Vanish", 29448)
end

function mod:OnEngage()
	self:RegisterEvent("UNIT_HEALTH")

	self:CDBar(29448, 35) -- Vanish
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Garrote(args)
	self:TargetMessage(args.spellId, "yellow", args.destName)
	self:PlaySound(args.spellId, "alert", nil, args.destName)
end

function mod:FrenzyEnrage(args)
	self:Message(args.spellId, "orange", CL.percent:format(30, args.spellName))
	self:PlaySound(args.spellId, "long")
end

function mod:Vanish(args)
	self:Message(args.spellId, "red")
	self:CDBar(args.spellId, 35)
	self:PlaySound(args.spellId, "warning")
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 15687 then
		local hp = self:GetHealth(unit)
		if hp < 36 then
			self:UnregisterEvent(event)
			if hp > 30 then
				self:Message(37023, "orange", CL.soon:format(self:SpellName(37023)), false) -- Frenzy / Enrage
			end
		end
	end
end
