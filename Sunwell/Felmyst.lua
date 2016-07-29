﻿------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Felmyst"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local started = nil
local IsItemInRange = IsItemInRange
local UnitName = UnitName
local UnitExists = UnitExists
local db = nil
local count = 1
local fail = {}
local bandages = {
	[21991] = true, -- Heavy Netherweave Bandage
	[21990] = true, -- Netherweave Bandage
	[14530] = true, -- Heavy Runecloth Bandage
	[14529] = true, -- Runecloth Bandage
	[8545] = true, -- Heavy Mageweave Bandage
	[8544] = true, -- Mageweave Bandage
	[6451] = true, -- Heavy Silk Bandage
	[6450] = true, -- Silk Bandage
	[3531] = true, -- Heavy Wool Bandage
	[3530] = true, -- Wool Bandage
	[2581] = true, -- Heavy Linen Bandage
	[1251] = true, -- Linen Bandage
}
local pName = UnitName("player")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Felmyst",

	encaps = "Encapsulate",
	encaps_desc = "Warn who has Encapsulate.",
	encaps_warning = "Encapsulate in ~5sec!",
	encaps_message = "Encapsulate: %s",

	gas = "Gas Nova",
	gas_desc = "Warn for Gas Nova being cast.",
	gas_message = "Casting Gas Nova!",
	gas_bar = "~Gas Nova Cooldown",

	vapor = "Demonic Vapor",
	vapor_desc = "Warn who gets Demonic Vapor.",
	vapor_message = "Vapor: %s",
	vapor_you = "Vapor on You!",

	icon = "Icon",
	icon_desc = "Place a Raid Target Icon on players with Encapsulate or Demonic Vapor. (requires promoted or higher)",

	phase = "Phases",
	phase_desc = "Warn for takeoff and landing phases.",
	airphase_trigger = "I am stronger than ever before!",
	takeoff_bar = "Takeoff",
	takeoff_message = "Taking off in 5sec!",
	landing_bar = "Landing",
	landing_message = "Landing in 10sec!",

	breath = "Deep Breath",
	breath_desc = "Deep Breath warnings.",
	breath_nextbar = "~Breath Cooldown (%d)",
	breath_warn = "Inc Breath (%d)!",

	dispel = "Mass Dispel Results",
	dispel_desc = "If you're a priest, will print in /say who your mass dispel failed on.",
	dispel_fail = "Mass Dispel failed: ",

	warning = "WARNING\n--\nFor Encapsulate scanning to work properly you need to have your Main Tank in the Blizzard Main Tank list!!",
} end )

