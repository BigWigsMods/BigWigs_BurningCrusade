-- Black Temple

local L = BigWigs:NewBossLocale("High Warlord Naj'entus", "frFR")
if L then
	L.start_trigger = "Vous allez mourir, au nom de dame Vashj !"
end

L = BigWigs:NewBossLocale("Supremus", "frFR")
if L then
	L.normal_phase_trigger = "De rage, Supremus frappe le sol !"
	L.kite_phase_trigger = "Le sol commence à se fissurer !"
	--L.normal_phase = "Normal Phase"
	--L.kite_phase = "Kite Phase"
	--L.next_phase = "Next Phase"
end

L = BigWigs:NewBossLocale("Shade of Akama", "frFR")
if L then
	--L.wipe_trigger = "No! Not yet!"
	--L.defender = "Defender" -- Ashtongue Defender
	--L.sorcerer = "Sorcerer" -- Ashtongue Sorcerer
	--L.adds_right = "Adds (Right)"
	--L.adds_left = "Adds (Left)"

	--L.engaged = "Shade of Akama Engaged"
end

L = BigWigs:NewBossLocale("Reliquary of Souls", "frFR")
if L then
	L.zero_mana = "Zéro Mana"
	--L.zero_mana_desc = "Show the time it will take until the Essence of Desire has reduced everyones maximum mana to 0."
	L.desire_start = "Essence du désir - Zéro Mana dans 160 sec"
end

L = BigWigs:NewBossLocale("The Illidari Council", "frFR")
if L then
	--L.veras = "Veras: %s"
	--L.malande = "Malande: %s"
	--L.gathios = "Gathios: %s"
	--L.zerevor = "Zerevor: %s"

	L.circle_heal_message = "Soigné ! - Prochain dans ~20 sec"
	L.circle_fail_message = "Interrompu par %s ! - Prochain dans ~12 sec"

	--L.magical_immunity = "Immune to magical!"
	--L.physical_immunity = "Immune to physical!"
end

L = BigWigs:NewBossLocale("Illidan Stormrage", "frFR")
if L then
	L.barrage_bar = "Barrage"
	L.warmup_trigger = "Akama. Ta duplicité n'est pas très étonnante. J'aurais dû vous massacrer depuis longtemps, toi et ton frère déformé."
end

-- Mount Hyjal

L = BigWigs:NewBossLocale("ArchimondeHyjal", "frFR")
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

L = BigWigs:NewBossLocale("Hyjal Summit Trash", "frFR")
if L then
	L.waves = "Avertissements des vagues"
	L.waves_desc = "Prévient quand la prochaine vague est susceptible d'arriver."

	L.ghoul = "goules"
	L.fiend = "démons des cryptes"
	L.abom = "abominations"
	L.necro = "nécromanciens"
	L.banshee = "banshees"
	L.garg = "gargouilles"
	L.wyrm = "wyrm de givre"
	L.fel = "traqueurs gangrenés"
	L.infernal = "infernaux"
	L.one = "%d|4ère:ème; vague ! %d %s"
	L.two = "%d|4ère:ème; vague ! %d %s, %d %s"
	L.three = "%d|4ère:ème; vague ! %d %s, %d %s, %d %s"
	L.four = "%d|4ère:ème; vague ! %d %s, %d %s, %d %s, %d %s"
	L.five = "%d|4ère:ème; vague ! %d %s, %d %s, %d %s, %d %s, %d %s"
	L.barWave = "Arrivée %d|4ère:ème; vague"

	L.waveInc = "Arrivée de la %d|4ère:ème; vague !"
	L.message = "%s dans ~%d sec. !"
	L.waveMessage = "%d|4ère:ème; vague dans ~%d sec. !"
end

-- Karazhan

