--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("The Big Bad Wolf", 799)
if not mod then return end
mod:RegisterEnableMob(17521, 17603) --The Big Bad Wolf, Grandmother

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.riding_bar = "%s Running"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{30753, "ICON", "WHISPER"}, "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Riding", 30753)

	self:Death("Win", 17521)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Riding(player, spellId, _, _, spellName)
	self:TargetMessage(spellId, spellName, player, "Attention", spellId, "Long")
	self:Whisper(spellId, player, spellName)
	self:PrimaryIcon(spellId, player)
	self:Bar(spellId, L["riding_bar"]:format(player), 20, spellId)
end