L:RegisterTranslations("esES", function() return {
	encaps = "Encapsular (Encapsulate)",
	encaps_desc = "Avisar quién tiene Encapsular.",
	encaps_warning = "¡Encapsular en ~5 Seg!",
	encaps_message = "Encapsular: %s",

	gas = "Nova de gas (Gas Nova)",
	gas_desc = "Avisar cuando se lanza Nova de gas.",
	gas_message = "¡Lanzando Nova de gas!",
	gas_bar = "~Nova de gas",

	vapor = "Vapor demoníaco (Demonic Vapor)",
	vapor_desc = "Avisar quién tiene Vapor demoníaco.",
	vapor_message = "Vapor: %s",

	icon = "Icono",
	icon_desc = "Poner un icono de banda sobre jugadores afectados por Encapsular o Vapor demoníaco. (Requiere derechos de banda)",

	phase = "Fases",
	phase_desc = "Avisar sobre las fases de suelo y aire.",
	airphase_trigger = "¡Soy más fuerte que nunca!",
	takeoff_bar = "Vuela",
	takeoff_message = "¡Vuela en 5 Seg!",
	landing_bar = "Aterriza",
	landing_message = "¡Aterriza en 10 Seg!",

	breath = "Respira hondo (Deep Breath)",
	breath_desc = "Avisar cuando respira hondo.",
	breath_nextbar = "~Respira hondo (%d)",
	breath_warn = "¡Respira hondo (%d)!",
	
	dispel = "Resultados de Disipación en masa",
	dispel_desc = "Si eres un sacerdote, enviará al canal Decir a quién le ha fallado tu Disipación en masa.",
	dispel_fail = "Disipación en masa falla: ",

	warning = "AVISO\n--\n¡¡Para que funcione la comprobación de Encapsular debes tener a tu tanque principal en la lista original del juego de tanques principales!!",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Teufelsruch",

	encaps = "Einschließen",
	encaps_desc = "Opfer des Einschließens ankündigen.",
	encaps_warning = "Einschließen in ~5 Sekunden!",
	encaps_message = "Einschließen: %s",

	gas = "Gasnova",
	gas_desc = "Gasnova ankündigen.",
	gas_message = "Wirkt Gasnova!",
	gas_bar = "~Gasnova-Cooldown",

	vapor = "Dämonischer Dampf",
	vapor_desc = "Warnt wer von Dämonischer Dampf betroffen ist.",
	vapor_message = "Dampf: %s",

	icon = "Schlachtzug Symbol",
	icon_desc = "Plaziert ein Schlachtzug Symbol auf Spielern die von Einschließen oder Demonic Vapor betroffen sind (benötigt Assistent oder höher)",

	phase = "Phasen",
	phase_desc = "Abheben und Landung ankündigen.",
	airphase_trigger = "Ich bin stärker als je zuvor!",
	takeoff_bar = "Abheben",
	takeoff_message = "Abheben in 5 Sekunden!",
	landing_bar = "Landung",
	landing_message = "Landung in 10 Sekunden!",

	breath = "Tiefer Atem",
	breath_desc = "Warnung für Tiefen Atem.",
	breath_nextbar = "~Atem-Cooldown (%d)",
	breath_warn = "Atem in Kürze (%d)!",

	dispel = "Ergebnis der Massenbannung",
	dispel_desc = "Wenn Du Priester bist, wird eine Nachricht im sag-Chat ausgegeben, bei wem Deine Massenbannung fehlgeschlagen ist.",
	dispel_fail = "Massenbannung fehlgeschlagen: ",

	warning = "WARNUNG\n--\nDamit die Einschließen-Detektion korrekt funtkioniert, muss der Maintank in der Blizzard-Maintank-Liste eingestellt sein.",
} end )

L:RegisterTranslations("zhCN", function() return {
	encaps = "压缩",
	encaps_desc = "当玩家受到压缩时发出警报。",
	encaps_warning = "约5秒后，压缩！",
	encaps_message = "压缩：>%s<！",

	gas = "毒气新星",
	gas_desc = "当施放毒气新星时发出警报。",
	gas_message = "正在施放毒气新星！",
	gas_bar = "<毒气新星 冷却>",

	vapor = "恶魔蒸汽",
	vapor_desc = "当玩家受到恶魔蒸汽时发出警报。",
	vapor_message = "恶魔蒸汽：>%s<！",
	vapor_you = ">你< 恶魔蒸汽！",

	icon = "团队标记",
	icon_desc = "为中了压缩或恶魔蒸汽的玩家打上团队标记。（需要权限）",

	phase = "阶段警报",
	phase_desc = "当升空或降落阶段时发出警报。",
	airphase_trigger = "我比以前更强大了！",
	takeoff_bar = "升空",
	takeoff_message = "5秒后，升空！",
	landing_bar = "降落",
	landing_message = "10秒后，降落！",

	breath = "深呼吸",
	breath_desc = "当施放深呼吸时发出警报。",
	breath_nextbar = "<下一深呼吸：%d>",
	breath_warn = "深呼吸：>%d<！",

	dispel = "群体驱散结果",
	dispel_desc = "如果你是牧师，将在 /say 提示谁不在群体驱散范围内。",
	dispel_fail = "距离过远：",

	warning = "注意\n--\n需要 MT 处于暴雪默认 MT 名单下压缩扫描才能正常使用！",
} end )

