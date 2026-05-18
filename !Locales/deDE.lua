-- Black Temple

local L = BigWigs:NewBossLocale("High Warlord Naj'entus", "deDE")
if L then
	L.start_trigger = "Im Namen Lady Vashjs werdet Ihr sterben!"
end

L = BigWigs:NewBossLocale("Supremus", "deDE")
if L then
	L.normal_phase_trigger = "Supremus schlägt wütend auf den Boden!"
	L.kite_phase_trigger = "Der Boden beginnt aufzubrechen!"
	--L.normal_phase = "Normal Phase"
	--L.kite_phase = "Kite Phase"
	--L.next_phase = "Next Phase"
end

L = BigWigs:NewBossLocale("Shade of Akama", "deDE")
if L then
	--L.wipe_trigger = "No! Not yet!"
	--L.defender = "Defender" -- Ashtongue Defender
	--L.sorcerer = "Sorcerer" -- Ashtongue Sorcerer
	--L.adds_right = "Adds (Right)"
	--L.adds_left = "Adds (Left)"

	--L.engaged = "Shade of Akama Engaged"
end

L = BigWigs:NewBossLocale("Reliquary of Souls", "deDE")
if L then
	L.zero_mana = "Kein Mana"
	--L.zero_mana_desc = "Show the time it will take until the Essence of Desire has reduced everyones maximum mana to 0."
	L.desire_start = "Essenz der Begierde - Kein Mana in 160sec"
end

L = BigWigs:NewBossLocale("The Illidari Council", "deDE")
if L then
	--L.veras = "Veras: %s"
	--L.malande = "Malande: %s"
	--L.gathios = "Gathios: %s"
	--L.zerevor = "Zerevor: %s"

	L.circle_heal_message = "Geheilt! - Nächster in ~20sek"
	L.circle_fail_message = "%s unterbrochen! - Nächster in ~12sek"

	--L.magical_immunity = "Immune to magical!"
	--L.physical_immunity = "Immune to physical!"
end

L = BigWigs:NewBossLocale("Illidan Stormrage", "deDE")
if L then
	L.barrage_bar = "Sperrfeuer"
	L.warmup_trigger = "Akama. Euer falsches Spiel überrascht mich nicht. Ich hätte Euch und Eure missgestalteten Brüder schon vor langer Zeit abschlachten sollen."
end

-- Mount Hyjal

L = BigWigs:NewBossLocale("ArchimondeHyjal", "deDE")
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

L = BigWigs:NewBossLocale("Hyjal Summit Trash", "deDE")
if L then
	L.waves = "Wellen"
	L.waves_desc = "Zeigt Warnungen für die nächste Welle an."

	L.ghoul = "Ghule"
	L.fiend = "Gruftscheusale"
	L.abom = "Monstrositäten"
	L.necro = "Nekromanten"
	L.banshee = "Banshees"
	L.garg = "Gargoyles"
	L.wyrm = "Frostwyrm"
	L.fel = "Teufelshunde"
	L.infernal = "Höllenbestien"
	L.one = "Welle %d! %d %s"
	L.two = "Welle %d! %d %s, %d %s"
	L.three = "Welle %d! %d %s, %d %s, %d %s"
	L.four = "Welle %d! %d %s, %d %s, %d %s, %d %s"
	L.five = "Welle %d! %d %s, %d %s, %d %s, %d %s, %d %s"
	L.barWave = "Welle %d spawnt."

	L.waveInc = "Welle %d kommt!"
	L.message = "%s in ~%d sek!"
	L.waveMessage = "Welle %d in ~%d sek!"
end

-- Karazhan

L = BigWigs:NewBossLocale("Prince Malchezaar", "deDE")
if L then
	L.phase1_trigger = "Der Wahnsinn f\195\188hrte Euch zu mir. Ich werde Euch das Genick brechen!"
	L.phase2_trigger = "Dummk\195\182pfe! Zeit ist das Feuer, in dem Ihr brennen werdet!"
	L.phase3_trigger = "Wie k\195\182nnt Ihr hoffen, einer so \195\188berw\195\164ltigenden Macht gewachsen zu sein?"

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
	L.adds_bar = "Elementare verschwinden"
	L.conjured_elemental = "Herbeigezauberter Elementar"

	L.drink = "Trinken"
	L.drink_desc = "Warnt, wenn Arans Schemen zu trinken beginnt."
	L.drink_warning = "Wenig Mana - trinkt gleich!"
	L.drink_message = "Trinkt - AoE Polymorph!"
	L.drink_bar = "Super-Pyroblast kommt!"
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

