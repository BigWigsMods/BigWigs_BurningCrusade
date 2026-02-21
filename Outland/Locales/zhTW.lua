local L = BigWigs:NewBossLocale("Doomwalker", "zhTW")
if not L then return end
if L then
	L.name = "厄運行者"

	L.engage_trigger = "別在繼續下去。你將會被消除的。"

	L.overrun_desc = "當厄運行者發動 超越 技能時發出警報"

	L.earthquake_desc = "當厄運行者發動地震術時發出警報"
end

L = BigWigs:NewBossLocale("Doom Lord Kazzak", "zhTW")
if L then
	L.name = "毀滅領主卡札克"

	L.engage_trigger1 = "燃燒軍團將征服一切!"
	L.engage_trigger2 = "所有的凡人都將死亡!"
end

L = BigWigs:NewBossLocale("High King Maulgar", "zhTW")
if L then
	L.shield_message = "先知盲眼施放強效真言術:盾"
	L.spellshield_message = "火手施放法術護盾"
	L.summon_message = "野生地獄獵犬要出來咬人嚕"
	L.summon_bar = "召喚野生惡魔獵犬"
	L.whirlwind_message = "大君王莫卡爾 - 旋風斬 15 秒"

	L.mage = "克羅斯·火手 (法師)"
	L.warlock = "召喚者歐莫 (術士)"
	L.priest = "先知盲眼 (牧師)"
end

L = BigWigs:NewBossLocale("Magtheridon", "zhTW")
if L then
	L.escape = "釋放"
	L.escape_desc = "倒數計時，直到 瑪瑟里頓 獲得自由"
	L.escape_trigger1 = "束縛開始變弱"
	L.escape_trigger2 = "我……被……釋放了!"
	L.escape_warning1 = "與 %s 進入戰鬥 - 2 分鐘後獲得自由!"
	L.escape_warning2 = "1 分鐘後獲得自由!"
	L.escape_warning3 = "30 秒後獲得自由!"
	L.escape_warning4 = "10 秒後獲得自由!"
	L.escape_bar = "被釋放"
	L.escape_message = "%s 被釋放了!"

	L.abyssal = "燃燒的冥淵火"
	L.abyssal_desc = "當地獄火導魔師創造燃燒的冥淵火時發出警報"
	L.abyssal_message = "燃燒的冥淵火已創造 (%d)"

	L.heal = "黑暗治療"
	L.heal_desc = "當地獄火導魔師開始治療時發出警報"
	L.heal_message = "黑暗治療 - 快中斷!"

	L.banish = "放逐術"
	L["30168_desc"] = "當你驅逐 瑪瑟里頓."
	L.banished = "被放逐"

	L.debris_trigger = "我不會這麼輕易就被擊敗!讓這座監獄的牆壁震顫……然後崩塌!"
end
