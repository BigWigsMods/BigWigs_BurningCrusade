--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Kael'thas Sunstrider", 782)
if not mod then return end
--Kael'thas Sunstrider, Thaladred the Darkener, Master Engineer Telonicus, Grand Astromancer Capernian, Lord Sanguinar
mod:RegisterEnableMob(19622, 20064, 20063, 20062, 20060)

local MCd = mod:NewTargetList()
local phase = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "My people are addicted to it"
	L.engage_message = "Phase 1"

	L.gaze = "Gaze"
	L.gaze_desc = "Warn when Thaladred focuses on a player."
	L.gaze_trigger = "sets eyes"

	L.fear_soon_message = "Fear soon!"
	L.fear_message = "Fear!"
	L.fear_bar = "~Fear"

	L.rebirth = "Phoenix Rebirth"
	L.rebirth_desc = "Approximate Phoenix Rebirth timers."
	L.rebirth_warning = "Possible Rebirth in ~5sec!"
	L.rebirth_bar = "~Rebirth"

	L.pyro = "Pyroblast"
	L.pyro_desc = "Show a 60 second timer for Pyroblast"
	L.pyro_trigger = "%s begins to cast Pyroblast!"
	L.pyro_warning = "Pyroblast in 5sec!"
	L.pyro_message = "Casting Pyroblast!"

	L.phase = "Phase warnings"
	L.phase_desc = "Warn about the various phases of the encounter."
	L.thaladred_inc_trigger = "Let us see how your nerves hold up against the Darkener, Thaladred! "
	L.sanguinar_inc_trigger = "You have persevered against some of my best advisors... but none can withstand the might of the Blood Hammer. Behold, Lord Sanguinar!"
	L.capernian_inc_trigger = "Capernian will see to it that your stay here is a short one."
	L.telonicus_inc_trigger = "Well done, you have proven worthy to test your skills against my master engineer, Telonicus."
	L.weapons_inc_trigger = "As you see, I have many weapons in my arsenal...."
	L.phase3_trigger = "Perhaps I underestimated you. It would be unfair to make you fight all four advisors at once, but... fair treatment was never shown to my people. I'm just returning the favor."
	L.phase4_trigger = "Alas, sometimes one must take matters into one's own hands. Balamore shanal!"

	L.flying_trigger = "I have not come this far to be stopped! The future I have planned will not be jeopardized! Now you will taste true power!!"
	L.flying_message = "Phase 5 - Gravity Lapse in 1min"

	L.weapons_inc_message = "Phase 2 - Weapons incoming!"
	L.phase3_message = "Phase 3 - Advisors and Weapons!"
	L.phase4_message = "Phase 4 - Kael'thas incoming!"
	L.phase4_bar = "Kael'thas incoming"

	L.mc = "Mind Control"
	L.mc_desc = "Warn who has Mind Control."
	L.mc_icon = 36797

	L.revive_bar = "Adds Revived"
	L.revive_warning = "Adds Revived in 5sec!"

	L.dead_message = "%s dies"

	L.capernian = "Grand Astromancer Capernian"
	L.sanguinar = "Lord Sanguinar"
	L.telonicus = "Master Engineer Telonicus"
	L.thaladred = "Thaladred the Darkener"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"phase", 37018, "mc", 37027, {"gaze", "ICON"}, 44863, "pyro", "rebirth", "proximity", "bosskill"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Conflag", 37018)
	self:Log("SPELL_AURA_APPLIED", "Toy", 37027)
	self:Log("SPELL_AURA_REMOVED", "ToyRemoved", 37027)
	self:Log("SPELL_AURA_APPLIED", "MC", 36797)
	self:Log("SPELL_CAST_START", "FearCast", 44863)
	self:Log("SPELL_MISSED", "Fear", 44863)
	self:Log("SPELL_AURA_APPLIED", "Fear", 44863)
	self:Log("SPELL_CAST_SUCCESS", "Phoenix", 36723)
	self:Log("SPELL_CAST_START", "GravityLapse", 35941)

	self:Yell("Engage", L["engage_trigger"])
	self:Emote("Pyro", L["pyro_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:Death("Win", 19622)
	self:Death("AddDeaths", 21272, 21270, 21269, 21271, 21268, 21273, 21274)
end

function mod:OnEngage()
	self:Bar("phase", L["thaladred"], 32, "Spell_Shadow_Charm")
	self:Message("phase", L["engage_message"], "Positive")
	phase = 1
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Conflag(args)
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Attention", args.spellId)
	self:TargetBar(args.spellId, args.spellName, args.destName, 10, args.spellId)
end

function mod:Toy(args)
	if phase < 3 then
		self:TargetMessage(args.spellId, args.spellName, args.destName, "Attention", args.spellId)
		self:TargetBar(args.spellId, args.spellName, args.destName, 60, args.spellId)
	end
end

function mod:ToyRemoved(args)
	self:StopBar(args.spellName, args.destName)
end

do
	local scheduled = nil
	local function mcWarn(spellName, spellId)
		mod:TargetMessage("mc", spellName, MCd, "Important", spellId, "Alert")
		scheduled = nil
	end
	function mod:MC(args)
		MCd[#MCd + 1] = args.destName
		if not scheduled then
			scheduled = true
			self:ScheduleTimer(mcWarn, 0.5, args.spellName, args.spellId)
		end
	end
end

function mod:FearCast(args)
	self:Message(args.spellId, L["fear_soon_message"], "Urgent", args.spellId)
end

do
	local last = 0
	function mod:Fear(args)
		local time = GetTime()
		if (time - last) > 5 then
			last = time
			self:Message(args.spellId, L["fear_message"], "Attention", args.spellId)
			self:Bar(args.spellId, L["fear_bar"], 30, args.spellId)
		end
	end
end

function mod:Phoenix()
	self:Message("rebirth", L["rebirth"], "Urgent")
	self:Bar("rebirth", L["rebirth_bar"], 45, "Spell_Fire_Burnout")
	self:DelayedMessage("rebirth", 40, L["rebirth_warning"], "Attention")
end

function mod:GravityLapse(args)
	self:Message("phase", args.spellName, "Important", args.spellId)
	self:Bar("phase", args.spellName, 90, args.spellId)
end

function mod:AddDeaths(args)
	self:Message("phase", L["dead_message"]:format(args.destName), "Attention")
end

function mod:Pyro()
	self:Bar("pyro", L["pyro"], 60, "Spell_Fire_Fireball02")
	self:Message("pyro", L["pyro_message"], "Positive")
	self:DelayedMessage("pyro", 55, L["pyro_warning"], "Attention")
end

function mod:CHAT_MSG_MONSTER_EMOTE(_, msg, _, _, _, player)
	if msg:find(L["gaze_trigger"]) then
		self:TargetBar("gaze", L["gaze"], player, 9, "Spell_Shadow_EvilEye")
		self:TargetMessage("gaze", L["gaze"], player, "Important")
		self:PrimaryIcon("gaze", player)
	end
end

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg == L["thaladred_inc_trigger"] then
		self:Message("phase", L["thaladred"], "Positive")
	elseif msg == L["sanguinar_inc_trigger"] then
		self:Message("phase", L["sanguinar"], "Positive")
		self:Bar("phase", L["sanguinar"], 13, "Spell_Shadow_Charm")
		self:PrimaryIcon("gaze")
		self:StopBar(L["gaze_bar"])
	elseif msg == L["capernian_inc_trigger"] then
		self:Message("phase", L["capernian"], "Positive")
		self:Bar("phase", L["capernian"], 7, "Spell_Shadow_Charm")
		self:OpenProximity("proximity", 10)
		self:StopBar(L["fear_bar"])
	elseif msg == L["telonicus_inc_trigger"] then
		self:Message("phase", L["telonicus"], "Positive")
		self:Bar("phase", L["telonicus"], 8, "Spell_Shadow_Charm")
		self:CloseProximity()
	elseif msg == L["weapons_inc_trigger"] then
		phase = 2
		self:Message("phase", L["weapons_inc_message"], "Positive")
		self:Bar("phase", L["revive_bar"], 95, "Spell_Holy_ReviveChampion")
		self:DelayedMessage("phase", 90, L["revive_warning"], "Attention")
	elseif msg == L["phase3_trigger"] then
		phase = 3
		self:Message("phase", L["phase3_message"], "Positive")
		self:Bar("phase", L["phase4_bar"], 180, "Spell_ChargePositive")
	elseif msg == L["phase4_trigger"] then
		phase = 4
		self:Message("phase", L["phase4_message"], "Positive")
		self:Bar("pyro", L["pyro"], 60, "Spell_Fire_Fireball02")
		self:DelayedMessage("pyro", 55, L["pyro_warning"], "Attention")
		self:StopBar(L["phase4_bar"])
	elseif msg == L["flying_trigger"] then
		phase = 5
		self:CancelDelayedMessage(L["pyro_warning"])
		self:StopBar(L["pyro"])
		self:Message("phase", L["flying_message"], "Attention")
		self:Bar("phase", L["gravity_bar"], 60, "Spell_Nature_UnrelentingStorm")
	end
end

