--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Moroes", 799)
if not mod then return end
--Moroes, Baroness Dorothea Millstipe, Baron Rafe Dreuger, Lady Catriona Von'Indi,
--Lady Keira Berrybuck, Lord Robin Daris, Lord Crispin Ference
mod:RegisterEnableMob(15687, 19875, 19874, 19872, 17007, 19876, 19873)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Hm, unannounced visitors. Preparations must be made..."
	L.engage_message = "%s Engaged - Vanish in ~35sec!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		29448, {37066, "ICON"}, 37023, "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Garrote", 37066)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 37023)
	self:Log("SPELL_AURA_APPLIED", "Vanish", 29448)

	self:Yell("Engage", L["engage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 15687)
end

function mod:OnEngage()
	self:RegisterEvent("UNIT_HEALTH_FREQUENT")
	self:Message(L["engage_message"]:format(self.displayName), "Attention")

	local vanish = GetSpellInfo(29448)
	self:Bar(29448, "~"..vanish, 35, 29448)
	self:DelayedMessage(29448, 30, CL["soon"]:format(vanish), "Attention")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Garrote(player, spellId, _, _, spellName)
	self:TargetMessage(spellId, spellName, player, "Attention", spellId)
	self:PrimaryIcon(spellId, player)
end

function mod:Frenzy(_, spellId, _, _, spellName)
	self:IfMessage(spellId, "30% - "..spellName, "Important", spellId, "Alarm")
end

function mod:Vanish(_, spellId)
	self:Message(spellId, spellName, "Urgent", spellId, "Alert")
	self:Bar(spellId, "~"..spellName, 35, spellId)
	self:DelayedMessage(spellId, 30, CL["soon"]:format(spellName), "Attention")
end

function mod:UNIT_HEALTH_FREQUENT(_, unit)
	if unit == "target" and self:GetCID(UnitGUID(unit)) == 15687 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp > 30 and hp < 36 then
			self:Message(37023, CL["soon"]:format(GetSpellInfo(37023)), "Positive", nil, "Info")
			self:UnregisterEvent("UNIT_HEALTH_FREQUENT")
		end
	end
end

