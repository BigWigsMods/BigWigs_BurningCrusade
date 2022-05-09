local L = BigWigs:NewBossLocale("Kil'jaeden", "zhTW")
if not L then return end
if L then

end

L = BigWigs:NewBossLocale("Felmyst", "zhTW")
if L then
	L.phase = "階段警報"
	L.phase_desc = "當升空或降落階段時發出警報"
	L.airphase_trigger = "我比以前更強大了!"
	L.takeoff_bar = "升空"
	L.takeoff_message = "約 5 秒後，升空!"
	L.landing_bar = "降落"
	L.landing_message = "約 10 秒後，降落!"

	L.breath = "深呼吸"
	L.breath_desc = "當施放深呼吸時發出警報"
end

L = BigWigs:NewBossLocale("Brutallus", "zhTW")
if L then
	L.engage_trigger = "啊，更多待宰的小羊們!"

	L.burnresist = "燃燒抵抗"
	L.burnresist_desc = "警報誰抵抗了燃燒"
	L.burn_resist = "燃燒抵抗: [%s]"
end

L = BigWigs:NewBossLocale("M'uru", "zhTW")
if L then
	L.sentinel = "虛無哨兵"
	L.sentinel_desc = "當虛無哨兵出現時發出警報"
	L.sentinel_next = "下一波虛無哨兵：%d"

	L.humanoid = "影劍怒法師和影劍狂戰士"
	L.humanoid_desc = "當影劍怒法師和影劍狂戰士出現時發出警報"
	L.humanoid_next = "下一波影劍怒法師和影劍狂戰士：%d"
end

L = BigWigs:NewBossLocale("Kalecgos", "zhTW")
if L then
	L.engage_trigger = "啊!!我不再是瑪里苟斯的奴隸了!所有挑戰我的人都要被消滅!"
	L.enrage_trigger = "塞斯諾瓦將卡雷苟斯逼入了瘋狂的暴怒中!"

	-- L.sathrovarr = "Sathrovarr the Corruptor"

	L.portal = "傳送門"
	L.portal_message = "約 5 秒內出現傳送門!"

	L.realm_desc = "提示你誰進入了鬼靈國度"
	L.realm_message = "鬼靈國度: [%s] - 小隊 %d!"
	L.nobody = "沒有人"

	L.curse = "詛咒"

	L.wild_magic_healing = "野性魔法 (治療加成)"
	L.wild_magic_healing_desc = "當你獲得野性魔法 (治療加成) 時提示"
	L.wild_magic_healing_you = "野性魔法 - 治療效果加成!"

	L.wild_magic_casting = "野性魔法 (施法時間延長)"
	L.wild_magic_casting_desc = "當治療職受到野性魔法 (施法時間延長) 時提示"
	L.wild_magic_casting_you = "野性魔法 - 你的施法時間延長!"
	L.wild_magic_casting_other = "野性魔法 - 施法時間延長: [%s]"

	L.wild_magic_hit = "野性魔法 (命中下降)"
	L.wild_magic_hit_desc = "當坦克受到野性魔法 (命中下降) 時提示"
	L.wild_magic_hit_you = "野性魔法 - 你的命中率下降!"
	L.wild_magic_hit_other = "野性魔法 - 命中率下降: [%s]"

	L.wild_magic_threat = "野性魔法 (仇恨增加)"
	L.wild_magic_threat_desc = "當你獲得野性魔法 (仇恨增加) 時提示"
	L.wild_magic_threat_you = "野性魔法 - 你的仇恨值增加!"
end

L = BigWigs:NewBossLocale("The Eredar Twins", "zhTW")
if L then

end

