--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Netherspite", 532, 1561)
if not mod then return end
mod:RegisterEnableMob(15689)
mod:SetEncounterID(659)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local voidCount = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.phase1_message = "Withdrawal - Netherbreaths Over"
	L.phase1_bar = "~Possible Withdrawal"
	L.phase1_trigger = "%s cries out in withdrawal, opening gates to the nether."
	L.phase2_message = "Rage - Incoming Netherbreaths!"
	L.phase2_bar = "~Possible Rage"
	L.phase2_trigger = "%s goes into a nether-fed rage!"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		37063, -- Void Zone
		{38523, "CASTBAR"}, -- Netherbreath
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "VoidZone", 37063)
	self:Log("SPELL_CAST_START", "Netherbreath", 38523)

	self:Emote("Stage1Emote", L.phase1_trigger)
	self:Emote("Stage2Emote", L.phase2_trigger)
end

function mod:OnEngage()
	voidCount = 1
	self:SetStage(1)
	self:CDBar("stages", 60, L.phase2_bar, "Spell_ChargePositive")
	self:Berserk(540, true)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:VoidZone(args)
	self:Message(args.spellId, "yellow", CL.count:format(args.spellName, voidCount))
	voidCount = voidCount + 1
	self:PlaySound(args.spellId, "info")
end

function mod:Netherbreath(args)
	self:Message(args.spellId, "orange")
	self:CastBar(args.spellId, 2.5)
end

function mod:Stage1Emote()
	self:SetStage(1)
	self:StopCastBar(38523) -- Netherbreath
	self:StopBar(L.phase1_bar)
	self:Message("stages", "cyan", L.phase1_message, "Spell_ChargePositive")
	self:CDBar("stages", 58, L.phase2_bar, "Spell_ChargePositive")
	self:PlaySound("stages", "long")
end

function mod:Stage2Emote()
	self:SetStage(2)
	self:StopBar(L.phase2_bar)
	self:Message("stages", "cyan", L.phase2_message, "Spell_ChargeNegative")
	self:CDBar("stages", 30, L.phase1_bar, "Spell_ChargeNegative")
	self:PlaySound("stages", "long")
end
