--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Void Reaver", 550, 1574)
if not mod then return end
mod:RegisterEnableMob(19516)
mod:SetEncounterID(731)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Alert! You are marked for extermination."
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{34172, "ICON", "SAY", "ME_ONLY"}, -- Arcane Orb
		25778, -- Knock Away
		34162, -- Pounding
		"berserk",
	},nil,{
		[36297] = CL.orb, -- Arcane Orb (Orb)
		[25778] = CL.tank_knockback, -- Knock Away (Tank Knockback)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "KnockAway", 25778)
	self:Log("SPELL_CAST_SUCCESS", "Pounding", 34162)
	self:Log("SPELL_CAST_SUCCESS", "ArcaneOrb", 34172)

	self:BossYell("Engage", L["engage_trigger"])
end

function mod:OnEngage()
	self:Berserk(600)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:KnockAway(args) -- Tank Knockback
	self:TargetMessage(args.spellId, "purple", args.destName, CL.tank_knockback)
	self:CDBar(args.spellId, 20, CL.tank_knockback)
	if self:Tank() then
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	end
end

function mod:Pounding(args) -- Pounding
	self:CDBar(args.spellId, 13)
	self:Message(args.spellId, "red")
	self:PlaySound(args.spellId, "info")
end

function mod:ArcaneOrb(args) -- Orb
	self:TargetMessage(args.spellId, "yellow", args.destName, CL.orb)
	self:PrimaryIcon(args.spellId, args.destName)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, CL.orb, nil, "Orb")
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	end
end
