--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Rage Winterchill", 775)
if not mod then return end
mod:RegisterEnableMob(17767)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{31258, "FLASHSHAKE"}, {31249, "ICON"}, "berserk", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Icebolt", 31249)
	self:Log("SPELL_AURA_APPLIED", "DeathAndDecay", 31258)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 17767)
end

function mod:OnEngage()
	self:Berserk(600)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Icebolt(player, spellId, _, _, spellName)
	self:TargetMessage(spellId, spellName, player, "Important", spellId, "Alert")
	self:PrimaryIcon(spellId, player)
end

function mod:DeathAndDecay(player, spellId, _, _, spellName)
	if UnitIsUnit(player, "player") then
		self:LocalMessage(spellId, CL["underyou"]:format(spellName), "Personal", spellId, "Alarm")
		self:FlashShake(spellId)
	end
end

