--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("High Astromancer Solarian", 782)
if not mod then return end
mod:RegisterEnableMob(18805)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Tal anu'men no sin'dorei!"

	L.phase = "Phase"
	L.phase_desc = "Warn for phase changes."
	L.phase1_message = "Phase 1 - Split in ~50sec"
	L.phase2_warning = "Phase 2 Soon!"
	L.phase2_trigger = "^I become"
	L.phase2_message = "20% - Phase 2"

	L.wrath_other = "Wrath"

	L.split = "Split"
	L.split_desc = "Warn for split & add spawn."
	L.split_trigger1 = "I will crush your delusions of grandeur!"
	L.split_trigger2 = "You are hopelessly outmatched!"
	L.split_bar = "~Next Split"
	L.split_warning = "Split in ~7 sec"

	L.agent_warning = "Split! - Agents in 6 sec"
	L.agent_bar = "Agents"
	L.priest_warning = "Priests/Solarian in 3 sec"
	L.priest_bar = "Priests/Solarian"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{42783, "ICON", "WHISPER", "PROXIMITY"}, "phase", "split", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Wrath", 42783)
	self:Log("SPELL_AURA_REMOVED", "WrathRemove", 42783)

	self:Yell("Engage", L["engage_trigger"])
	self:Yell("Phase2", L["phase2_trigger"])
	self:Yell("Split", L["split_trigger1"], L["split_trigger2"])

	self:Death("Win", 18805)
end

function mod:OnEngage()
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "target", "focus")

	self:Message("phase", L["phase1_message"], "Positive")
	self:Bar("phase", L["split_bar"], 50, "Spell_Shadow_SealOfKings")
	self:DelayedMessage("phase", 43, L["split_warning"], "Important")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Wrath(args)
	self:TargetMessage(args.spellId, L["wrath_other"], args.destName, "Attention", args.spellId)
	self:PrimaryIcon(args.spellId, args.destName)
	self:TargetBar(args.spellId, L["wrath_other"], args.destName, 6, args.spellId)
	if UnitIsUnit("player", args.destName) then
		self:OpenProximity(args.spellId, 10)
	else
		self:Whisper(args.spellId, args.destName, L["wrath_other"])
	end
end

function mod:WrathRemove(args)
	self:PrimaryIcon(args.spellId)
	if UnitIsUnit("player", args.destName) then
		self:CloseProximity(args.spellId)
	end
end

function mod:UNIT_HEALTH_FREQUENT(unit)
	if self:MobId(UnitGUID(unit)) == 18805 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp > 21 and hp < 25 then
			self:Message("phase", L["phase2_warning"], "Positive")
			self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
		end
	end
end

function mod:Phase2()
	self:Message("phase", L["phase2_message"], "Important")
	self:CancelAllTimers()
	self:StopBar(L["split_bar"])
end

function mod:Split()
	--split is around 90 seconds after the previous
	self:Bar("split", L["split_bar"], 90, "Spell_Shadow_SealOfKings")
	self:DelayedMessage("split", 83, L["split_warning"], "Important")

	-- Agents 6 seconds after the Split
	self:Message("split", L["agent_warning"], "Important")
	self:Bar("split", L["agent_bar"], 6, "Ability_Creature_Cursed_01")

	-- Priests 22 seconds after the Split
	self:DelayedMessage("split", 19, L["priest_warning"], "Important")
	self:Bar("split", L["priest_bar"], 22, "Spell_Holy_HolyBolt")
end

