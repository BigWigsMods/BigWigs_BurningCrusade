--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Netherspite", 532, 1561)
if not mod then return end
mod:RegisterEnableMob(15689)
mod:SetEncounterID(659)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local voidCount = 1
local blueList, blueDebuffTime, blueStacks = {}, {}, {}
local greenList, greenDebuffTime, greenStacks = {}, {}, {}
local redList, redDebuffTime, redStacks = {}, {}, {}
local BLUE_DURATION, GREEN_DURATION, RED_DURATION = 8, 10, 20
local UpdateInfoBoxList

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.phase1_message = "Withdrawal - Netherbreaths Over"
	L.phase1_bar = "Possible Withdrawal"
	L.phase1_trigger = "%s cries out in withdrawal, opening gates to the nether."
	L.phase2_message = "Rage - Incoming Netherbreaths!"
	L.phase2_bar = "Possible Rage"
	L.phase2_trigger = "%s goes into a nether-fed rage!"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		37063, -- Void Zone
		{38523, "CASTBAR"}, -- Netherbreath
		30466, -- Nether Portal - Perseverence
		"infobox",
		"berserk",
	},nil,{
		[30466] = CL.tank_soak, -- Nether Portal - Perseverence (Tank Soak)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "VoidZone", 37063)
	self:Log("SPELL_CAST_START", "Netherbreath", 38523)
	self:Log("SPELL_AURA_APPLIED_DOSE", "NetherPortalPerseverenceAppliedBoss", 30466)
	self:Log("SPELL_AURA_REMOVED", "NetherPortalPerseverenceRemovedBoss", 30466)

	self:Emote("Stage1Emote", L.phase1_trigger)
	self:Emote("Stage2Emote", L.phase2_trigger)

	self:Log("SPELL_AURA_APPLIED", "NetherPortalDominanceApplied", 30423) -- Blue
	self:Log("SPELL_AURA_APPLIED_DOSE", "NetherPortalDominanceApplied", 30423)
	self:Log("SPELL_AURA_REMOVED", "NetherPortalDominanceRemoved", 30423)

	self:Log("SPELL_AURA_APPLIED", "NetherPortalSerenityApplied", 30422) -- Green
	self:Log("SPELL_AURA_APPLIED_DOSE", "NetherPortalSerenityApplied", 30422)
	self:Log("SPELL_AURA_REMOVED", "NetherPortalSerenityRemoved", 30422)

	self:Log("SPELL_AURA_APPLIED", "NetherPortalPerseverenceApplied", 30421) -- Red
	self:Log("SPELL_AURA_APPLIED_DOSE", "NetherPortalPerseverenceApplied", 30421)
	self:Log("SPELL_AURA_REMOVED", "NetherPortalPerseverenceRemoved", 30421)
end

function mod:OnEngage()
	voidCount = 1
	blueList, blueDebuffTime, blueStacks = {}, {}, {}
	greenList, greenDebuffTime, greenStacks = {}, {}, {}
	redList, redDebuffTime, redStacks = {}, {}, {}
	self:SetStage(1)
	self:CDBar("stages", 60, L.phase2_bar, "Spell_ChargePositive")
	self:Berserk(540, true)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:VoidZone(args)
	self:Message(args.spellId, "yellow", CL.count:format(args.spellName, voidCount))
	voidCount = voidCount + 1
	self:PlaySound(args.spellId, "info")
end

function mod:Netherbreath(args)
	self:Message(args.spellId, "orange")
	self:CastBar(args.spellId, 2.5)
end

function mod:NetherPortalPerseverenceAppliedBoss(args)
	if args.amount % 3 == 0 then
		local unit = self:GetUnitIdByGUID(args.destGUID)
		if unit and self:Tanking(unit) then
			self:StackMessage(args.spellId, "purple", CL.boss, args.amount, 9, CL.tank_soak)
			if args.amount >= 9 then
				self:PlaySound(args.spellId, "warning")
			end
		end
	end
end

function mod:NetherPortalPerseverenceRemovedBoss(args)
	local unit = self:GetUnitIdByGUID(args.destGUID)
	if unit and self:Tanking(unit) then
		self:Message(args.spellId, "purple", CL.removed_from:format(CL.tank_soak, CL.boss))
	end
end

function mod:Stage1Emote()
	self:SetStage(1)
	self:StopCastBar(38523) -- Netherbreath
	self:StopBar(L.phase1_bar)
	self:Message("stages", "cyan", L.phase1_message, "Spell_ChargePositive")
	self:CDBar("stages", 58, L.phase2_bar, "Spell_ChargePositive")
	self:PlaySound("stages", "long")
end

function mod:Stage2Emote()
	self:SetStage(2)
	self:StopBar(L.phase2_bar)
	self:Message("stages", "cyan", L.phase2_message, "Spell_ChargeNegative")
	self:CDBar("stages", 30, L.phase1_bar, "Spell_ChargeNegative")
	self:PlaySound("stages", "long")
end