-- Outland

L = BigWigs:NewBossLocale("Doomwalker", "deDE")
if L then
	L.name = "Verdammniswandler"

	L.engage_trigger = "Fahren Sie nicht fort. Sie werden eliminiert." --check

	L.overrun_desc = "Warnt, wenn Verdammniswandler \195\156berrennen benutzt."

	L.earthquake_desc = "Warnt wenn Verdammniswandler Erdbeben benutzt."
end

L = BigWigs:NewBossLocale("Doom Lord Kazzak", "deDE")
if L then
	L.name = "Verdammnislord Kazzak"

	L.engage_trigger1 = "Die Legion wird alles erobern!"
	L.engage_trigger2 = "Alle Sterblichen werden zu Grunde gehen!"
end

L = BigWigs:NewBossLocale("High King Maulgar", "deDE")
if L then
	L.shield_message = "Schild auf Blindauge!"
	L.spellshield_message = "Zauberschild auf Krosh!"
	L.summon_message = "Teufelsjäger wurde beschworen!"
	L.summon_bar = "Teufelsjäger"
	L.whirlwind_message = "Maulgar - Wirbelwind f\195\188r 15sek!"

	L.mage = "Krosh Feuerhand (Magier)"
	L.warlock = "Olm der Beschwörer (Hexenmeister)"
	L.priest = "Blindauge der Seher (Priester)"
end

L = BigWigs:NewBossLocale("Magtheridon", "deDE")
if L then
	L.abyssal = "Brennender Schlund"
	L.abyssal_desc = "Warnt, wenn ein Brennender Schlund gespawned wird"
	L.abyssal_message = "Brennender Schlund gespawned (%d)"

	L.heal = "Heilung"
	L.heal_desc = "Warnt, wenn ein Kanalisierer anf\195\164ngt zu heilen"
	L.heal_message = "Heilung!"

	L.banish = "Verbannen"
	L["30168_desc"] = "Warnt, wenn ihr Magtheridon verbannt"
	L.banished = "Verbannt"

	L.debris_trigger = "Lasst die Mauern dieses Kerkers erzittern"
end

-- Serpentshrine Cavern

L = BigWigs:NewBossLocale("Hydross the Unstable", "deDE")
if L then
	L.start_trigger = "Ich kann nicht zulassen, dass Ihr Euch einmischt!"

	L.mark = "Mal"
	L.mark_desc = "Zeigt Warnungen und Anzahl des Mals."

	L.stance = "Phasenwechsel"
	L.stance_desc = "Warnt wenn Hydross der Unstete seine Phase wechselt."
	L.poison_stance = "Hydross ist nun vergiftet!"
	L.water_stance = "Hydross ist wieder gereinigt!"

	L.debuff_warn = "Mal bei %s%%!"
end

L = BigWigs:NewBossLocale("Fathom-Lord Karathress", "deDE")
if L then
	L.enrage_trigger = "Achtung, Wachen! Wir haben Besuch..."

	L.totem = "Feuerspuckendes Totem"
	L.totem_desc = "Warnt vor dem Feuerspuckenden Totem und wer es aufstellt."
	L.totem_message1 = "Flutvess: Feuerspuckendes Totem"
	L.totem_message2 = "Karathress: Feuerspuckendes Totem"
	L.heal_message = "Caribdis heilt!"

	L.priest = "Tiefenw\195\164chter Caribdis"
end

