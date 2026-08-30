
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Shade of Akama", 564, 1584)
if not mod then return end
mod:RegisterEnableMob(23191, 22841) -- Akama, Shade of Akama
mod:SetEncounterID(603)
mod:SetRespawnTime(120)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local defender, sorcerer, left, right = nil, nil, nil, nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.wipe_trigger = "No! Not yet!"
	L.defender = "Defender" -- Ashtongue Defender
	L.sorcerer = "Sorcerer" -- Ashtongue Sorcerer
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		42023, -- Rain of Fire
		"stages",
	}
end

function mod:VerifyEnable(unit, mobId)
	if mobId == 22841 or self:GetHealth(unit) == 100 then -- Enable if shade, or if Akama at 100% hp
		return true
	end
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_REMOVED", "StealthRemoved", 34189)
	self:RegisterEvent("GOSSIP_CONFIRM_CANCEL")
	self:RegisterMessage("BigWigs_BossComm")

	self:Log("SPELL_AURA_APPLIED", "RainOfFireDamage", 42023)
	self:Log("SPELL_PERIODIC_DAMAGE", "RainOfFireDamage", 42023)
	self:Log("SPELL_PERIODIC_MISSED", "RainOfFireDamage", 42023)

	self:Log("SWING_DAMAGE", "SwingDamage", "*")

	if self:Classic() then
		self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	end
end

function mod:OnEngage()
	self:SetStage(1)
	if not self:Classic() then
		self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
	end
	self:Bar("stages", 32, L.defender, "ability_parry")
	self:RepeaterSorcerer()
	self:RepeaterAddsRight()
	left = self:ScheduleTimer("RepeaterAddsLeft", 15)
	defender = self:ScheduleTimer("RepeaterDefender", 32)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local prev = 0
	function mod:StealthRemoved(args)
		-- Stealth is removed when you speak to him, starting the encounter
		if self:MobId(args.destGUID) == 23191 and not self:IsEngaged() and (GetTime() - prev > 2) then -- Akama
			self:Sync("Akama") -- There seems to be range problems with this, sync for now.
		end
	end
end

do
	local prev = 0
	function mod:GOSSIP_CONFIRM_CANCEL()
		if self:MobId(self:UnitGUID("npc")) == 23191 and (GetTime() - prev > 2) then -- Akama
			prev = GetTime()
			self:Sync("AkamaG")
		end
	end
end

do
	local prev = 0
	function mod:BigWigs_BossComm(_, msg)
		if msg == "Akama" and not self:IsEngaged() and (GetTime() - prev > 2) then
			prev = GetTime()
			self:Message("stages", "cyan", "-", false)
			self:Bar("stages", 13, L.defender, "ability_parry")
			self:Bar("stages", 13, L.sorcerer, "spell_shadow_siphonmana")
			self:Bar("stages", 13, CL.extra:format(CL.adds, CL.right), "misc_arrowright")
			self:Bar("stages", 28, CL.extra:format(CL.adds, CL.left), "misc_arrowleft")
		elseif msg == "AkamaG" and not self:IsEngaged() and (GetTime() - prev > 2) then
			prev = GetTime()
			self:Message("stages", "cyan", "+", false)
			self:Bar("stages", 13, L.defender, "ability_parry")
			self:Bar("stages", 13, L.sorcerer, "spell_shadow_siphonmana")
			self:Bar("stages", 13, CL.extra:format(CL.adds, CL.right), "misc_arrowright")
			self:Bar("stages", 28, CL.extra:format(CL.adds, CL.left), "misc_arrowleft")
		end
	end
end

function mod:RepeaterDefender()
	self:Bar("stages", 29.7, L.defender, "ability_parry")
	defender = self:ScheduleTimer("RepeaterDefender", 29.7)
end

function mod:RepeaterSorcerer()
	self:Bar("stages", 25.5, L.sorcerer, "spell_shadow_siphonmana")
	sorcerer = self:ScheduleTimer("RepeaterSorcerer", 25.5)
end

function mod:RepeaterAddsRight()
	self:Bar("stages", 45, CL.extra:format(CL.adds, CL.right), "misc_arrowright")
	right = self:ScheduleTimer("RepeaterAddsRight", 45)
end

function mod:RepeaterAddsLeft()
	self:Bar("stages", 52, CL.extra:format(CL.adds, CL.left), "misc_arrowleft")
	left = self:ScheduleTimer("RepeaterAddsLeft", 52)
end

do
	local prev = 0
	function mod:RainOfFireDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 2 then
			prev = args.time
			self:PersonalMessage(args.spellId, "aboveyou")
			self:PlaySound(args.spellId, "underyou")
		end
	end
end

do
	local function GoStage2(self)
		if self:GetStage() == 1 then
			self:SetStage(2)
			self:CancelTimer(defender)
			self:CancelTimer(sorcerer)
			self:CancelTimer(right)
			self:CancelTimer(left)
			defender, sorcerer, left, right = nil, nil, nil, nil
			self:StopBar(L.defender)
			self:StopBar(L.sorcerer)
			self:StopBar(CL.extra:format(CL.adds, CL.right))
			self:StopBar(CL.extra:format(CL.adds, CL.left))
			self:Message("stages", "cyan", CL.stage:format(2), false)
			self:PlaySound("stages", "info")
		end
	end

	function mod:SwingDamage(args) -- Classic
		local destCreatureID = self:MobId(args.destGUID)
		if destCreatureID == 23191 or destCreatureID == 22841 then -- Akama, Shade of Akama
			self:RemoveLog("SWING_DAMAGE", "*")
			GoStage2(self)
		end
	end

	function mod:INSTANCE_ENCOUNTER_ENGAGE_UNIT() -- Retail
		if UnitExists("boss1") then
			self:UnregisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
			GoStage2(self)
		end
	end
end

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg == L.wipe_trigger then
		self:EncounterEnd(nil, self.engageId, self.displayName, 0, 0, 0) -- XXX Hack for missing ENCOUNTER_END
	end
end
