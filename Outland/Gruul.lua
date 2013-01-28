--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Gruul the Dragonkiller", 776)
if not mod then return end
mod:RegisterEnableMob(19044)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Come.... and die."
	L.engage_message = "%s Engaged!"

	L.grow = "Grow"
	L.grow_desc = "Count and warn for Grull's grow."
	L.grow_icon = 36300
	L.grow_message = "Grows: (%d)"
	L.grow_bar = "Grow (%d)"

	L.grasp = "Grasp"
	L.grasp_desc = "Grasp warnings and timers."
	L.grasp_icon = 33525
	L.grasp_message = "Ground Slam - Shatter in ~10sec!"
	L.grasp_warning = "Ground Slam Soon"

	L.silence_message = "AOE Silence"
	L.silence_warning = "AOE Silence soon!"
	L.silence_bar = "~Silence"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"grasp", "grow", {36240, "FLASHSHAKE"}, 36297, "proximity", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Grow", 36300)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Grow", 36300)

	self:Log("SPELL_AURA_APPLIED", "CaveIn", 36240)
	self:Log("SPELL_CAST_SUCCESS", "Silence", 36297)
	self:Log("SPELL_CAST_START", "Shatter", 33654)
	self:Log("SPELL_CAST_START", "Slam", 33525)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Yell("Engage", L["engage_trigger"])

	self:Death("Win", 19044)
end

function mod:OnEngage()
	self:OpenProximity(15)

	self:Message("grasp", L["engage_message"]:format(self.displayName), "Attention")
	self:DelayedMessage("grasp", 30, L["grasp_warning"], "Urgent")
	self:Bar("grasp", "~"..GetSpellInfo(33525), 33, 33525)

	self:DelayedMessage(36297, 97, L["silence_warning"], "Urgent")
	self:Bar(36297, L["silence_bar"], 102, 36297)

	self:Bar("grow", L["grow_bar"]:format(1), 30, 36300)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CaveIn(player, spellId, _, _, spellName)
	if UnitIsUnit(player, "player") then
		self:LocalMessage(spellId, CL["you"]:format(spellName), "Personal", spellId, "Alarm")
		self:FlashShake(spellId)
	end
end

function mod:Grow(_, spellId, _, _, _, stack)
	stack = stack or 1
	self:Message("grow", L["grow_message"]:format(stack), "Important", spellId)
	stack = stack + 1
	if stack < 31 then
		self:Bar("grow", L["grow_bar"]:format(stack), 30, spellId)
	else
		stack = 1
		self:Bar("grow", L["grow_bar"]:format(stack), 300, spellId)
	end
end

function mod:Silence(_, spellId)
	self:Message(spellId, L["silence_message"], "Attention", spellId)
	self:DelayedMessage(spellId, 28, L["silence_warning"], "Urgent")
	self:Bar(spellId, L["silence_bar"], 31, spellId)
end

function mod:Shatter(_, spellId, _, _, spellName)
	self:Message("grasp", spellName, "Positive", spellId)
	self:DelayedMessage("grasp", 56, L["grasp_warning"], "Urgent")
	self:Bar("grasp", "~"..GetSpellInfo(33525), 62, 33525)
end

function mod:Slam(_, spellId)
	self:Message("grasp", L["grasp_message"], "Attention", spellId)
	self:Bar("grasp", GetSpellInfo(33654), 10, 33654)
end

