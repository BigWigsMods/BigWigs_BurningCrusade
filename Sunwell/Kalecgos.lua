﻿------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Kalecgos"]
local sath = BB["Sathrovarr the Corruptor"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local db = nil
local enrageWarn = nil
local wipe = nil
local counter = 1

local fmt = string.format
local GetNumRaidMembers = GetNumRaidMembers
local CheckInteractDistance = CheckInteractDistance
local pName = UnitName("player")
local UnitBuff = UnitBuff
local UnitPowerType = UnitPowerType
local UnitClass = UnitClass

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Kalecgos",

	engage_trigger = "Aggh!! No longer will I be a slave to Malygos! Challenge me and you will be destroyed!",
	wipe_bar = "Respawn",

	portal = "Portal",
	portal_desc = "Warn when the Spectral Blast cooldown is up.",
	portal_bar = "Next portal (%d)",
	portal_message = "Possible portal in 5sec!",

	realm = "Spectral Realm",
	realm_desc = "Tells you who is in the Spectral Realm.",
	realm_message = "Spectral Realm: %s (Group %d)",

	curse = "Curse of Boundless Agony",
	curse_desc = "Tells you who is afflicted by Curse of Boundless Agony.",
	curse_bar = "Curse: %s",

	magichealing = "Wild Magic (Increased healing)",
	magichealing_desc = "Tells you when you get increased healing from Wild Magic.",
	magichealing_you = "Wild Magic - Healing effects increased!",

	magiccast = "Wild Magic (Increased cast time)",
	magiccast_desc = "Tells you when a healer gets incrased cast time from Wild Magic.",
	magiccast_you = "Wild Magic - Increased casting time on YOU!",
	magiccast_other = "Wild Magic - Increased casting time on %s!",

	magichit = "Wild Magic (Decreased chance to hit)",
	magichit_desc = "Tells you when a tank's chance to hit is reduced by Wild Magic.",
	magichit_you = "Wild Magic - Decreased chance to hit on YOU!",
	magichit_other = "Wild Magic - Decreased chance to hit on %s!",

	magicthreat = "Wild Magic (Increased threat)",
	magicthreat_desc = "Tells you when you get increased threat from Wild Magic.",
	magicthreat_you = "Wild Magic - Threat generation increased!",

	buffet = "Arcane Buffet",
	buffet_desc = "Show the Arcane Buffet timer bar.",

	enrage_warning = "Enrage soon!",
	enrage_message = "10% - Enraged!",
	enrage_trigger = "Sathrovarr drives Kalecgos into a crazed rage!",

	strike = "Corrupting Strike",
	strike_desc = "Warn who gets Corrupting Strike.",
	strike_message = "Corrupting Strike: %s",
} end )

