--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("The Lurker Below", 780)
if not mod then return end
mod:RegisterEnableMob(21217, 21873, 21865) --Lurker, Coilfang Guardian, Coilfang Ambusher

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_warning = "%s Engaged - Possible Dive in 90sec"

	L.dive = "Dive"
	L.dive_desc = "Timers for when The Lurker Below dives."
	L.dive_icon = "Spell_Frost_ArcticWinds"
	L.dive_warning = "Possible Dive in %dsec!"
	L.dive_bar = "~Dives in"
	L.dive_message = "Dives - Back in 60sec"

	L.spout = "Spout"
	L.spout_desc = "Timers for Spout, may not always be accurate."
	L.spout_icon = "INV_Weapon_Rifle_02"
	L.spout_message = "Casting Spout!"
	L.spout_warning = "Possible Spout in ~3sec!"
	L.spout_bar = "~Spout"

	L.emerge_warning = "Back in %dsec"
	L.emerge_message = "Back - Possible Dive in 90sec"
	L.emerge_bar = "Back in"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"dive", "spout", 37660, "proximity", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_DAMAGE", "Whirl", 37363)
	self:Log("SPELL_MISSED", "Whirl", 37363)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("RAID_BOSS_EMOTE")

	self:Death("Win", 21217)
end

function mod:OnEngage()
	self:Message("dive", L["engage_warning"]:format(self.displayName), "Attention")
	local dwarn = L["dive_warning"]
	self:DelayedMessage("dive", 30, (dwarn):format(60), "Positive")
	self:DelayedMessage("dive", 60, (dwarn):format(30), "Positive")
	self:DelayedMessage("dive", 80, (dwarn):format(10), "Positive")
	self:DelayedMessage("dive", 85, (dwarn):format(5), "Urgent", nil, "Alarm")
	self:Bar("dive", L["dive_bar"], 90, "Spell_Frost_ArcticWinds")

	self:Bar(37660, "~"..GetSpellInfo(37660), 17, 37660)

	self:DelayedMessage("spout", 34, L["spout_warning"], "Attention")
	self:Bar("spout", L["spout_bar"], 37, "INV_Weapon_Rifle_02")

	self:OpenProximity(10)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local last = 0
	function mod:Whirl(_, _, _, _, spellName)
		local time = GetTime()
		if (time - last) > 10 then
			last = time
			self:Bar(37660, "~"..spellName, 17, 37660)
		end
	end
end

function mod:RAID_BOSS_EMOTE(_, _, unit)
	if unit == self.displayName then
		self:ScanForLurker()
		self:CheckForWipe()
		self:Bar("spout", L["spout_message"], 20, "Spell_Frost_ChillingBlast")
		self:Bar("spout", L["spout_bar"], 50, "Spell_Frost_ChillingBlast")
		self:Message("spout", L["spout_message"], "Important", nil, "Alert", nil, 37433)
		self:DelayedMessage("spout", 47, L["spout_warning"], "Attention")
		self:SendMessage("BigWigs_StopBar", self, "~"..GetSpellInfo(37660))
	end
end

do
	local timer = nil
	function mod:ScanForLurker()
		-- XXX Fix this as Lurker can come up early when all adds die
		if not self:GetUnitIdByGUID(21217) then
			self:CancelAllTimers()
			timer = nil
			self:CloseProximity()
			self:SendMessage("BigWigs_StopBar", self, L["spout_bar"])
			self:SendMessage("BigWigs_StopBar", self, "~"..GetSpellInfo(37660))
			self:ScheduleTimer("LurkerUp", 60)

			local ewarn = L["emerge_warning"]
			self:Message("dive", L["dive_message"], "Attention")
			self:DelayedMessage("dive", 30, (ewarn):format(30), "Positive")
			self:DelayedMessage("dive", 50, (ewarn):format(10), "Positive")
			self:DelayedMessage("dive", 55, (ewarn):format(5), "Urgent", nil, "Alert")
			self:DelayedMessage("dive", 60, L["emerge_message"], "Attention")
			self:Bar("dive", L["emerge_bar"], 60, "Spell_Frost_Stun")

			self:Bar("spout", L["spout_bar"], 63, "Spell_Frost_ChillingBlast")
			self:DelayedMessage("spout", 60, L["spout_warning"], "Attention")
			return
		end
		if not timer then
			timer = self:ScheduleRepeatingTimer("ScanForLurker", 1)
		end
	end
end

function mod:LurkerUp()
	local dwarn = L["dive_warning"]
	self:DelayedMessage("dive", 30, (dwarn):format(60), "Positive")
	self:DelayedMessage("dive", 60, (dwarn):format(30), "Positive")
	self:DelayedMessage("dive", 80, (dwarn):format(10), "Positive")
	self:DelayedMessage("dive", 85, (dwarn):format(5), "Urgent", nil, "Alarm")
	self:Bar("dive", L["dive_bar"], 90, "Spell_Frost_ArcticWinds")

	self:OpenProximity(10)
	self:ScheduleRepeatingTimer("CheckForWipe", 20)
end

