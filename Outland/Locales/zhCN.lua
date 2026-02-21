local L = BigWigs:NewBossLocale("Doomwalker", "zhCN")
if not L then return end
if L then
	L.name = "末日行者"

	L.engage_trigger = "停止前进。否则你们将被消灭。"

	L.overrun_desc = "当施放泛滥技能时发出警报。"

	L.earthquake_desc = "当施放地震术时发出警告。"
end

L = BigWigs:NewBossLocale("Doom Lord Kazzak", "zhCN")
if L then
	L.name = "末日领主卡扎克"

	L.engage_trigger1 = "军团将会征服一切！"
	L.engage_trigger2 = "所有的凡人都将灭亡！"
end

L = BigWigs:NewBossLocale("High King Maulgar", "zhCN")
if L then
	L.shield_message = "盲眼先知 真言术：盾！"
	L.spellshield_message = "克洛什 法术护盾！速度偷取"
	L.summon_message = "开始召唤 地狱犬！"
	L.summon_bar = "地狱犬"
	L.whirlwind_message = "莫加尔 - 旋风斩！15秒。"

	L.mage = "克洛什·火拳 (法师)"
	L.warlock = "召唤者沃尔姆 (术士)"
	L.priest = "盲眼先知 (牧师)"
end

L = BigWigs:NewBossLocale("Magtheridon", "zhCN")
if L then
	L.escape = "释放"
	L.escape_desc = "玛瑟里顿获得自由倒计时。"
	L.escape_trigger1 = "%s的禁锢开始变弱！"
	L.escape_trigger2 = "我……自由了！"
	L.escape_warning1 = "%s 激活！2分钟后，获得自由！"
	L.escape_warning2 = "60秒后，自由！"
	L.escape_warning3 = "30秒后，自由！"
	L.escape_warning4 = "10秒后，自由！"
	L.escape_bar = "已释放"
	L.escape_message = "%s 已释放！"

	L.abyssal = "深渊燃魔"
	L.abyssal_desc = "当创造深渊燃魔时发出警报。"
	L.abyssal_message = "深渊燃魔：%d ！"

	L.heal = "治疗"
	L.heal_desc = "当地狱火导魔者施放治疗时发出警报。"
	L.heal_message = "黑暗愈合！"

	L.banish = "放逐术"
	L["30168_desc"] = "当你放逐玛瑟里顿时发出警报。"
	L.banished = "驱逐"

	L.debris_trigger = "我是不会轻易倒下的！让这座牢狱的墙壁颤抖并崩塌吧！"
end
