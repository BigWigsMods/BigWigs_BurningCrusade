--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("The Big Bad Wolf", 532, -655)
if not mod then return end
mod:RegisterEnableMob(17521, 17603) -- The Big Bad Wolf, Grandmother
--mod:SetEncounterID(655) -- Shared with 3 modules and fires way before starting the encounters

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.name = "The Big Bad Wolf"

	L.riding_bar = "%s Running"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{30753, "ICON", "SAY", "ME_ONLY_EMPHASIZE"}, -- Red Riding Hood
	}
end

function mod:OnRegister()
	self.displayName = L.name
end

function mod:OnBossEnable()
	self:RegisterEvent("ENCOUNTER_END")
	self:Log("SPELL_AURA_APPLIED", "RedRidingHoodApplied", 30753)
	self:Log("SPELL_AURA_REMOVED", "RedRidingHoodRemoved", 30753)
	self:CheckForEngage()
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:ENCOUNTER_END(_, encounterId, _, _, _, status)
	if encounterId == 655 then
		if status == 0 then
			-- Delay slightly to avoid re-registering ENCOUNTER_END as part of :Reboot() during this ENCOUNTER_END dispatch
			self:SimpleTimer(function() self:Wipe() end, 1)
		else
			self:Win()
		end
	end
end

function mod:RedRidingHoodApplied(args)
	self:TargetMessage(args.spellId, "yellow", args.destName)
	self:Bar(args.spellId, 20, L.riding_bar:format(args.destName))
	self:PrimaryIcon(args.spellId, args.destName)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, L.riding_bar:format(args.destName), true, ("%s Running"):format(args.destName))
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	end
end

function mod:RedRidingHoodRemoved(args)
	self:StopBar(L.riding_bar:format(args.destName))
	self:PrimaryIcon(args.spellId)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, "removed")
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	end
end