L = BigWigs:NewBossLocale("Leotheras the Blind", "deDE")
if L then
	L.enrage_trigger = "Endlich hat meine Verbannung ein Ende!"

	L.phase = "D\195\164monenphase"
	L.phase_desc = "Gesch\195\164tzte Timer f\195\188r die D\195\164monenphase."
	L.phase_trigger = "Hinfort, unbedeutender Elf. Ich habe jetzt die Kontrolle!"
	L.phase_demon = "D\195\164monenphase f\195\188r 60sec!"
	L.phase_demonsoon = "D\195\164monenphase in 5sec!"
	L.phase_normalsoon = "Normale Phase in 5sec"
	L.phase_normal = "Normale Phase!"
	L.demon_bar = "D\195\164monenphase"
	L.demon_nextbar = "N\195\164chste D\195\164monenphase"

	L.mindcontrol = "Gedankenkontrolle"
	L.mindcontrol_desc = "Warnt vor \195\188bernommenen Spielern."
	L.mindcontrol_warning = "Gedankenkontrolle"

	L.image = "Schatten von Leotheras"
	L.image_desc = "Meldet die 15% Schatten Abspaltung."
	L.image_trigger = "Ich bin der Meister! H\195\182rt Ihr?"
	L.image_message = "15% - Schatten von Leotheras!"
	L.image_warning = "Schatten von Leotheras bald!"

	L.whisper = "Heimt\195\188ckisches Gefl\195\188ster"
	L.whisper_desc = "Zeigt an, welche Spieler von Heimt\195\188ckisches Gefl\195\188ster betroffen sind."
	L.whisper_message = "D\195\164mon"
	L.whisper_bar = "D\195\164monen verschwinden"
	L.whisper_soon = "~D\195\164monen"
end

L = BigWigs:NewBossLocale("The Lurker Below", "deDE")
if L then
	L.engage_warning = "%s Engaged - M\195\182gliches Abtauchen in 90sek"

	L.dive = "Abtauchen"
	L.dive_desc = "Zeitanzeige wann Das Grauen aus der Tiefe taucht."
	L.dive_warning = "M\195\182gliches Abtauchen in %dsek!"
	L.dive_bar = "~Abtauchen"
	L.dive_message = "Abgetaucht - Zur\195\188ck in 60sek"

	L.spout = "Schwall"
	L.spout_desc = "Gesch\195\164tzte Zeitanzeige f\195\188r Schwall."
	L.spout_message = "Wirkt Schwall!"
	L.spout_warning = "M\195\182glicher Schwall in ~3sek!"
	L.spout_bar = "M\195\182glicher Schwall"

	L.emerge_warning = "Zur\195\188ck in %dsek"
	L.emerge_message = "Aufgetaucht - M\195\182gliches Abtauchen in 90sek"
	L.emerge_bar = "Auftauchen"
end

L = BigWigs:NewBossLocale("Morogrim Tidewalker", "deDE")
if L then
	L.grave_bar = "<Nasses Grab>"
	L.grave_nextbar = "n\195\164chstes Nasses Grab"

	L.murloc = "Murlocs"
	L.murloc_desc = "Warnt vor ankommenden Murlocs."
	L.murloc_bar = "n\195\164chste Murlocs"
	L.murloc_message = "Murlocs kommen!"
	L.murloc_soon_message = "Murlocs bald!"
	L.murloc_engaged = "%s angegriffen, Murlocs in ~40sec"

	L.globules = "Wasserkugeln"
	L.globules_desc = "Warnt vor Wasserkugeln."
	L.globules_trigger1 = "Bald ist es vor\195\188ber!"
	L.globules_trigger2 = "Es gibt kein Entkommen!"
	L.globules_message = "Wasserkugeln kommen!"
	L.globules_warning = "Wasserkugeln bald!"
	L.globules_bar = "Wasserkugeln Despawn"
end

