--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Doomwalker", -104)
if not mod then return end
mod:RegisterEnableMob(17711)
mod:SetAllowWin(true) -- No journal ID
mod.worldBoss = 17711
if mod:Classic() then
	mod.mapId = 1948
	mod.otherMenu = -1945
else
	mod.otherMenu = -101
end

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.name = "Doomwalker"

	L.engage_trigger = "Do not proceed. You will be eliminated."

	L.overrun = mod:SpellName(32637)
	L.overrun_desc = "Doomwalker will randomly charge someone, knocking them back. Doomwalker will also reset his threat table."
	L.overrun_icon = 32637

	L.earthquake = mod:SpellName(32686)
	L.earthquake_desc = "Doomwalker channels an Earthquake doing 2000 damage every 2 seconds, lasting 8 seconds, and stunning players in his proximity."
	L.earthquake_icon = 32686
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"overrun",
		{"earthquake", "EMPHASIZE"},
		"proximity",
		33653, -- Enrage / Frenzy
	},nil,{
		[33653] = CL.health_percent:format(20), -- Frenzy / Enrage (20% Health)
	}
end

function mod:OnRegister()
	self.displayName = L.name
end

function mod:OnBossEnable()
	self:ScheduleTimer("CheckForEngage", 1)

	self:Death("Win", 17711)
end

function mod:OnEngage()
	self:CheckForWipe()

	self:Log("SPELL_CAST_START", "Overrun", 32637)
	self:Log("SPELL_CAST_SUCCESS", "Earthquake", 32686)
	self:Log("SPELL_AURA_APPLIED", "FrenzyEnrage", 33653)

	self:RegisterEvent("UNIT_HEALTH")
	self:OpenProximity("proximity", 10)

	self:CDBar("earthquake", 30, 32686) -- Earthquake
	self:CDBar("overrun", 26, 32637) -- Overrun
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local prev = 0
	function mod:Overrun(args)
		if args.time - prev > 20 then
			prev = args.time
			self:Message("overrun", "yellow", args.spellName, args.spellId)
			self:CDBar("overrun", 30, args.spellName, args.spellId)
			self:PlaySound(args.spellId, "alert")
		end
	end
end

function mod:Earthquake(args)
	self:Message("earthquake", "red", args.spellName, args.spellId)
	self:CDBar("earthquake", 70, args.spellName, args.spellId)
	self:PlaySound("earthquake", "warning")
end

function mod:FrenzyEnrage(args)
	self:Message(args.spellId, "orange", CL.percent:format(20, args.spellName))
	self:PlaySound(args.spellId, "long")
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 17711 then
		local hp = self:GetHealth(unit)
		if hp < 27 then
			self:UnregisterEvent(event)
			if hp > 20 then
				self:Message(33653, "orange", CL.soon:format(self:SpellName(33653)), false) -- Frenzy / Enrage
			end
		end
	end
end
