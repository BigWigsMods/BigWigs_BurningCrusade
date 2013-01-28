--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Fathom-Lord Karathress", 780)
if not mod then return end
mod:RegisterEnableMob(21214, 21966, 21965, 21964) --Karathress, Sharkkis, Tidalvess, Caribdis

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.enrage_trigger = "Guards, attention! We have visitors...."

	L.totem = "Spitfire Totem"
	L.totem_desc = "Warn for Spitfire Totems and who cast them."
	L.totem_icon = 38236
	L.totem_message1 = "Tidalvess: Spitfire Totem"
	L.totem_message2 = "Karathress: Spitfire Totem"
	L.heal_message = "Caribdis casting heal!"

	L.priest = "Fathom-Guard Caribdis"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions(CL)
	return {
		38330, "totem", "berserk", "bosskill"
	}, {
		[38330] = L["priest"],
		totem = CL["general"],
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Heal", 38330)
	self:Log("SPELL_SUMMON", "Totem", 38236)

	self:Yell("Engage", L["enrage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 21214)
end

function mod:OnEngage()
	self:Berserk(600)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Heal(_, spellId)
	self:Message(spellId, L["heal_message"], "Important", spellId, "Long")
end

function mod:Totem(_, spellId, source)
	if source == self.displayName then
		self:Message("totem", L["totem_message2"], "Urgent", spellId, "Alarm")
	else
		self:Message("totem", L["totem_message1"], "Attention", spellId)
	end
end