L = BigWigs:NewBossLocale("Prince Malchezaar", "frFR")
if L then
	L.phase1_trigger = "La folie vous a fait venir ici, devant moi. Et je serai votre perte !"
	L.phase2_trigger = "Imbéciles heureux ! Le temps est le brasier dans lequel vous brûlerez !"
	L.phase3_trigger = "Comment pouvez-vous espérer résister devant un tel pouvoir ?"

	L.infernal = "Infernaux"
	L.infernal_desc = "Affiche le temps de recharge des invocations d'infernaux."
	L.infernal_bar = "Arrivée d'un infernal"
	L.infernal_message = "Infernal ! Flammes infernales dans 5 sec. !"
	L.infernal_trigger1 = "Vous n'affrontez pas seulement"
	L.infernal_trigger2 = "toutes les dimensions me sont"
end

L = BigWigs:NewBossLocale("Netherspite", "frFR")
if L then
	L.phase1_message = "Retrait - Fin des Souffles du Néant"
	L.phase1_bar = "Retrait probable"
	L.phase1_trigger = "%s se retire avec un cri en ouvrant un portail vers le Néant."
	L.phase2_message = "Rage - Souffles de Néant imminent !"
	L.phase2_bar = "Rage probable"
	L.phase2_trigger = "%s entre dans une rage nourrie par le Néant !"
end

L = BigWigs:NewBossLocale("Nightbane Raid", "frFR")
if L then
	L.name = "Plaie-de-nuit"

	L.airphase_trigger = "Misérable vermine. Je vais vous exterminer des airs !"
	L.airphase_message = "Décollage !"
end

L = BigWigs:NewBossLocale("Romulo & Julianne", "frFR")
if L then
	L.name = "Romulo & Julianne"

	L.phase1_message = "Acte I - Julianne"
	L.phase2_message = "Acte II - Romulo"
	L.phase3_message = "Acte III - Les deux"

	L.poison = "Poison"
	L.poison_desc = "Prévient quand un joueur est empoisonné."
	L.poison_message = "Empoisonné"

	L.heal = "Soin"
	L.heal_desc = "Prévient quand Julianne lance Amour éternel."
	L.heal_message = "Julianne incante un soin !"

	L.buff = "Buff"
	L.buff_desc = "Prévient quand Romulo et Julianne gagnent leurs buffs."
	L.buff1_message = "Romulo gagne Hardiesse !"
	L.buff2_message = "Julianne gagne Dévotion !"
end

L = BigWigs:NewBossLocale("Shade of Aran", "frFR")
if L then
	L.adds_bar = "Fin des élémentaires"
	L.conjured_elemental = "Elémentaire conjuré"

	L.drink = "Boisson"
	L.drink_desc = "Prévient quand l'Ombre d'Aran commence à boire."
	L.drink_warning = "Mana faible - Boisson imminente !"
	L.drink_message = "Boisson - Polymorphisme de zone !"
	L.drink_bar = "Super Explosion pyro."
end

L = BigWigs:NewBossLocale("The Big Bad Wolf", "frFR")
if L then
	L.name = "Le Grand Méchant Loup"

	L.riding_bar = "Chaperon : %s"
end

L = BigWigs:NewBossLocale("The Crone", "frFR")
if L then
	L.name = "La Mégère"

	L.engage_trigger = "^Oh, Tito, nous devons trouver le moyen de rentrer à la maison !"

	L.spawns = "Délais d'activité"
	L.spawns_desc = "Affiche plusieurs barres indiquant quand les différents personnages passent à l'action."
	L.spawns_warning = "%s dans 5 sec."

	L.roar = "Graou"
	L.tinhead = "Tête de fer-blanc"
	L.strawman = "Homme de paille"
	L.tito = "Tito"
end

L = BigWigs:NewBossLocale("Hyakiss the Lurker", "frFR")
if L then
	L.name = "Hyakiss la Rôdeuse"
end

-- Outland

