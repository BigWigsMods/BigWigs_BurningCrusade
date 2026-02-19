--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Prince Malchezaar", 532, 1563)
if not mod then return end
mod:RegisterEnableMob(15690)
mod:SetEncounterID(661)
mod:SetRespawnTime(60)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.wipe_bar = "Respawn"

	L.phase = "Engage"
	L.phase_desc = "Alert when changing phases."
	L.phase1_trigger = "Madness has brought you here to me. I shall be your undoing!"
	L.phase2_trigger = "Simple fools! Time is the fire in which you'll burn!"
	L.phase3_trigger = "How can you hope to stand against such overwhelming power?"
	L.phase1_message = "Phase 1 - Infernal in ~40sec!"
	L.phase2_message = "60% - Phase 2"
	L.phase3_message = "30% - Phase 3 "

	L.infernal = "Infernals"
	L.infernal_desc = "Show cooldown timer for Infernal summons."
	L.infernal_icon = "INV_Stone_05"
	L.infernal_bar = "Incoming Infernal"
	L.infernal_message = "Infernal Landed! Hellfire in 5sec!"
	L.infernal_trigger1 = "but the legions I command"
	L.infernal_trigger2 = "All realities"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		{30843, "CASTBAR"}, -- Enfeeble
		{30852, "CASTBAR"}, -- Shadow Nova
		"infernal",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Enfeeble", 30843)
	self:Log("SPELL_AURA_APPLIED", "EnfeebleApplied", 30843)
	self:Log("SPELL_CAST_START", "ShadowNova", 30852)
	if self:Classic() then
		self:BossYell("Infernal", L["infernal_trigger1"], L["infernal_trigger2"])
	else
		self:Log("SPELL_CAST_SUCCESS", "Infernal", 30834)
	end

	self:BossYell("Stage2Yell", L["phase2_trigger"])
	self:BossYell("Stage3Yell", L["phase3_trigger"])
end

function mod:OnEngage()
	self:SetStage(1)

	self:Bar(30843, 30) -- Enfeeble
	self:CDBar(30852, 33.5) -- Shadow Nova
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Enfeeble(args)
	self:Message(args.spellId, "red")
	self:Bar(args.spellId, 30)
	self:CastBar(args.spellId, 9)
end

function mod:EnfeebleApplied(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId)
		self:StopCastBar(args.spellName)
		self:TargetBar(args.spellId, 9, args.destName)
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	end
end

function mod:ShadowNova(args)
	self:Message(args.spellId, "yellow")
	self:CastBar(args.spellId, 2)
	if self:GetStage() == 3 then
		self:CDBar(args.spellId, 18)
	else
		self:CDBar(args.spellId, 31)
	end
	self:PlaySound(args.spellId, "alarm")
end

function mod:Infernal()
	if self:Classic() then
		self:Message("infernal", "orange", CL.custom_sec:format(L.infernal_bar, 20), L.infernal_icon)
		self:DelayedMessage("infernal", 15, "orange", L.infernal_message, false, "alert")
		self:Bar("infernal", 20, L.infernal_bar, L.infernal_icon)
		self:PlaySound("infernal", "info")
	else
		self:Message("infernal", "orange", CL.custom_sec:format(L.infernal_bar, 17), L.infernal_icon)
		self:DelayedMessage("infernal", 12, "orange", L.infernal_message, false, "alert")
		self:Bar("infernal", 17, L.infernal_bar, L.infernal_icon)
		self:PlaySound("infernal", "info")
	end
end

function mod:Stage2Yell()
	self:SetStage(2)
	self:Message("stages", "cyan", CL.percent:format(60, CL.stage:format(2)), false)
end

function mod:Stage3Yell()
	self:SetStage(3)
	self:StopBar(30843) -- Enfeeble
	self:StopBar(30852) -- Shadow Nova
	self:Message("stages", "cyan", CL.percent:format(30, CL.stage:format(3)), false)
end
