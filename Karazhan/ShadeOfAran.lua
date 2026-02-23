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
	L["29962_icon"] = "spell_frost_summonwaterelemental_2"
	L.adds_bar = "Elementals despawn"
	L.conjured_elemental = "Conjured Elemental"

	L.drink = "Drinking"
	L.drink_desc = "Warn when Aran starts to drink."
	L.drink_icon = "inv_drink_16"
	L.drink_warning = "Low Mana - Drinking Soon!"
	L.drink_message = "Drinking - AoE Polymorph!"
	L.drink_bar = "Super Pyroblast Incoming"
end

--------------------------------------------------------------------------------
-- Initialization
--

local elementalsMarker = mod:AddMarkerOption(true, "npc", 1, "conjured_elemental", 1, 2, 3, 4) -- Conjured Elemental
function mod:GetOptions()
	return {
		29962, -- Summon Water Elementals
		elementalsMarker,
		"drink",
		29951, -- Blizzard
		29973, -- Arcane Explosion
		{30004, "CASTBAR", "COUNTDOWN", "ME_ONLY_EMPHASIZE", "SAY"}, -- Flame Wreath
	},nil,{
		[29962] = CL.adds, -- Summon Water Elementals (Adds)
	}
end

function mod:OnRegister()
	elementalsMarker = mod:AddMarkerOption(true, "npc", 1, "conjured_elemental", 1, 2, 3, 4) -- Conjured Elemental
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "FlameWreathStart", 30004)
	self:Log("SPELL_AURA_APPLIED", "FlameWreathApplied", 29946)

	self:Log("SPELL_CAST_START", "SummonBlizzard", 29969)
	self:Log("SPELL_AURA_APPLIED", "BlizzardDamage", 29951)
	self:Log("SPELL_PERIODIC_DAMAGE", "BlizzardDamage", 29951)
	self:Log("SPELL_PERIODIC_MISSED", "BlizzardDamage", 29951)

	self:Log("SPELL_CAST_START", "MassPolymorph", 29963) -- Drinking
	self:Log("SPELL_CAST_SUCCESS", "SummonWaterElementalsSuccess", 29962)
	self:Log("SPELL_SUMMON", "SummonWaterElementals", 29962, 37051, 37053, 37052)
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

function mod:SummonBlizzard()
	self:Message(29951, "orange", CL.incoming:format(self:SpellName(29951)))
	self:Bar(29951, 36)
end

do
	local prev = 0
	function mod:BlizzardDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 3 then
			prev = args.time
			self:PersonalMessage(args.spellId, "aboveyou")
			self:PlaySound(args.spellId, "underyou")
		end
	end
end

function mod:MassPolymorph() -- Drinking
	self:Message("drink", "cyan", L.drink_message, L.drink_icon)
	self:Bar("drink", 15, L.drink_bar, 29978) --Pyroblast id
end

do
	local mobCollector, markIcon = {}, 0
	function mod:SummonWaterElementalsSuccess(args)
		mobCollector, markIcon = {}, 0
		self:Message(args.spellId, "cyan", CL.percent:format(40, CL.adds), L["29962_icon"])
		self:Bar(args.spellId, 90, L.adds_bar, L["29962_icon"])
	end

	function mod:ElementalMarking(_, unit, guid)
		if mobCollector[guid] then
			self:CustomIcon(elementalsMarker, unit, mobCollector[guid])
			mobCollector[guid] = nil
			if not next(mobCollector) then
				self:UnregisterTargetEvents()
			end
		end
	end

	function mod:SummonWaterElementals(args)
		markIcon = markIcon + 1
		if self:GetOption(elementalsMarker) then
			local unit = self:GetUnitIdByGUID(args.destGUID)
			if unit then
				self:CustomIcon(elementalsMarker, unit, markIcon)
			else
				mobCollector[args.destGUID] = markIcon
				self:RegisterTargetEvents("ElementalMarking")
			end
		end
	end
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
				self:Message(29962, "orange", CL.soon:format(CL.adds), false)
			end
		end
	end
end
