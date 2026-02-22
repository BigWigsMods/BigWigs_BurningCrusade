--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Nightbane Raid", 532, -662)
if not mod then return end
mod:RegisterEnableMob(17225, 17261) -- Nightbane, Restless Skeleton
mod:SetEncounterID(662)

--------------------------------------------------------------------------------
-- Locals
--

local stageHP = 100
local skeletonCount = 5

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
	self:Log("SPELL_AURA_APPLIED", "CharredEarthDamage", 30129)
	self:Log("SPELL_PERIODIC_DAMAGE", "CharredEarthDamage", 30129)
	self:Log("SPELL_PERIODIC_MISSED", "CharredEarthDamage", 30129)

	self:Log("SPELL_CAST_START", "BellowingRoar", 36922)
	self:Log("SPELL_CAST_SUCCESS", "RainOfBones", 37098)

	self:BossYell("AirStageYell", L["airphase_trigger"])
	self:Death("RestlessSkeletonDeath", 17261)
end

do
	local function DelayFear()
		mod:CDBar(36922, 36, CL.fear, L["36922_icon"]) -- Bellowing Roar
	end
	function mod:OnEngage()
		stageHP = 100
		skeletonCount = 5
		self:Bar("stages", 34, CL.landing, "INV_Misc_Head_Dragon_01")
		self:ScheduleTimer(DelayFear, 33)
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local prev = 0
	function mod:CharredEarthDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 2 then
			prev = args.time
			self:PersonalMessage(args.spellId, "underyou")
			self:PlaySound(args.spellId, "underyou")
		end
	end
end

function mod:BellowingRoar(args)
	self:CastBar(args.spellId, 2.5, CL.fear, L["36922_icon"])
	self:Message(args.spellId, "red", CL.incoming:format(CL.fear), L["36922_icon"])
	self:CDBar(args.spellId, 37, CL.fear, L["36922_icon"])
	self:PlaySound(args.spellId, "alert")
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

do
	local function DelayFear()
		mod:CDBar(36922, 61, CL.fear, L["36922_icon"]) -- Bellowing Roar
	end
	function mod:RestlessSkeletonDeath()
		skeletonCount = skeletonCount - 1
		if skeletonCount == 0 then
			skeletonCount = 5
			self:Message("stages", "cyan", CL.boss_landing:format(L.name), "INV_Misc_Head_Dragon_01")
			self:Bar("stages", 17, CL.landing, "INV_Misc_Head_Dragon_01")
			self:ScheduleTimer(DelayFear, 16)
			self:PlaySound("stages", "long")
		end
	end
end
