local L = BigWigs:NewBossLocale("Archimonde", "esES")
if not L then return end
if L then
	L.engage_trigger = "Vuestra resistencia es insignificante."
	L.grip_other = "Apretón"
	L.fear_message = "Miedo, sig. en ~ 42seg!"

	L.killable = "Becomes Killable"
end

L = BigWigs:NewBossLocale("Azgalor", "esES")
if L then
	L.howl_bar = "~Aullido"
	L.howl_message = "Silencio de área"
end

L = BigWigs:NewBossLocale("Kaz'rogal", "esES")
if L then
	L.mark_bar = "~Marca (%d)"
	L.mark_warn = "Marca en 5 seg"
end

