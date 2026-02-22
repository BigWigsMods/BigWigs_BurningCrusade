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
	L.adds_desc = "Warn about the water elemental adds spawning."
	L.adds_icon = "spell_frost_summonwaterelemental_2"
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
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"adds",
		"drink",
		"blizzard",
		29973, -- Arcane Explosion
		{30004, "CASTBAR", "COUNTDOWN", "ME_ONLY_EMPHASIZE", "SAY"}, -- Flame Wreath
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "FlameWreathStart", 30004)
	self:Log("SPELL_AURA_APPLIED", "FlameWreathApplied", 29946)
	self:Log("SPELL_CAST_START", "SummonBlizzard", 29969)
	self:Log("SPELL_CAST_START", "MassPolymorph", 29963) -- Drinking
	self:Log("SPELL_SUMMON", "SummonWaterElementals", 29962)
	self:Log("SPELL_CAST_SUCCESS", "MassiveMagneticPull", 29979)
	self:Log("SPELL_CAST_START", "ArcaneExplosion", 29973)
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
			self:CastBar(30004, 21, args.spellName, args.spellId)
		end
		playerList[#playerList+1] = args.destName
		self:TargetsMessage(30004, "yellow", playerList, nil, nil, args.spellId)
		if self:Me(args.destGUID) then
			self:Say(30004, nil, nil, "Flame Wreath")
			self:PlaySound(30004, "warning", nil, args.destName)
		end
	end
end

function mod:FlameWreathStart(args)
	self:Message(args.spellId, "red", CL.casting:format(args.spellName))
	self:Bar(args.spellId, 5)
	self:PlaySound(args.spellId, "long")
end

function mod:SummonBlizzard(args)
	self:Message("blizzard", "orange", L.blizzard, args.spellId)
	self:Bar("blizzard", 36, L.blizzard, args.spellId)
end

function mod:MassPolymorph() -- Drinking
	self:Message("drink", "cyan", L.drink_message, L.drink_icon)
	self:Bar("drink", 15, L.drink_bar, 29978) --Pyroblast id
end

function mod:SummonWaterElementals()
	self:Message("adds", "cyan", CL.percent:format(40, CL.adds), L.adds_icon)
	self:Bar("adds", 90, L.adds_bar, L.adds_icon)
end

do
	local prev = 0
	function mod:MassiveMagneticPull(args) -- Arcane Explosion pre warning
		if args.time - prev > 5 then
			prev = args.time
			self:Message(29973, "yellow", self:SpellName(29973)) -- Arcane Explosion
			self:PlaySound(29973, "info")
		end
	end
end

function mod:ArcaneExplosion(args)
	self:Bar(args.spellId, 10)
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
				self:Message("adds", "orange", CL.soon:format(CL.adds), false)
			end
		end
	end
end
