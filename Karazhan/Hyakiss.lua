--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Hyakiss the Lurker", 799)
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

	self:Death("Win", 16179)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Web(args)
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Urgent", args.spellId)
	self:TargetBar(args.spellId, args.spellName, args.destName, 10, args.spellId)
end

