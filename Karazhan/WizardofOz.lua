--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("The Crone", 532, -655)
if not mod then return end
-- The Crone, Dorothee, Tito, Strawman, Tinhead, Roar
mod:RegisterEnableMob(18168, 17535, 17548, 17543, 17547, 17546)
-- mod:SetEncounterID(655) -- Shared with 3 modules

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.name = "The Crone"

	L.engage_trigger = "^Oh Tito, we simply must find a way home!"

	L.spawns = "Spawn Timers"
	L.spawns_desc = "Timers for when the characters become active."
	L.spawns_warning = "%s in 5 sec"

	L.roar = "Roar"
	L.tinhead = "Tinhead"
	L.strawman = "Strawman"
	L.tito = "Tito"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"spawns",
		{32337, "CASTBAR"}, -- Chain Lightning
	}
end

function mod:OnRegister()
	self.displayName = L.name
end

function mod:OnBossEnable()
	--self:RegisterEvent("ENCOUNTER_START")
	self:RegisterEvent("ENCOUNTER_END")

	self:Log("SPELL_CAST_START", "ChainLightning", 32337)

	self:BossYell("Engage", L["engage_trigger"])
end

function mod:OnEngage()
	local swarn = L["spawns_warning"]
	self:Bar("spawns", 15, L["roar"], "INV_Staff_08")
	self:DelayedMessage("spawns", 10, "yellow", (swarn):format(L["roar"]), "INV_Staff_08")
	self:Bar("spawns", 25, L["strawman"], "Ability_Druid_ChallangingRoar")
	self:DelayedMessage("spawns", 20, "yellow", (swarn):format(L["strawman"]), "Ability_Druid_ChallangingRoar")
	self:Bar("spawns", 35, L["tinhead"], "INV_Chest_Plate06")
	self:DelayedMessage("spawns", 30, "yellow", (swarn):format(L["tinhead"]), "INV_Chest_Plate06")
	self:Bar("spawns", 48, L["tito"], "Ability_Hunter_Pet_Wolf")
	self:DelayedMessage("spawns", 43, "yellow", (swarn):format(L["tito"]), "Ability_Hunter_Pet_Wolf")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:ENCOUNTER_START(_, encounterId)
	if encounterId == 655 then
		self:Engage()
	end
end

function mod:ENCOUNTER_END(_, encounterId, _, _, _, status)
	if encounterId == 655 then
		if status == 0 then
			-- delay slightly to avoid reregistering ENCOUNTER_END as part of Reboot during this ENCOUNTER_END dispatch
			self:SimpleTimer(function() self:Wipe() end, 1)
		else
			self:Win()
		end
	end
end

function mod:ChainLightning(args)
	self:Message(args.spellId, "orange")
	self:CastBar(args.spellId, 2)
end
