local L = BigWigs:NewBossLocale("High Warlord Naj'entus", "ruRU")
if not L then return end
if L then
	L.start_trigger = "Вы умрете во имя леди Вайш!"
end

L = BigWigs:NewBossLocale("Supremus", "ruRU")
if L then
	L.normal_phase_trigger = "Супремус в гневе ударяет по земле!"
	L.kite_phase_trigger = "Земля начинает раскалываться!"
	--L.normal_phase = "Normal Phase"
	--L.kite_phase = "Kite Phase"
	--L.next_phase = "Next Phase"
end

L = BigWigs:NewBossLocale("Reliquary of Souls", "ruRU")
if L then
	--L.zero_mana = "Zero Mana"
	--L.zero_mana_desc = "Show the time it will take until the Essence of Desire has reduced everyones maximum mana to 0."
	--L.desire_start = "Essence of Desire - Zero Mana in 160 sec"
end

L = BigWigs:NewBossLocale("The Illidari Council", "ruRU")
if L then
	--L.veras = "Veras: %s"
	--L.malande = "Malande: %s"
	--L.gathios = "Gathios: %s"
	--L.zerevor = "Zerevor: %s"

	L.circle_heal_message = "Исцелен! - Следующее через ~20сек"
	L.circle_fail_message = "Прервал %s! - Следующее через ~12sec"

	--L.magical_immunity = "Immune to magical!"
	--L.physical_immunity = "Immune to physical!"
end

L = BigWigs:NewBossLocale("Illidan Stormrage", "ruRU")
if L then
	
end
