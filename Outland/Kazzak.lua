--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Doom Lord Kazzak", -100)
if not mod then return end
mod:RegisterEnableMob(18728)
mod:SetAllowWin(true) -- No journal ID
mod.worldBoss = 18728
if mod:Classic() then
	mod.mapId = 1944
	mod.otherMenu = -1945
else
	mod.otherMenu = -101
end

--------------------------------------------------------------------------------
-- Locals
--

local prevYell = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.name = "Doom Lord Kazzak"

	L.engage_trigger1 = "The Legion will conquer all!"
	L.engage_trigger2 = "All mortals will perish!"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{32960, "ME_ONLY_EMPHASIZE"}, -- Mark of Kazzak
		21063, -- Twisted Reflection
		{32964, "CASTBAR"}, -- Frenzy
	},nil,{
		[32960] = CL.mark, -- Mark of Kazzak (Mark)
		[32964] = CL.enrage, -- Frenzy (Enrage)
	}
end

function mod:OnRegister()
	self.displayName = L.name
end

function mod:OnBossEnable()
	self:ScheduleTimer("CheckForEngage", 1)

	self:Death("Win", 18728)
end

function mod:OnEngage()
	self:CheckForWipe()

	self:Log("SPELL_AURA_APPLIED", "MarkOfKazzak", 32960)
	self:Log("SPELL_AURA_APPLIED", "TwistedReflection", 21063)
	self:Log("SPELL_AURA_APPLIED", "FrenzyApplied", 32964)
	self:Log("SPELL_AURA_REMOVED", "FrenzyRemoved", 32964)

	self:CDBar(32964, 60, CL.enrage)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MarkOfKazzak(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, nil, CL.mark)
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	end
end

function mod:TwistedReflection(args)
	self:TargetMessage(args.spellId, "yellow", args.destName)
end

function mod:FrenzyApplied(args)
	self:StopBar(CL.enrage)
	self:CancelDelayedMessage(CL.soon:format(CL.enrage))
	self:Message(args.spellId, "red", CL.enrage)
	self:CastBar(args.spellId, 10, CL.enrage)
end

function mod:FrenzyRemoved(args)
	self:Message(args.spellId, "green", CL.over:format(CL.enrage))
	self:CDBar(args.spellId, 50, CL.enrage)
	self:DelayedMessage(args.spellId, 45, "orange", CL.soon:format(CL.enrage))
end
