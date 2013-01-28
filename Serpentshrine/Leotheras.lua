--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Leotheras the Blind", 780)
if not mod then return end
mod:RegisterEnableMob(21215)

local beDemon = mod:NewTargetList()
local demonTimer = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.enrage_trigger = "Finally, my banishment ends!"

	L.phase = "Demon Phase"
	L.phase_desc = "Estimated demon phase timers."
	L.phase_icon = "Spell_Shadow_Metamorphosis"
	L.phase_trigger = "Be gone, trifling elf.  I am in control now!"
	L.phase_demon = "Demon Phase for 60sec"
	L.phase_demonsoon = "Demon Phase in 5sec!"
	L.phase_normalsoon = "Normal Phase in 5sec"
	L.phase_normal = "Normal Phase!"
	L.demon_bar = "Demon Phase"
	L.demon_nextbar = "Next Demon Phase"

	L.mindcontrol = "Mind Control"
	L.mindcontrol_desc = "Warn which players are Mind Controlled."
	L.mindcontrol_icon = 37749
	L.mindcontrol_warning = "Mind Controlled"

	L.image = "Image"
	L.image_desc = "15% Image Split Alerts."
	L.image_trigger = "No... no! What have you done? I am the master! Do you hear me? I am... aaggh! Can't... contain him."
	L.image_message = "15% - Image Created!"
	L.image_warning = "Image Soon!"

	L.whisper = "Insidious Whisper (Demon)"
	L.whisper_desc = "Alert what players have Insidious Whisper (Demon)."
	L.whisper_icon = 37676
	L.whisper_message = "Demon"
	L.whisper_bar = "Demons Despawn"
	L.whisper_soon = "~Demons"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		37640, "whisper", "mindcontrol", "phase", "image", "berserk", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Whirlwind", 37640)
	self:Log("SPELL_AURA_REMOVED", "WhirlwindBar", 37640)
	self:Log("SPELL_AURA_APPLIED", "Whisper", 37676)
	self:Log("SPELL_AURA_APPLIED", "Madness", 37749)

	self:Yell("Image", L["image_trigger"])
	self:Yell("Phase", L["phase_trigger"])

	self:Yell("Engage", L["enrage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 21215)
end

function mod:OnEngage()
	self:RegisterEvent("UNIT_HEALTH_FREQUENT")
	demonTimer = nil

	self:DelayedMessage("phase", 55, L["phase_demonsoon"], "Urgent")
	self:Bar("phase", L["demon_nextbar"], 60, "Spell_Shadow_Metamorphosis")
	self:Berserk(600)
	self:WhirlwindBar()
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local scheduled = nil
	local function demonWarn()
		mod:TargetMessage("whisper", L["whisper_message"], beDemon, "Attention", 37676)
		scheduled = nil
	end
	function mod:Whisper(player, spellId)
		beDemon[#beDemon + 1] = player
		if not scheduled then
			scheduled = true
			self:Bar("whisper", L["whisper_bar"], 30, spellId)
			self:ScheduleTimer(demonWarn, 0.3)
		end
	end
end

function mod:Whirlwind(_, spellId, _, _, spellName)
	self:Message(spellId, spellName, "Important", spellId, "Alert")
	self:Bar(spellId, CL["cast"]:format(spellName), 12, spellId)
end

function mod:WhirlwindBar()
	local ww = GetSpellInfo(37640)
	self:Bar(37640, "~"..ww, 15, 37640)
	self:DelayedMessage(37640, 14, CL["soon"]:format(ww), "Attention")
end

function mod:Madness(player, spellId)
	self:TargetMessage("mindcontrol", L["mindcontrol_warning"], player, "Urgent", spellId, "Alert")
end

do
	local function demonSoon()
		mod:Message("phase", L["phase_normal"], "Important")
		mod:DelayedMessage("phase", 40, L["phase_demonsoon"], "Urgent")
		mod:Bar("phase", L["demon_nextbar"], 45, "Spell_Shadow_Metamorphosis")
	end
	function mod:Phase()
		local ww = GetSpellInfo(37640)
		self:SendMessage("BigWigs_StopBar", self, CL["cast"]:format(ww))
		self:SendMessage("BigWigs_StopBar", self, "~"..ww)
		self:SendMessage("BigWigs_StopBar", self, L["demon_nextbar"])
		self:CancelAllTimers()

		self:Message("phase", L["phase_demon"], "Attention")
		self:DelayedMessage("phase", 55, L["phase_normalsoon"], "Important")
		self:Bar("whisper", L["whisper_soon"], 23, 37676)
		self:Bar("phase", L["demon_bar"], 60, "Spell_Shadow_Metamorphosis")
		demonTimer = self:ScheduleTimer(demonSoon, 60)
		self:ScheduleTimer("WhirlwindBar", 60)
	end
end

function mod:Image()
	self:CancelTimer(demonTimer, true)
	self:CancelDelayedMessage(L["phase_normalsoon"])
	self:CancelDelayedMessage(L["phase_demonsoon"])
	self:SendMessage("BigWigs_StopBar", self, L["demon_bar"])
	self:SendMessage("BigWigs_StopBar", self, L["demon_nextbar"])
	self:Message("image", L["image_message"], "Important")
end

function mod:UNIT_HEALTH_FREQUENT(_, unit)
	if unit == "target" and self:GetCID(UnitGUID(unit)) == 21215 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp > 15 and hp < 20 then
			self:Message("image", L["image_warning"], "Urgent")
			self:UnregisterEvent("UNIT_HEALTH_FREQUENT")
		end
	end
end