function mod:NetherPortalDominanceApplied(args) -- Blue
	if not blueList[1] and not greenList[1] and not redList[1] then
		self:OpenInfo("infobox", self:SpellName(38637), 5) -- 38637 = "Nether Exhaustion"
		self:SimpleTimer(UpdateInfoBoxList, 0.1)
	end
	self:DeleteFromTable(blueList, args.destName)
	blueList[#blueList + 1] = args.destName
	blueDebuffTime[args.destName] = GetTime() + BLUE_DURATION
	blueStacks[args.destName] = args.amount or 1
end

function mod:NetherPortalDominanceRemoved(args) -- Blue
	blueDebuffTime[args.destName] = nil
	self:DeleteFromTable(blueList, args.destName)
	if not blueList[1] and not greenList[1] and not redList[1] then
		self:CloseInfo("infobox")
	end
end

function mod:NetherPortalSerenityApplied(args) -- Green
	if not blueList[1] and not greenList[1] and not redList[1] then
		self:OpenInfo("infobox", self:SpellName(38637), 5) -- 38637 = "Nether Exhaustion"
		self:SimpleTimer(UpdateInfoBoxList, 0.1)
	end
	self:DeleteFromTable(greenList, args.destName)
	greenList[#greenList + 1] = args.destName
	greenDebuffTime[args.destName] = GetTime() + GREEN_DURATION
	greenStacks[args.destName] = args.amount or 1
end

function mod:NetherPortalSerenityRemoved(args) -- Green
	greenDebuffTime[args.destName] = nil
	self:DeleteFromTable(greenList, args.destName)
	if not blueList[1] and not greenList[1] and not redList[1] then
		self:CloseInfo("infobox")
	end
end

function mod:NetherPortalPerseverenceApplied(args) -- Red
	if not blueList[1] and not greenList[1] and not redList[1] then
		self:OpenInfo("infobox", self:SpellName(38637), 5) -- 38637 = "Nether Exhaustion"
		self:SimpleTimer(UpdateInfoBoxList, 0.1)
	end
	self:DeleteFromTable(redList, args.destName)
	redList[#redList + 1] = args.destName
	redDebuffTime[args.destName] = GetTime() + RED_DURATION
	redStacks[args.destName] = args.amount or 1
end

function mod:NetherPortalPerseverenceRemoved(args) -- Red
	redDebuffTime[args.destName] = nil
	self:DeleteFromTable(redList, args.destName)
	if not blueList[1] and not greenList[1] and not redList[1] then
		self:CloseInfo("infobox")
	end
end

do
	local blueText = "|T134398:0:0:0:0:64:64:4:60:4:60|t".. CL.count
	local greenText = "|T134397:0:0:0:0:64:64:4:60:4:60|t".. CL.count
	local redText = "|T134396:0:0:0:0:64:64:4:60:4:60|t".. CL.count
	function UpdateInfoBoxList()
		if not mod:IsEngaged() or mod:GetStage() == 2 or (not blueList[1] and not greenList[1] and not redList[1]) then return end
		mod:SimpleTimer(UpdateInfoBoxList, 0.1)

		local t = GetTime()
		local line = 1
		for i = 1, #blueList do
			local player = blueList[i]
			local remaining = (blueDebuffTime[player] or 0) - t
			mod:SetInfo("infobox", line, blueText:format(mod:ColorName(player), blueStacks[player]))
			if remaining > 0 then
				mod:SetInfo("infobox", line + 1, CL.seconds:format(remaining))
				mod:SetInfoBar("infobox", line, remaining / BLUE_DURATION, 0, 0, 1, 0.5)
			else
				mod:SetInfo("infobox", line + 1, "")
				mod:SetInfoBar("infobox", line, 0)
			end
			line = line + 2
			if line > 10 then return end
		end
		for i = 1, #greenList do
			local player = greenList[i]
			local remaining = (greenDebuffTime[player] or 0) - t
			mod:SetInfo("infobox", line, greenText:format(mod:ColorName(player), greenStacks[player]))
			if remaining > 0 then
				mod:SetInfo("infobox", line + 1, CL.seconds:format(remaining))
				mod:SetInfoBar("infobox", line, remaining / GREEN_DURATION, 0, 1, 0, 0.5)
			else
				mod:SetInfo("infobox", line + 1, "")
				mod:SetInfoBar("infobox", line, 0)
			end
			line = line + 2
			if line > 10 then return end
		end
		for i = 1, #redList do
			local player = redList[i]
			local remaining = (redDebuffTime[player] or 0) - t
			mod:SetInfo("infobox", line, redText:format(mod:ColorName(player), redStacks[player]))
			if remaining > 0 then
				mod:SetInfo("infobox", line + 1, CL.seconds:format(remaining))
				mod:SetInfoBar("infobox", line, remaining / RED_DURATION, 1, 0, 0, 0.5)
			else
				mod:SetInfo("infobox", line + 1, "")
				mod:SetInfoBar("infobox", line, 0)
			end
			line = line + 2
			if line > 10 then return end
		end
		while line < 11 do
			mod:SetInfo("infobox", line, "")
			mod:SetInfo("infobox", line + 1, "")
			mod:SetInfoBar("infobox", line, 0)
			line = line + 2
		end
	end
end