L = BigWigs:NewBossLocale("Doomwalker", "frFR")
if L then
	L.name = "Marche-funeste"

	L.engage_trigger = "Cessez toute activité. Vous allez être éliminés."

	L.overrun_desc = "Prévient quand Marche-funeste utilise sa capacité Renversement."

	L.earthquake_desc = "Prévient quand Marche-funeste utilise sa capacité Séisme."
end

L = BigWigs:NewBossLocale("Doom Lord Kazzak", "frFR")
if L then
	L.name = "Seigneur funeste Kazzak"

	L.engage_trigger1 = "La Légion envahira l'univers !"
	L.engage_trigger2 = "Que les mortels périssent tous !"
end

L = BigWigs:NewBossLocale("High King Maulgar", "frFR")
if L then
	L.shield_message = "Bouclier sur Oeillaveugle !"
	L.spellshield_message = "Bouclier anti-sort sur Krosh !"
	L.summon_message = "Chasseur corrompu en cours d'invocation !"
	L.summon_bar = "Chasseur corrompu"
	L.whirlwind_message = "Maulgar - Toubillon pendant 15 sec. !"

	L.mage = "Krosh Brasemain (Mage)"
	L.warlock = "Olm l'Invocateur (Démoniste)"
	L.priest = "Oeillaveugle le Voyant (Prêtre)"
end

L = BigWigs:NewBossLocale("Magtheridon", "frFR")
if L then
	L.abyssal = "Abyssal ardent"
	L.abyssal_desc = "Prévient quand un Abyssal ardent est créé."
	L.abyssal_message = "Abyssal ardent créé (%d)"

	L.heal = "Soin"
	L.heal_desc = "Prévient quand un Canaliste des Flammes infernales commence à soigner."
	L.heal_message = "Se soigne !"

	L.banish = "Bannir"
	L["30168_desc"] = "Prévient quand vous bannissez Magtheridon."
	L.banished = "Banni"

	L.debris_trigger = "Que les murs de cette prison tremblent"
end

-- Serpentshrine Cavern

L = BigWigs:NewBossLocale("Hydross the Unstable", "frFR")
if L then
	L.start_trigger = "Je ne peux pas vous laisser nous gêner !"

	L.mark = "Marque"
	L.mark_desc = "Affiche les alertes et les compteurs des marques."

	L.stance = "Changements d'état"
	L.stance_desc = "Prévient quand Hydross l'Instable change d'état."
	L.poison_stance = "Hydross est maintenant empoisonné !"
	L.water_stance = "Hydross est de nouveau sain !"

	L.debuff_warn = "Marque à %s%% !"
end

L = BigWigs:NewBossLocale("Fathom-Lord Karathress", "frFR")
if L then
	L.enrage_trigger = "Gardes, en position ! Nous avons de la visite…"

	L.totem = "Totem crache-feu"
	L.totem_desc = "Prévient quand un Totem crache-feu est posé et indique son possesseur."
	L.totem_message1 = "Marevess : Totem crache-feu"
	L.totem_message2 = "Karathress : Totem crache-feu"
	L.heal_message = "Caribdis incante un soin !"

	L.priest = "Garde-fonds Caribdis"
end

L = BigWigs:NewBossLocale("Leotheras the Blind", "frFR")
if L then
	L.enrage_trigger = "Enfin, mon exil s'achève !"

	L.phase = "Phase démon"
	L.phase_desc = "Affiche une estimation de la phase démon."
	L.phase_trigger = "Hors d'ici, elfe insignifiant. Je prends le contrôle !"
	L.phase_demon = "Phase démon pendant 60 sec."
	L.phase_demonsoon = "Phase démon dans 5 sec. !"
	L.phase_normalsoon = "Phase normal dans 5 sec."
	L.phase_normal = "Phase normale !"
	L.demon_bar = "Phase démon"
	L.demon_nextbar = "Prochaine phase démon"

	L.mindcontrol = "Contrôle mental"
	L.mindcontrol_desc = "Prévient quand un joueur subit les effets du Contrôle mental."
	L.mindcontrol_warning = "Contrôle mental"

	L.image = "Image"
	L.image_desc = "Prévient quand l'image est créée à 15%."
	L.image_trigger = "Non… Non ! Mais qu'avez-vous fait ? C'est moi le maître ! Vous entendez ? Moi ! Je suis… Aaargh ! Impossible… de… retenir…"
	L.image_message = "15% - Image créée !"
	L.image_warning = "Image imminente !"

	L.whisper = "Murmure insidieux"
	L.whisper_desc = "Prévient quand des joueurs subissent le Murmure insidieux."
	L.whisper_message = "Démon"
	L.whisper_bar = "Disparition des démons"
	L.whisper_soon = "~Recharge Démons"
