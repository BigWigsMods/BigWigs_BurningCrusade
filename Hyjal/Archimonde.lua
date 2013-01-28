--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Archimonde", 775)
if not mod then return end
mod:RegisterEnableMob(17968)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Your resistance is insignificant."
	L.grip_other = "Grip"
	L.fear_message = "Fear, next in ~42sec!"

	L.killable = "Becomes Killable"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		31972, 31970, {32014, "SAY", "ICON", "PROXIMITY"}, "berserk", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Grip", 31972)
	self:Log("SPELL_CAST_START", "Burst", 32014)
	self:Log("SPELL_CAST_START", "Fear", 31970)

	self:Log("SPELL_CAST_SUCCESS", "ProtectionOfElune", 38528)

	self:Yell("Engage", L["engage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 17968)
end

function mod:OnEngage()
	self:Berserk(600)
	self:OpenProximity(15, 32014)
	local fear = GetSpellInfo(31970)
	self:Bar(31970, "~"..fear, 40, 31970)
	self:DelayedMessage(31970, 40, CL["soon"]:format(fear), "Urgent", 31970)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Grip(player, spellId)
	self:TargetMessage(spellId, L["grip_other"], player, "Attention", spellId, "Alert")
end

function mod:Fear(_, spellId, _, _, spellName)
	self:Bar(spellId, "~"..spellName, 41.5, spellId)
	self:Message(spellId, L["fear_message"], "Important", spellId)
	self:DelayedMessage(spellId, 41.5, CL["soon"]:format(spellName), "Urgent")
end

do
	local fired, timer = 0, nil

	local function clearIcon()
		mod:PrimaryIcon(32014)
	end
	local function burstCheck(sGUID)
		fired = fired + 1
		local mobId = mod:GetUnitIdByGUID(sGUID)
		local player
		if mobId then
			player = UnitName(mobId.."target")
		end
		if player and not UnitDetailedThreatSituation(mobId.."target", mobId) then
			mod:CancelTimer(timer, true)
			timer = nil
			local burst = GetSpellInfo(32014)
			mod:TargetMessage(32014, burst, player, "Important", 32014, "Long")
			mod:PrimaryIcon(32014, player)
			mod:ScheduleTimer(clearIcon, 5)
			if UnitIsUnit(player, "player") then
				self:Say(32014, CL["say"]:format(burst))
			end
			return
		end
		-- 14 == 1.4sec
		-- Safety check if the unit doesn't exist
		if fired > 13 then
			mod:CancelTimer(timer, true)
			timer = nil
		end
	end
	function mod:Burst(...)
		fired = 0
		local sGUID = select(11, ...)
		if not timer then
			timer = self:ScheduleRepeatingTimer(burstCheck, 0.1, sGUID)
		end
	end
end

function mod:ProtectionOfElune()
	self:CancelAllTimers()
	self:PrimaryIcon(32014)
	self:SendMessage("BigWigs_StopBar", self, "~"..GetSpellInfo(31970))
	-- Use berserk instead of making a toggle option for this.
	self:Bar("berserk", L["killable"], 36, "achievement_boss_archimonde-")
end

