--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Doomwalker", 473)
if not mod then return end
mod:RegisterEnableMob(17711)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Do not proceed. You will be eliminated."
	L.engage_message = "Doomwalker engaged, Earthquake in ~30sec!"

	L.overrun = mod:SpellName(32637)
	L.overrun_desc = "Doomwalker will randomly charge someone, knocking them back. Doomwalker will also reset his threat table."
	L.overrun_icon = 32637

	L.earthquake = mod:SpellName(32686)
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
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "target", "focus")
	self:OpenProximity("proximity", 10)

	self:Message("earthquake", L["engage_message"], "Attention")
	self:Bar("earthquake", "~"..L["earthquake"], 30, 32686)

	local overrun = self:SpellName(32637)
	self:Bar("overrun", "~"..L["overrun"], 26, 32637)
	self:DelayedMessage("overrun", 24, CL["soon"]:format(L["overrun"]), "Attention")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local prev = 0
	function mod:Overrun(args)
		local t = GetTime()
		if (t-prev) > 20 then
			prev = t
			self:Message("overrun", args.spellName, "Important", args.spellId)
			self:Bar("overrun", "~"..args.spellName, 30, args.spellId)
			self:DelayedMessage("overrun", 28, CL["soon"]:format(args.spellName), "Attention")
		end
	end
end

function mod:Earthquake(args)
	self:Message("earthquake", args.spellName, "Important", args.spellId)
	self:DelayedMessage("overrun", 65, CL["soon"]:format(args.spellName), "Attention")
	self:Bar("earthquake", "~"..args.spellName, 70, args.spellId)
end

function mod:Frenzy(args)
	self:Message(args.spellId, "20% - "..args.spellName, "Important", args.spellId, "Alarm")
end

function mod:UNIT_HEALTH_FREQUENT(unit)
	if self:GetCID(UnitGUID(unit)) == 17711 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp > 20 and hp < 27 then
			self:Message(33653, CL["soon"]:format(self:SpellName(33653)), "Urgent") -- Frenzy
			self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
		end
	end
end