L:RegisterTranslations("esES", function() return {
	engage_trigger = "¡Aggh! ¡Ya no seré un esclavo de Malygos! ¡Retadme y seréis destruidos!",
	wipe_bar = "Reaparición",

	portal = "Portal",
	portal_desc = "Avisar cuando puede utilizar Explosión espectral.",
	portal_bar = "Portal (%d)",
	portal_message = "Posible portal en 5 seg",

	realm = "Reino espectral (Spectral Realm)",
	realm_desc = "Avisa quién está en el Reino espectral.",
	realm_message = "Reino espectral: %s (Grupo %d)",

	curse = "Agonía ilimitada (Boundless Agony)",
	curse_desc = "Avisa quién tiene Maldición de agonía ilimitada.",
	curse_bar = "Maldición: %s",

	magichealing = "Magia salvaje - Curación",
	magichealing_desc = "Te avisa cuando haces curaciones aumentadas por Magia salvaje.",
	magichealing_you = "¡Magia salvaje - Curación aumentada!",

	magiccast = "Magia salvaje - Tiempo lanzamiento",
	magiccast_desc = "Te avisa cuando un sanador tiene el tiempo de lanzamiento aumentado por Magia salvaje.",
	magiccast_you = "¡Magia salvaje - Tiempo lanzamiento aumentado en TI!",
	magiccast_other = "¡Magia salvaje - Tiempo lanzamiento aumentado en %s!",

	magichit = "Magia salvaje - Prob. golpe",
	magichit_desc = "Avisa cuando la probabilidad de golpe de un tanque se ve reducida por Magia salvaje.",
	magichit_you = "¡Magia salvaje - Prob. golpe reducida en TI!",
	magichit_other = "¡Magia salvaje - Prob. golpe reducida en %s!",

	magicthreat = "Magia salvaje - Amenaza",
	magicthreat_desc = "Avisa cuando generas más amenaza por Magia salvaje.",
	magicthreat_you = "¡Magia salvaje - Amenaza generada aumentada!",

	buffet = "Sacudida Arcana (Arcane Buffet)",
	buffet_desc = "Muestra una barra de tiempo para Sacudida Arcana.",

	enrage_warning = "¡Enfurecer en breve!",
	enrage_message = "¡10% - Enfurecido!",
	enrage_trigger = "¡Sathrovarr induce a Kalecgos a un estado de ira enloquecida!",

	strike = "Golpe corruptor (Corrupting Strike)",
	strike_desc = "Avisa quién tiene Golpe corruptor.",
	strike_message = "%s: Golpe corruptor",
} end )

L:RegisterTranslations("koKR", function() return {
	engage_trigger = "으아!! 난 이제 말리고스의 노예가 아니다! 덤벼라, 끝장을 내주마!",
	wipe_bar = "재생성 시간",

	portal = "차원문",
	portal_desc = "공허 폭발의 재사용 대기시간에 대해 알립니다.",
	portal_bar = "다음 차원문 (%d)",
	portal_message = "약 5초이내 차원문!",

	realm = "정신 세계",
	realm_desc = "정신 세계에 들어간 플레이어를 알립니다.",
	realm_message = "정신 세계: %s (%d 파티)",

	curse = "무한한 고통의 저주",
	curse_desc = "무한한 고통의 저주에 걸린 플레이어를 알립니다.",
	curse_bar = "저주: %s",

	magichealing = "마법 폭주 (힐량 증가)",
	magichealing_desc = "당신이 마법 폭주에 의해 힐량이 증가할때 알려줍니다.",
	magichealing_you = "마법 폭주 - 힐량 증가!",

	magiccast = "마법 폭주 (시전시간 지연)",
	magiccast_desc = "힐러가 마법 폭주에 의해 시전시간이 지연될때 알려줍니다.",
	magiccast_you = "마법 폭주 - 당신은 시전시간 지연!",
	magiccast_other = "마법 폭주 - %s 시전시간 지연!",

	magichit = "마법 폭주 (적중률 감소)",
	magichit_desc = "탱커가 마법 폭주에 의해 적중률이 감소할때 알려줍니다.",
	magichit_you = "마법 폭주 - 당신은 적중률 감소!",
	magichit_other = "마법 폭주 - %s 적중률 감소!",

	magicthreat = "마법 폭주 (위협수준 증가)",
	magicthreat_desc = "당신이 마법 폭주에 의해 위협수준이 증가할때 알려줍니다.",
	magicthreat_you = "마법 폭주 - 위협 생성 증가!",

	buffet = "비전 강타",
	buffet_desc = "비전 강타의 타이머 바를 표시합니다.",

	enrage_warning = "곧 격노!",
	enrage_message = "10% - 격노!",
	enrage_trigger = "사스로바르가 칼렉고스를 억제할 수 없는 분노의 소용돌이에 빠뜨립니다!",

	strike = "타락의 일격",
	strike_desc = "타락의 일격에 걸린 플레이어를 알립니다.",
	strike_message = "타락의 일격: %s",
} end )

