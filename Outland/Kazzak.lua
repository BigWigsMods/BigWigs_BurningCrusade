--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Doom Lord Kazzak", 465)
if not mod then return end
mod:RegisterEnableMob(18728)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger1 = "The Legion will conquer all!"
	L.engage_trigger2 = "All mortals will perish!"

	L.enrage_warning1 = "%s Engaged - Enrage in 50-60sec"
	L.enrage_warning2 = "Enrage soon!"
	L.enrage_message = "Enraged for 10sec!"
	L.enrage_finished = "Enrage over - Next in 50-60sec"
	L.enrage_bar = "~Enrage"
	L.enraged_bar = "<Enraged>"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {{32960, "FLASH"}, 21063, "berserk", "bosskill"}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Mark", 32960)
	self:Log("SPELL_AURA_APPLIED", "Twisted", 21063)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 32964)

	self:Yell("Engage", L["engage_trigger1"], L["engage_trigger2"])

	self:Death("Win", 18728)
end

function mod:OnEngage()
	self:Message("berserk", L["enrage_warning1"]:format(self.displayName), "Attention")
	self:DelayedMessage("berserk", 49, L["enrage_warning2"], "Urgent")
	self:Bar("berserk", L["enrage_bar"], 60, 32964)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Mark(args)
	if UnitIsUnit("player", args.destName) then
		self:LocalMessage(args.spellId, CL["you"]:format(args.spellName), "Personal", args.spellId, "Alarm")
		self:Flash(args.spellId)
	end
end

function mod:Twisted(args)
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Attention", args.spellId)
end

function mod:Frenzy(args)
	self:Message("berserk", L["enrage_message"], "Important", args.spellId, "Alert")
	self:DelayedMessage("berserk", 10, L["enrage_finished"], "Positive")
	self:Bar("berserk", L["enraged_bar"], 10, args.spellId)
	self:DelayedMessage("berserk", 49, L["enrage_warning2"], "Urgent")
	self:Bar("berserk", L["enrage_bar"], 60, args.spellId)
end

