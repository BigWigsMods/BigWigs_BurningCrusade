--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Void Reaver", 782)
if not mod then return end
mod:RegisterEnableMob(19516)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Alert! You are marked for extermination."
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{34172, "ICON", "SAY"}, 25778, 34162, "berserk", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "KnockAway", 25778)
	self:Log("SPELL_CAST_SUCCESS", "Pounding", 34162)
	self:Log("SPELL_CAST_SUCCESS", "Orb", 34172)

	self:Yell("Engage", L["engage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 19516)
end

function mod:OnEngage()
	self:Berserk(600)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:KnockAway(player, spellId, _, _, spellName)
	self:TargetMessage(spellId, spellName, player, "Positive", spellId)
	self:Bar(spellId, "~"..spellName, 20, spellId)
end

function mod:Pounding(_, spellId, _, _, spellName)
	self:Bar(spellId, "~"..spellName, 13, spellId)
end

function mod:Orb(player, spellId, _, _, spellName)
	self:TargetMessage(spellId, spellName, player, "Attention", spellId)
	self:PrimaryIcon(spellId, player)
	if UnitIsUnit("player", player) then
		self:Say(spellId, CL["say"]:format(spellName))
	end
end

