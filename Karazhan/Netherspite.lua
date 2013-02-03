--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Netherspite", 799)
if not mod then return end
mod:RegisterEnableMob(15689)

local voidcount = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.phase = "Phases"
	L.phase_desc = "Warns when Netherspite changes from one phase to another."
	L.phase1_message = "Withdrawal - Netherbreaths Over"
	L.phase1_bar = "~Possible Withdrawal"
	L.phase1_trigger = "%s cries out in withdrawal, opening gates to the nether."
	L.phase2_message = "Rage - Incoming Netherbreaths!"
	L.phase2_bar = "~Possible Rage"
	L.phase2_trigger = "%s goes into a nether-fed rage!"

	L.voidzone_warn = "Void Zone (%d)!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"phase", 37063, 38523, "berserk", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "VoidZone", 37063)
	self:Log("SPELL_CAST_START", "Netherbreath", 38523)

	self:Emote("Phase1", L["phase1_trigger"])
	self:Emote("Phase2", L["phase2_trigger"])

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 15689)
end

function mod:OnEngage()
	voidcount = 1
	self:Bar("phase", L["phase2_bar"], 60, "Spell_ChargePositive")
	self:Berserk(540)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:VoidZone(_, spellId)
	self:Message(spellId, L["voidzone_warn"]:format(voidcount), "Attention", spellId)
	voidcount = voidcount + 1
end

function mod:Netherbreath(_, spellId, _, _, spellName)
	self:Message(spellId, spellName, "Urgent", spellId)
	self:Bar(spellId, "<"..spellName..">", 2.5, spellId)
end

function mod:Phase1()
	self:StopBar("<"..GetSpellInfo(38523)..">")
	self:Message("phase", L["phase1_message"], "Important", "Spell_ChargePositive")
	self:Bar("phase", L["phase2_bar"], 58, "Spell_ChargePositive")
end

function mod:Phase2()
	self:Message("phase", L["phase2_message"], "Important", "Spell_ChargeNegative")
	self:Bar("phase", L["phase1_bar"], 30, "Spell_ChargeNegative")
end

