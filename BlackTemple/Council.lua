
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("The Illidari Council", 564, 1589)
if not mod then return end
mod:RegisterEnableMob(22951, 22952, 22949, 22950) -- Lady Malande, Veras Darkshadow, Gathios the Shatterer, High Nethermancer Zerevor
mod:SetEncounterID(608)
--mod:SetRespawnTime(0) -- Resets, doesn't respawn

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.veras = "Veras: %s"
	L.malande = "Malande: %s"
	L.gathios = "Gathios: %s"
	L.zerevor = "Zerevor: %s"

	L.circle_heal_message = "Healed! - Next in ~20sec"
	L.circle_fail_message = "%s Interrupted! - Next in ~12sec"

	L.magical_immunity = "Immune to magical!"
	L.physical_immunity = "Immune to physical!"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"berserk",

		--[[ Veras Darkshadow ]]--
		41476, -- Vanish
		{41485, "ICON"}, -- Deadly Poison

		--[[ Lady Malande ]]--
		41475, -- Reflective Shield
		41455, -- Circle of Healing

		--[[ Gathios the Shatterer ]]--
		41453, -- Chromatic Resistance Aura
		41450, -- Blessing of Protection
		41451, -- Blessing of Spell Warding
		41541, -- Consecration

		--[[ High Nethermancer Zerevor ]]--
		41481, -- Flamestrike
		41482, -- Blizzard
	}, {
		[41476] = -15716, -- Veras Darkshadow
		[41475] = -15726, -- Lady Malande
		[41453] = -15704, -- Gathios the Shatterer
		[41481] = -15720, -- High Nethermancer Zerevor
	}
end

function mod:OnBossEnable()
	--[[ Veras Darkshadow ]]--
	self:Log("SPELL_AURA_APPLIED", "Vanish", 41476)
	self:Log("SPELL_AURA_REMOVED", "VanishOver", 41479)
	self:Log("SPELL_AURA_APPLIED", "DeadlyPoisonApplied", 41485)
	self:Log("SPELL_AURA_REMOVED", "DeadlyPoisonRemoved", 41485)

	--[[ Lady Malande ]]--
	self:Log("SPELL_AURA_APPLIED", "ReflectiveShield", 41475)
	self:Log("SPELL_AURA_REMOVED", "ReflectiveShieldOver", 41475)
	self:Log("SPELL_CAST_START", "CircleOfHealing", 41455)
	self:Log("SPELL_CAST_SUCCESS", "CircleOfHealingSuccess", 41455)
	self:Log("SPELL_INTERRUPT", "CircleOfHealingInterrupted", "*")

	--[[ Gathios the Shatterer ]]--
	self:Log("SPELL_AURA_APPLIED", "ChromaticResistanceAuraApplied", 41453)
	self:Log("SPELL_AURA_REMOVED", "ChromaticResistanceAuraRemoved", 41453)
	self:Log("SPELL_AURA_APPLIED", "BlessingOfProtection", 41450)
	self:Log("SPELL_AURA_APPLIED", "BlessingOfSpellWarding", 41451)
	self:Log("SPELL_AURA_APPLIED", "ConsecrationDamage", 41541)
	self:Log("SPELL_PERIODIC_DAMAGE", "ConsecrationDamage", 41541)
	self:Log("SPELL_PERIODIC_MISSED", "ConsecrationDamage", 41541)

	--[[ High Nethermancer Zerevor ]]--
	self:Log("SPELL_AURA_APPLIED", "FlamestrikeDamage", 41481)
	self:Log("SPELL_PERIODIC_DAMAGE", "FlamestrikeDamage", 41481)
	self:Log("SPELL_PERIODIC_MISSED", "FlamestrikeDamage", 41481)
	self:Log("SPELL_AURA_APPLIED", "BlizzardDamage", 41482)
	self:Log("SPELL_PERIODIC_DAMAGE", "BlizzardDamage", 41482)
	self:Log("SPELL_PERIODIC_MISSED", "BlizzardDamage", 41482)
end