L:RegisterTranslations("koKR", function() return {
	encaps = "가두기",
	encaps_desc = "가두기에 걸린 플레이어를 알립니다.",
	encaps_warning = "약 5초 이내 가두기!",
	encaps_message = "가두기: %s",

	gas = "가스 회오리",
	gas_desc = "가스 회오리의 시전에 대해 알립니다.",
	gas_message = "가스 회오리 시전!",
	gas_bar = "~가스 회오리 대기시간",

	vapor = "악령의 증기",
	vapor_desc = "악령의 증기에 걸린 플레이어를 알립니다.",
	vapor_message = "증기: %s",
	vapor_you = "당신은 증기!",

	icon = "전술 표시",
	icon_desc = "가두기 또는 악령의 증기에 걸린 플레이어에게 전술 표시를 지정합니다. (승급자 이상 권한 필요)",

	phase = "단계",
	phase_desc = "이륙과 착지 단계에 대해 알립니다.",
	airphase_trigger = "나는 어느 때보다도 강하다!",
	takeoff_bar = "이륙",
	takeoff_message = "5초 이내 이륙!",
	landing_bar = "착지",
	landing_message = "10초 이내 착지!",

	breath = "깊은 숨결",
	breath_desc = "깊은 숨결을 알립니다.",
	breath_nextbar = "~숨결 대기시간 (%d)",
	breath_warn = "깊은 숨결 (%d)!",

	dispel = "대규모 무효화 결과",
	dispel_desc = "당신이 사제인 경우, 대규모 무효화가 실패한 플레이어를 일반 대화창으로 알립니다.",
	dispel_fail = "대규모 무효화 실패: ",

	warning = "경고\n--\n기본 블리자드의 방어 전담 탱커 & ORA의 메인 탱커가 등록되어야 가두기에 대한 검색이 제대로 작동합니다!!(탱커로 지정된 플레이어가 대상이 될때에는 가두기 경보가 나오지 않습니다.)",
} end )

L:RegisterTranslations("frFR", function() return {
	encaps = "Enfermer",
	encaps_desc = "Prévient quand un joueur subit les effets d'Enfermer.",
	encaps_warning = "Enfermer dans ~5 sec. !",
	encaps_message = "Enfermer : %s",

	gas = "Nova de gaz",
	gas_desc = "Prévient quand la Nova de gaz est incantée.",
	gas_message = "Nova de gaz en incantation !",
	gas_bar = "~Recharge Nova de gaz",

	vapor = "Vapeur démoniaque",
	vapor_desc = "Prévient quand un joueur subit les effets de la Vapeur démoniaque.",
	vapor_message = "Vapeur : %s",
	vapor_you = "Vapeur sur VOUS !",

	icon = "Icône",
	icon_desc = "Place une icône de raid sur la dernière personne affectée par Enfermer ou Vapeur démoniaque (nécessite d'être promu ou mieux).",

	phase = "Phases",
	phase_desc = "Prévient quand Gangrebrume décolle et atterit.",
	airphase_trigger = "Je suis plus forte que jamais !",
	takeoff_bar = "Décollage",
	takeoff_message = "Décollage dans 5 sec. !",
	landing_bar = "Atterrissage",
	landing_message = "Atterrissage dans 10 sec. !",

	breath = "Grande inspiration",
	breath_desc = "Prévient quand Gangrebrume inspire profondément.",
	breath_nextbar = "~Recharge Souffle (%d)",
	breath_warn = "Souffle (%d) !",

	dispel = "Échecs Dissipation de masse",
	dispel_desc = "Si vous êtes prêtre, ceci affichera en /dire les échecs de votre Dissipation de masse.",
	dispel_fail = "Échec(s) Dissipation de masse : ",

	warning = "ATTENTION\n--\nPour que l'analyse des Enfermer fonctionne correctement, vous devez indiquer votre tank dans la liste des tanks principaux de Blizzard !",
} end )

