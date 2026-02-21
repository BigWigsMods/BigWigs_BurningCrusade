--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Attumen the Huntsman Raid", 532, 1553)
if not mod then return end
mod:RegisterEnableMob(16151, 15550, 16152) -- Midnight, Attumen, Attumen (Mounted)
mod:SetEncounterID(652)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.phase2_trigger = "%s calls for her master!"
	L.phase3_trigger = "Come Midnight, let's disperse this petty rabble!"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		29833, -- Intangible Presence
	},nil,{
		[29833] = CL.curse, -- Intangible Presence (Curse)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "IntangiblePresence", 29833)
	self:Log("SPELL_CAST_SUCCESS", "SummonAttumen", 29714)
	self:Log("SPELL_CAST_SUCCESS", "Mount", 29770)
end

function mod:OnEngage()
	self:SetStage(1)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:IntangiblePresence(args)
	self:Message(args.spellId, "yellow", CL.on_group:format(CL.curse))
	self:PlaySound(args.spellId, "alert")
end

function mod:SummonAttumen() -- Stage 2
	self:SetStage(2)
	self:Message("stages", "cyan", CL.stage:format(2), false)
	self:PlaySound("stages", "info")
end

function mod:Mount() -- Stage 3
	self:SetStage(3)
	self:Message("stages", "cyan", CL.stage:format(3), false)
	self:PlaySound("stages", "info")
end
