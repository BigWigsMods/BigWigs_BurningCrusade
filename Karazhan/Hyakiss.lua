--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Hyakiss the Lurker", 799)
if not mod then return end
mod:RegisterEnableMob(16179)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {29896, "bosskill"}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Web", 29896)

	self:Deth("Win", 16179)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Web(player, spellId, _, _, spellName)
	self:TargetMessage(spellId, spellName, player, "Urgent", spellId)
	self:Bar(spellId, CL["other"]:format(spellName, player), 10, spellId)
end

