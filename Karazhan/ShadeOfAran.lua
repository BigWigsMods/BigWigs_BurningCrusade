--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Shade of Aran", 532, 1559)
if not mod then return end
mod:RegisterEnableMob(16524)
mod:SetEncounterID(658)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
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

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"adds",
		"drink",
		"blizzard",
		"pull",
		{30004, "CASTBAR"}, -- Flame Wreath
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "FlameWreathStart", 30004)
	self:Log("SPELL_AURA_APPLIED", "FlameWreathApplied", 29946)
	self:Log("SPELL_CAST_START", "SummonBlizzard", 29969)
	self:Log("SPELL_CAST_START", "MassPolymorph", 29963) -- Drinking
	self:Log("SPELL_SUMMON", "SummonWaterElementals", 29962)
	self:Log("SPELL_CAST_SUCCESS", "MassiveMagneticPull", 29979) -- Pull + Arcane Explosion
end

function mod:OnEngage()
	self:RegisterEvent("UNIT_POWER_UPDATE")
	self:RegisterEvent("UNIT_HEALTH")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local playerList, prev = {}, 0
	function mod:FlameWreathApplied(args)
		if args.time - prev > 5 then
			prev = args.time
			playerList = {}
			self:Bar(30004, 21, args.spellName, args.spellId)
		end
		playerList[#playerList+1] = args.destName
		self:TargetsMessage(30004, "yellow", playerList, nil, nil, args.spellId)
		if #playerList == 1 then
			self:PlaySound(30004, "warning")
		end
	end
end

function mod:FlameWreathStart(args)
	self:Message(args.spellId, "red", CL.casting:format(args.spellName))
	self:CastBar(args.spellId, 5)
	self:PlaySound(args.spellId, "long")
end

function mod:SummonBlizzard(args)
	self:Message("blizzard", "orange", L.blizzard_message, args.spellId)
	self:Bar("blizzard", 36, L.blizzard_message, args.spellId)
end

function mod:MassPolymorph() -- Drinking
	self:Message("drink", "cyan", L.drink_message, L.drink_icon)
	self:Bar("drink", 15, L.drink_bar, 29978) --Pyroblast id
end

function mod:SummonWaterElementals()
	self:Message("adds", "orange", L.adds_message, L.adds_icon)
	self:Bar("adds", 90, L.adds_bar, L.adds_icon)
end

do
	local prev = 0
	function mod:MassiveMagneticPull(args) -- Pull + Arcane Explosion
		if args.time - prev > 5 then
			prev = args.time
			self:Message("pull", "yellow", L.pull_message, 29973)
			self:Bar("pull", 12, L.pull_bar, 29973)
		end
	end
end

function mod:UNIT_POWER_UPDATE(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 16524 then
		local mana = UnitPower(unit)
		if mana < 37000 then
			self:UnregisterEvent(event)
			if mana > 33000 then
				self:Message("drink", "orange", L.drink_warning, false)
			end
		end
	end
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 16524 then
		local hp = self:GetHealth(unit)
		if hp < 46 then
			self:UnregisterEvent(event)
			if hp > 40 then
				self:Message("adds", "orange", L.adds_warning, false)
			end
		end
	end
end