end

L = BigWigs:NewBossLocale("The Lurker Below", "frFR")
if L then
	L.engage_warning = "%s engagé - Plongée probable dans 90 sec."

	L.dive = "Plongées"
	L.dive_desc = "Délais avant que Le Rôdeur d'En-bas ne plonge."
	L.dive_warning = "Plongée probable dans %d sec. !"
	L.dive_bar = "~Plongée"
	L.dive_message = "Plongée - De retour dans 60 sec."

	L.spout = "Jet"
	L.spout_desc = "Délais concernant les Jets. Pas toujours précis."
	L.spout_message = "Incante un Jet !"
	L.spout_warning = "Jet probable dans ~3 sec. !"
	L.spout_bar = "Jet probable"

	L.emerge_warning = "De retour dans %d sec."
	L.emerge_message = "De retour - Plongée probable dans 90 sec."
	L.emerge_bar = "De retour dans"
end

L = BigWigs:NewBossLocale("Morogrim Tidewalker", "frFR")
if L then
	L.grave_bar = "<Tombeaux aquatique>"
	L.grave_nextbar = "~Recharge Tombeaux"

	L.murloc = "Murlocs"
	L.murloc_desc = "Prévient de l'arrivée des murlocs."
	L.murloc_bar = "~Recharge Murlocs"
	L.murloc_message = "Arrivée des murlocs !"
	L.murloc_soon_message = "Murlocs imminent !"
	L.murloc_engaged = "%s engagé, murlocs dans ~40 sec."

	L.globules = "Globules"
	L.globules_desc = "Prévient de l'arrivée des globules."
	L.globules_trigger1 = "Bientôt, ce sera terminé."
	L.globules_trigger2 = "Il est impossible de m'échapper !"
	L.globules_message = "Arrivée des globules !"
	L.globules_warning = "Globules imminent !"
	L.globules_bar = "Disparation des globules"
end

L = BigWigs:NewBossLocale("Lady Vashj", "frFR")
if L then
	L.engage_trigger1 = "J'espérais ne pas devoir m'abaisser à affronter des créatures de la surface, mais vous ne me laissez pas le choix..."
	L.engage_trigger2 = "Je te crache dessus, racaille de la surface !"
	L.engage_trigger3 = "Victoire au seigneur Illidan !"
	L.engage_trigger4 = "Je vais te déchirer de part en part !"
	L.engage_trigger5 = "Mort aux étrangers !"
	L.engage_message = "Début de la phase 1"

	L.phase = "Phases"
	L.phase_desc = "Prévient quand la rencontre entre dans une nouvelle phase."
	L.phase2_trigger = "L'heure est venue ! N'épargnez personne !"
	L.phase2_soon_message = "Phase 2 imminente !"
	L.phase2_message = "Phase 2, arrivée des renforts !"
	L.phase3_trigger = "Il faudrait peut-être vous mettre à l'abri."
	L.phase3_message = "Phase 3 - Enrager dans 4 min. !"

	L.elemental = "Elémentaires souillés"
	L.elemental_desc = "Prévient quand les Elémentaires souillés apparaissent durant la phase 2."
	L.elemental_bar = "Prochain élémentaire souillé"
	L.elemental_soon_message = "Elémentaire souillé imminent !"

	L.strider = "Trotteurs de Glissecroc"
	L.strider_desc = "Prévient quand les Trotteurs de Glissecroc apparaissent durant la phase 2."
	L.strider_bar = "Prochain trotteur"
	L.strider_soon_message = "Trotteur imminent !"

	L.naga = "Nagas élites de Glissecroc"
	L.naga_desc = "Prévient quand les Nagas élites de Glissecroc apparaissent durant la phase 2."
	L.naga_bar = "Prochain naga"
	L.naga_soon_message = "Naga imminent !"

	L.barrier_desc = "Prévient quand les barrières se dissipent."
	L.barrier_down_message = "Barrière %d/4 dissipée !"