L:RegisterTranslations("zhTW", function() return {
	encaps = "封印",
	encaps_desc = "隊友受到封印效果時發出警報",
	encaps_warning = "約 5 秒後! 施放封印!",
	encaps_message = "封印: [%s]",

	gas = "毒氣新星",
	gas_desc = "當毒氣新星準備施放時發出警報",
	gas_message = "毒氣新星施放中!",
	gas_bar = "毒氣新星冷卻計時",

	vapor = "惡魔煙霧",
	vapor_desc = "隊友受到惡魔煙霧時發出警報",
	vapor_message = "惡魔煙霧: [%s]",
	vapor_you = "[你]:惡魔煙霧!",

	icon = "團隊標記",
	icon_desc = "為中了封印或惡魔煙霧的隊友標上團隊標記（需要權限）",

	phase = "階段警報",
	phase_desc = "當升空或降落階段時發出警報",
	airphase_trigger = "我比以前更強大了!",--need combatlog
	takeoff_bar = "升空",
	takeoff_message = "約 5 秒後，升空!",
	landing_bar = "降落",
	landing_message = "約 10 秒後，降落!",

	breath = "深呼吸",
	breath_desc = "當施放深呼吸時發出警報",
	breath_nextbar = "<下次深呼吸: %d>",
	breath_warn = "深呼吸: >%d<!",

	dispel = "群體驅魔結果",
	dispel_desc = "如果你是牧師，將在 /say 提示誰不在群體驅魔範圍內",
	dispel_fail = "距離過遠: ",

	warning = "注意\n--\n需要 MT 處於暴風雪預設 MT 名單下封印掃描才能正常使用!",
} end )

