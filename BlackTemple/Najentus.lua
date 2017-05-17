
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("High Warlord Naj'entus", 796, 1582)
if not mod then return end
mod:RegisterEnableMob(22887)
mod.engageId = 601
--mod.respawnTime = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.start_trigger = "You will die in the name of Lady Vashj!"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{39837, "SAY", "ICON"}, -- Impaling Spine
		39872, -- Tidal Shield
		{39835, "PROXIMITY"}, -- Needle Spine
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "TidalShield", 39872)
	self:Log("SPELL_AURA_REMOVED", "TidalShieldRemoved", 39872)
	self:Log("SPELL_AURA_APPLIED", "ImpalingSpine", 39837)
	self:Log("SPELL_AURA_REMOVED", "ImpalingSpineRemoved", 39837)

	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
end

function mod:CHAT_MSG_MONSTER_YELL(event, msg)
	if msg == L["start_trigger"] then
		self:Engage()
	end
end

function mod:OnEngage()
	self:DelayedMessage(39872, 50, "Attention", CL.custom_sec:format(self:SpellName(39872), 10)) -- Tidal Shield
	self:Bar(39872, 60) -- Tidal Shield
	self:Berserk(480)
	self:OpenProximity(39835, 8) -- Needle Spine
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:TidalShield(args)
	self:Message(args.spellId, "Important", "Alert")
	self:DelayedMessage(args.spellId, 46, "Attention", CL.custom_sec:format(args.spellName, 10))
	self:Bar(args.spellId, 56)
end

function mod:TidalShieldRemoved(args)
	self:Message(args.spellId, "Positive", nil, CL.removed:format(args.spellName))
end

function mod:ImpalingSpine(args)
	if self:Me(args.destGUID) then
		self:Say(args.spellId)
	end
	self:TargetMessage(args.spellId, args.destName, "Important", "Warning", nil, nil, true)
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:ImpalingSpineRemoved(args)
	self:PrimaryIcon(args.spellId)
end
