local L = BigWigs:NewBossLocale("Kil'jaeden", "deDE")
if not L then return end
if L then

end

L = BigWigs:NewBossLocale("Felmyst", "deDE")
if L then
	L.phase = "Phasen"
	L.phase_desc = "Abheben und Landung ankündigen."
	L.airphase_trigger = "Ich bin stärker als je zuvor!"
	L.takeoff_bar = "Abheben"
	L.takeoff_message = "Abheben in 5 Sekunden!"
	L.landing_bar = "Landung"
	L.landing_message = "Landung in 10 Sekunden!"

	L.breath = "Tiefer Atem"
	L.breath_desc = "Warnung für Tiefen Atem."
end

L = BigWigs:NewBossLocale("Brutallus", "deDE")
if L then
	L.engage_trigger = "Ah, mehr Lämmer zum Schlachten!"

	L.burnresist = "Brand wiederstanden"
	L.burnresist_desc = "Warnt wer Brand weiderstanden hat."
	L.burn_resist = "%s hat Brand wiederstanden"
end

L = BigWigs:NewBossLocale("M'uru", "deDE")
if L then
	L.sentinel = "Leerenwache"
	L.sentinel_desc = "Warnung wenn eine Leerenwache erscheint."
	L.sentinel_next = "Leerenwache (%d)"

	L.humanoid = "Menschliche Wache"
	L.humanoid_desc = "Warnung wenn Menschliche Wachen erscheinen."
	L.humanoid_next = "Wachen (%d)"
end

L = BigWigs:NewBossLocale("Kalecgos", "deDE")
if L then
	L.engage_trigger = "Ah ha haa!! Nicht länger werde ich Malygos' Sklave sein! Fordert mich heraus und Ihr werdet vernichtet!"
	L.enrage_trigger = "Sathrovarr treibt Kalecgos in eine wahnsinnige Wut!"

	L.sathrovarr = "Sathrovarr der Verderber"

	L.portal = "Portal"
	L.portal_message = "Mögliches Portal in 5 sekunden!"

	L.realm_desc = "Sagt dir wer im Spektralreich ist."
	L.realm_message = "Spektralreich: %s (Gruppe %d)"
	L.nobody = "Niemand"

	L.curse = "Fluch"

	L.wild_magic_healing = "Wilde Magie (Verbesserte Heilung)"
	L.wild_magic_healing_desc = "Sagt dir wann du erhöte Heilung von Wilder Magie bekommst."
	L.wild_magic_healing_you = "Wilde Magie - Heilungs Effekte erhöht!"

	L.wild_magic_casting = "Wilde Magie (Schnellere Zauber)"
	L.wild_magic_casting_desc = "Sagt dir wann ein Heiler schnellere Zauber von Wilder Magie bekommt."
	L.wild_magic_casting_you = "Wilde Magie - Schnellere Zauber!"
	L.wild_magic_casting_other = "Wilde Magie - Schnellere Zauber auf %s!"

	L.wild_magic_hit = "Wilde Magie (Verringerte Trefferchance)"
	L.wild_magic_hit_desc = "Sagt dir wenn bei einem Tank die Trefferchance verringert ist durch Wilde Magie."
	L.wild_magic_hit_you = "Wild Magic - Verringerte Trefferchance!"
	L.wild_magic_hit_other = "Wilde Magie - Verringerte Trefferchance auf %s!"

	L.wild_magic_threat = "Wilde Magie (Erhöhte Agro)"
	L.wild_magic_threat_desc = "Sagt dir wenn du erhöhte Agro durch Wilde Magie bekommst."
	L.wild_magic_threat_you = "Wilde Magie - Agro Generierung erhöht!"
end

L = BigWigs:NewBossLocale("The Eredar Twins", "deDE")
if L then

end

