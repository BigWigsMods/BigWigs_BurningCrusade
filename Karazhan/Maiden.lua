--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Maiden of Virtue", 799)
if not mod then return end
mod:RegisterEnableMob(16457)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Your behavior will not be tolerated."
	L.engage_message = "Maiden Engaged! Repentance in ~33sec"

	L.repentance_message = "Repentance! Next in ~33sec"
	L.repentance_warning = "Repentance Cooldown Over - Inc Soon!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		29511, {29522, "ICON"}, "proximity", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "HolyFire", 29522)
	self:Log("SPELL_CAST_START", "Repentance", 29511)

	self:Yell("Engage", L["engage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 16457)
end

function mod:OnEngage()
	self:Message(29511, L["engage_message"], "Attention")
	self:DelayedMessage(29511, 33, L["repentance_warning"], "Urgent", nil, "Alarm")
	self:Bar(29511, "~"..GetSpellInfo(29511), 33, 29511)
	self:OpenProximity("proximity", 10)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:HolyFire(player, spellId, _, _, spellName)
	self:TargetMessage(spellId, spellName, player, "Important", spellId)
	self:PrimaryIcon(spellId, player)
end

function mod:Repentance(_, spellId, _, _, spellName)
	self:Message(spellId, L["repentance_message"], "Important", spellId)
	self:Bar(spellId, "<"..spellName..">", 12, spellId)
	self:DelayedMessage(spellId, 33, L["repentance_warning"], "Urgent", nil, "Alarm")
	self:Bar(spellId, "~"..spellName, 33, spellId)
end

