local L = BigWigs:NewBossLocale("Archimonde", "frFR")
if not L then return end
if L then
	L.engage_trigger = "Votre résistance est futile."
	L.grip_other = "Poigne"
	L.fear_message = "Peur, prochain dans ~42 sec. !"

	L.killable = "Becomes Killable"
end

L = BigWigs:NewBossLocale("Azgalor", "frFR")
if L then
	L.howl_bar = "~Hurlement"
	L.howl_message = "Silence de zone"
end

L = BigWigs:NewBossLocale("Kaz'rogal", "frFR")
if L then
	L.mark_bar = "Prochaine marque (%d)"
	L.mark_warn = "Marque dans 5 sec. !"
end

