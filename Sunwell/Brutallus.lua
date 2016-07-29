--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Brutallus", 789)
if not mod then return end
mod:RegisterEnableMob(24882)

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

	L.meteor_bar = "Meteor Slash #%d"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{46394, "WHISPER", "ICON"}, "burnresist", 45150, 45185, "berserk"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_MISSED", "BurnResist", 45141)
	self:Log("SPELL_CAST_START", "Meteor", 45150)
	self:Log("SPELL_AURA_APPLIED", "Burn", 46394)
	self:Log("SPELL_AURA_REMOVED", "BurnRemove", 46394)
	self:Log("SPELL_CAST_SUCCESS", "Stomp", 45185)

	self:Yell("Engage", L["engage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 24882)
end

function mod:OnEngage()
	meteorCounter = 1
	self:Berserk(360)
	local burn = GetSpellInfo(46394)
	self:Bar(46394, burn, 20, 46394)
	self:DelayedMessage(46394, 16, CL["soon"]:format(burn), "Attention")
	self:Bar(45185, GetSpellInfo(45185), 30, 45185)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Burn(player, spellId, _, _, spellName)
	self:TargetMessage(spellId, spellName, player, "Important", spellId, "Alert")
	self:PrimaryIcon(spellId, player)
	self:Whisper(spellId, player, spellName)
	self:Bar(spellId, CL["other"]:format(spellName, player), 60, spellId)
	self:Bar(spellId, spellName, 20, spellId)
	self:DelayedMessage(spellId, 16, CL["soon"]:format(spellName), "Attention")
end

function mod:Meteor(_, spellId)
	meteorCounter = meteorCounter + 1
	self:Bar(spellId, L["meteor_bar"]:format(meteorCounter), 12, spellId)
end

function mod:BurnRemove(player, _, _, _, spellName)
	self:StopBar(CL["other"]:format(spellName, player))
end

function mod:BurnResist(player, spellId)
	self:Message("burnresist", L["burn_resist"]:format(player), "Positive", spellId)
end

function mod:Stomp(player, spellId, _, _, spellName)
	self:TargetMessage(spellId, spellName, player, "Urgent", spellId)
	self:DelayedMessage(spellId, 25.5, CL["custom_sec"]:format(spellName, 5), "Attention")
	self:Bar(spellId, spellName, 30.5, spellId)
end

