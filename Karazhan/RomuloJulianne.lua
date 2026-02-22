--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Romulo & Julianne", 532, -655)
if not mod then return end
mod:RegisterEnableMob(17533, 17534) -- Romulo, Julianne
--mod:SetEncounterID(655) -- Shared with 3 modules and fires way before starting the encounters
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.name = "Romulo & Julianne"

	L.phase1_message = "Act I - Julianne"
	L.phase2_message = "Act II - Romulo"
	L.phase3_message = "Act III - Both"

	L.poison = "Poison"
	L.poison_desc = "Warn of a poisoned player."
	L.poison_icon = 30822
	L.poison_message = "Poisoned"

	L.heal = "Heal"
	L.heal_desc = "Warn when Julianne casts Eternal Affection."
	L.heal_icon = 30878
	L.heal_message = "Julianne casting Heal!"

	L.buff = "Self-Buff Alert"
	L.buff_desc = "Warn when Romulo & Julianne gain a self-buff."
	L.buff_icon = 30841
	L.buff1_message = "Romulo gains Daring!"
	L.buff2_message = "Julianne gains Devotion!"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		30878, -- Eternal Affection
		"buff",
		30822, -- Poisoned Thrust
	},nil,{
		[30878] = L.heal, -- Eternal Affection (Heal)
		[30822] = CL.poison, -- Poisoned Thrust (Poison)
	}
end

function mod:OnRegister()
	self.displayName = L.name
end

function mod:OnBossEnable()
	self:RegisterEvent("ENCOUNTER_END")

	self:Log("SPELL_AURA_APPLIED", "PoisonedThrustApplied", 30822)
	self:Log("SPELL_CAST_START", "EternalAffection", 30878)

	self:Log("SPELL_AURA_APPLIED", "Devotion", 30887)
	self:Log("SPELL_AURA_REMOVED", "DevotionRemoved", 30887)

	self:Log("SPELL_AURA_APPLIED", "Daring", 30841)
	self:Log("SPELL_AURA_REMOVED", "DaringRemoved", 30841)

	self:Death("JulianneDeath", 17534)
	self:Log("SPELL_CAST_START", "UndyingLove", 30951)

	self:CheckForEngage()
end

function mod:OnEngage()
	self:SetStage(1)
	self:Message("stages", "cyan", L.phase1_message, false)
	self:PlaySound("stages", "long")
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

function mod:PoisonedThrustApplied(args)
	self:TargetMessage(args.spellId, "yellow", args.destName, CL.poison)
end

function mod:EternalAffection(args)
	self:Message(args.spellId, "orange", L.heal_message)
	self:PlaySound(args.spellId, "warning")
end

function mod:Devotion(args)
	if self:MobId(args.destGUID) == 17534 then -- Julianne
		self:Message("buff", "yellow", L.buff2_message, args.spellId)
		self:Bar("buff", 10, L.buff2_message, args.spellId)
		self:PlaySound("buff", "info")
	end
end

function mod:DevotionRemoved(args)
	if self:MobId(args.destGUID) == 17534 then -- Julianne
		self:StopBar(L.buff2_message)
	end
end

function mod:Daring(args)
	if self:MobId(args.destGUID) == 17533 then -- Julianne
		self:Message("buff", "yellow", L.buff1_message, args.spellId)
		self:Bar("buff", 8, L.buff1_message, args.spellId)
		self:PlaySound("buff", "info")
	end
end

function mod:DaringRemoved(args)
	if self:MobId(args.destGUID) == 17533 then -- Julianne
		self:StopBar(L.buff1_message)
	end
end

function mod:JulianneDeath() -- Stage 2
	if self:GetStage() == 1 then
		self:SetStage(2)
		self:Message("stages", "cyan", L.phase2_message, false)
		self:PlaySound("stages", "long")
	else
		self:Bar("stages", 11.2, CL.door_open, "Inv_crate_05")
	end
end

function mod:UndyingLove() -- Stage 3
	self:SetStage(3)
	self:Message("stages", "cyan", L.phase3_message, false)
	self:PlaySound("stages", "long")
end
