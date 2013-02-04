--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Terestian Illhoof", 799)
if not mod then return end
mod:RegisterEnableMob(15688)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "^Ah, you're just in time."

	L.weak = "Weakened"
	L.weak_desc = "Warn for weakened state."
	L.weak_icon = 30065
	L.weak_message = "Weakened for ~45sec!"
	L.weak_warning1 = "Weakened over in ~5sec!"
	L.weak_warning2 = "Weakened over!"
	L.weak_bar = "~Weakened Fades"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"weak", {30115, "ICON"}, "berserk", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Sacrifice", 30115)
	self:Log("SPELL_AURA_APPLIED", "Weakened", 30065)
	self:Log("SPELL_AURA_REMOVED", "WeakenedRemoved", 30065)
	self:Log("SPELL_AURA_REMOVED", "SacrificeRemoved", 30115)

	self:Yell("Engage", L["engage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 15688)
end

function mod:OnEngage()
	self:Berserk(600)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Sacrifice(args)
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Attention", args.spellId)
	self:TargetBar(args.spellId, args.spellName, args.destName, 30, args.spellId)
	self:DelayedMessage(args.spellId, 40, CL["soon"]:format(args.spellName), "Urgent")
	self:Bar(args.spellId, "~"..args.spellName, 42, args.spellId)
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:Weakened(args)
	self:Message("weak", L["weak_message"], "Important", args.spellId, "Alarm")
	self:DelayedMessage("weak", 40, L["weak_warning1"], "Attention")
	self:Bar("weak", L["weak_bar"], 45, args.spellId)
end

function mod:WeakenedRemoved(args)
	self:Message(args.spellId, L["weak_warning2"], "Attention", nil, "Info")
	self:CancelDelayedMessage(L["weak_warning1"])
	self:StopBar(L["weak_bar"])
end

function mod:SacrificeRemoved(args)
	self:StopBar(args.spellName, args.destName)
	self:PrimaryIcon(args.spellId, args.destName)
end

