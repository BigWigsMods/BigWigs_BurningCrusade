--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Doomwalker", 473)
if not mod then return end
mod:RegisterEnableMob(17711)
mod.otherMenu = 3

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Do not proceed. You will be eliminated."
	L.engage_message = "Doomwalker engaged, Earthquake in ~30sec!"

	L.overrun = GetSpellInfo(32637)
	L.overrun_desc = "Doomwalker will randomly charge someone, knocking them back. Doomwalker will also reset his threat table."
	L.overrun_icon = 32637

	L.earthquake = GetSpellInfo(32686)
	L.earthquake_desc = "Doomwalker channels an Earthquake doing 2000 damage every 2 seconds, lasting 8 seconds, and stunning players in his proximity."
	L.earthquake_icon = 32686
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"overrun", "earthquake", "proximity", 33653, "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Overrun", 32637)
	self:Log("SPELL_CAST_SUCCESS", "Earthquake", 32686)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 33653)

	self:Yell("Engage", L["engage_trigger"])
	self:Death("Win", 17711)
end

function mod:OnEngage()
	self:RegisterEvent("UNIT_HEALTH_FREQUENT")
	self:OpenProximity(10)

	self:Message("earthquake", L["engage_message"], "Attention")
	self:Bar("earthquake", "~"..GetSpellInfo(32686), 30, 32686)

	local overrun = GetSpellInfo(32637)
	self:Bar("overrun", "~"..overrun, 26, 32637)
	self:DelayedMessage("overrun", 24, CL["soon"]:format(overrun), "Attention")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local prev = 0
	function mod:Overrun(_, spellId, _, _, spellName)
		local t = GetTime()
		if (t-prev) > 20 then
			prev = t
			self:Message("overrun", spellName, "Important", spellId)
			self:Bar("overrun", "~"..spellName, 30, spellId)
			self:DelayedMessage("overrun", 28, CL["soon"]:format(spellName), "Attention")
		end
	end
end

function mod:Earthquake(_, spellId, _, _, spellName)
	self:Message("earthquake", spellName, "Important", spellId)
	self:DelayedMessage("overrun", 65, CL["soon"]:format(spellName), "Attention")
	self:Bar("earthquake", "~"..spellName, 70, spellId)
end

function mod:Frenzy(_, spellId, _, _, spellName)
	self:Message(spellId, "20% - "..spellName, "Important", spellId, "Alarm")
end

function mod:UNIT_HEALTH_FREQUENT(_, unit)
	if unit == "target" and self:GetCID(UnitGUID(unit)) == 17711 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp > 20 and hp < 27 then
			self:Message(33653, CL["soon"]:format(GetSpellInfo(33653)), "Urgent")
			self:UnregisterEvent("UNIT_HEALTH_FREQUENT")
		end
	end
end