L:RegisterTranslations("frFR", function() return {
	engage_trigger = "Aarghh !! Je ne serai plus jamais l'esclave de Malygos ! Osez me défier et vous serez détruits !",
	wipe_bar = "Réapparition",

	portal = "Portail",
	portal_desc = "Prévient quand le temps de recharge de la Déflagration spectrale est terminé.",
	portal_bar = "Prochain portail (%d)",
	portal_message = "Portail probable dans 5 sec. !",

	realm = "Royaume spectral",
	realm_desc = "Prévient quand un joueur est dans le Royaume spectral.",
	realm_message = "Royaume spectral : %s (Groupe %d)",

	curse = "Malédiction d'agonie infinie",
	curse_desc = "Prévient quand un joueur subit les effets de la Malédiction d'agonie infinie.",
	curse_bar = "Malédiction : %s",

	magichealing = "Magie sauvage (Soins prodigués augmentés)",
	magichealing_desc = "Prévient quand les effets de vos soins sont augmentés par la Magie sauvage.",
	magichealing_you = "Magie sauvage - Effets des soins augmentés !",

	magiccast = "Magie sauvage (Temps d'incantation augmenté)",
	magiccast_desc = "Prévient quand un soigneur a son temps d'incantation augmenté par la Magie sauvage.",
	magiccast_you = "Magie sauvage - Temps d'incantation augmenté pour VOUS !",
	magiccast_other = "Magie sauvage - Temps d'incantation augmenté pour %s !",

	magichit = "Magie sauvage (Chances de toucher réduites)",
	magichit_desc = "Prévient quand les chances de toucher d'un tank sont réduites par la Magie sauvage.",
	magichit_you = "Magie sauvage - Chances de toucher réduites pour VOUS !",
	magichit_other = "Magie sauvage - Chances de toucher réduites pour %s !",

	magicthreat = "Magie sauvage (Menace générée augmentée)",
	magicthreat_desc = "Prévient quand la menace que vous générez est augmentée par la Magie sauvage.",
	magicthreat_you = "Magie sauvage - Menace générée augmentée !",

	buffet = "Rafale des arcanes",
	buffet_desc = "Affiche une barre temporelle pour la Rafale des arcanes.",

	enrage_warning = "Enrager imminent !",
	enrage_message = "10% - Enragé !",
	enrage_trigger = "Sathrovarr déchaîne la rage de Kalecgos !",

	strike = "Frappe corruptrice",
	strike_desc = "Prévient quand quelqu'un subit les effets de la Frappe corruptrice.",
	strike_message = "%s : Frappe corruptrice",
} end )

L:RegisterTranslations("zhCN", function() return {
	engage_trigger = "啊！我不再是玛利苟斯的奴隶了！所有挑战我的人都要被消灭！",
	wipe_bar = "重置计时",

	portal = "传送",
	portal_desc = "当灵魂冲击冷却时发出警报。",
	portal_bar = "<下一传送：%d>",
	portal_message = "5秒后，可能发动传送！",

	realm = "灵魂世界",
	realm_desc = "当玩家在灵魂世界中发出警报.",
	realm_message = "灵魂世界：>%s<！（%d 小队）",

	curse = "无边苦痛诅咒",
	curse_desc = "当玩家受到无边苦痛诅咒时发出警报。",
	curse_bar = "<诅咒：%s>",

	magichealing = "狂野魔法（治疗加成）",
	magichealing_desc = "当你从狂野魔法中获得治疗加成时发出警报。",
	magichealing_you = "狂野魔法 - 治疗效果加成！",

	magiccast = "狂野魔法（施法时间延长）",
	magiccast_desc = "当治疗从狂野魔法延长施法时间时发出警报。",
	magiccast_you = "狂野魔法 - 施法时间延长：>你<！",
	magiccast_other = "狂野魔法 - 施法时间延长：>%s<！",

	magichit = "狂野魔法（降低命中率）",
	magichit_desc = "当 MT 受到狂野魔法降低命中率时发出警报。",
	magichit_you = "狂野魔法 - 命中率降低：>你<",
	magichit_other = "狂野魔法 - 命中率降低：>%s<！",

	magicthreat = "狂野魔法（增加仇恨）",
	magicthreat_desc = "当你受到狂野魔法增加仇恨时发出警报。",
	magicthreat_you = "狂野魔法 - 增加仇恨！",

	buffet = "奥术打击",
	buffet_desc = "显示奥术打击记时条。",

	enrage_warning = "即将激怒！",
	enrage_message = "10% - 激怒！",
	enrage_trigger = "萨索瓦尔将卡雷苟斯逼得狂暴不已！",

	strike = "堕落打击",
	strike_desc = "当玩家受到堕落打击时发出警报。",
	strike_message = "堕落打击：>%s<！",
} end )

