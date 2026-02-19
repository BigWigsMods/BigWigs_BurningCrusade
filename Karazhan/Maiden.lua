--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Maiden of Virtue Raid", 532, 1555)
if not mod then return end
mod:RegisterEnableMob(16457)
mod:SetEncounterID(654)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{29511, "CASTBAR"}, -- Repentance
		29522, -- Holy Fire
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "HolyFire", 29522)
	self:Log("SPELL_CAST_START", "Repentance", 29511)
end

function mod:OnEngage()
	self:CDBar(29511, 33) -- Repentance
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:HolyFire(args)
	self:TargetMessage(args.spellId, "yellow", args.destName)
	self:PlaySound(args.spellId, "alert", nil, args.destName)
end

function mod:Repentance(args)
	self:Message(args.spellId, "red")
	self:CastBar(args.spellId, 12)
	self:CDBar(args.spellId, 33)
end