L = BigWigs:NewBossLocale("Lady Vashj", "deDE")
if L then
	L.engage_trigger1 = "Normalerweise würde ich mich nicht herablassen, Euresgleichen persönlich gegenüberzutreten, aber ihr lasst mir keine Wahl..."
	L.engage_trigger2 = "Ich spucke auf Euch, Oberweltler!" -- up to date as of 2.3.3
	L.engage_trigger3 = "Sieg für Fürst Illidan!" -- up to date as of 2.3.3
	L.engage_trigger4 = "Ich werde Euch der Länge nach spalten!" -- to be checked
	L.engage_trigger5 = "Tod den Eindringlingen!"
	L.engage_message = "Phase 1"

	L.phase = "Phasenwarnung"
	L.phase_desc = "Warnt, wenn Vashj ihre Phase wechselt."
	L.phase2_trigger = "Die Zeit ist gekommen! Lasst keinen am Leben!"
	L.phase2_soon_message = "Phase 2 bald!"
	L.phase2_message = "Phase 2, Adds kommen!"
	L.phase3_trigger = "Geht besser in Deckung!"
	L.phase3_message = "Phase 3 - Wutanfall in 4min!"

	L.elemental = "Besudelter Elementar Spawn"
	L.elemental_desc = "Warnt, wenn ein Besudelter Elementar während Phase 2 spawnt."
	L.elemental_bar = "Besudelter Elementar kommt"
	L.elemental_soon_message = "Besudelter Elementar bald!"

	L.strider = "Schreiter des Echsenkessels Spawn"
	L.strider_desc = "Warnt, wenn ein Schreiter des Echsenkessels während Phase 2 spawnt."
	L.strider_bar = "Schreiter kommt"
	L.strider_soon_message = "Schreiter bald!"

	L.naga = "Naga Elite spawn"
	L.naga_desc = "Warnt, wenn ein Naga Elite während Phase 2 spawnt."
	L.naga_bar = "Naga Elite kommt"
	L.naga_soon_message = "Naga Elite bald!"

	L.barrier_desc = "Alarmiert, wenn die Barrieren in Phase 2 zerstört werden."
	L.barrier_down_message = "Barriere %d/4 zerstört!"
end

-- Sunwell Plateau

L = BigWigs:NewBossLocale("Kil'jaeden", "deDE")
if L then
	L.bomb_cast = "Eingehende Große Bombe!"
	L.bomb_nextbar = "~Mögliche Bombe"
	L.bomb_warning = "Mögliche Bombe in ~10sek"

	L.orb = "Schildkugel"
	L.orb_desc = "Warnt wenn eine Schildkugel Schattenblitze schleudert."
	L.orb_shooting = "Kugel Lebend - Schiessen Leute!"

	L.shield_up = "Schild ist Oben!"
	L.deceiver_dies = "Betrüger #%d getötet"

	L.blueorb = "Drachenkugel"
	L.blueorb_desc = "Warnt wenn eine Blaue Drachenschwarm Kugel erscheint."
	L.blueorb_message = "Blaue Drachenschwarm Kugel Bereit!"

	L.kalec_yell = "I will channel my powers into the orbs! Be ready!"
	L.kalec_yell2 = "I have empowered another orb! Use it quickly!"
	L.kalec_yell3 = "Another orb is ready! Make haste!"
	L.kalec_yell4 = "I have channeled all I can! The power is in your hands!"
	L.phase3_trigger = "I will not be denied! This world shall fall!"
	L.phase4_trigger = "Do not harbor false hope. You cannot win!"
	L.phase5_trigger = "Ragh! The powers of the Sunwell turn against me! What have you done? What have you done?!"
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
	L.lady = "Lady Sacrolash #3:"
	L.lock = "Großhexenmeisterin Alythess #2:"

	L.threat = "Drohung"

	--L.custom_on_threat = "Threat InfoBox"
	--L.custom_on_threat_desc = "Show second on threat for Grand Warlock Alythess and third on threat for Lady Sacrolash."
end

-- The Eye

L = BigWigs:NewBossLocale("Void Reaver", "deDE")
if L then
	L.engage_trigger = "Alarm! Eliminierung eingeleitet!"
end

L = BigWigs:NewBossLocale("High Astromancer Solarian", "deDE")
if L then
	L.engage_trigger = "Tal anu'men no sin'dorei!"

	L.phase = "Phasen"
	L.phase_desc = "Warnung bei Phasenwechsel."
	L.phase1_message = "Phase 1 - Spaltung in ~50sek"
	L.phase2_warning = "Phase 2 bald!"
	L.phase2_trigger = "^Ich werde"
	L.phase2_message = "20% - Phase 2"

	L.wrath_other = "Zorn"

	L.split = "Spaltung"
	L.split_desc = "Warnt vor Spaltung & Add Spawn."
	L.split_trigger1 = "Ich werde Euch Euren Hochmut austreiben!"
	L.split_trigger2 = "Ihr seid eindeutig in der Unterzahl!"
	L.split_bar = "~Nächste Spaltung"
	L.split_warning = "Spaltung in ~7sek"

	L.agent_warning = "Splittung! - Agenten in 6sek"
	L.agent_bar = "Agenten"
	L.priest_warning = "Priester/Solarian in 3sek"
	L.priest_bar = "Priester/Solarian"
