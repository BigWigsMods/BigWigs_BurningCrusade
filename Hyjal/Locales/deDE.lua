local L = BigWigs:NewBossLocale("Archimonde", "deDE")
if not L then return end
if L then
	L.engage_trigger = "Euer Widerstand ist sinnlos!"
	L.grip_other = "Würgegriff"
	L.fear_message = "Furcht, nächste in ~42sek!"

	L.killable = "Becomes Killable"
end

L = BigWigs:NewBossLocale("Azgalor", "deDE")
if L then
	L.howl_bar = "~Geheul"
	L.howl_message = "AoE Stille"
end

L = BigWigs:NewBossLocale("Kaz'rogal", "deDE")
if L then
	L.mark_bar = "Mal von Kaz'rogal (%d)"
	L.mark_warn = "Mal von Kaz'rogal in 5sek!"
end

