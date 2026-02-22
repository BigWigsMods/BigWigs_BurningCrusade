local L = BigWigs:NewBossLocale("Attumen the Huntsman Raid", "deDE")
if not L then return end
if L then
	L.phase2_trigger = "%s ruft nach ihrem Meister!"
	L.phase3_trigger = "Komm Mittnacht, lass' uns dieses Gesindel auseinander treiben!"
end

L = BigWigs:NewBossLocale("Prince Malchezaar", "deDE")
if L then
	L.wipe_bar = "Wiederbeleben"

	L.phase = "Engage"
	L.phase_desc = "Warnt wenn eine neue Phase beginnt"

	L.phase1_trigger = "Der Wahnsinn f\195\188hrte Euch zu mir. Ich werde Euch das Genick brechen!"
	L.phase2_trigger = "Dummk\195\182pfe! Zeit ist das Feuer, in dem Ihr brennen werdet!"
	L.phase3_trigger = "Wie k\195\182nnt Ihr hoffen, einer so \195\188berw\195\164ltigenden Macht gewachsen zu sein?"
	L.phase1_message = "Phase 1 - Infernos in ~40 Sek!"
	L.phase2_message = "60% - Phase 2"
	L.phase3_message = "30% - Phase 3 "

	L.infernal = "Infernos"
	L.infernal_desc = "Zeige Timerbalken f\195\188r Infernos"
	L.infernal_bar = "Infernos"
	L.infernal_message = "Infernos in 5 Sek!"
	L.infernal_trigger1 = "sondern vor den Legionen, die ich befehlige"
	L.infernal_trigger2 = "alle Dimensionen stehen mir offen"
end

L = BigWigs:NewBossLocale("Netherspite", "deDE")
if L then
	L.phase1_message = "Withdrawal - Netheratem vorbei"
	L.phase1_bar = "Next Withdrawal"
	L.phase1_trigger = "%s schreit auf und \195\182ffnet Tore zum Nether."
	L.phase2_message = "Rage - Incoming Netheratem!"
	L.phase2_bar = "N\195\164chste Rage"
	L.phase2_trigger = "Netherenergien versetzen %s in rasende Wut!"
end

L = BigWigs:NewBossLocale("Nightbane Raid", "deDE")
if L then
	L.name = "Schrecken der Nacht"

	L.airphase_trigger = "Abscheuliches Gew\195\188rm! Ich werde euch aus der Luft vernichten!"
	L.landphase_trigger1 = "Genug! Ich werde landen und mich h\195\182chst pers\195\182nlich um Euch k\195\188mmern!"
	L.landphase_trigger2 = "Insekten! Lasst mich Euch meine Kraft aus n\195\164chster N\195\164he demonstrieren!"
	L.airphase_message = "Flug!"
end

L = BigWigs:NewBossLocale("Romulo & Julianne", "deDE")
if L then
	L.name = "Romulo & Julianne"

	L.phase1_message = "Akt I - Julianne"
	L.phase2_message = "Akt II - Romulo"
	L.phase3_message = "Akt III - Beide"

	L.poison = "Gift"
	L.poison_desc = "Warnt vor vergifteten Spielern"
	L.poison_message = "Vergiftet"

	L.heal = "Heilen"
	L.heal_desc = "Warnt wenn Julianne sich heilt"
	L.heal_message = "Julianne wirkt Heilung!"

	L.buff = "Selbst-Buff Alarm"
	L.buff_desc = "Warnt wenn Romulo und Julianne sich selbst buffen"
	L.buff1_message = "Romulo bekommt Wagemut!"
	L.buff2_message = "Julianne bekommt Hingabe!"
end

L = BigWigs:NewBossLocale("Shade of Aran", "deDE")
if L then
	L.adds_desc = "Warnt vor den Wasserelementaren bei 40%."
	L.adds_bar = "Elementare verschwinden"

	L.drink = "Trinken"
	L.drink_desc = "Warnt, wenn Arans Schemen zu trinken beginnt."
	L.drink_warning = "Wenig Mana - trinkt gleich!"
	L.drink_message = "Trinkt - AoE Polymorph!"
	L.drink_bar = "Super-Pyroblast kommt!"

	L.blizzard = "Blizzard"
	L.blizzard_desc = "Warnt vor dem Blizzard."
end

L = BigWigs:NewBossLocale("The Big Bad Wolf", "deDE")
if L then
	L.name = "Der große böse Wolf"

	L.riding_bar = "%s rennt"
end

L = BigWigs:NewBossLocale("The Crone", "deDE")
if L then
	L.name = "Die böse Hexe"

	L.engage_trigger = "^Oh Tito, wir m\195\188ssen einfach einen Weg nach Hause finden!"

	L.spawns = "Spawn Timer"
	L.spawns_desc = "Zeitanzeige bis die Charaktere Aktiv werden"
	L.spawns_warning = "%s in 5 sek"

	L.roar = "Brüller"
	L.tinhead = "Blechkopf"
	L.strawman = "Strohmann"
	L.tito = "Tito"
end

L = BigWigs:NewBossLocale("Hyakiss the Lurker", "deDE")
if L then
	L.name = "Hyakiss der Lauerer"
end