end

L = BigWigs:NewBossLocale("Kael'thas Sunstrider", "deDE")
if L then
	L.engage_trigger = "^Energie. Kraft."
	L.engage_message = "Phase 1"

	L.gaze = "Blick"
	L.gaze_desc = "Warnt, wenn Thaladred einen Spieler fokussiert."
	L.gaze_trigger = "im Blickfeld"

	L.fear_soon_message = "Furcht bald!"
	L.fear_message = "Furcht!"
	L.fear_bar = "~Nächste Furcht"

	L.rebirth = "Phönix Wiedergeburt"
	L.rebirth_desc = "Warnt vor Wiedergeburt der Phönix Eier."
	L.rebirth_warning = "Phönix Wiedergeburt in 5sek!"
	L.rebirth_bar = "~Mögliche Wiedergeburt"

	L.pyro = "Pyroschlag"
	L.pyro_desc = "Zeigt einen 60 Sekunden Timer f\195\188r Pyroschlag."
	L.pyro_trigger = "%s beginnt, Pyroschlag zu wirken!"
	L.pyro_warning = "Pyroschlag in 5sek!"
	L.pyro_message = "Pyroschlag!"

	L.phase = "Phasen"
	L.phase_desc = "Warnt vor den verschiedenen Phasen."
	L.thaladred_inc_trigger = "Eindrucksvoll. Aber werdet Ihr auch mit Thaladred, dem Verfinsterer fertig?"
	L.sanguinar_inc_trigger = "Ihr habt gegen einige meiner besten Berater bestanden... aber niemand kommt gegen die Macht des Bluthammers an. Zittert vor Fürst Blutdurst!"
	L.capernian_inc_trigger = "Capernian wird dafür sorgen, dass Euer Aufenthalt hier nicht lange währt."
	L.telonicus_inc_trigger = "Gut gemacht. Ihr habt Euch würdig erwiesen, gegen meinen Meisteringenieur, Telonicus, anzutreten."
	L.weapons_inc_trigger = "Wie Ihr seht, habe ich viele Waffen in meinem Arsenal..."
	L.phase3_trigger = "Vielleicht habe ich Euch unterschätzt. Es wäre unfair, Euch gegen meine vier Berater gleichzeitig kämpfen zu lassen, aber... mein Volk wurde auch nie fair behandelt. Ich vergelte nur Gleiches mit Gleichem."
	L.phase4_trigger = "Ach, manchmal muss man die Sache selbst in die Hand nehmen. Balamore shanal!"

	L.flying_trigger = "Ich bin nicht so weit gekommen, um jetzt noch aufgehalten zu werden! Die Zukunft, die ich geplant habe, darf nicht gefährdet werden. Jetzt bekommt Ihr wahre Macht zu spüren!"
	L.flying_message = "Schweben! Gravitationsverlust in 1min"

	L.weapons_inc_message = "Waffen kommen!"
	L.phase3_message = "Phase 2 - Berater und Waffen!"
	L.phase4_message = "Phase 3 - Kael'thas aktiv!"
	L.phase4_bar = "Kael'thas aktiv"

	L.mc = "Gedankenkontrolle"
	L.mc_desc = "Warnt wer von Gedankenkontrolle betroffen ist."

	L.revive_bar = "Berater wiederbeleben"
	L.revive_warning = "Wiederbeleben der Berater in 5sek!"

	L.dead_message = "%s stirbt"

	L.capernian = "Großastromantin Capernian"
	L.sanguinar = "Fürst Blutdurst"
	L.telonicus = "Meisteringenieur Telonicus"
	L.thaladred = "Thaladred der Verfinsterer"
end