function mod:OnEngage()
	self:Berserk(900)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

--[[ Veras Darkshadow ]]--
function mod:Vanish(args)
	self:Message(args.spellId, "yellow", L.veras:format(args.spellName))
	self:Bar(args.spellId, 30)
	self:PlaySound(args.spellId, "alert")
end

function mod:VanishOver(args)
	self:Message(41476, "green", CL.over:format(args.spellName))
end

function mod:DeadlyPoisonApplied(args)
	self:PrimaryIcon(args.spellId, args.destName)
	if self:Healer() or self:Me(args.destGUID) then
		self:TargetMessage(args.spellId, "red", args.destName)
		self:PlaySound(args.spellId, "alarm", nil, args.destName)
	end
end

function mod:DeadlyPoisonRemoved(args)
	self:PrimaryIcon(args.spellId)
end

--[[ Lady Malande ]]--
function mod:ReflectiveShield(args)
	self:Message(args.spellId, "red", L.malande:format(args.spellName))
	self:Bar(args.spellId, 20)
	self:PlaySound(args.spellId, "long")
end

function mod:ReflectiveShieldOver(args)
	self:Message(args.spellId, "green", CL.over:format(args.spellName))
end

function mod:CircleOfHealing(args)
	self:Message(args.spellId, "orange", L.malande:format(args.spellName))
	if self:Interrupter() then
		self:PlaySound(args.spellId, "warning")
	end
end

function mod:CircleOfHealingSuccess(args)
	self:Message(args.spellId, "orange", L.circle_heal_message)
	self:CDBar(args.spellId, 20)
end

function mod:CircleOfHealingInterrupted(args)
	if args.extraSpellId == 41455 then
		self:Message(41455, "orange", CL.interrupted_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
		self:CDBar(41455, 12)
	end
end

--[[ Gathios the Shatterer ]]--
function mod:ChromaticResistanceAuraApplied(args)
	if self:MobId(args.destGUID) == 22949 then -- Gathios the Shatterer
		local res = self:SpellName(19726) -- 19726 = "Resistance Aura"
		self:Message(args.spellId, "yellow", L.gathios:format(res))
		self:Bar(args.spellId, 30, res)
	end
end

function mod:ChromaticResistanceAuraRemoved(args)
	if self:MobId(args.destGUID) == 22949 then -- Gathios the Shatterer
		self:Message(args.spellId, "green", CL.over:format(self:SpellName(19726))) -- 19726 = "Resistance Aura"
	end
end

function mod:BlessingOfProtection(args)
	if self:MobId(args.destGUID) == 22951 then -- Lady Malande
		local txt = L.malande:format(L.physical_immunity)
		self:Bar(args.spellId, 15, txt)
		if self:MobId(self:UnitGUID("target")) == 22951 then
			self:Message(args.spellId, "red", txt)
			self:PlaySound(args.spellId, "info")
		end
	end
end

function mod:BlessingOfSpellWarding(args)
	if self:MobId(args.destGUID) == 22951 then -- Lady Malande
		local txt = L.malande:format(L.magical_immunity)
		self:Bar(args.spellId, 15, txt)
		if self:MobId(self:UnitGUID("target")) == 22951 then
			self:Message(args.spellId, "red", txt)
			self:PlaySound(args.spellId, "info")
		end
	end
end

do
	local prev = 0
	function mod:ConsecrationDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 2 then
			prev = args.time
			self:PersonalMessage(args.spellId, "underyou")
			self:PlaySound(args.spellId, "underyou")
		end
	end
end

--[[ High Nethermancer Zerevor ]]--
do
	local prev = 0
	function mod:FlamestrikeDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 2 then
			prev = args.time
			self:PersonalMessage(args.spellId, "underyou")
			self:PlaySound(args.spellId, "underyou")
		end
	end
end

do
	local prev = 0
	function mod:BlizzardDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 2 then
			prev = args.time
			self:PersonalMessage(args.spellId, "aboveyou")
			self:PlaySound(args.spellId, "underyou")
		end
	end
end