L:RegisterTranslations("ruRU", function() return {
	encaps = "Капсула",
	encaps_desc = "Предупреждать Вас о тех, кто получает Инкапсулейт.",
	encaps_warning = "Инкапсулейт через 5 Секунд!",
	encaps_message = "%s попадает в Инкапсулейт!",

	gas = "Газ огненной звезды",
	gas_desc = "Предупреждение о газе огненной звезды.",
	gas_message = "Внимание: газ огненной звезды!",
	gas_bar = "~Осталось до газа огненной звезды",

	vapor = "Демонический луч",
	vapor_desc = "Предупреждение о демоническом луче.",
	vapor_message = "Демонический луч преследует %s",
	vapor_you = "Демонический луч на Вас!",

	icon = "Иконка",
	icon_desc = "Помечает иконкой игрока под демоническим лучем или капсулой (необходим промоут)",

	phase = "Фазы",
	phase_desc = "Предупреждение о смене фаз",
	airphase_trigger = "Я сильнее, чем когда-либо прежде!",
	takeoff_bar = "Взлет",
	takeoff_message = "Взлет через 5 секунд!",
	landing_bar = "Посадка",
	landing_message = "Посадка через 10 секунд!",

	breath = "Дыхание",
	breath_desc = "Предупреждение о дыхании.",
	breath_nextbar = "(%d)-е Глубокое Дыхание",
	breath_warn = "На подходе %d-й выдох!",

	dispel = "Результат Массового Рассеивания",
	dispel_desc = "Если Вы жрец то сообщает в чат о людях, рассеивание которых не удалось",
	dispel_fail = "Газ Огненной Звезды остался на ",

	warning = "ВНИМАНИЕ\n--\nДля корректного сканирования Инкапсулейта необходимо правильно установить список танков рейда!!",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Sunwell Plateau"]
mod.enabletrigger = boss
mod.guid = 25038
mod.toggleOptions = {"phase", "breath", "vapor", "icon", -1, "encaps", "gas", "dispel", "enrage", "proximity"}
mod.revision = tonumber(("$Revision: 6 $"):sub(12, -3))
mod.proximityCheck = function( unit ) 
	for k, v in pairs( bandages ) do
		if IsItemInRange( k, unit) == 1 then
			return true
		end
	end
	return false
end
mod.proximitySilent = true

------------------------------
--      Initialization      --
------------------------------

local warn = true
function mod:OnEnable()
	started = nil

	self:AddCombatListener("SPELL_CAST_START", "Gas", 45855)
	self:AddCombatListener("SPELL_SUMMON", "Vapor", 45392)
	--self:AddCombatListener("SPELL_AURA_APPLIED", "Encapsulate", 45662) --Maybe one day
	local _, class = UnitClass("player")
	if class == "PRIEST" then
		self:AddCombatListener("SPELL_DISPEL_FAILED", "DispelFail", 32375) --Mass Dispel catcher
	end
	self:AddCombatListener("UNIT_DIED", "BossDeath")

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")

	self:RegisterEvent("BigWigs_RecvSync")

	db = self.db.profile
	if warn then
		BigWigs:Print(L["warning"])
		warn = nil
	end
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:Gas(_, spellID)
	if db.gas then
		self:IfMessage(L["gas_message"], "Attention", spellID)
		self:Bar(L["gas_bar"], 20, spellID)
	end
end

function mod:Vapor(_, _, source)
	if db.vapor then
		local other = L["vapor_message"]:format(source)
		if source == pName then
			self:Message(L["vapor_you"], "Personal", nil, "Long")
			self:WideMessage(other)
		else
			self:IfMessage(other, "Urgent", 45402)
		end
		self:Bar(other, 10, 45402)
		self:Icon(source, "icon")
	end
end

function mod:DispelFail(player, _, source)
	if UnitIsUnit(source, "player") and db.dispel then
		fail[player] = true
		self:ScheduleEvent("BWFelmystDispelWarn", self.DispelWarn, 0.3, self)
	end
end

function mod:DispelWarn()
	local msg = nil
	for k in pairs(fail) do
		if not msg then
			msg = k
		else
			msg = msg .. ", " .. k
		end
	end
	SendChatMessage(L["dispel_fail"]..msg, "SAY")
	for k in pairs(fail) do fail[k] = nil end
end

do
	local function isMT(player)
		if GetPartyAssignment("maintank", player) then return true end
		if oRA and oRA.maintanktable then
			for i, t in ipairs(oRA.maintanktable) do
				if t == player then return true end
			end
		end
	end

	local cachedId = nil
	local lastTarget = nil
	function mod:Encapsulate()
		local found = nil
		if cachedId and UnitExists(cachedId) and UnitName(cachedId) == boss then found = true end
		if not found then
			cachedId = self:Scan()
			if cachedId then found = true end
		end
		if not found then return end
		local target = UnitName(cachedId .. "target")
		if target and target ~= lastTarget and UnitExists(target) then
			if not isMT(target) then
				local msg = L["encaps_message"]:format(target)
				self:IfMessage(msg, "Important", 45665, "Alert")
				self:Bar(msg, 6, 45665)
				self:Icon(target, "icon")
			end
			lastTarget = target
		end
	end
end

function mod:BigWigs_RecvSync(sync, rest, nick)
	if self:ValidateEngageSync(sync, rest) and not started then
		started = true
		for k in pairs(fail) do fail[k] = nil end
		if self:IsEventRegistered("PLAYER_REGEN_DISABLED") then
			self:UnregisterEvent("PLAYER_REGEN_DISABLED")
		end
		self:PhaseOne()
		if db.encaps then
			self:ScheduleRepeatingEvent("BWEncapsScan", self.Encapsulate, 0.5, self)
		end
		self:TriggerEvent("BigWigs_ShowProximity", self)
		if db.enrage then
			self:Enrage(600)
		end
	end
end

function mod:CHAT_MSG_RAID_BOSS_EMOTE(_, unit)
	if db.breath and unit == boss then
		--19879 track dragonkin, looks like a dragon breathing 'deep breath' :)
		self:IfMessage(L["breath_warn"]:format(count), "Attention", 19879)
		self:Bar(L["breath_warn"]:format(count), 4, 19879)
		count = count + 1
		if count < 4 then
			self:Bar(L["breath_nextbar"]:format(count), 17, 19879)
		end
	end
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L["airphase_trigger"] then
		if db.phase then
			self:Bar(L["landing_bar"], 100, 31550)
			self:DelayedMessage(90, L["landing_message"], Attention)
		end
		self:ScheduleEvent("BWFelmystStage", self.PhaseOne, 100, self)
		if db.breath then
			count = 1
			self:Bar(L["breath_nextbar"]:format(count), 40.5, 19879)
		end
		self:CancelScheduledEvent("BWEncapsScan")
	end
end

function mod:PhaseOne()
	if db.phase then
		self:Bar(L["takeoff_bar"], 60, 31550)
		self:DelayedMessage(55, L["takeoff_message"], "Attention")
	end

	if db.encaps then
		self:Bar(L["encaps"], 30, 45661)
		self:DelayedMessage(25, L["encaps_warning"], "Attention")
		self:ScheduleRepeatingEvent("BWEncapsScan", self.Encapsulate, 0.5, self)
	end
end

