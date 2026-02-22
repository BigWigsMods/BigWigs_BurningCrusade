--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Hyakiss the Lurker", 532, 1552)
if not mod then return end
mod:RegisterEnableMob(16179)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.name = "Hyakiss the Lurker"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{29896, "SAY"}, -- Hyakiss' Web
	}
end

function mod:OnRegister()
	self.displayName = L.name
end

function mod:OnBossEnable()
	self:ScheduleTimer("CheckForEngage", 1)
	self:Log("SPELL_AURA_APPLIED", "HyakissWeb", 29896)

	self:Death("Win", 16179)
end

function mod:OnEngage()
	self:CheckForWipe()
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:HyakissWeb(args)
	self:TargetMessage(args.spellId, "orange", args.destName)
	self:TargetBar(args.spellId, 10, args.destName)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, nil, nil, "Hyakiss' Web")
	end
end
