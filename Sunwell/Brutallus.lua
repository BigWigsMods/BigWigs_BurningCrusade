--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Brutallus", 580, 1592)
if not mod then return end
mod:RegisterEnableMob(24882)

--------------------------------------------------------------------------------
-- Locals
--

local meteorCounter = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Ah, more lambs to the slaughter!"

	L.burnresist = "Burn Resist"
	L.burnresist_desc = "Warn who resists burn."
	L.burnresist_icon = 45141
	L.burn_resist = "%s resisted Burn"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{46394, "ICON"}, -- Burn
		"burnresist",
		45150, -- Meteor Slash
		45185, -- Stomp
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_MISSED", "BurnResist", 45141)
	self:Log("SPELL_CAST_START", "Meteor", 45150)
	self:Log("SPELL_AURA_APPLIED", "Burn", 46394)
	self:Log("SPELL_AURA_REMOVED", "BurnRemove", 46394)
	self:Log("SPELL_CAST_SUCCESS", "Stomp", 45185)

	self:BossYell("Engage", L.engage_trigger)
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 24882)
end

function mod:OnEngage()
	meteorCounter = 1
	self:Berserk(360)
	self:Bar(46394, 20) -- Burn
	self:DelayedMessage(46394, 16, "yellow", CL.soon:format(self:SpellName(46394))) -- Burn
	self:Bar(45185, 30) -- Stomp
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Burn(args)
	self:TargetMessageOld(args.spellId, args.destName, "red", "alert")
	self:PrimaryIcon(args.spellId, args.destName)
	self:TargetBar(args.spellId, 60, args.destName)
	self:Bar(args.spellId, 20)
	self:DelayedMessage(args.spellId, 16, "yellow", CL.soon:format(args.spellName))
end

function mod:Meteor(args)
	meteorCounter = meteorCounter + 1
	self:Bar(args.spellId, 12, CL.count:format(args.spellName, meteorCounter))
end

function mod:BurnRemove(args)
	self:StopBar(args.spellName, args.destName)
end

function mod:BurnResist(args)
	self:MessageOld("burnresist", "green", nil, L.burn_resist:format(args.destName), args.spellId)
end

function mod:Stomp(args)
	self:TargetMessageOld(args.spellId, args.destName, "orange")
	self:DelayedMessage(args.spellId, 25.5, "yellow", CL.custom_sec:format(args.spellName, 5))
	self:Bar(args.spellId, 30.5)
end