L:RegisterTranslations("zhTW", function() return {
	engage_trigger = "啊!!我不再是瑪里苟斯的奴隸了!所有挑戰我的人都要被消滅!",
	wipe_bar = "重生計時",

	portal = "傳送門",
	portal_desc = "當鬼靈衝擊冷卻結束時發出警報",
	portal_bar = "<下一次傳送門 (%d)>",
	portal_message = "約 5 秒內出現傳送門!",

	realm = "鬼靈國度",
	realm_desc = "提示你誰進入了鬼靈國度",
	realm_message = "鬼靈國度: [%s] - 小隊 %d!",

	curse = "無盡痛苦詛咒",
	curse_desc = "提示你誰受到了無盡痛苦詛咒",
	curse_bar = "<無盡痛苦詛咒: [%s]>",

	magichealing = "野性魔法 (治療加成)",
	magichealing_desc = "當你獲得野性魔法 (治療加成) 時提示",
	magichealing_you = "野性魔法 - 治療效果加成!",

	magiccast = "野性魔法 (施法時間延長)",
	magiccast_desc = "當治療職受到野性魔法 (施法時間延長) 時提示",
	magiccast_you = "野性魔法 - 你的施法時間延長!",
	magiccast_other = "野性魔法 - 施法時間延長: [%s]",

	magichit = "野性魔法 (命中下降)",
	magichit_desc = "當坦克受到野性魔法 (命中下降) 時提示",
	magichit_you = "野性魔法 - 你的命中率下降!",
	magichit_other = "野性魔法 - 命中率下降: [%s]",

	magicthreat = "野性魔法 (仇恨增加)",
	magicthreat_desc = "當你獲得野性魔法 (仇恨增加) 時提示",
	magicthreat_you = "野性魔法 - 你的仇恨值增加!",

	buffet = "秘法之擊",
	buffet_desc = "顯示秘法之擊計時條",

	enrage_warning = "即將狂怒!",
	enrage_message = "10% - 狂怒狀態!",
	enrage_trigger = "塞斯諾瓦將卡雷苟斯逼入了瘋狂的暴怒中!",

	strike = "腐蝕之擊",
	strike_desc = "警報誰受到腐蝕之擊",
	strike_message = "腐蝕之擊: [%s]",
} end )

