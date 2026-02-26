local L = BigWigs:NewBossLocale("Prince Malchezaar", "zhTW")
if not L then return end
if L then
	L.phase1_trigger = "瘋狂把你帶到我的面前。我會成為你失敗的原因!"
	L.phase2_trigger = "頭腦簡單的笨蛋!你在燃燒的是時間的火焰!"
	L.phase3_trigger = "你怎能期望抵抗這樣勢不可擋的力量?"

	L.infernal = "地獄火警告"
	L.infernal_desc = "顯示召喚地獄火計時條"
	L.infernal_bar = "地獄火"
	L.infernal_message = "5 秒後召喚地獄火"
	L.infernal_trigger1 = "而是我所率領的整個軍隊"
	L.infernal_trigger2 = "所有的空間對我來說都是開放的"
end

L = BigWigs:NewBossLocale("Netherspite", "zhTW")
if L then
	L.phase1_message = "撒退 - 第一階段光線門"
	L.phase1_bar = "地獄吐息 - 撒退"
	L.phase1_trigger = "%s大聲呼喊撤退，打開通往地獄的門。"
	L.phase2_message = "狂怒 - 第二階段自我放逐"
	L.phase2_bar = "地獄吐息 - 狂怒"
	L.phase2_trigger = "%s陷入一陣狂怒!"
end

L = BigWigs:NewBossLocale("Nightbane Raid", "zhTW")
if L then
	L.name = "夜禍"

	L.airphase_trigger = "悲慘的害蟲。我將讓你消失在空氣中!"
	L.airphase_message = "昇空"
end

L = BigWigs:NewBossLocale("Romulo & Julianne", "zhTW")
if L then
	L.name = "羅慕歐與茱麗葉"

	L.phase1_message = "Act I - 茱麗葉"
	L.phase2_message = "Act II - 羅慕歐"
	L.phase3_message = "Act III - 羅慕歐與茱麗葉"

	L.poison = "中毒警告"
	L.poison_desc = "當有玩家中毒時發送警告"
	L.poison_message = "中毒"

	L.heal = "治療警告"
	L.heal_desc = "當 茱麗葉 施放永恆的影響時發送警告"
	L.heal_message = "茱麗葉 正在施放治療術"

	L.buff = "狀態警告"
	L.buff_desc = "當 羅慕歐 和 茱麗葉 施放狀態時發送警告"
	L.buff1_message = "羅慕歐 在施放增益狀態"
	L.buff2_message = "茱麗葉 在施放增益狀態"
end

L = BigWigs:NewBossLocale("Shade of Aran", "zhTW")
if L then
	L.adds_bar = "召喚水元素"
	L.conjured_elemental = "召喚的元素"

	L.drink = "群體變羊"
	L.drink_desc = "當 埃蘭之影 開始回魔時發送警告"
	L.drink_warning = "埃蘭之影魔力太低"
	L.drink_message = "群體變羊術 - 埃蘭之影開始回魔"
	L.drink_bar = "群體變羊術"
end

L = BigWigs:NewBossLocale("The Big Bad Wolf", "zhTW")
if L then
	L.name = "大野狼"

	L.riding_bar = "%s 快跑！"
end

L = BigWigs:NewBossLocale("The Crone", "zhTW")
if L then
	L.name = "老巫婆"

	L.engage_trigger = "喔多多，我們一定要找到回家的路!"

	L.spawns = "啟動時間"
	L.spawns_desc = "設定各角色啟動時間計時"
	L.spawns_warning = "%s 將在 5 秒後開始攻擊"

	L.roar = "獅子"
	L.tinhead = "機器人"
	L.strawman = "稻草人"
	L.tito = "多多"
end

L = BigWigs:NewBossLocale("Hyakiss the Lurker", "zhTW")
if L then
	L.name = "潛伏者希亞其斯"
end
