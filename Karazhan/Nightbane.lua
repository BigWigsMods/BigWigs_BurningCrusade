--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Nightbane Raid", 532, -662)
if not mod then return end
mod:RegisterEnableMob(17225)
mod:SetEncounterID(662)

--------------------------------------------------------------------------------
-- Locals
--

local stageHP = 100

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.name = "Nightbane"

	L.airphase_trigger = "Miserable vermin. I shall exterminate you from the air!"
	L.landphase_trigger1 = "Enough! I shall land and crush you myself!"
	L.landphase_trigger2 = "Insects! Let me show you my strength up close!"
	L.airphase_message = "Flying!"
	L.summon_trigger = "An ancient being awakens in the distance..."

	L.engage_trigger = "What fools! I shall bring a quick end to your suffering!"

	L["36922_icon"] = "spell_shadow_psychicscream"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		{36922, "CASTBAR"}, -- Bellowing Roar
		30129, -- Charred Earth
		37098, -- Rain of Bones
	},nil,{
		[36922] = CL.fear, -- Bellowing Roar (Fear)
	}
end

function mod:OnRegister()
	self.displayName = L.name
	self:SetSpellRename(36922, CL.fear) -- Bellowing Roar (Fear)
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "BellowingRoar", 36922)
	self:Log("SPELL_AURA_APPLIED", "CharredEarth", 30129)
	self:Log("SPELL_CAST_SUCCESS", "RainOfBones", 37098)

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")

	self:BossYell("AirStageYell", L["airphase_trigger"])
	self:BossYell("LandStageYell", L["landphase_trigger1"], L["landphase_trigger2"])

	-- Event order: Use item to summon
	-- ENCOUNTER_START fires, enables and engages this module > landing bar
	-- Boss lands > boss yell > EngageYell() > shows fear bar
	self:BossYell("EngageYell", L["engage_trigger"])
end

function mod:OnEngage()
	stageHP = 100
	self:Bar("stages", 34, CL.landing, "INV_Misc_Head_Dragon_01")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:BellowingRoar(args)
	self:CastBar(args.spellId, 2.5, CL.fear, L["36922_icon"])
	self:Message(args.spellId, "red", CL.incoming:format(CL.fear), L["36922_icon"])
	self:CDBar(args.spellId, 37, CL.fear, L["36922_icon"])
	self:PlaySound(args.spellId, "alert")
end

function mod:CharredEarth(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, "underyou")
		self:PlaySound(args.spellId, "underyou")
	end
end

function mod:RainOfBones(args)
	self:Message(args.spellId, "orange")
	self:Bar(args.spellId, 11)
	self:PlaySound(args.spellId, "info")
end

function mod:AirStageYell()
	stageHP = stageHP - 25
	self:StopBar(CL.fear) -- Bellowing Roar

	self:Message("stages", "yellow", CL.percent:format(stageHP, L.airphase_message), "INV_Misc_Head_Dragon_01")
	self:Bar("stages", 57, CL.landing, "INV_Misc_Head_Dragon_01")
	self:PlaySound("stages", "long")
end

function mod:LandStageYell()
	self:Message("stages", "cyan", CL.boss_landing:format(L.name), "INV_Misc_Head_Dragon_01")
	self:Bar("stages", 17, CL.landing, "INV_Misc_Head_Dragon_01")
	self:CDBar(36922, 77, CL.fear, L["36922_icon"]) -- Bellowing Roar
	self:PlaySound("stages", "long")
end

function mod:EngageYell()
	self:CDBar(36922, 35, CL.fear, L["36922_icon"]) -- Bellowing Roar
end
