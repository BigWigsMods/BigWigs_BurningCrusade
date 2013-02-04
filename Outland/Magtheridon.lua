--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Magtheridon", 779)
if not mod then return end
mod:RegisterEnableMob(17257, 17256) --Magtheridon, Hellfire Channeler

local abycount = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.escape = "Escape"
	L.escape_desc = "Countdown until Magtheridon breaks free."
	L.escape_icon = 20589
	L.escape_trigger1 = "%%s's bonds begin to weaken!"
	L.escape_trigger2 = "I... am... unleashed!"
	L.escape_warning1 = "%s Engaged - Breaks free in 2min!"
	L.escape_warning2 = "Breaks free in 1min!"
	L.escape_warning3 = "Breaks free in 30sec!"
	L.escape_warning4 = "Breaks free in 10sec!"
	L.escape_warning5 = "Breaks free in 3sec!"
	L.escape_bar = "Released..."
	L.escape_message = "%s Released!"

	L.abyssal = "Burning Abyssal"
	L.abyssal_desc = "Warn when a Burning Abyssal is created."
	L.abyssal_icon = 30511
	L.abyssal_message = "Burning Abyssal Created (%d)"

	L.heal = "Heal"
	L.heal_desc = "Warn when a Hellfire Channeler starts to heal."
	L.heal_icon = 30528
	L.heal_message = "Healing!"

	L.banish = "Banish"
	L.banish_desc = "Warn when you Banish Magtheridon."
	L.banish_icon = 30168
	L.banish_message = "Banished for ~10sec"
	L.banish_over_message = "Banish Fades!"
	L.banish_bar = "<Banished>"

	L.exhaust = self:SpellName(44032)
	L.exhaust_desc = "Timer bars for Mind Exhaustion on players."
	L.exhaust_icon = 44032
	L.exhaust_bar = "[%s] Exhausted"

	L.debris_trigger = "Let the walls of this prison tremble"
	L.debris_message = "30% - Incoming Debris!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"escape", "abyssal", "heal",
		30616, "banish", 36449,
		"exhaust", "berserk", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Exhaustion", 44032)
	self:Log("SPELL_AURA_APPLIED", "Debris", 36449)
	self:Log("SPELL_SUMMON", "Abyssal", 30511)
	self:Log("SPELL_CAST_START", "Heal", 30528)
	self:Log("SPELL_CAST_START", "Nova", 30616)

	self:Log("SPELL_AURA_APPLIED", "Banished", 30168)
	self:Log("SPELL_AURA_REMOVED", "BanishRemoved", 30168)

	self:Yell("Start", L["escape_trigger2"])
	self:Yell("DebrisInc", L["debris_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")

	self:Death("Win", 17257)
end

function mod:OnEngage()
	self:RegisterEvent("UNIT_HEALTH_FREQUENT")
	abycount = 1

	self:Message("escape", L["escape_warning1"]:format(self.displayName), "Attention", 20589)
	self:Bar("escape", L["escape_bar"], 120, 20589)
	self:DelayedMessage("escape", 60, L["escape_warning2"], "Positive")
	self:DelayedMessage("escape", 90, L["escape_warning3"], "Attention")
	self:DelayedMessage("escape", 110, L["escape_warning4"], "Urgent")
	self:DelayedMessage("escape", 117, L["escape_warning5"], "Urgent", nil, "Long")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CHAT_MSG_MONSTER_EMOTE(_, msg)
	if msg:find(L["escape_trigger1"]) then
		self:Engage()
	end
end

function mod:Exhaustion(args)
	self:Bar("exhaust", L["exhaust_bar"]:format(args.destName), 30, args.spellId)
end

function mod:Abyssal()
	self:Message("abyssal", L["abyssal_message"]:format(abycount), "Attention", 30511)
	abycount = abycount + 1
end

function mod:Heal(args)
	self:Message("heal", L["heal_message"], "Urgent", args.spellId, "Alarm")
	self:Bar("heal", L["heal_message"], 2, args.spellId)
end

function mod:Banished(args)
	self:Message("banish", L["banish_message"], "Important", args.spellId, "Info")
	self:Bar("banish", L["banish_bar"], 10, args.spellId)
	local nova = self:SpellName(30616)
	self:StopBar(CL["cast"]:format(nova))
end

function mod:BanishRemoved(args)
	self:Message("banish", L["banish_over_message"], "Attention", args.spellId)
	self:StopBar(L["banish_bar"])
end

function mod:Start()
	local nova = self:SpellName(30616)
	self:Bar(30616, "~"..nova, 58, 30616)
	self:DelayedMessage(30616, 56, CL["soon"]:format(nova), "Urgent")
	self:Berserk(1200)

	self:StopBar(L["escape_bar"])
	self:CancelDelayedMessage(L["escape_warning2"])
	self:CancelDelayedMessage(L["escape_warning3"])
	self:CancelDelayedMessage(L["escape_warning4"])
	self:CancelDelayedMessage(L["escape_warning5"])
end

function mod:Nova(args)
	self:Message(args.spellId, args.spellName, "Positive", args.spellId)
	self:Bar(args.spellId, "~"..args.spellName, 51, args.spellId)
	self:Bar(args.spellId, CL["cast"]:format(args.spellName), 12, args.spellId)
	self:DelayedMessage(args.spellId, 48, CL["soon"]:format(args.spellName), "Urgent")
end

function mod:Debris(args)
	if UnitIsUnit(args.destName, "player") then
		self:LocalMessage(args.spellId, CL["you"]:format(args.spellName), "Important", args.spellId, "Alert")
	end
end

function mod:DebrisInc()
	self:Message(36449, L["debris_message"], "Positive", 36449)
end

function mod:UNIT_HEALTH_FREQUENT(_, unit)
	if unit == "target" and self:GetCID(UnitGUID(unit)) == 17257 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp > 30 and hp < 37 then
			local debris = self:SpellName(36449)
			self:Message(36449, CL["soon"]:format(debris), "Positive")
			self:UnregisterEvent("UNIT_HEALTH_FREQUENT")
		end
	end
end

