--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Romulo & Julianne", 532, -655)
if not mod then return end
mod:RegisterEnableMob(17533, 17534) -- Romulo, Julianne
--mod:SetEncounterID(655) -- Shared with 3 modules

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.name = "Romulo & Julianne"

	L.phase = "Phases"
	L.phase_desc = "Warn when entering a new Phase."
	L.phase1_trigger = "What devil art thou, that dost torment me thus?"
	L.phase1_message = "Act I - Julianne"
	L.phase2_trigger = "Wilt thou provoke me? Then have at thee, boy!"
	L.phase2_message = "Act II - Romulo"
	L.phase3_trigger = "Come, gentle night; and give me back my Romulo!"
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
	self:RegisterEvent("ENCOUNTER_START")
	self:RegisterEvent("ENCOUNTER_END")

	self:Log("SPELL_AURA_APPLIED", "PoisonedThrustApplied", 30822)
	self:Log("SPELL_CAST_START", "EternalAffection", 30878)

	self:Log("SPELL_AURA_APPLIED", "Devotion", 30887)
	self:Log("SPELL_AURA_REMOVED", "DevotionRemoved", 30887)

	self:Log("SPELL_AURA_APPLIED", "Daring", 30841)
	self:Log("SPELL_AURA_REMOVED", "DaringRemoved", 30841)

	self:BossYell("YellAct1", L.phase1_trigger)
	self:BossYell("YellAct2", L.phase2_trigger)
	self:BossYell("YellAct3", L.phase3_trigger)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:ENCOUNTER_START(_, encounterId)
	if encounterId == 655 then
		self:Engage()
	end
end

function mod:ENCOUNTER_END(_, encounterId, _, _, _, status)
	if encounterId == 655 then
		if status == 0 then
			-- delay slightly to avoid reregistering ENCOUNTER_END as part of Reboot during this ENCOUNTER_END dispatch
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

function mod:YellAct1()
	self:Message("stages", "cyan", L.phase1_message, false)
	self:PlaySound("stages", "long")
end

function mod:YellAct2()
	self:Message("stages", "cyan", L.phase2_message, false)
	self:PlaySound("stages", "long")
end

function mod:YellAct3()
	self:Message("stages", "cyan", L.phase3_message, false)
	self:PlaySound("stages", "long")
end
