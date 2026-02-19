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
	self:Log("SPELL_AURA_APPLIED", "GreaterPowerWordShield", 33147)
	self:Log("SPELL_AURA_APPLIED", "SpellShield", 33054)
	self:Log("SPELL_AURA_APPLIED", "Whirlwind", 33238)
	self:Log("SPELL_CAST_START", "SummonWildFelhunter", 33131)
	self:Log("SPELL_CAST_START", "PrayerOfHealing", 33152)
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

function mod:GreaterPowerWordShield(args)
	self:Message(args.spellId, "orange", L.shield_message)
end

function mod:SpellShield(args)
	if self:MobId(args.destGUID) == 18832 then
		self:Message(args.spellId, "yellow", L.spellshield_message)
		self:Bar(args.spellId, 30)
		self:PlaySound(args.spellId, "info")
	end
end

function mod:Whirlwind(args)
	self:Message(args.spellId, "red", L.whirlwind_message)
	self:CastBar(args.spellId, 15)
	self:CDBar(args.spellId, 60)
end

function mod:SummonWildFelhunter(args)
	self:Message(args.spellId, "yellow", L.summon_message)
	self:Bar(args.spellId, 50, L.summon_bar)
	self:PlaySound(args.spellId, "alert")
end

function mod:PrayerOfHealing(args)
	self:Message(args.spellId, "red")
	self:PlaySound(args.spellId, "alarm")
end

function mod:ArcingSmash(args)
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
