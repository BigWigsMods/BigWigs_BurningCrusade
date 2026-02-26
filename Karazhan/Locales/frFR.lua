local L = BigWigs:NewBossLocale("Prince Malchezaar", "frFR")
if not L then return end
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
