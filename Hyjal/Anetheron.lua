--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Anetheron", 775)
if not mod then return end
mod:RegisterEnableMob(17808)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{31299, "ICON"}, 31306, "berserk", "bosskill"
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
	self:Message(args.spellId, args.spellName, "Attention", args.spellId)
	self:Bar(args.spellId, "~"..args.spellName, 11, args.spellId)
end

do
	local function infernoCheck(sGUID, spellId)
		local mobId = mod:GetUnitIdByGUID(sGUID)
		if mobId then
			local target = UnitName(mobId.."target")
			if not target then return end
			mod:TargetMessage(spellId, spellId, target, "Important", spellId, "Alert")
			mod:PrimaryIcon(spellId, target)
			mod:ScheduleTimer("PrimaryIcon", 5, spellId)
		end
	end

	function mod:Inferno(args)
		self:DelayedMessage(args.spellId, 45, CL["soon"]:format(args.spellName), "Positive", args.spellId)
		self:Bar(args.spellId, "~"..args.spellName, 50, args.spellId)
		self:ScheduleTimer(infernoCheck, 0.7, args.sourceGUID, args.spellId)
	end
end

