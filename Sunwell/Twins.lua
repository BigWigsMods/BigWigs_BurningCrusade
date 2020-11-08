﻿------------------------------
--      Are you local?      --
------------------------------

local lady = BB["Lady Sacrolash"]
local lock = BB["Grand Warlock Alythess"]
local boss = BB["The Eredar Twins"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local db = nil
local wipe = nil
local started = nil
local deaths = 0

local pName = UnitName("player")
local CheckInteractDistance = CheckInteractDistance

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "EredarTwins",

	wipe_bar = "Respawn",

	nova = "Shadow Nova",
	nova_desc = "Warn for Shadow Nova being cast.",
	nova_message = "Shadow Nova on %s",
	nova_bar = "~Nova Cooldown",

	conflag = "Conflagration",
	conflag_desc = "Warn for Conflagration being cast.",
	conflag_message = "Conflag on %s",
	conflag_you = "Conflag on YOU!",
	conflag_bar = "Conflag",

	icon = "Raid Icon",
	icon_desc = "Place a Raid Target Icon on the player that Shadow Nova and Conflagration is being cast on.",

	pyro = "Pyrogenics",
	pyro_desc = "Warn who gains and removes Pyrogenics.",
	pyro_gain = "%s gained Pyrogenics",
	pyro_remove = "%s removed Pyrogenics",

	blow = "Confounding Blow",
	blow_desc = "Show a timer bar for Confounding Blow.",
	blow_bar = "Confounding Blow",

	blades = "Shadow Blades",
	blades_desc = "Show a timer bar for Shadow Blades.",
	blades_bar = "Shadow Blades",
} end )

L:RegisterTranslations("esES", function() return {
	wipe_bar = "Reaparición",

	nova = "Nova de las Sombras (Shadow Nova)",
	nova_desc = "Avisar cuando se empieza a lanzar Nova de las Sombras.",
	nova_message = "Nova de las Sombras en %s",
	nova_bar = "~Nova de las Sombras",

	conflag = "Conflagración (Conflagration)",
	conflag_desc = "Avisar cuando se lanza Conflagración.",
	conflag_message = "Conflagración en %s",
	conflag_you = "¡Conflagración en TI!",
	conflag_bar = "~Conflagración",

	icon = "Icono de banda",
	icon_desc = "Poner un icono de banda sobre los jugadores sobre los que se lanza Nova de las Sombras y/o Conflagración.",

	pyro = "Pirogénica (Pyrogenics)",
	pyro_desc = "Avisar quien gana y quita Pirogénica.",
	pyro_gain = "%s gana Pirogénica",
	pyro_remove = "%s quita Pirogénica",

	blow = "Arremetida desconcertante (Confounding Blow)",
	blow_desc = "Mostrar una barra de tiempo para Arremetida desconcertante.",
	blow_bar = "~Arremetida desconcertante",

	blades = "Hojas de las Sombras (Shadow Blades)",
	blades_desc = "Mostrar una barra de tiempo para Hojas de las Sombras.",
	blades_bar = "~Hojas de las Sombras",
} end )

L:RegisterTranslations("frFR", function() return {
	wipe_bar = "Réapparition",

	nova = "Nova de l'ombre",
	nova_desc = "Prévient quand une Nova de l'ombre est incantée.",
	nova_message = "Nova de l'ombre sur %s",
	nova_bar = "~Recharge Nova",

	conflag = "Déflagration",
	conflag_desc = "Prévient quand une Déflagration est incantée.",
	conflag_message = "Déflagration sur %s",
	conflag_you = "Déflagration sur VOUS !",
	conflag_bar = "Déflagration",

	icon = "Icône",
	icon_desc = "Place une icône de raid sur le dernier joueur sur lequel Nova de l'ombre ou Déflagration est incantée.",

	pyro = "Pyrogénie",
	pyro_desc = "Prévient qui gagne et qui enlève Pyrogénie.",
	pyro_gain = "%s a gagné Pyrogénie",
	pyro_remove = "%s a enlevé Pyrogénie",

	blow = "Coup déconcertant",
	blow_desc = "Affiche une barre temporelle pour le Coup déconcertant.",
	blow_bar = "Coup déconcertant",

	blades = "Lames de l'ombre",
	blades_desc = "Affiche une barre temporelle pour les Lames de l'ombre.",
	blades_bar = "Lames de l'ombre",
} end )

