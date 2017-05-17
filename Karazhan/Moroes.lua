--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Moroes Raid", 799, 1554)
if not mod then return end
--Moroes, Baroness Dorothea Millstipe, Baron Rafe Dreuger, Lady Catriona Von'Indi,
--Lady Keira Berrybuck, Lord Robin Daris, Lord Crispin Ference
mod:RegisterEnableMob(15687, 19875, 19874, 19872, 17007, 19876, 19873)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Hm, unannounced visitors. Preparations must be made..."
	L.engage_message = "%s Engaged - Vanish in ~35sec!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		29448, {37066, "ICON"}, 37023
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Garrote", 37066)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 37023)
	self:Log("SPELL_AURA_APPLIED", "Vanish", 29448)

	self:Yell("Engage", L["engage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 15687)
end

function mod:OnEngage()
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "target", "focus")
	self:Message(29448, "Attention", nil, L["engage_message"]:format(self.displayName))

	self:CDBar(29448, 35)
	self:DelayedMessage(29448, 30, CL["soon"]:format(self:SpellName(29448)), "Attention")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Garrote(args)
	self:TargetMessage(args.spellId, args.destName, "Attention")
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:Frenzy(args)
	self:Message(args.spellId, "Important", "Alarm", "30% - "..args.spellName)
end

function mod:Vanish(args)
	self:Message(args.spellId, "Urgent", "Alert")
	self:CDBar(args.spellId, 35)
	self:DelayedMessage(args.spellId, 30, "Attention", CL["soon"]:format(args.spellName))
end

function mod:UNIT_HEALTH_FREQUENT(unit)
	if self:MobId(UnitGUID(unit)) == 15687 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp > 30 and hp < 36 then
			self:Message(37023, "Positive", "Info", CL["soon"]:format(self:SpellName(37023)), false) -- Frenzy
			self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
		end
	end
end