end

-- Sunwell Plateau

L = BigWigs:NewBossLocale("Kil'jaeden", "frFR")
if L then
	L.bomb_cast = "Ténèbres des mille âmes en incantation !"
	L.bomb_nextbar = "~Bombe probable"
	L.bomb_warning = "Bombe probable dans ~10 sec."

	L.orb = "Orbe du bouclier"
	L.orb_desc = "Prévient quand un Orbe du bouclier lance des Traits de l'ombre."
	L.orb_shooting = "Orbe en vie - Bombardement de traits !"

	L.shield_up = "Bouclier ACTIF !"
	L.deceiver_dies = "Main du Trompeur #%d tué"

	L.blueorb = "Orbe du Vol bleu"
	L.blueorb_desc = "Prévient quand un Orbe du Vol bleu est prêt."
	L.blueorb_message = "Orbe du Vol bleu prêt !"

	L.kalec_yell = "Je vais canaliser mon énergie vers les orbes ! Préparez-vous !"
	L.kalec_yell2 = "J'ai chargé un autre orbe ! Utilisez-le vite !"
	L.kalec_yell3 = "Un autre orbe est prêt ! Hâtez-vous !"
	L.kalec_yell4 = "J'ai envoyé tout ce que je pouvais ! La puissance est entre vos mains !"
	L.phase3_trigger = "Rien ne m'arrêtera ! Ce monde va tomber !"
	L.phase4_trigger = "Assez de faux espoirs ! Vous ne pouvez pas gagner !"
	L.phase5_trigger = "Arggghhh ! Les pouvoirs du Puits de soleil… se retournent... contre moi ! Qu'avez-vous fait ? Qu'avez-vous fait ??"
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
	L.lady = "Sacrocingle #3:"
	L.lock = "Alythess #2:"

	L.threat = "Menace"

	--L.custom_on_threat = "Threat InfoBox"
	--L.custom_on_threat_desc = "Show second on threat for Grand Warlock Alythess and third on threat for Lady Sacrolash."
end

-- The Eye

L = BigWigs:NewBossLocale("Void Reaver", "frFR")
if L then
	L.engage_trigger = "Alerte ! Vous êtes désigné pour extermination."
end

L = BigWigs:NewBossLocale("High Astromancer Solarian", "frFR")
if L then
	L.engage_trigger = "Tal anu'men no sin'dorei!"

	L.phase = "Phases"
	L.phase_desc = "Prévient quand la rencontre entre dans une nouvelle phase."
	L.phase1_message = "Phase 1 - Rupture dans ~50 sec."
	L.phase2_warning = "Phase 2 imminente !"
	L.phase2_trigger = "^Je ne fais plus"
	L.phase2_message = "20% - Phase 2"

	L.wrath_other = "Courroux"

	L.split = "Rupture"
	L.split_desc = "Prévient de l'arrivée des ruptures & des apparitions des adds."
	L.split_trigger1 = "Je vais balayer vos illusions de grandeur !"
	L.split_trigger2 = "Vous êtes désespérément surclassés !"
	L.split_bar = "~Prochaine Rupture"
	L.split_warning = "Rupture dans ~7 sec."

	L.agent_warning = "Rupture ! - Agents dans 6 sec."
	L.agent_bar = "Agents"
	L.priest_warning = "Prêtres/Solarian dans 3 sec."
	L.priest_bar = "Prêtres/Solarian"
