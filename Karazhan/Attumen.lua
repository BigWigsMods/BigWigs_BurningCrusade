--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Attumen the Huntsman Raid", 532, 1553)
if not mod then return end
mod:RegisterEnableMob(16152, 16151, 15550)
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
	self:Log("SPELL_AURA_APPLIED", "IntangiblePresence", 29833)
	self:BossYell("Stage3Yell", L.phase3_trigger)

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
end

function mod:OnEngage()
	self:SetStage(1)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:IntangiblePresence(args)
	self:TargetMessage(args.spellId, "yellow", args.destName, CL.curse)
end

function mod:CHAT_MSG_MONSTER_EMOTE(_, msg)
	if not self:IsSecret(msg) and msg == L.phase2_trigger then
		self:SetStage(2)
		self:Message("stages", "cyan", CL.stage:format(2), false)
		self:PlaySound("stages", "info")
	end
end

function mod:Stage3Yell()
	self:SetStage(3)
	self:Message("stages", "cyan", CL.stage:format(3), false)
	self:PlaySound("stages", "info")
end
