--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Rage Winterchill", 775, 1577)
if not mod then return end
mod:RegisterEnableMob(17767)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{31258, "FLASH"}, {31249, "ICON"}, "berserk"
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

function mod:Icebolt(args)
	self:TargetMessage(args.spellId, args.destName, "Important", "Alert")
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:DeathAndDecay(args)
	if self:Me(args.destGUID) then
		self:Message(args.spellId, "Personal", "Alarm")
		self:Flash(args.spellId)
	end
end