end

L = BigWigs:NewBossLocale("Kael'thas Sunstrider", "frFR")
if L then
	L.engage_trigger = "^L'énergie. La puissance."
	L.engage_message = "Phase 1"

	L.gaze = "Focalisation"
	L.gaze_desc = "Prévient quand Thaladred se focalise sur un joueur."
	L.gaze_trigger = "pose ses yeux"

	L.fear_soon_message = "Rugissement imminent !"
	L.fear_message = "Rugissement !"
	L.fear_bar = "Recharge Rugissement"

	L.rebirth = "Renaissance du phénix"
	L.rebirth_desc = "Prévient quand le phénix est suceptible de renaitre."
	L.rebirth_warning = "Renaissance probable dans 5 sec. !"
	L.rebirth_bar = "~Renaissance probable"

	L.pyro = "Explosion pyrotechnique"
	L.pyro_desc = "Affiche un compte à rebours de 60 secondes pour l'Explosion pyrotechnique."
	L.pyro_trigger = "%s commence à lancer une explosion pyrotechnique !"
	L.pyro_warning = "Explosion pyrotechnique dans 5 sec. !"
	L.pyro_message = "Explosion pyrotechnique en incantation !"

	L.phase = "Phases"
	L.phase_desc = "Prévient quand la rencontre entre dans une nouvelle phase."
	L.thaladred_inc_trigger = "Impressionnant. Voyons comment tiendront vos nerfs face à l'Assombrisseur, Thaladred !"
	L.sanguinar_inc_trigger = "Vous avez tenu tête à certains de mes plus talentueux conseillers… Mais personne ne peut résister à la puissance du Marteau de sang. Je vous présente le seigneur Sanguinar !"
	L.capernian_inc_trigger = "Capernian fera en sorte que votre séjour ici ne se prolonge pas."
	L.telonicus_inc_trigger = "Bien, vous êtes dignes de mesurer votre talent à celui de mon maître ingénieur, Telonicus."
	L.weapons_inc_trigger = "Comme vous le voyez, j'ai plus d'une corde à mon arc…"
	L.phase3_trigger = "Peut-être vous ai-je sous-estimés. Il ne serait pas très loyal de vous faire combattre mes quatre conseillers en même temps, mais… mon peuple n'a jamais été traité avec loyauté. Je ne fais que rendre la politesse."
	L.phase4_trigger = "Il est hélas parfois nécessaire de prendre les choses en main soi-même. Balamore shanal !"

	L.flying_trigger = "Je ne suis pas arrivé si loin pour échouer maintenant ! Je ne laisserai pas l'avenir que je prépare être remis en cause ! Vous allez goûter à ma vraie puissance !"
	L.flying_message = "Phase 5 - Rupture de gravité dans 1 min."

	L.weapons_inc_message = "Phase 2 - Arrivée des armes !"
	L.phase3_message = "Phase 3 - Conseillers et armes !"
	L.phase4_message = "Phase 4 - Arrivée de Kael'thas !"
	L.phase4_bar = "Arrivée de Kael'thas"

	L.mc = "Contrôle mental"
	L.mc_desc = "Prévient quand des joueurs subissent les effets du Contrôle mental."

	L.revive_bar = "Retour des conseillers"
	L.revive_warning = "Retour des conseillers dans 5 sec. !"

	L.dead_message = "%s meurt"

	L.capernian = "Grande astromancienne Capernian"
	L.sanguinar = "Seigneur Sanguinar"
	L.telonicus = "Maître ingénieur Telonicus"
	L.thaladred = "Thaladred l'Assombrisseur"
end
