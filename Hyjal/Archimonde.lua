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
	self:OpenProximity(32014, 15)
	local fear = self:SpellName(31970)
	self:Bar(31970, "~"..fear, 40, 31970)
	self:DelayedMessage(31970, 40, CL["soon"]:format(fear), "Urgent", 31970)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Grip(args)
	self:TargetMessage(args.spellId, L["grip_other"], args.destName, "Attention", args.spellId, "Alert")
end

function mod:Fear(args)
	self:Bar(args.spellId, "~"..args.spellName, 41.5, args.spellId)
	self:Message(args.spellId, L["fear_message"], "Important", args.spellId)
	self:DelayedMessage(args.spellId, 41.5, CL["soon"]:format(args.spellName), "Urgent")
end

do
	local fired, timer = 0, nil

	local function burstCheck(sGUID, spellId)
		fired = fired + 1
		local mobId = mod:GetUnitIdByGUID(sGUID)
		local player
		if mobId then
			player = UnitName(mobId.."target")
		end
		if player and not UnitDetailedThreatSituation(mobId.."target", mobId) then
			mod:CancelTimer(timer)
			timer = nil
			mod:TargetMessage(spellId, spellId, player, "Important", spellId, "Long") -- Air Burst
			mod:PrimaryIcon(spellId, player)
			mod:ScheduleTimer("PrimaryIcon", 5, spellId)
			if UnitIsUnit(player, "player") then
				mod:Say(spellId)
			end
			return
		end
		-- 14 == 1.4sec
		-- Safety check if the unit doesn't exist
		if fired > 13 then
			mod:CancelTimer(timer)
			timer = nil
		end
	end
	function mod:Burst(args)
		fired = 0
		if not timer then
			timer = self:ScheduleRepeatingTimer(burstCheck, 0.1, args.sourceGUID, args.spellId)
		end
	end
end

function mod:ProtectionOfElune()
	self:CancelAllTimers()
	self:PrimaryIcon(32014)
	self:StopBar("~"..self:SpellName(31970)) -- Fear
	-- Use berserk instead of making a toggle option for this.
	self:Bar("berserk", L["killable"], 36, "achievement_boss_archimonde-")
end

