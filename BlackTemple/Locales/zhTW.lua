local L = BigWigs:NewBossLocale("High Warlord Naj'entus", "zhTW")
if not L then return end
if L then
	L.start_trigger = "你會以瓦許女士之名而死!"
end

L = BigWigs:NewBossLocale("Supremus", "zhTW")
if L then
	L.normal_phase_trigger = "瑟普莫斯憤怒的捶擊地面!"
	L.kite_phase_trigger = "地上開始裂開!"
	--L.normal_phase = "Normal Phase"
	--L.kite_phase = "Kite Phase"
	--L.next_phase = "Next Phase"
end

L = BigWigs:NewBossLocale("Shade of Akama", "zhTW")
if L then
	--L.wipe_trigger = "No! Not yet!"
	--L.defender = "Defender" -- Ashtongue Defender
	--L.sorcerer = "Sorcerer" -- Ashtongue Sorcerer
	--L.adds_right = "Adds (Right)"
	--L.adds_left = "Adds (Left)"

	--L.engaged = "Shade of Akama Engaged"
end

L = BigWigs:NewBossLocale("Reliquary of Souls", "zhTW")
if L then
	L.zero_mana = "沒魔"
	--L.zero_mana_desc = "Show the time it will take until the Essence of Desire has reduced everyones maximum mana to 0."
	L.desire_start = "慾望精華 - 160 秒內沒魔"
end

L = BigWigs:NewBossLocale("The Illidari Council", "zhTW")
if L then
	--L.veras = "Veras: %s"
	--L.malande = "Malande: %s"
	--L.gathios = "Gathios: %s"
	--L.zerevor = "Zerevor: %s"

	L.circle_heal_message = "被治療了! - 下一次 ~20秒"
	L.circle_fail_message = "%s 中斷了! - 下一次 ~12秒"

	--L.magical_immunity = "Immune to magical!"
	--L.physical_immunity = "Immune to physical!"
end

L = BigWigs:NewBossLocale("Illidan Stormrage", "zhTW")
if L then
	L.barrage_bar = "黑暗侵襲"
	L.warmup_trigger = "阿卡瑪。你的謊言真是老套。我很久前就該殺了你和你那些畸形的同胞。"
end
