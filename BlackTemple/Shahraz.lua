
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Mother Shahraz", 796, 1588)
if not mod then return end
mod:RegisterEnableMob(22947)
mod.engageId = 607
--mod.respawnTime = 0

--------------------------------------------------------------------------------
-- Locals
--

local playerList = mod:NewTargetList()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		41001, -- Fatal Attraction
		40883, -- Prismatic Aura: Nature
		40891, -- Prismatic Aura: Arcane
		40880, -- Prismatic Aura: Shadow
		40897, -- Prismatic Aura: Holy
		40882, -- Prismatic Aura: Fire
		40896, -- Prismatic Aura: Frost
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "FatalAttraction", 41001)

	self:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", nil, "boss1")
end

function mod:OnEngage()
	wipe(playerList)
	self:Berserk(600)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:FatalAttraction(args)
	playerList[#playerList+1] = args.destName
	if #playerList == 1 then
		self:ScheduleTimer("TargetMessage", 0.3, args.spellId, playerList, "Urgent", "Alert")
	end
end

do
	local spells = {
		[40883] = true, -- Prismatic Aura: Nature
		[40891] = true, -- Prismatic Aura: Arcane
		[40880] = true, -- Prismatic Aura: Shadow
		[40897] = true, -- Prismatic Aura: Holy
		[40882] = true, -- Prismatic Aura: Fire
		[40896] = true, -- Prismatic Aura: Frost
	}
	function mod:UNIT_SPELLCAST_SUCCEEDED(_, _, _, _, spellId)
		if spells[spellId] then
			self:Message(spellId, "Attention", "Info")
			self:Bar(spellId, 15)
		end
	end
end
