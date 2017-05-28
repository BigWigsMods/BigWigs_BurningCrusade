
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Teron Gorefiend", 796, 1585)
if not mod then return end
mod:RegisterEnableMob(22871)
mod.engageId = 604
--mod.respawnTime = 0

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{40251, "ICON"}, -- Shadow of Death
		40243, -- Crushing Shadows
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "ShadowOfDeath", 40251)
	self:Log("SPELL_CAST_SUCCESS", "CrushingShadows", 40243)
	self:Log("SPELL_AURA_APPLIED", "CrushingShadowsApplied", 40243)
end

function mod:OnEngage()
	self:Berserk(600)
	self:CDBar(40243, 15.7) -- Crushing Shadows
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:ShadowOfDeath(args)
	self:TargetMessage(args.spellId, args.destName, "Important", "Warning")
	self:TargetBar(args.spellId, 55, args.destName)
	self:PrimaryIcon(args.spellId, args.destName)
	self:ScheduleTimer("TargetBar", 55, args.spellId, 60, args.destName, 221641) -- 221641 = "Ghost" / achievement_halloween_ghost_01 / icon 236548
end

function mod:CrushingShadows(args)
	self:CDBar(args.spellId, 15.7)
end

do
	local list = mod:NewTargetList()
	function mod:CrushingShadowsApplied(args)
		list[#list+1] = args.destName
		if #list == 1 then
			self:ScheduleTimer("TargetMessage", 0.3, args.spellId, list, "Urgent", "Alert")
		end
	end
end
