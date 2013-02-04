--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Hydross the Unstable", 780)
if not mod then return end
mod:RegisterEnableMob(21216)

local inTomb = mod:NewTargetList()
local curPerc = 10
local stance = 1
local allowed = nil
local debuffBar = "%d%% - %s"
local poisonName = mod:SpellName(38219)
local cleanName = mod:SpellName(38215)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.start_trigger = "I cannot allow you to interfere!"

	L.mark = "Mark"
	L.mark_desc = "Show warnings and counters for marks."

	L.stance = "Stance changes"
	L.stance_desc = "Warn when Hydross changes stances."
	L.poison_stance = "Hydross is now poisoned!"
	L.water_stance = "Hydross is now cleaned again!"

	L.debuff_warn = "Mark at %s%%!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {"stance", "mark", {38246, "ICON"}, {38235, "PROXIMITY"}, "berserk", "bosskill"}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Tomb", 38235)
	self:Log("SPELL_AURA_APPLIED", "Sludge", 38246)
	self:Log("SPELL_CAST_SUCCESS", "Mark",
		38215, 38216, 38217, 38218, 38231, 40584, --Mark of Hydross - 10, 25, 50, 100, 250, 500
		38219, 38220, 38221, 38222, 38230, 40583 --Mark of Corruption - 10, 25, 50, 100, 250, 500
	)
	self:Log("SPELL_CAST_SUCCESS", "Stance", 25035)

	curPerc = 10
	stance = 1
	allowed = nil

	self:Yell("Engage", L["start_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 21216)
end

function mod:OnEngage()
	curPerc = 10
	stance = 1
	allowed = true
	self:Bar("mark", (debuffBar):format(curPerc, cleanName), 15, 38215)
	self:Berserk(600)
	self:OpenProximity(38235, 10)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local scheduled = nil
	local function tombWarn(spellName, spellId)
		mod:TargetMessage(spellId, spellName, inTomb, "Attention", spellId)
		scheduled = nil
	end
	function mod:Tomb(args)
		inTomb[#inTomb + 1] = args.destName
		if not scheduled then
			scheduled = true
			self:ScheduleTimer(tombWarn, 0.3, args.spellName, args.spellId)
		end
	end
end

function mod:Sludge(args)
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Attention", args.spellId)
	self:TargetBar(args.spellId, args.spellName, args.destName, 24, args.spellId)
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:Mark(args)
	self:StopBar((debuffBar):format(curPerc, poisonName))
	self:StopBar((debuffBar):format(curPerc, cleanName))
	self:Message("mark", L["debuff_warn"]:format(curPerc), "Important", args.spellId, "Alert")
	if args.spellId == 38215 or args.spellId == 38219 then
		curPerc = 25
	elseif args.spellId == 38216 or args.spellId == 38220 then
		curPerc = 50
	elseif args.spellId == 38217 or args.spellId == 38221 then
		curPerc = 100
	elseif args.spellId == 38218 or args.spellId == 38222 then
		curPerc = 250
	elseif args.spellId == 38231 or args.spellId == 38230 then
		curPerc = 500
	end
	self:Bar("mark", (debuffBar):format(curPerc, args.spellName), 15, args.spellId)
end

do
	local last = 0
	--stance: 1=clean 2=poison
	function mod:Stance()
		if not allowed then return end
		local time = GetTime()
		if (time - last) > 10 then
			last = time
			if stance == 1 then
				stance = 2
				self:StopBar((debuffBar):format(curPerc, cleanName))
				curPerc = 10
				self:Message("stance", L["poison_stance"], "Important", 38219)
				self:Bar("mark", (debuffBar):format(curPerc, poisonName), 15, 38219)
				self:CloseProximity(38235)
			else
				stance = 1
				self:StopBar((debuffBar):format(curPerc, poisonName))
				curPerc = 10
				self:PrimaryIcon(38246)
				self:Message("stance", L["water_stance"], "Important", 38215)
				self:Bar("mark", (debuffBar):format(curPerc, cleanName), 15, 38215)
				self:OpenProximity(38235, 10)
			end
		end
	end
end