L:RegisterTranslations("deDE", function() return {
	engage_trigger = "Ah ha haa!! Nicht länger werde ich Malygos' Sklave sein! Fordert mich heraus und Ihr werdet vernichtet!",
	wipe_bar = "Wiederbeleben",

	portal = "Portal",
	portal_desc = "Warnt wann der Spektralschlag cooldown endet.",
	portal_bar = "Nächstes Portal (%d)",
	portal_message = "Mögliches Portal in 5 Sekunden!",

	realm = "Spektralreich",
	realm_desc = "Sagt dir wer im Spektralreich ist.",
	realm_message = "Spektralreich: %s (Gruppe %d)",

	curse = "Fluch der unermesslichen Pein",
	curse_desc = "Sagt dir wer von Fluch der unermesslichen Pein betroffen ist.",
	curse_bar = "Fluch: %s",

	magichealing = "Wilde Magie (Verbesserte Heilung)",
	magichealing_desc = "Sagt dir wann du erhöte Heilung von Wilder Magie bekommst.",
	magichealing_you = "Wilde Magie - Heilungs Effekte erhöht!",

	magiccast = "Wilde Magie (Schnellere Zauber)",
	magiccast_desc = "Sagt dir wann ein Heiler schnellere Zauber von Wilder Magie bekommt.",
	magiccast_you = "Wilde Magie - Schnellere Zauber auf DIR!",
	magiccast_other = "Wilde Magie - Schnellere Zauber auf %s!",

	magichit = "Wilde Magie (Verringerte Chance zu treffen)",
	magichit_desc = "sagt dir wenn bei einem Tank die Trefferchance verringert ist durch Wilde Magie.",
	magichit_you = "Wilde Magie - Verringerte Trefferchance auf DIR!",
	magichit_other = "Wilde Magie - Verringerte Trefferchance auf %s!",

	magicthreat = "Wilde Magie (Erhöhte Agro)",
	magicthreat_desc = "Sagt dir wenn du erhöhte Agro durch Wilde Magie bekommst.",
	magicthreat_you = "Wilde Magie - Agro Generierung erhöht!",

	buffet = "Arkanpuffer",
	buffet_desc = "Zeigt den Arkanpuffer Zeitbalken.",

	enrage_warning = "Wütend bald!",
	enrage_message = "10% - Wütend!",
	enrage_trigger = "Sathrovarr treibt Kalecgos in eine wahnsinnige Wut!",

	strike = "Stoß der Verderbnis",
	strike_desc = "Warnt wer Stoß der Verderbnis bekommt.",
	strike_message = "%s: Stoß der Verderbnis",
} end )