L:RegisterTranslations("koKR", function() return {
	wipe_bar = "재생성 시간",

	nova = "암흑 회오리",
	nova_desc = "암흑 회오리의 시전에 대해 알립니다.",
	nova_message = "%s 암흑 회오리!",
	nova_bar = "~회오리 대기시간",

	conflag = "거대한 불길",
	conflag_desc = "거대한 불길의 시전에 대해 알립니다.",
	conflag_message = "%s 거대한 불길!",
	conflag_you = "당신에게 거대한 불길!",
	conflag_bar = "거대한 불길",

	icon = "전술 표시",
	icon_desc = "암흑 회오리와 거대한 불길의 대상이된 플레이어에게 전술 표시를 지정합니다. (승급자 이상 권한 필요)",

	pyro = "발열",
	pyro_desc = "발열을 누가 획득하고 제거하는지 알립니다.",
	pyro_gain = "%s 발열",
	pyro_remove = "%s 발열 제거",

	blow = "혼란의 강타",
	blow_desc = "혼란의 강타에 대한 타이머 바를 표시합니다.",
	blow_bar = "혼란의 강타",

	blades = "어둠의 칼날",
	blades_desc = "어둠의 칼날에 대한 타이머 바를 표시합니다.",
	blades_bar = "어둠의 칼날",
} end )

L:RegisterTranslations("zhCN", function() return {
	wipe_bar = "重置计时",

	nova = "暗影新星",
	nova_desc = "当施放暗影新星时发出警报。",
	nova_message = "暗影新星：>%s<！",
	nova_bar = "<暗影新星 冷却>",

	conflag = "燃烧",
	conflag_desc = "当施放燃烧时发出警报。",
	conflag_message = "燃烧：>%s<！",
	conflag_you = ">你< 燃烧！",
	conflag_bar = "<下一燃烧>",

	icon = "团队标记",
	icon_desc = "给中了暗影新星和燃烧目标玩家打上团队标记。（需要权限）",

	pyro = "高热",
	pyro_desc = "当玩家获得或移除高热时发出警报。",
	pyro_gain = "获得 高热：>%s<！",
	pyro_remove = "移除 高热：>%s<！",

	blow = "混乱重击",
	blow_desc = "显示混乱重击记时条。",
	blow_bar = "<下一重击>",

	blades = "暗影之刃",
	blades_desc = "显示暗影之刃记时条。",
	blades_bar = "<下一暗影之刃>",
} end )

L:RegisterTranslations("zhTW", function() return {
	wipe_bar = "重生計時",

	nova = "暗影新星",
	nova_desc = "當暗影新星施放時發出警報",
	nova_message = "暗影新星目標: [%s]",
	nova_bar = "<暗影新星冷卻計時>",

	conflag = "燃燒",
	conflag_desc = "當燃燒施放時發出警報",
	conflag_message = "燃燒目標: [%s]",
	conflag_you = "你受到燃燒!",
	conflag_bar = "<下一次燃燒>",

	icon = "團隊標記",
	icon_desc = "對暗影新星及燃燒的隊友設置團隊標記（需要權限）",

	pyro = "焦化",
	pyro_desc = "警報誰受到及解除焦化效果",
	pyro_gain = "受到焦化: [%s]",
	pyro_remove = "解除焦化: [%s]",

	blow = "混亂痛擊",
	blow_desc = "顯示混亂痛擊計時條",
	blow_bar = "<下一次混亂痛擊>",

	blades = "暗影之刃",
	blades_desc = "顯示暗影之刃計時條",
	blades_bar = "<下一次暗影之刃>",
} end )

L:RegisterTranslations("deDE", function() return {
	wipe_bar = "Wiederbelebung",

	nova = "Schattennova",
	nova_desc = "Warnt wenn Schattennova gewirkt wird.",
	nova_message = "Schattennova auf %s",
	nova_bar = "~Nova Cooldown",

	conflag = "Großbrand",
	conflag_desc = "Warnt wenn Großbrand gewirkt wird.",
	conflag_message = "Großbrand auf %s",
	--conflag_you = "Conflag on YOU!",
	conflag_bar = "Nächster Großbrand",

	icon = "Schlachtzug Symbol",
	icon_desc = "Plaziert ein Schlachtzug Symbol auf Spielern auf die Schattennova und Großbrand gewirkt wird.",

	pyro = "Pyrogen",
	pyro_desc = "Warnt wer Pyrogen bekommt und wer es verliert.",
	pyro_gain = "%s bekommt Pyrogen",
	pyro_remove = "%s verliert Pyrogen",

	blow = "Verwirrender Schlag",
	blow_desc = "Zeigt einen Zeitbalken für Verwirrender Schlag.",
	blow_bar = "Nächster Schlag",

	blades = "Schattenklingen",
	blades_desc = "Zeigt einen Zeitbalken für Schattenklingen.",
	blades_bar = "Nächste Klingen",
} end )

