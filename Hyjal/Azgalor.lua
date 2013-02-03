--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Azgalor", 775)
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
		{31347, "ICON", "FLASHSHAKE"}, 31344, 31340, "berserk", "bosskill"
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
	if UnitIsUnit(args.destName, "player") then
		self:LocalMessage(args.spellId, CL["you"]:format(args.spellName), "Urgent", args.spellId, "Alarm")
	end
end

function mod:Howl(args)
	self:Message(args.spellId, L["howl_message"], "Important", args.spellId)
	self:Bar(args.spellId, L["howl_bar"], 16, args.spellId)
	self:DelayedMessage(args.spellId, 15, CL["soon"]:format(L["howl_message"]), "Important")
end

function mod:Doom(args)
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Attention", args.spellId, "Alert")
	self:TargetBar(args.spellId, args.spellName, args.destName, 19, args.spellId)
	self:PrimaryIcon(args.spellId, args.destName)
	if UnitIsUnit(args.destName, "player") then
		self:FlashShake(args.spellId)
	end
end