L:RegisterTranslations("ruRU", function() return {
	engage_trigger = "Аххх! Я больше никогда не буду рабом Малигоса! Осмелься бросить мне вызов – и я уничтожу тебя!",
	wipe_bar = "Возрождение",

	portal = "Порталы",
	portal_desc = "Предупреждать Вас о Спектральной Вспышке.",
	portal_bar = "Приближается %d-й Портал",
	portal_message = "Через 5 секунд возможен Портал!",

	realm = "Спектральная Реальность",
	realm_desc = "Показывать Вам игроков, затянутых в Спектральную Реальность.",
	realm_message = "%s из %d-й группы получает Спектральную Вспышку!",

	curse = "Проклятье Безграничной агонии",
	curse_desc = "Предупреждать Вас о людях, пораженных Проклятьем Безграничной агонии.",
	curse_bar = "Проклятье на %s",

	magichealing = "Дикая Магия (Увеличение Исцеления)",
	magichealing_desc = "Предупреждать, когда Вы получите эффект Увеличения Исцеления от Дикой Магии.",
	magichealing_you = "Еффекты лечения увеличены!",

	magiccast = "Дикая Магия (Замедление заклинаний)",
	magiccast_desc = "Предупреждать когда ваши целители получают Эффект Замедления от  Дикой Магии.",
	magiccast_you = "Дикая Магия - Ваши заклинания замедленны!",
	magiccast_other = "%s замедляет чтение заклинаний!",

	magichit = "Дикая Магия (Понижен шанс попадания)",
	magichit_desc = "Предупреждать когда у танка понижается шанс попадания от Дикой Магии.",
	magichit_you = "Ваш шанс попадания понижен!",
	magichit_other = "%s начинает промахиваться по цели!",

	magicthreat = "Дикая Магия (Увеличенная угроза)",
	magicthreat_desc = "Предупреждать когда Ваша угроза повышается от Дикой Магии.",
	magicthreat_you = "ВНИМАНИЕ! - Вы создаете повышенную угрозу!",

	buffet = "Борьба Чар",
	buffet_desc = "Показывать таймер Борьбы Чар.",

	enrage_warning = "Приближается Исступление!",
	enrage_message = "10% - Исступление!",
	enrage_trigger = "Сатроварр приводит Калесгоса в бешеную ярость!",

	strike = "Сокрушающий удар",
	strike_desc = "Показывать кто получает Сокрушающий Удар.",
	strike_message = "%s получает Сокрушающий Удар!",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Sunwell Plateau"]
mod.enabletrigger = { boss, sath }
mod.guid = 24892
mod.toggleOptions = {"portal", "buffet", "realm", "curse", "strike", -1, "magichealing", "magiccast", "magichit", "magicthreat", "enrage", "proximity"}
mod.revision = tonumber(("$Revision: 6 $"):sub(12, -3))
mod.proximityCheck = function(unit) return CheckInteractDistance(unit, 3) end
mod.proximitySilent = true

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:RegisterEvent("UNIT_HEALTH")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:AddSyncListener("SPELL_AURA_APPLIED", 46021, "KalecgosRealm", 1)
	self:AddSyncListener("SPELL_CAST_SUCCESS", 45029, "KalecgosStrike", 1)
	self:AddSyncListener("SPELL_AURA_APPLIED", 45032, 45034, "KalecgosCurse", 1)
	self:AddSyncListener("SPELL_AURA_APPLIED", 45018, "KaleBuffet", 1)
	self:AddSyncListener("SPELL_AURA_APPLIED_DOSE", 45018, "KaleBuffet", 1)
	self:AddSyncListener("SPELL_AURA_REMOVED", 45032, 45034, "KaleCurseRemv", 1)

	self:AddCombatListener("SPELL_AURA_APPLIED", "WildMagic", 44978, 45001, 45002, 45006)
	self:AddCombatListener("UNIT_DIED", "BossDeath")

	self:RegisterEvent("BigWigs_RecvSync")
	self:Throttle(3, "KalecgosMagicCast", "KalecgosMagicHit", "KaleBuffet", "KalecgosStrike")
	self:Throttle(0, "KalecgosCurse", "KaleCurseRemv")
	self:Throttle(19, "KalecgosRealm")

	db = self.db.profile
	if wipe and BigWigs:IsModuleActive(boss) then
		self:Bar(L["wipe_bar"], 30, 44670)
		wipe = nil
	end
	counter = 1
end

------------------------------
--      Event Handlers      --
------------------------------


function mod:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L["engage_trigger"] then
		wipe = true
		counter = 1
		if db.portal then
			self:Bar(L["portal_bar"]:format(counter), 20, 46021)
			self:DelayedMessage(15, L["portal_message"], "orange", nil, "alert")
		end
		self:TriggerEvent("BigWigs_ShowProximity", self)
	end
end

function mod:WildMagic(player, spellId)
	if spellId == 44978 and player == pName and db.magichealing then -- Wild Magic - Healing done by spells and effects increased by 100%.
		self:MessageOld(L["magichealing_you"], "yellow", spellId, "long")
	elseif spellId == 45001 then -- Wild Magic - Casting time increased by 100%.
		if self:IsPlayerHealer(player) then
			self:Sync("KalecgosMagicCast", player)
		end
	elseif spellId == 45002 then -- Wild Magic - Chance to hit with melee and ranged attacks reduced by 50%.
		if self:IsPlayerTank(player) then
			self:Sync("KalecgosMagicHit", player)
		end
	elseif spellId == 45006 and player == pName and db.magicthreat then -- Wild Magic - Increases threat generated by 100%.
		self:MessageOld(L["magicthreat_you"], "blue", spellId, "long")
	end
end

function mod:BigWigs_RecvSync(sync, rest, nick)
	if sync == "KalecgosRealm" and rest then
		if db.portal then
			counter = counter + 1
			self:Bar(L["portal_bar"]:format(counter), 20, 46021)
			self:DelayedMessage(15, L["portal_message"], "orange", nil, "alert")
		end
		if db.realm then
			local groupNo = self:GetGroupNumber(rest) or 0
			self:IfMessage(fmt(L["realm_message"], rest, groupNo), "orange", 44866, "alert")
		end
	elseif sync == "KalecgosCurse" and rest and db.curse then
		self:Bar(fmt(L["curse_bar"], rest), 30, 45032)
	elseif sync == "KaleBuffet" and db.buffet then
		self:Bar(L["buffet"], 8, 45018)
	elseif sync == "KaleCurseRemv" and rest and db.curse then
		self:TriggerEvent("BigWigs_StopBar", self, fmt(L["curse_bar"], rest))
	elseif sync == "KalecgosMagicCast" and rest and db.magiccast then
		local other = fmt(L["magiccast_other"], rest)
		if rest == pName then
			self:MessageOld(L["magiccast_you"], "green", 45001, "long")
			self:WideMessage(other)
		else
			self:IfMessage(other, "yellow", 45001)
		end
	elseif sync == "KalecgosMagicHit" and rest and db.magichit then
		local other = fmt(L["magichit_other"], rest)
		if rest == pName then
			self:MessageOld(L["magichit_you"], "blue", 45002, "long")
			self:WideMessage(other)
		else
			self:IfMessage(other, "yellow", 45002)
		end
	elseif sync == "KalecgosStrike" and rest and db.strike then
		local msg = fmt(L["strike_message"], rest)
		if rest == boss then
			self:IfMessage(msg, "orange", 45029)
		else
			self:IfMessage(msg, "orange", 45029)
			self:Bar(msg, 3, 45029)
		end
	end
end

function mod:UNIT_HEALTH(msg)
	if db.enrage then
		if msg == sath then
			local health = UnitHealth(msg)
			if health > 12 and health <= 14 and not enrageWarn then
				self:MessageOld(L["enrage_warning"], "green")
				enrageWarn = true
			elseif health > 50 and enrageWarn then
				enrageWarn = false
			end
		end
	end
end

function mod:CHAT_MSG_RAID_BOSS_EMOTE(msg)
	if db.enrage and msg == L["enrage_trigger"] then
		self:IfMessage(L["enrage_message"], "red", 44806)
	end
end

-- Assumptions made:
--	Shaman are always counted as healers
--	Paladins without Righteous Fury are healers
--	Druids are counted as healers if they have a mana bar and are not Moonkin
--	Priests are counted as healers if they aren't in Shadowform
local sfID = GetSpellInfo(15473) --Shadowform
local mkID = GetSpellInfo(24905) --Moonkin
local rfID = GetSpellInfo(25780) --Righteous Fury

local function hasBuff(player, buff)
	local i = 1
	local name = UnitBuff(player, i)
	while name do
		if name == buff then return true end
		i = i + 1
		name = UnitBuff(player, i)
	end
	return false
end

function mod:IsPlayerHealer(player)
	local _, class = UnitClass(player)
	if class == "SHAMAN" then
		return true
	end
	if class == "DRUID" and UnitPowerType(player) == 0 then
		return not hasBuff(player, mkID)
	end
	if class == "PALADIN" then
		return not hasBuff(player, rfID)
	end
	if class == "PRIEST" then
		return not hasBuff(player, sfID)
	end
	return false
end

-- Assumptions made:
--	Anyone with a rage bar is counted as a tank
--	Paladins with Righteous Fury are counted as tanks
function mod:IsPlayerTank(player)
	local _, class = UnitClass(player)
	if UnitPowerType(player) == 1 then --has rage
		return true
	end
	if class == "PALADIN" and hasBuff(player, rfID) then
		return true
	end
	return false
end

function mod:GetGroupNumber(player)
	for i = 1, GetNumRaidMembers() do
		local name, _, subGroup = GetRaidRosterInfo(i)
		if name == player then return subGroup end
	end
end

