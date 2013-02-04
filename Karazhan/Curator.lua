--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("The Curator", 799)
if not mod then return end
mod:RegisterEnableMob(15691)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "The Menagerie is for guests only."

	L.weaken_message = "Evocation - Weakened for 20sec!"
	L.weaken_fade_message = "Evocation Finished - Weakened Gone!"
	L.weaken_fade_warning = "Evocation over in 5sec!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		30254, 30403, "proximity", "berserk", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Evocate", 30254)
	self:Log("SPELL_CAST_SUCCESS", "Infusion", 30403)

	self:Yell("Engage", L["engage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 15691)
end

function mod:OnEngage()
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "target", "focus")
	self:OpenProximity("proximity", 10)
	self:Berserk(600)
	local evocation = self:SpellName(30254)
	self:Bar(30254, "~"..evocation, 109, 30254)
	self:DelayedMessage(30254, 39, CL["custom_sec"]:format(evocation, 70), "Positive")
	self:DelayedMessage(30254, 79, CL["custom_sec"]:format(evocation, 30), "Attention")
	self:DelayedMessage(30254, 99, CL["custom_sec"]:format(evocation, 10), "Urgent")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Evocate(args)
	self:Message(args.spellId, L["weaken_message"], "Important", args.spellId, "Alarm")
	self:Bar(args.spellId, CL["cast"]:format(args.spellName), 20, args.spellId)
	self:DelayedMessage(args.spellId, 15, L["weaken_fade_warning"], "Urgent")
	self:DelayedMessage(args.spellId, 20, L["weaken_fade_message"], "Important", nil, "Alarm")

	self:Bar(args.spellId, "~"..args.spellName, 115, args.spellId)
	self:DelayedMessage(args.spellId, 45, CL["custom_sec"]:format(args.spellName, 70), "Positive")
	self:DelayedMessage(args.spellId, 85, CL["custom_sec"]:format(args.spellName, 30), "Attention")
	self:DelayedMessage(args.spellId, 105, CL["custom_sec"]:format(args.spellName, 10), "Urgent")
end

function mod:Infusion(args)
	self:Message(args.spellId, "15% - "..args.spellName, "Important", args.spellId)

	self:CancelAllTimers()
	local evocation = self:SpellName(30254)
	self:StopBar("~"..evocation)
	self:StopBar(CL["cast"]:format(evocation))
end

function mod:UNIT_HEALTH_FREQUENT(unit)
	if self:GetCID(UnitGUID(unit)) == 15691 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp > 15 and hp < 20 then
			self:Message(30403, CL["soon"]:format(self:SpellName(30403)), "Positive") -- Arcane Infusion
			self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
		end
	end
end

