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

function mod:Swarm(_, spellId, _, _, spellName)
	self:Message(spellId, spellName, "Attention", spellId)
	self:Bar(spellId, "~"..spellName, 11, spellId)
end

do
	local function clearIcon()
		mod:PrimaryIcon(31299)
	end
	local function infernoCheck(sGUID)
		local mobId = mod:GetUnitIdByGUID(sGUID)
		if mobId then
			local target = UnitName(mobId.."target")
			if not target then return end
			mod:TargetMessage(31299, GetSpellInfo(31299), target, "Important", 31299, "Alert")
			mod:PrimaryIcon(31299, target)
			mod:ScheduleTimer(clearIcon, 5)
		end
	end
	function mod:Inferno(_, spellId, _, _, spellName, _, _, _, _, _, sGUID)
		self:DelayedMessage(spellId, 45, CL["soon"]:format(spellName), "Positive", spellId)
		self:Bar(spellId, "~"..spellName, 50, spellId)
		self:ScheduleTimer(infernoCheck, 0.7, sGUID)
	end
end

