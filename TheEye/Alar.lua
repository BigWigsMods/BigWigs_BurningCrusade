--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Al'ar", 782)
if not mod then return end
mod:RegisterEnableMob(19514)

local first = nil

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		35383, {35410, "ICON"}, 35181, "berserk", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "FlamePatch", 35383)
	self:Log("SPELL_AURA_APPLIED", "Armor", 35410)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 19514)
end

function mod:OnEngage()
	self:Berserk(620)
	self:ScheduleTimer("ScanForAlar", 5)
	first = nil
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:FlamePatch(player, spellId, _, _, spellName)
	if UnitIsUnit("player", player) then
		self:LocalMessage(spellId, CL["underyou"]:format(spellName), "Personal", spellId, "Alarm")
	end
end

function mod:Armor(player, spellId, _, _, spellName)
	self:TargetMessage(spellId, spellName, player, "Important", spellId, "Long")
	self:Bar(spellId, CL["other"]:format(spellName, player), 60, spellId)
	self:PrimaryIcon(spellId, player)
end

do
	local timer = nil
	function mod:ScanForAlar()
		if not self:GetUnitIdByGUID(19514) then
			local diveBomb = GetSpellInfo(35181)
			if not first then
				first = true
			else
				self:Message(35181, diveBomb, "Urgent", 35181, "Alarm")
			end
			self:DelayedMessage(35181, 47, CL["soon"]:format(diveBomb), "Important")
			self:Bar(35181, "~"..diveBomb, 52, 35181)
			self:CancelTimer(timer, true)
			timer = nil
			self:ScheduleTimer("ScanForAlar", 25)
			return
		end
		if not timer then
			timer = self:ScheduleRepeatingTimer("ScanForAlar", 1)
		end
	end
end

