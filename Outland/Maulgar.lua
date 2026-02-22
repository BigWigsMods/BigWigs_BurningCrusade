--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("High King Maulgar", 565, 1564)
if not mod then return end
-- Maulgar, Krosh Firehand (Mage), Olm the Summoner (Warlock), Kiggler the Crazed (Shaman), Blindeye the Seer (Priest)
mod:RegisterEnableMob(18831, 18832, 18834, 18835, 18836)
mod:SetEncounterID(649)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.shield_message = "Shield on Blindeye!"
	L.spellshield_message = "Spell Shield on Krosh!"
	L.summon_message = "Felhunter being summoned!"
	L.summon_bar = "Felhunter"
	L.whirlwind_message = "Maulgar - Whirlwind for 15sec!"

	L.mage = "Krosh Firehand (Mage)"
	L.warlock = "Olm the Summoner (Warlock)"
	L.priest = "Blindeye the Seer (Priest)"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		-- Blindeye the Seer (Priest)
		33152, -- Prayer of Healing
		33147, -- Greater Power Word: Shield
		-- Krosh Firehand (Mage)
		33054, -- Spell Shield
		-- Olm the Summoner (Warlock)
		33131, -- Summon Wild Felhunter
		-- High King Maulgar
		39144, -- Arcing Smash
		{33238, "CASTBAR"}, -- Whirlwind
		33232, -- Flurry
	},{
		[33152] = L["priest"],
		[33054] = L["mage"],
		[33131] = L["warlock"],
		[39144] = self.displayName,
	}
end

function mod:OnBossEnable()
	-- Blindeye the Seer (Priest)
	self:Log("SPELL_CAST_START", "PrayerOfHealing", 33152)
	self:Log("SPELL_AURA_APPLIED", "GreaterPowerWordShield", 33147)

	-- Krosh Firehand (Mage)
	self:Log("SPELL_AURA_APPLIED", "SpellShield", 33054)
	self:Death("KroshDeath", 18832)

	-- Olm the Summoner (Warlock)
	self:Log("SPELL_CAST_START", "SummonWildFelhunter", 33131)
	self:Death("OlmDeath", 18834)

	-- High King Maulgar
	self:Log("SPELL_AURA_APPLIED", "WhirlwindApplied", 33238)
	self:Log("SPELL_AURA_REMOVED", "WhirlwindRemoved", 33238)
	self:Log("SPELL_CAST_SUCCESS", "ArcingSmash", 39144)
	self:Log("SPELL_CAST_SUCCESS", "Flurry", 33232)
end

function mod:OnEngage()
	self:RegisterEvent("UNIT_HEALTH")

	self:CDBar(33238, 59) -- Whirlwind
end

--------------------------------------------------------------------------------
-- Event Handlers
--

-- Blindeye the Seer (Priest)
function mod:PrayerOfHealing(args)
	self:Message(args.spellId, "red")
	self:PlaySound(args.spellId, "alarm")
end

function mod:GreaterPowerWordShield(args)
	self:Message(args.spellId, "orange", L.shield_message)
end

-- Krosh Firehand (Mage)
function mod:SpellShield(args)
	if self:MobId(args.destGUID) == 18832 then
		self:Message(args.spellId, "yellow", L.spellshield_message)
		self:Bar(args.spellId, 30)
		self:PlaySound(args.spellId, "info")
	end
end

function mod:KroshDeath(args)
	self:StopBar(33054) -- Spell Shield
end

-- Olm the Summoner (Warlock)
function mod:SummonWildFelhunter(args)
	self:Message(args.spellId, "yellow", L.summon_message)
	self:Bar(args.spellId, 50, L.summon_bar)
	self:PlaySound(args.spellId, "alert")
end

function mod:OlmDeath(args)
	self:StopBar(L.summon_bar)
end

-- High King Maulgar
do
	local prev = 0
	function mod:WhirlwindApplied(args)
		prev = args.time
		self:StopBar(39144) -- Arcing Smash
		self:Message(args.spellId, "red", L.whirlwind_message)
		self:CastBar(args.spellId, 15)
	end

	function mod:WhirlwindRemoved(args)
		self:StopCastBar(args.spellName)
		local duration = 60-(args.time-prev)
		self:CDBar(args.spellId, duration > 0 and duration or 45) -- Fallback for safety (60-15)
		local unit = self:GetUnitIdByGUID(args.sourceGUID)
		if unit and self:UnitWithinRange(unit, 20) then
			self:CDBar(39144, 4) -- Arcing Smash
		end
	end
end

function mod:ArcingSmash(args)
	self:StopBar(args.spellName) -- Stop bar in case you get a bar and then go out of range
	local unit = self:GetUnitIdByGUID(args.sourceGUID)
	if unit and self:UnitWithinRange(unit, 10) then
		self:CDBar(args.spellId, 10)
	end
end

function mod:Flurry(args)
	self:Message(args.spellId, "orange", CL.percent:format(50, args.spellName))
	self:PlaySound(args.spellId, "long")
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 18831 then
		local hp = self:GetHealth(unit)
		if hp < 57 then
			self:UnregisterEvent(event)
			if hp > 50 then
				self:Message(33232, "orange", CL.soon:format(self:SpellName(33232)), false) -- Flurry
			end
		end
	end
end
