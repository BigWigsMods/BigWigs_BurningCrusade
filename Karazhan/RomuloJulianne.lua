--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Romulo & Julianne", 799)
if not mod then return end
mod:RegisterEnableMob(17533, 17534) --Romulo, Julianne

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
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
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"phase", "heal", "buff", "poison"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Poison", 30822)
	self:Log("SPELL_CAST_START", "Heal", 30878)

	self:Log("SPELL_AURA_APPLIED", "Devotion", 30887)
	self:Log("SPELL_AURA_REMOVED", "DevotionRemoved", 30887)

	self:Log("SPELL_AURA_APPLIED", "Daring", 30841)
	self:Log("SPELL_AURA_REMOVED", "DaringRemoved", 30841)

	self:Yell("Act1", L["phase1_trigger"])
	self:Yell("Act2", L["phase2_trigger"])
	self:Yell("Act3", L["phase3_trigger"])
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Poison(args)
	self:TargetMessage(args.spellId, L["poison_message"], args.destName, "Important", args.spellId)
end

function mod:Heal(args)
	self:Message("heal", L["heal_message"], "Urgent", args.spellId)
end

function mod:Devotion(args)
	if not UnitIsPlayer(args.destName) then
		self:Message("buff", L["buff2_message"], "Attention", args.spellId)
		self:Bar("buff", L["buff2_message"], 10, args.spellId)
	end
end

function mod:DevotionRemoved(args)
	if not UnitIsPlayer(args.destName) then
		self:StopBar(L["buff2_message"])
	end
end

function mod:Daring(args)
	if not UnitIsPlayer(args.destName) then
		self:Message("buff", L["buff1_message"], "Attention", args.spellId)
		self:Bar("buff", L["buff1_message"], 8, args.spellId)
	end
end

function mod:DaringRemoved(args)
	if not UnitIsPlayer(args.destName) then
		self:StopBar(L["buff1_message"])
	end
end

function mod:Act1()
	self:Message("phase", L["phase1_message"], "Positive")
end

function mod:Act2()
	self:Message("phase", L["phase2_message"], "Positive")
end

function mod:Act3()
	self:Message("phase", L["phase3_message"], "Positive")
end

