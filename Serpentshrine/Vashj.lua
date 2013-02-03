--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Lady Vashj", 780)
if not mod then return end
mod:RegisterEnableMob(21212, 22055, 22056, 22009) --Vashj, Coilfang Elite, Coilfang Strider, Tainted Elemental

local shieldsFaded = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger1 = "I did not wish to lower myself by engaging your kind, but you leave me little choice..."
	L.engage_trigger2 = "I spit on you, surface filth!"
	L.engage_trigger3 = "Victory to Lord Illidan! "
	L.engage_trigger4 = "I'll split you from stem to stern!"
	L.engage_trigger5 = "Death to the outsiders!"
	L.engage_message = "Entering Phase 1"

	L.phase = "Phase warnings"
	L.phase_desc = "Warn when Vashj goes into the different phases."
	L.phase2_trigger = "The time is now! Leave none standing! "
	L.phase2_soon_message = "Phase 2 soon!"
	L.phase2_message = "Phase 2, adds incoming!"
	L.phase3_trigger = "You may want to take cover. "
	L.phase3_message = "Phase 3 - Enrage in 4min!"

	L.elemental = "Tainted Elemental spawn"
	L.elemental_desc = "Warn when the Tainted Elementals spawn during phase 2."
	L.elemental_icon = 38132
	L.elemental_bar = "~Tainted Elemental"
	L.elemental_soon_message = "Tainted Elemental soon!"

	L.strider = "Coilfang Strider spawn"
	L.strider_desc = "Warn when the Coilfang Striders spawn during phase 2."
	L.strider_icon = "Spell_Nature_AstralRecal"
	L.strider_bar = "~Strider"
	L.strider_soon_message = "Strider soon!"

	L.naga = "Coilfang Elite Naga spawn"
	L.naga_desc = "Warn when the Coilfang Elite Naga spawn during phase 2."
	L.naga_icon = "INV_Misc_MonsterHead_02"
	L.naga_bar = "~Naga"
	L.naga_soon_message = "Naga soon!"

	L.barrier = GetSpellInfo(38112)
	L.barrier_desc = "Alert when the barriers go down."
	L.barrier_icon = 38112
	L.barrier_down_message = "Barrier %d/4 down!"

	L.loot = GetItemInfo(31088)
	L.loot_desc = "Warn who loots the Tainted Cores."
	L.loot_icon = 38132
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions(CL)
	return {
		{38280, "ICON", "PROXIMITY"},
		"elemental", "strider", "naga", "loot", "barrier",
		"berserk",
		"phase", "bosskill"
	}, {
		[38280] = CL["phase"]:format(1),
		elemental = CL["phase"]:format(2),
		berserk = CL["phase"]:format(3),
		phase = CL["general"],
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Charge", 38280)
	self:Log("SPELL_AURA_REMOVED", "ChargeRemoved", 38280)
	--It seems that looting the core no longer stuns the player, this isn't fired. (v4.2)
	self:Log("SPELL_AURA_APPLIED", "LootUpdate", 38132)
	--It seems that there is no longer any events for barrier removal. (v4.2)
	self:Log("SPELL_AURA_REMOVED", "BarrierRemove", 38112)

	self:RegisterEvent("CHAT_MSG_LOOT")
	self:AddSyncListener("VashjLoot")

	self:Yell("Phase2", L["phase2_trigger"])
	self:Yell("Phase3", L["phase3_trigger"])

	self:Yell("Engage", L["engage_trigger1"], L["engage_trigger2"], L["engage_trigger3"], 
		L["engage_trigger4"], L["engage_trigger5"]
	)
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Deaths", 21212, 22009) -- Vashj, Tainted Elemental
end

function mod:OnEngage()
	self:RegisterEvent("UNIT_HEALTH_FREQUENT")
	shieldsFaded = 0
	self:Message("phase", L["engage_message"], "Attention")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Phase2()
	self:PrimaryIcon(38280)
	shieldsFaded = 0
	self:Message("phase", L["phase2_message"], "Important", nil, "Alarm")
	self:Bar("elemental", L["elemental_bar"], 53, 38132)
	self:DelayedMessage("elemental", 48, L["elemental_soon_message"], "Important")
	self:RepeatStrider()
	self:RepeatNaga()
end

function mod:Phase3()
	self:PrimaryIcon("loot")
	self:CancelAllTimers()
	self:StopBar(L["elemental_bar"])
	self:StopBar(L["strider_bar"])
	self:StopBar(L["naga_bar"])
	self:Message("phase", L["phase3_message"], "Important", nil, "Alarm")
	self:Berserk(240, true)
end

function mod:Charge(player, spellId, _, _, spellName)
	self:TargetMessage(spellId, spellName, player, "Important", spellId, "Alert")
	self:PrimaryIcon(spellId, player)
	self:Bar(spellId, CL["other"]:format(spellName, player), 20, spellId)
	if UnitIsUnit(player, "player") then
		self:OpenProximity(spellId, 10)
	end
end

function mod:ChargeRemoved(player, spellId, _, _, spellName)
	if UnitIsUnit(player, "player") then
		self:CloseProximity(spellId)
	end
	self:StopBar(CL["other"]:format(spellName, player))
end

--It seems that looting the core no longer stuns the player, this isn't fired. (v4.2)
function mod:LootUpdate(player, spellId)
	self:TargetMessage("loot", L["loot"], player, "Positive", spellId, "Info")
	self:PrimaryIcon("loot", player)
end

--It seems that there is no longer any events for barrier removal. (v4.2)
function mod:BarrierRemove(_, spellId)
	shieldsFaded = shieldsFaded + 1
	if shieldsFaded < 4 then
		self:Message("barrier", L["barrier_down_message"]:format(shieldsFaded), "Attention", spellId)
	end
end

function mod:Deaths(mobId)
	if mobId == 22009 then
		self:Bar("elemental", L["elemental_bar"], 53, 38132)
		self:DelayedMessage("elemental", 48, L["elemental_soon_message"], "Important")
	else
		self:Win()
	end
end

do
	local lootItem = '^' .. LOOT_ITEM:gsub("%%s", "(.-)") .. '$'
	local lootItemSelf = '^' .. LOOT_ITEM_SELF:gsub("%%s", "(.*)") .. '$'
	function mod:CHAT_MSG_LOOT(_, msg)
		local player, item = select(3, msg:find(lootItem))
		if not player then
			item = select(3, msg:find(lootItemSelf))
			if item then
				player = UnitName("player")
			end
		end

		if type(item) == "string" and type(player) == "string" then
			local itemLink, itemRarity = select(2, GetItemInfo(item))
			if itemRarity and itemRarity == 1 and itemLink then
				local itemId = select(3, itemLink:find("item:(%d+):"))
				if not itemId then return end
				itemId = tonumber(itemId:trim())
				if type(itemId) ~= "number" or itemId ~= 31088 then return end -- Tainted Core
				self:Sync("VashjLoot", player)
			end
		end
	end
end

function mod:RepeatStrider()
	self:Bar("strider", L["strider_bar"], 63, "Spell_Nature_AstralRecal")
	self:DelayedMessage("strider", 58, L["strider_soon_message"], "Attention")
	self:ScheduleTimer("RepeatStrider", 63)
end

function mod:RepeatNaga()
	self:Bar("naga", L["naga_bar"], 47.5, "INV_Misc_MonsterHead_02")
	self:DelayedMessage("naga", 42.5, L["naga_soon_message"], "Attention")
	self:ScheduleTimer("RepeatNaga", 47.5)
end

function mod:UNIT_HEALTH_FREQUENT(_, unit)
	if unit == "target" and self:GetCID(UnitGUID(unit)) == 21212 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp > 70 and hp < 76 then
			self:Message("phase", L["phase2_soon_message"], "Attention")
			self:UnregisterEvent("UNIT_HEALTH_FREQUENT")
		end
	end
end

function mod:OnSync(sync, rest, nick)
	if sync == "VashjLoot" and rest then
		self:TargetMessage("loot", L["loot"], rest, "Positive", 38132, "Info")
		self:PrimaryIcon("loot", rest)
	end
end

