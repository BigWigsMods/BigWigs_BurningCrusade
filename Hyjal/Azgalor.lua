--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Azgalor", 775)
if not mod then return end
mod:RegisterEnableMob(17842)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.howl_bar = "~Howl"
	L.howl_message = "AoE silence"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{31347, "ICON", "FLASHSHAKE"}, 31344, 31340, "berserk", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "RainOfFire", 31340)
	self:Log("SPELL_CAST_SUCCESS", "Howl", 31344)
	self:Log("SPELL_AURA_APPLIED", "Doom", 31347)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 17842)
end

function mod:OnEngage()
	self:Berserk(600)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:RainOfFire(player, spellId, _, _, spellName)
	if UnitIsUnit(player, "player") then
		self:LocalMessage(spellId, CL["you"]:format(spellName), "Urgent", spellId, "Alarm")
	end
end

function mod:Howl(_, spellId)
	self:Message(spellId, L["howl_message"], "Important", spellId)
	self:Bar(spellId, L["howl_bar"], 16, spellId)
	self:DelayedMessage(spellId, 15, CL["soon"]:format(L["howl_message"]), "Important")
end

function mod:Doom(player, spellId, _, _, spellName)
	self:TargetMessage(spellId, spellName, player, "Attention", spellId, "Alert")
	self:Bar(spellId, CL["other"]:format(spellName, player), 19, spellId)
	self:PrimaryIcon(spellId, player)
	if UnitIsUnit(player, "player") then
		self:FlashShake(spellId)
	end
end

