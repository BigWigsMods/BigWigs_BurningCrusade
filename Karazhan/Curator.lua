--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("The Curator", 799)
if not mod then return end
mod:RegisterEnableMob(15691)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "The Menagerie is for guests only."

	L.weaken_message = "Evocation - Weakened for 20sec!"
	L.weaken_fade_message = "Evocation Finished - Weakened Gone!"
	L.weaken_fade_warning = "Evocation over in 5sec!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		30254, 30403, "proximity", "berserk", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Evocate", 30254)
	self:Log("SPELL_CAST_SUCCESS", "Infusion", 30403)

	self:Yell("Engage", L["engage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 15691)
end

function mod:OnEngage()
	self:RegisterEvent("UNIT_HEALTH_FREQUENT")
	self:OpenProximity(10)
	self:Berserk(600)
	local evocation = GetSpellInfo(30254)
	self:Bar(30254, "~"..evocation, 109, 30254)
	self:DelayedMessage(30254, 39, CL["custom_sec"]:format(evocation, 70), "Positive")
	self:DelayedMessage(30254, 79, CL["custom_sec"]:format(evocation, 30), "Attention")
	self:DelayedMessage(30254, 99, CL["custom_sec"]:format(evocation, 10), "Urgent")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Evocate(_, spellId, _, _, spellName)
	self:Message(spellId, L["weaken_message"], "Important", spellId, "Alarm")
	self:Bar(spellId, CL["cast"]:format(spellName), 20, spellId)
	self:DelayedMessage(spellId, 15, L["weaken_fade_warning"], "Urgent")
	self:DelayedMessage(spellId, 20, L["weaken_fade_message"], "Important", nil, "Alarm")

	self:Bar(spellId, "~"..spellName, 115, spellId)
	self:DelayedMessage(spellId, 45, CL["custom_sec"]:format(spellName, 70), "Positive")
	self:DelayedMessage(spellId, 85, CL["custom_sec"]:format(spellName, 30), "Attention")
	self:DelayedMessage(spellId, 105, CL["custom_sec"]:format(spellName, 10), "Urgent")
end

function mod:Infusion(_, spellId, _, _, spellName)
	self:Message(spellId, "15% - "..spellName, "Important", spellId)

	self:CancelAllTimers()
	local evocation = GetSpellInfo(30254)
	self:SendMessage("BigWigs_StopBar", self, "~"..evocation)
	self:SendMessage("BigWigs_StopBar", self, CL["cast"]:format(evocation))
end

function mod:UNIT_HEALTH_FREQUENT(_, unit)
	if unit == "target" and self:GetCID(UnitGUID(unit)) == 15691 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp > 15 and hp < 20 then
			self:Message(30403, CL["soon"]:format(GetSpellInfo(30403)), "Positive")
			self:UnregisterEvent("UNIT_HEALTH_FREQUENT")
		end
	end
end

