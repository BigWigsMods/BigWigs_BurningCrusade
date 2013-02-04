--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("The Crone", 799)
if not mod then return end
--The Crone, Dorothee, Tito, Strawman, Tinhead, Roar
mod:RegisterEnableMob(18168, 17535, 17548, 17543, 17547, 17546)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "^Oh Tito, we simply must find a way home!"

	L.spawns = "Spawn Timers"
	L.spawns_desc = "Timers for when the characters become active."
	L.spawns_warning = "%s in 5 sec"

	L.roar = "Roar"
	L.tinhead = "Tinhead"
	L.strawman = "Strawman"
	L.tito = "Tito"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"spawns", 32337, "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "ChainLightning", 32337)

	self:Yell("Engage", L["engage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 18168)
end

function mod:OnEngage()
	local swarn = L["spawns_warning"]
	self:Bar("spawns", L["roar"], 15, "INV_Staff_08")
	self:DelayedMessage("spawns", 10, (swarn):format(L["roar"]), "Attention", "INV_Staff_08")
	self:Bar("spawns", L["strawman"], 25, "Ability_Druid_ChallangingRoar")
	self:DelayedMessage("spawns", 20, (swarn):format(L["strawman"]), "Attention", "Ability_Druid_ChallangingRoar")
	self:Bar("spawns", L["tinhead"], 35, "INV_Chest_Plate06")
	self:DelayedMessage("spawns", 30, (swarn):format(L["tinhead"]), "Attention", "INV_Chest_Plate06")
	self:Bar("spawns", L["tito"], 48, "Ability_Hunter_Pet_Wolf")
	self:DelayedMessage("spawns", 43, (swarn):format(L["tito"]), "Attention", "Ability_Hunter_Pet_Wolf")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:ChainLightning(args)
	self:Message(args.spellId, args.spellName, "Urgent", args.spellId)
	self:Bar(args.spellId, "<"..args.spellName..">", 2, args.spellId)
end

