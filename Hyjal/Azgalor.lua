--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Azgalor", 775, 1580)
if not mod then return end
mod:RegisterEnableMob(17842)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.howl_bar = "~Howl"
	L.howl_message = "AoE silence"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{31347, "ICON", "FLASH"}, 31344, 31340, "berserk"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "RainOfFire", 31340)
	self:Log("SPELL_CAST_SUCCESS", "Howl", 31344)
	self:Log("SPELL_AURA_APPLIED", "Doom", 31347)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 17842)
end

function mod:OnEngage()
	self:Berserk(600)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:RainOfFire(args)
	if self:Me(args.destGUID) then
		self:Message(args.spellId, "Urgent", "Alarm", CL["you"]:format(args.spellName))
	end
end

function mod:Howl(args)
	self:Message(args.spellId, "Important", nil, L["howl_message"])
	self:Bar(args.spellId, 16, L["howl_bar"])
	self:DelayedMessage(args.spellId, 15, "Important", CL["soon"]:format(L["howl_message"]))
end

function mod:Doom(args)
	self:TargetMessage(args.spellId, args.destName, "Attention", "Alert")
	self:TargetBar(args.spellId, 19, args.destName)
	self:PrimaryIcon(args.spellId, args.destName)
	if self:Me(args.destGUID) then
		self:Flash(args.spellId)
	end
end

