
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Supremus", 796, 1583)
if not mod then return end
mod:RegisterEnableMob(22898)
mod.engageId = 602
--mod.respawnTime = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.normal_phase_trigger = "Supremus punches the ground in anger!"
	L.kite_phase_trigger = "The ground begins to crack open!"
	L.normal_phase = "Normal Phase"
	L.kite_phase = "Kite Phase"
	L.next_phase = "Next Phase"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{41951, "SAY", "ICON"}, -- Fixate
		40126, -- Molten Punch
		40265, -- Molten Flame
		"stages",
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Fixate", 41951)
	self:Log("SPELL_AURA_REMOVED", "FixateRemoved", 41951)
	self:Log("SPELL_CAST_SUCCESS", "MoltenPunch", 40126)

	self:Log("SPELL_DAMAGE", "MoltenFlameDamage", 40265)
	self:Log("SPELL_MISSED", "MoltenFlameDamage", 40265) -- Not firing?

	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
end

function mod:OnEngage()
	self:Berserk(900)
	self:Bar("stages", 60, L.next_phase, "spell_shadow_summoninfernal")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Fixate(args)
	if self:Me(args.destGUID) then
		self:Say(args.spellId)
	end
	self:TargetMessage(args.spellId, args.destName, "Important", "Warning")
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:FixateRemoved(args)
	self:PrimaryIcon(args.spellId)
end

function mod:MoltenPunch(args)
	self:Message(args.spellId, "Attention")
	self:Bar(args.spellId, 10)
end

do
	local prev = 0
	function mod:MoltenFlameDamage(args)
		local t = GetTime()
		if self:Me(args.destGUID) and t-prev > 1.5 then
			prev = t
			self:Message(args.spellId, "Personal", "Alert", CL.underyou:format(args.spellName))
		end
	end
end

function mod:CHAT_MSG_RAID_BOSS_EMOTE(_, msg)
	if msg == L.normal_phase_trigger then
		self:Message("stages", "Neutral", "Info", L.normal_phase, false)
		self:Bar("stages", 60, L.next_phase, "spell_shadow_summoninfernal")
	elseif msg == L.kite_phase_trigger then
		self:Message("stages", "Neutral", "Info", L.kite_phase, false)
		self:Bar("stages", 60, L.next_phase, "spell_shadow_summoninfernal")
	end
end
