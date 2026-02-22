--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Magtheridon", 544, 1566)
if not mod then return end
mod:RegisterEnableMob(17257, 17256) -- Magtheridon, Hellfire Channeler
mod:SetEncounterID(651)
mod:SetRespawnTime(28)

--------------------------------------------------------------------------------
-- Locals
--

local abycount = 1
local mindExhaustionList = {}
local mindExhaustionDebuffTime = {}
local UpdateInfoBoxList

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.escape = "Escape"
	L.escape_desc = "Countdown until Magtheridon breaks free."
	L.escape_icon = "ability_rogue_trip"
	L.escape_trigger1 = "%%s's bonds begin to weaken!"
	L.escape_trigger2 = "I... am... unleashed!"
	L.escape_warning1 = "%s Engaged - Breaks free in 2min!"
	L.escape_warning2 = "Breaks free in 1min!"
	L.escape_warning3 = "Breaks free in 30sec!"
	L.escape_warning4 = "Breaks free in 10sec!"
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
	L["30168_desc"] = "Warn when you Banish Magtheridon."
	L.banished = "Banished"

	L.debris_trigger = "Let the walls of this prison tremble"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{"escape", "COUNTDOWN"},
		"abyssal",
		"heal",
		{30616, "CASTBAR", "EMPHASIZE"}, -- Blast Nova
		30168, -- Shadow Cage
		36449, -- Debris
		{44032, "INFOBOX"}, -- Mind Exhaustion
		"berserk",
	},nil,{
		[30168] = L.banish, -- Shadow Cage (Banish)
	}
end

function mod:OnBossEnable()
	mindExhaustionList = {}
	mindExhaustionDebuffTime = {}
	self:Log("SPELL_AURA_APPLIED", "MindExhaustionApplied", 44032)
	self:Log("SPELL_AURA_REFRESH", "MindExhaustionApplied", 44032)
	self:Log("SPELL_AURA_REMOVED", "MindExhaustionRemoved", 44032)
	self:Log("SPELL_AURA_APPLIED", "DebrisApplied", 36449)
	self:Log("SPELL_SUMMON", "BurningAbyssal", 30511)
	self:Log("SPELL_CAST_START", "DarkMending", 30528)
	self:Log("SPELL_CAST_START", "BlastNova", 30616)

	self:Log("SPELL_AURA_APPLIED", "ShadowCageApplied", 30168)
	self:Log("SPELL_AURA_REMOVED", "ShadowCageRemoved", 30168)

	self:BossYell("EscapeYell", L["escape_trigger2"])
	self:BossYell("DebrisIncYell", L["debris_trigger"])
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
end

function mod:OnEngage()
	abycount = 1
	mindExhaustionList = {}
	mindExhaustionDebuffTime = {}

	self:Message("escape", "yellow", L.escape_warning1:format(self.displayName), L.escape_icon)
	self:Bar("escape", 120, L.escape_bar, L.escape_icon)
	self:DelayedMessage("escape", 60, "yellow", L.escape_warning2)
	self:DelayedMessage("escape", 90, "yellow", L.escape_warning3)
	self:DelayedMessage("escape", 110, "yellow", L.escape_warning4)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CHAT_MSG_MONSTER_EMOTE(_, msg)
	if not self:IsSecret(msg) and (msg:find(L.escape_trigger1) or msg:find(L.escape_trigger1, nil, true) or msg == L.escape_trigger1) then
		self:Engage()
	end
end

function mod:MindExhaustionApplied(args)
	if not mindExhaustionList[1] then
		self:OpenInfo(args.spellId, CL.other:format("BigWigs", "|T136222:0:0:0:0:64:64:4:60:4:60|t".. self:SpellName(57723)), 5) -- 57723 = "Exhaustion"
		self:SimpleTimer(UpdateInfoBoxList, 1)
	end
	self:DeleteFromTable(mindExhaustionList, args.destName)
	mindExhaustionList[#mindExhaustionList + 1] = args.destName
	mindExhaustionDebuffTime[args.destName] = GetTime() + 30
end

function mod:MindExhaustionRemoved(args)
	mindExhaustionDebuffTime[args.destName] = nil
	self:DeleteFromTable(mindExhaustionList, args.destName)
	if not mindExhaustionList[1] then
		self:CloseInfo(args.spellId)
	end
end

function mod:BurningAbyssal(args)
	self:Message("abyssal", "cyan", L.abyssal_message:format(abycount), args.spellId)
	abycount = abycount + 1
end

function mod:DarkMending(args)
	self:Message("heal", "orange", L.heal_message, args.spellId)
	self:PlaySound("heal", "alarm")
end

do
	local appliedTime = 0
	function mod:ShadowCageApplied(args)
		appliedTime = args.time
		self:StopCastBar(30616) -- Blast Nova
		self:Message(args.spellId, "red", L.banished)
		self:PlaySound(args.spellId, "info")
	end

	function mod:ShadowCageRemoved(args)
		self:Message(args.spellId, "green", CL.removed_after:format(L.banish, args.time-appliedTime))
	end
end

function mod:EscapeYell()
	self:RegisterEvent("UNIT_HEALTH")
	self:CDBar(30616, 58) -- Blast Nova
	self:Berserk(1200, true)

	self:StopBar(L.escape_bar)
	self:CancelDelayedMessage(L.escape_warning2)
	self:CancelDelayedMessage(L.escape_warning3)
	self:CancelDelayedMessage(L.escape_warning4)
end

function mod:BlastNova(args)
	self:Message(args.spellId, "red")
	self:CDBar(args.spellId, 51)
	self:CastBar(args.spellId, 12)
	self:PlaySound(args.spellId, "warning")
end

function mod:DebrisApplied(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId)
		self:PlaySound(args.spellId, "alert", nil, args.destName)
	end
end

function mod:DebrisIncYell()
	self:Message(36449, "orange", CL.percent:format(30, CL.incoming:format(self:SpellName(36449))))
	self:PlaySound(36449, "long")
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 17257 then
		local hp = self:GetHealth(unit)
		if hp < 37 then
			self:UnregisterEvent(event)
			if hp > 30 then
				self:Message(36449, "orange", CL.soon:format(self:SpellName(36449)), false) -- Debris
			end
		end
	end
end

function UpdateInfoBoxList()
	if not mod:IsEngaged() or not mindExhaustionList[1] then return end
	mod:SimpleTimer(UpdateInfoBoxList, 0.1)

	local t = GetTime()
	local line = 1
	for i = 1, 5 do
		local player = mindExhaustionList[i]
		if player then
			local remaining = (mindExhaustionDebuffTime[player] or 0) - t
			mod:SetInfo(44032, line, mod:ColorName(player))
			if remaining > 0 then
				mod:SetInfo(44032, line + 1, CL.seconds:format(remaining))
				mod:SetInfoBar(44032, line, remaining / 30)
			else
				mod:SetInfo(44032, line + 1, "")
				mod:SetInfoBar(44032, line, 0)
			end
		else
			mod:SetInfo(44032, line, "")
			mod:SetInfo(44032, line + 1, "")
			mod:SetInfoBar(44032, line, 0)
		end
		line = line + 2
	end
end
