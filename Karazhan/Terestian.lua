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

function mod:Sacrifice(player, spellId, _, _, spellName)
	self:TargetMessage(spellId, spellName, player, "Attention", spellId)
	self:Bar(spellId, CL["other"]:format(spellName, player), 30, spellId)
	self:DelayedMessage(spellId, 40, CL["soon"]:format(spellName), "Urgent")
	self:Bar(spellId, "~"..spellName, 42, spellId)
	self:PrimaryIcon(spellId, player)
end

function mod:Weakened(_, spellId)
	self:Message("weak", L["weak_message"], "Important", spellId, "Alarm")
	self:DelayedMessage("weak", 40, L["weak_warning1"], "Attention")
	self:Bar("weak", L["weak_bar"], 45, spellId)
end

function mod:WeakenedRemoved(_, spellId)
	self:Message(spellId, L["weak_warning2"], "Attention", nil, "Info")
	self:CancelDelayedMessage(L["weak_warning1"])
	self:SendMessage("BigWigs_StopBar", self, L["weak_bar"])
end

function mod:SacrificeRemoved(player, spellId, _, _, spellName)
	self:SendMessage("BigWigs_StopBar", self, CL["other"]:format(player))
	self:PrimaryIcon(spellId)
end

