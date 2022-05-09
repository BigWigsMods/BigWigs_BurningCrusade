local L = BigWigs:NewBossLocale("Kil'jaeden", "zhCN")
if not L then return end
if L then

end

L = BigWigs:NewBossLocale("Felmyst", "zhCN")
if L then
	L.phase = "阶段警报"
	L.phase_desc = "当升空或降落阶段时发出警报。"
	L.airphase_trigger = "我比以前更强大了！"
	L.takeoff_bar = "升空"
	L.takeoff_message = "5秒后，升空！"
	L.landing_bar = "降落"
	L.landing_message = "10秒后，降落！"

	L.breath = "深呼吸"
	L.breath_desc = "当施放深呼吸时发出警报。"
end

L = BigWigs:NewBossLocale("Brutallus", "zhCN")
if L then
	L.engage_trigger = "啊，又来了一群小绵羊！"

	L.burnresist = "燃烧抵抗"
	L.burnresist_desc = "当玩家抵抗燃烧攻击发出警报。"
	L.burn_resist = "燃烧抵抗：>%s<！"
end

L = BigWigs:NewBossLocale("M'uru", "zhCN")
if L then
	L.sentinel = "虚空戒卫"
	L.sentinel_desc = "当虚空戒卫刷新时发出警报。"
	L.sentinel_next = "下一虚空戒卫：%d"

	L.humanoid = "暗誓精灵"
	L.humanoid_desc = "当暗誓精灵刷新时发出警报。"
	L.humanoid_next = "下一暗誓精灵：%d"
end

L = BigWigs:NewBossLocale("Kalecgos", "zhCN")
if L then
	L.engage_trigger = "啊！我不再是玛利苟斯的奴隶了！所有挑战我的人都要被消灭！"
	L.enrage_trigger = "萨索瓦尔将卡雷苟斯逼得狂暴不已！"

	L.sathrovarr = "腐蚀者萨索瓦尔"

	L.portal = "传送"
	L.portal_message = "5秒后,可能发动传送！"

	L.realm_desc = "当玩家在灵魂世界中发出警报."
	L.realm_message = "灵魂世界：>%s<!(%d 小队）"
	L.nobody = "没有人"

	L.curse = "诅咒"

	L.wild_magic_healing = "狂野魔法（治疗加成）"
	L.wild_magic_healing_desc = "当你从狂野魔法中获得治疗加成时发出警报。"
	L.wild_magic_healing_you = "狂野魔法 - 治疗效果加成！"

	L.wild_magic_casting = "狂野魔法（施法时间延长）"
	L.wild_magic_casting_desc = "当治疗从狂野魔法延长施法时间时发出警报。"
	L.wild_magic_casting_you = "狂野魔法 - 施法时间延长：>你<！"
	L.wild_magic_casting_other = "狂野魔法 - 施法时间延长：>%s<!"

	L.wild_magic_hit = "狂野魔法（降低命中率）"
	L.wild_magic_hit_desc = "当 MT 受到狂野魔法降低命中率时发出警报。"
	L.wild_magic_hit_you = "狂野魔法 - 命中率降低：>你<"
	L.wild_magic_hit_other = "狂野魔法 - 命中率降低：>%s<!"

	L.wild_magic_threat = "狂野魔法（增加仇恨）"
	L.wild_magic_threat_desc = "当你受到狂野魔法增加仇恨时发出警报。"
	L.wild_magic_threat_you = "狂野魔法 - 增加仇恨！"
end

L = BigWigs:NewBossLocale("The Eredar Twins", "zhCN")
if L then

end

