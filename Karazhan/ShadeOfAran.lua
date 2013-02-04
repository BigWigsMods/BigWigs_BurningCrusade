--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Shade of Aran", 799)
if not mod then return end
mod:RegisterEnableMob(16524)

local inWreath = mod:NewTargetList()

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.adds = "Elementals"
	L.adds_desc = "Warn about the water elemental adds spawning."
	L.adds_icon = "spell_frost_summonwaterelemental_2"
	L.adds_message = "Elementals Incoming!"
	L.adds_warning = "Elementals Soon"
	L.adds_bar = "Elementals despawn"

	L.drink = "Drinking"
	L.drink_desc = "Warn when Aran starts to drink."
	L.drink_icon = "inv_drink_16"
	L.drink_warning = "Low Mana - Drinking Soon!"
	L.drink_message = "Drinking - AoE Polymorph!"
	L.drink_bar = "Super Pyroblast Incoming"

	L.blizzard = "Blizzard"
	L.blizzard_desc = "Warn when Blizzard is being cast."
	L.blizzard_icon = 29969
	L.blizzard_message = "Blizzard!"

	L.pull = "Pull/Super AE"
	L.pull_desc = "Warn for the magnetic pull and Super Arcane Explosion."
	L.pull_icon = 29973
	L.pull_message = "Arcane Explosion!"
	L.pull_bar = "Arcane Explosion"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"adds", "drink", "blizzard", "pull", 30004, "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "FlameWreathStart", 30004)
	self:Log("SPELL_AURA_APPLIED", "FlameWreath", 29946)
	self:Log("SPELL_CAST_START", "Blizzard", 29969)
	self:Log("SPELL_CAST_START", "Drinking", 29963) --Mass Polymorph
	self:Log("SPELL_SUMMON", "Elementals", 29962)
	self:Log("SPELL_CAST_SUCCESS", "Pull", 29979) --Arcane Explosion

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 16524)
end

function mod:OnEngage()
	self:RegisterUnitEvent("UNIT_MANA", nil, "target", "focus")
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "target", "focus")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local scheduled = nil
	local function wreathWarn(spellName)
		mod:TargetMessage(30004, spellName, inWreath, "Important", 29946, "Long")
		scheduled = nil
	end
	function mod:FlameWreath(args.destName, _, _, _, args.spellName)
		inWreath[#inWreath + 1] = args.destName
		if not scheduled then
			scheduled = true
			self:Bar(30004, L["flame_bar"], 21, 29946)
			self:ScheduleTimer(wreathWarn, 0.4, args.spellName)
		end
	end
end

function mod:FlameWreathStart(args)
	self:Message(args.spellId, CL["cast"]:format(args.spellName), "Important", args.spellId, "Alarm")
	self:Bar(args.spellId, CL["cast"]:format(args.spellName), 5, args.spellId)
end

function mod:Blizzard(args)
	self:Message("blizzard", L["blizzard_message"], "Attention", args.spellId)
	self:Bar("blizzard", L["blizzard_message"], 36, args.spellId)
end

function mod:Drinking()
	self:Message("drink", L["drink_message"], "Positive", L["drink_icon"])
	self:Bar("drink", L["drink_bar"], 15, 29978) --Pyroblast id
end

function mod:Elementals()
	self:Message("adds", L["adds_message"], "Important", L["adds_icon"])
	self:Bar("adds", L["adds_bar"], 90, L["adds_icon"])
end

do
	local last = 0
	function mod:Pull()
		local time = GetTime()
		if (time - last) > 5 then
			last = time
			self:Message("pull", L["pull_message"], "Attention", 29973)
			self:Bar("pull", L["pull_bar"], 12, 29973)
		end
	end
end

function mod:UNIT_MANA(unit)
	if self:GetCID(UnitGUID(unit)) == 16524 then
		local mana = UnitPower(unit, 0)
		if mana > 33000 and mana < 37000 then
			self:Message("drink", L["drink_warning"], "Urgent", nil, "Alert")
			self:UnregisterUnitEvent("UNIT_MANA", "target", "focus")
		end
	end
end

function mod:UNIT_HEALTH_FREQUENT(unit)
	if self:GetCID(UnitGUID(unit)) == 16524 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp > 40 and hp < 46 then
			self:Message("adds", L["adds_warning"], "Urgent", nil, "Alert")
			self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
		end
	end
end

