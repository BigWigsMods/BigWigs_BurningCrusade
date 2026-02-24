local L = BigWigs:NewBossLocale("Doomwalker", "ruRU")
if not L then return end
if L then
	L.name = "Судьболом"

	L.engage_trigger = "Не продолжайте. Вы будете уничтожены."

	--L.overrun_desc = "Alert when Doomwalker uses his Overrun ability."

	--L.earthquake_desc = "Alert when Doomwalker uses his Earthquake ability."
end

L = BigWigs:NewBossLocale("Doom Lord Kazzak", "ruRU")
if L then
	L.name = "Владыка Судеб Каззак"

	--L.engage_trigger1 = "The Legion will conquer all!"
	--L.engage_trigger2 = "All mortals will perish!"
end

L = BigWigs:NewBossLocale("High King Maulgar", "ruRU")
if L then
	L.shield_message = "Щит на Слепоглазе!"
	L.spellshield_message = "Щит заклятий на Кроше!"
	L.summon_message = "Призван Охотник Скверны!"
	L.summon_bar = "Охотник Скверны"
	L.whirlwind_message = "Молгар - Вихрь через 15сек!"

	L.mage = "Крош Огненная Рука (Маг)"
	L.warlock = "Олм Созывающий (Чернокнижник)"
	L.priest = "Слепоглаз Ясновидец (Жрец)"
end

L = BigWigs:NewBossLocale("Magtheridon", "ruRU")
if L then
	L.abyssal = "Горящий дух Бездны"
	L.abyssal_desc = "Предупреждать о создании Горящего духа Бездны."
	L.abyssal_message = "Горящий дух Бездны (%d)"

	L.heal = "Исцеление"
	L.heal_desc = "Предупреждать когда Чаротворцы начинают Исцелять."
	L.heal_message = "Исцеление!"

	L.banish = "Изгнание"
	L["30168_desc"] = "Предупреждать о Изгнании Магтеридона."
	L.banished = "Изгнание"

	L.debris_trigger = "Пусть стены темницы содрогнутся"
end
