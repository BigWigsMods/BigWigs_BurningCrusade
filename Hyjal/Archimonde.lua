--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("ArchimondeHyjal", 775, 1581)
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
		31972, 31970, {32014, "SAY", "ICON", "PROXIMITY"}, "berserk"
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
	self:CDBar(31970, 40)
	self:DelayedMessage(31970, 40, "Urgent", CL["soon"]:format(self:SpellName(31970))) -- Fear
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Grip(args)
	self:TargetMessage(args.spellId, args.destName, "Attention", "Alert", L["grip_other"])
end

function mod:Fear(args)
	self:CDBar(args.spellId, 41.5)
	self:Message(args.spellId, "Important", nil, L["fear_message"])
	self:DelayedMessage(args.spellId, 41.5, "Urgent", CL["soon"]:format(args.spellName))
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
			mod:TargetMessage(spellId, player, "Important", "Long") -- Air Burst
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
	self:StopBar(31970) -- Fear
	-- Use berserk instead of making a toggle option for this.
	self:Bar("berserk", 36, L["killable"], "achievement_boss_archimonde-")
end

