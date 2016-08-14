--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Maiden of Virtue", 799, 1555)
if not mod then return end
mod:RegisterEnableMob(16457)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Your behavior will not be tolerated."
	L.engage_message = "Maiden Engaged! Repentance in ~33sec"

	L.repentance_message = "Repentance! Next in ~33sec"
	L.repentance_warning = "Repentance Cooldown Over - Inc Soon!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		29511, {29522, "ICON"}, "proximity"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "HolyFire", 29522)
	self:Log("SPELL_CAST_START", "Repentance", 29511)

	self:Yell("Engage", L["engage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 16457)
end

function mod:OnEngage()
	self:Message(29511, "Attention", nil, L["engage_message"])
	self:DelayedMessage(29511, 33, "Urgent", L["repentance_warning"], false, "Alarm")
	self:CDBar(29511, 33)
	self:OpenProximity("proximity", 10)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:HolyFire(args)
	self:TargetMessage(args.spellId, args.destName, "Important")
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:Repentance(args)
	self:Message(args.spellId, "Important", nil, L["repentance_message"])
	self:Bar(args.spellId, 12, "<"..args.spellName..">")
	self:DelayedMessage(args.spellId, 33, "Urgent", L["repentance_warning"], false, "Alarm")
	self:CDBar(args.spellId, 33)
end