L:RegisterTranslations("ruRU", function() return {
	wipe_bar = "Возрождение",

	nova = "Кольцо Тьмы",
	nova_desc = "Предупреждать о появлении Кольца Тьмы.",
	nova_message = "%s получает Кольцо Тьмы",
	nova_bar = "Кольцо Тьмы",

	conflag = "Воспламенение",
	conflag_desc = "Предупреждать о Воспламенении.",
	conflag_message = "%s получает Воспламенение!",
	conflag_you = "Вы охвачены пламенем!",
	conflag_bar = "Воспламенение",

	icon = "Иконка",
	icon_desc = "Помещать Иконку на игроков, которые стали целью для Кольца Тьмы и Воспламенения.",

	pyro = "Пирогенез",
	pyro_desc = "Предупреждать о тех, кто получает и снимает Пирогенез.",
	pyro_gain = "%s получает Пирогенез",
	pyro_remove = "%s снимает Пирогенез",

	blow = "Сбитие с толку",
	blow_desc = "Показывать таймер перезарядки способности Ошеломления.",
	blow_bar = "Ошеломление",

	blades = "Теневые Клинки",
	blades_desc = "Показывать таймер Теневых Клинков.",
	blades_bar = "Следующие Клинки",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Sunwell Plateau"]
mod.enabletrigger = {lady, lock, boss}
mod.guid = 25166
mod.toggleOptions = {"nova", "conflag", "icon", -1, "pyro", -1, "blow", "blades", "enrage"}
mod.revision = tonumber(("$Revision: 6 $"):sub(12, -3))
mod.proximityCheck = function( unit ) return CheckInteractDistance( unit, 3 ) end
mod.proximitySilent = true

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:AddCombatListener("SPELL_AURA_APPLIED", "PyroGain", 45230)
	self:AddCombatListener("SPELL_STOLEN", "PyroRemove")
	self:AddCombatListener("SPELL_DISPEL", "PyroRemove")
	self:AddCombatListener("SPELL_DAMAGE", "Blow", 45256)
	self:AddCombatListener("SPELL_MISSED", "Blow", 45256)
	self:AddCombatListener("SPELL_CAST_START", "Blades", 45248)
	self:AddCombatListener("UNIT_DIED", "Deaths")

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
	self:RegisterEvent("BigWigs_RecvSync")

	db = self.db.profile
	if wipe and BigWigs:IsModuleActive(boss) then
		self:Bar(L["wipe_bar"], 30, 44670)
		wipe = nil
	end
	started = nil
	deaths = 0
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:PyroGain(unit, spellID)
	if unit == lock and db.pyro then
		self:MessageOld(L["pyro_gain"]:format(unit), "green", nil, nil, nil, spellID)
		self:Bar(L["pyro"], 15, spellID)
	end
end

function mod:PyroRemove(_, _, source, spellID)
	if spellID and spellID == 45230 then
		if db.pyro then
			self:MessageOld(L["pyro_remove"]:format(source), "green")
			self:TriggerEvent("BigWigs_StopBar", self, L["pyro"])
		end
	end
end

function mod:Blow()
	if db.blow then
		self:Bar(L["blow_bar"], 20, 45256)
	end
end

function mod:Blades()
	if db.blades then
		self:Bar(L["blades_bar"], 10, 45248)
	end
end

function mod:Deaths(_, guid)
	guid = tonumber((guid):sub(-12,-7),16)
	if guid == self.guid or guid == 25165 then
		deaths = deaths + 1
	end
	if deaths == 2 then
		self:BossDeath(nil, self.guid, true)
	end
end

function mod:CHAT_MSG_RAID_BOSS_EMOTE(_, unit, _, _, player)
	if ((unit == lady and deaths == 0) or (unit == lock and deaths == 1)) and db.nova then
		if player == pName then
			self:MessageOld(L["nova_message"]:format(player), "blue", 45329, "long")
		else
			self:MessageOld(L["nova_message"]:format(player), "orange", nil, nil, nil, 45329)
		end
		self:Bar(L["nova_bar"], 30.5, 45329)
		self:Icon(player, "icon")
	elseif ((unit == lock and deaths == 0) or (unit == lady and deaths == 1)) and db.conflag then
		if player == pName then
			self:MessageOld(L["conflag_message"]:format(player), "blue", 45333, "long")
		else
			self:MessageOld(L["conflag_message"]:format(player), "yellow", nil, nil, nil, 45333)
			self:Whisper(player, L["conflag_you"])
		end
		self:Bar(L["conflag_bar"], 32, 45333)
		self:Icon(player, "icon")
	end
end

function mod:BigWigs_RecvSync(sync, rest, nick)
	if self:ValidateEngageSync(sync, rest) and not started then
		started = true
		wipe = true
		deaths = 0
		self:TriggerEvent("BigWigs_ShowProximity", self)
		if self:IsEventRegistered("PLAYER_REGEN_DISABLED") then
			self:UnregisterEvent("PLAYER_REGEN_DISABLED")
		end
		if db.enrage then
			self:Enrage(360)
		end
	end
end
