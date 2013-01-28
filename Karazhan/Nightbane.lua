--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Nightbane", 799)
if not mod then return end
mod:RegisterEnableMob(17225)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.phase = "Phases"
	L.phase_desc = "Warn when Nightbane switches between phases."
	L.airphase_trigger = "Miserable vermin. I shall exterminate you from the air!"
	L.landphase_trigger1 = "Enough! I shall land and crush you myself!"
	L.landphase_trigger2 = "Insects! Let me show you my strength up close!"
	L.airphase_message = "Flying!"
	L.landphase_message = "Landing!"
	L.summon_trigger = "An ancient being awakens in the distance..."

	L.engage_trigger = "What fools! I shall bring a quick end to your suffering!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"phase", 36922, {30129, "FLASHSHAKE"}, 37098, "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Fear", 36922)
	self:Log("SPELL_AURA_APPLIED", "CharredEarth", 30129)
	self:Log("SPELL_CAST_SUCCESS", "Bones", 37098)

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")

	self:Yell("Air", L["airphase_trigger"])
	self:Yell("Land", L["landphase_trigger1"], L["landphase_trigger2"])

	self:Yell("Engage", L["engage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 17225)
end

function mod:OnEngage()
	local spellId = 36922
	local fear = GetSpellInfo(spellId)
	self:Message(spellId, CL["custom_start_s"]:format(self.displayName, fear, 35), "Positive")
	self:Bar(spellId, "~"..fear, 35, spellId)
	self:DelayedMessage(spellId, 33, CL["soon"]:format(fear), "Positive")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Fear(_, spellId, _, _, spellName)
	self:Bar(spellId, "<"..spellName..">", 2.5, spellId)
	self:Message(spellId, spellName, "Positive", spellId)
	self:Bar(spellId, "~"..spellName, 37, spellId)
	self:DelayedMessage(spellId, 35, CL["soon"]:format(spellName), "Positive")
end

function mod:CharredEarth(player, spellId, _, _, spellName)
	if UnitIsUnit(player, "player") then
		self:LocalMessage(spellId, CL["underyou"]:format(spellName), "Personal", spellId, "Alarm")
		self:FlashShake(spellId)
	end
end

function mod:Bones(_, spellId, _, _, spellName)
	self:Message(spellId, spellName, "Urgent", spellId)
	self:Bar(spellId, "<"..spellName..">", 11, spellId)
end

function mod:CHAT_MSG_MONSTER_EMOTE(_, msg)
	if msg == L["summon_trigger"] then
		self:Bar("phase", L["landphase_message"], 34, "INV_Misc_Head_Dragon_01")
	end
end

function mod:Air()
	local fear = GetSpellInfo(36922)
	self:CancelDelayedMessage(CL["soon"]:format(fear))
	self:SendMessage("BigWigs_StopBar", self, "~"..fear)

	self:Message("phase", L["airphase_message"], "Attention", "INV_Misc_Head_Dragon_01", "Info")
	self:Bar("phase", L["landphase_message"], 57, "INV_Misc_Head_Dragon_01")
end

function mod:Land()
	self:Message("phase", L["landphase_message"], "Important", "INV_Misc_Head_Dragon_01", "Long")
	self:Bar("phase", L["landphase_message"], 17, "INV_Misc_Head_Dragon_01")
end

