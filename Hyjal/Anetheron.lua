--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Anetheron", 775, 1578)
if not mod then return end
mod:RegisterEnableMob(17808)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{31299, "ICON"}, 31306, "berserk"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Swarm", 31306)
	self:Log("SPELL_CAST_START", "Inferno", 31299)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 17808)
end

function mod:OnEngage()
	self:Berserk(600)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Swarm(args)
	self:Message(args.spellId, "Attention")
	self:CDBar(args.spellId, 11)
end

do
	local function infernoCheck(sGUID, spellId)
		local mobId = mod:GetUnitIdByGUID(sGUID)
		if mobId then
			local target = UnitName(mobId.."target")
			if not target then return end
			mod:TargetMessage(spellId, target, "Important", "Alert")
			mod:PrimaryIcon(spellId, target)
			mod:ScheduleTimer("PrimaryIcon", 5, spellId)
		end
	end

	function mod:Inferno(args)
		self:DelayedMessage(args.spellId, 45, "Positive", CL["soon"]:format(args.spellName))
		self:CDBar(args.spellId, 50)
		self:ScheduleTimer(infernoCheck, 0.7, args.sourceGUID, args.spellId)
	end
end

