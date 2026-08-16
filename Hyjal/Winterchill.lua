--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Rage Winterchill", 534, 1577)
if not mod then return end
mod:RegisterEnableMob(17767)
mod:SetEncounterID(620)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{31249, "SAY"}, -- Icebolt
		31258, -- Death & Decay
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Icebolt", 31249)
	self:Log("SPELL_AURA_APPLIED", "DeathAndDecayDamage", 31258)
	self:Log("SPELL_PERIODIC_DAMAGE", "DeathAndDecayDamage", 31258)
	self:Log("SPELL_PERIODIC_MISSED", "DeathAndDecayDamage", 31258)
end

function mod:OnEngage()
	self:Berserk(600)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Icebolt(args)
	self:TargetMessage(args.spellId, "red", args.destName)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, nil, nil, "Icebolt")
	end
	self:PlaySound(args.spellId, "alert", nil, args.destName)
end

do
	local prev = 0
	function mod:DeathAndDecayDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 2 then
			prev = args.time
			self:PersonalMessage(args.spellId, "underyou")
			self:PlaySound(args.spellId, "underyou")
		end
	end
end
