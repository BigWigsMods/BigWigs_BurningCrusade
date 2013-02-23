local L = BigWigs:NewBossLocale("Archimonde", "ruRU")
if not L then return end
if L then
	L.engage_trigger = "Ваше сопротивление нас не остановит."
	L.grip_other = "Хватка"
	L.fear_message = "Страх! Следующий через ~ 42сек!"

	L.killable = "Becomes Killable"
end

L = BigWigs:NewBossLocale("Azgalor", "ruRU")
if L then
	L.howl_bar = "~перезарядка Воя"
	L.howl_message = "МАСС Молчание"
end

L = BigWigs:NewBossLocale("Kaz'rogal", "ruRU")
if L then
	L.mark_bar = "След Матка (%d)"
	L.mark_warn = "Метка через 5 сек!"
end

