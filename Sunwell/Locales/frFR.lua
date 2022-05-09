local L = BigWigs:NewBossLocale("Kil'jaeden", "frFR")
if not L then return end
if L then

end

L = BigWigs:NewBossLocale("Felmyst", "frFR")
if L then
	L.phase = "Phases"
	L.phase_desc = "Prévient quand Gangrebrume décolle et atterit."
	L.airphase_trigger = "Je suis plus forte que jamais !"
	L.takeoff_bar = "Décollage"
	L.takeoff_message = "Décollage dans 5 sec. !"
	L.landing_bar = "Atterrissage"
	L.landing_message = "Atterrissage dans 10 sec. !"

	L.breath = "Grande inspiration"
	L.breath_desc = "Prévient quand Gangrebrume inspire profondément."
end

L = BigWigs:NewBossLocale("Brutallus", "frFR")
if L then
	L.engage_trigger = "Ah, encore des agneaux pour l'abattoir !"

	L.burnresist = "Résistances à Brûler"
	L.burnresist_desc = "Prévient quand un joueur a résisté à Brûler."
	L.burn_resist = "%s a résisté à Brûler"
end

L = BigWigs:NewBossLocale("M'uru", "frFR")
if L then
	L.sentinel = "Sentinelles du Vide"
	L.sentinel_desc = "Prévient quand les Sentinelles du Vide apparaissent."
	L.sentinel_next = "Sentinelle (%d)"

	L.humanoid = "Renforts humanoïdes"
	L.humanoid_desc = "Prévient quand les renforts humanoïdes apparaissent."
	L.humanoid_next = "Humanoïdes (%d)"
end

L = BigWigs:NewBossLocale("Kalecgos", "frFR")
if L then
	L.engage_trigger = "Aarghh !! Je ne serai plus jamais l'esclave de Malygos ! Osez me défier et vous serez détruits !"
	L.enrage_trigger = "Sathrovarr déchaîne la rage de Kalecgos !"

	L.sathrovarr = "Sathrovarr le Corrupteur"

	L.portal = "Portail"
	L.portal_message = "Portail probable dans 5 sec. !"

	L.realm_desc = "Prévient quand un joueur est dans le Royaume spectral."
	L.realm_message = "Royaume spectral : %s (Groupe %d)"
	L.nobody = "Nul"

	L.curse = "Malédiction"

	L.wild_magic_healing = "Magie sauvage (Soins prodigués augmentés)"
	L.wild_magic_healing_desc = "Prévient quand les effets de vos soins sont augmentés par la Magie sauvage."
	L.wild_magic_healing_you = "Magie sauvage - Effets des soins augmentés !"

	L.wild_magic_casting = "Magie sauvage (Temps d'incantation augmenté)"
	L.wild_magic_casting_desc = "Prévient quand un soigneur a son temps d'incantation augmenté par la Magie sauvage."
	L.wild_magic_casting_you = "Magie sauvage - Temps d'incantation augmenté pour VOUS !"
	L.wild_magic_casting_other = "Magie sauvage - Temps d'incantation augmenté pour %s !"

	L.wild_magic_hit = "Magie sauvage (Chances de toucher réduites)"
	L.wild_magic_hit_desc = "Prévient quand les chances de toucher d'un tank sont réduites par la Magie sauvage."
	L.wild_magic_hit_you = "Magie sauvage - Chances de toucher réduites pour VOUS !"
	L.wild_magic_hit_other = "Magie sauvage - Chances de toucher réduites pour %s !"

	L.wild_magic_threat = "Magie sauvage (Menace générée augmentée)"
	L.wild_magic_threat_desc = "Prévient quand la menace que vous générez est augmentée par la Magie sauvage."
	L.wild_magic_threat_you = "Magie sauvage - Menace générée augmentée !"
end

L = BigWigs:NewBossLocale("The Eredar Twins", "frFR")
if L then

end

