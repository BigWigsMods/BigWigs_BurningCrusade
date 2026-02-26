--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Gruul the Dragonkiller", 565, 1565)
if not mod then return end
mod:RegisterEnableMob(19044)
mod:SetEncounterID(650)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		33525, -- Ground Slam
		{33652, "COUNTDOWN"}, -- Stoned
		33654, -- Shatter
		36300, -- Growth
		36240, -- Cave In
		36297, -- Reverberation
	},nil,{
		[36297] = mod:SpellName(15487), -- Reverberation (Silence)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "CaveIn", 36240)

	self:Log("SPELL_AURA_APPLIED", "GrowthApplied", 36300)
	self:Log("SPELL_AURA_APPLIED_DOSE", "GrowthApplied", 36300)

	self:Log("SPELL_CAST_SUCCESS", "Reverberation", 36297)
	self:Log("SPELL_CAST_START", "GroundSlam", 33525)
	self:Log("SPELL_AURA_APPLIED", "GroundSlamApplied", 39187)
	self:Log("SPELL_CAST_START", "Shatter", 33654)
end

function mod:OnEngage()
	self:CDBar(33525, 33) -- Ground Slam
	self:CDBar(36297, 102, mod:SpellName(15487)) -- Reverberation (Silence)
	self:Bar(36300, 30, CL.count:format(self:SpellName(36300), 1)) -- Growth
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CaveIn(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, "aboveyou")
		self:PlaySound(args.spellId, "underyou")
	end
end

function mod:GrowthApplied(args)
	local stack = args.amount or 1
	local nextStack = stack + 1
	if nextStack < 31 then
		self:Bar(args.spellId, 30, CL.count:format(args.spellName, nextStack))
		if stack >= 7 then -- Trying to only show a message when it starts becoming important
			self:Message(args.spellId, "cyan", CL.count:format(args.spellName, stack))
			self:PlaySound(args.spellId, "info")
		end
	else
		self:Bar(args.spellId, 300, CL.count:format(args.spellName, 1))
	end
end

function mod:Reverberation(args)
	self:Message(args.spellId, "yellow", self:SpellName(15487)) -- Silence
	self:CDBar(args.spellId, 31, self:SpellName(15487))
	self:PlaySound(args.spellId, "alarm")
end

function mod:GroundSlam(args)
	self:StopBar(args.spellName)
	self:Message(args.spellId, "orange", CL.other:format(args.spellName, CL.custom_sec:format(self:SpellName(33654), 10)), args.spellId)
	self:Bar(33654, 10) -- Shatter
	self:PlaySound(args.spellId, "long")
end

function mod:GroundSlamApplied(args)
	if self:Me(args.destGUID) then
		self:Bar(33652, 5) -- Stoned
	end
end

function mod:Shatter(args)
	self:Message(args.spellId, "red")
	self:CDBar(33525, 62) -- Ground Slam
	self:PlaySound(args.spellId, "warning")
end
