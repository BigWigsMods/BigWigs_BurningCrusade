-- Black Temple

local L = BigWigs:NewBossLocale("High Warlord Naj'entus", "itIT")
if L then
	--L.start_trigger = "You will die in the name of Lady Vashj!"
end

L = BigWigs:NewBossLocale("Supremus", "itIT")
if L then
	--L.normal_phase_trigger = "Supremus punches the ground in anger!"
	--L.kite_phase_trigger = "The ground begins to crack open!"
	--L.normal_phase = "Normal Phase"
	--L.kite_phase = "Kite Phase"
	--L.next_phase = "Next Phase"
end

L = BigWigs:NewBossLocale("Shade of Akama", "itIT")
if L then
	--L.wipe_trigger = "No! Not yet!"
	--L.defender = "Defender" -- Ashtongue Defender
	--L.sorcerer = "Sorcerer" -- Ashtongue Sorcerer
	--L.adds_right = "Adds (Right)"
	--L.adds_left = "Adds (Left)"

	--L.engaged = "Shade of Akama Engaged"
end

L = BigWigs:NewBossLocale("Reliquary of Souls", "itIT")
if L then
	--L.zero_mana = "Zero Mana"
	--L.zero_mana_desc = "Show the time it will take until the Essence of Desire has reduced everyones maximum mana to 0."
	--L.desire_start = "Essence of Desire - Zero Mana in 160 sec"
end

L = BigWigs:NewBossLocale("The Illidari Council", "itIT")
if L then
	--L.veras = "Veras: %s"
	--L.malande = "Malande: %s"
	--L.gathios = "Gathios: %s"
	--L.zerevor = "Zerevor: %s"

	--L.circle_heal_message = "Healed! - Next in ~20sec"
	--L.circle_fail_message = "%s Interrupted! - Next in ~12sec"

	--L.magical_immunity = "Immune to magical!"
	--L.physical_immunity = "Immune to physical!"
end

L = BigWigs:NewBossLocale("Illidan Stormrage", "itIT")
if L then
	--L.barrage_bar = "Barrage"
	--L.warmup_trigger = "Akama. Your duplicity is hardly surprising. I should have slaughtered you and your malformed brethren long ago."
end

-- Mount Hyjal

L = BigWigs:NewBossLocale("ArchimondeHyjal", "itIT")
if L then
end

L = BigWigs:NewBossLocale("Azgalor", "itIT")
if L then
end

L = BigWigs:NewBossLocale("Kaz'rogal", "itIT")
if L then
end

L = BigWigs:NewBossLocale("Hyjal Summit Trash", "itIT")
if L then
	--L.waves = "Wave Warnings"
	--L.waves_desc = "Announce approximate warning messages for the next wave."

	--L.ghoul = "Ghouls"
	--L.fiend = "Crypt Fiends"
	--L.abom = "Abominations"
	--L.necro = "Necromancers"
	--L.banshee = "Banshees"
	--L.garg = "Gargoyles"
	--L.wyrm = "Frost Wyrm"
	--L.fel = "Fel Stalkers"
	--L.infernal = "Infernals"
	--L.one = "Wave %d! %d %s"
	--L.two = "Wave %d! %d %s, %d %s"
	--L.three = "Wave %d! %d %s, %d %s, %d %s"
	--L.four = "Wave %d! %d %s, %d %s, %d %s, %d %s"
	--L.five = "Wave %d! %d %s, %d %s, %d %s, %d %s, %d %s"
	--L.barWave = "Wave %d spawn"

	--L.waveInc = "Wave %d incoming!"
	--L.message = "%s in ~%d sec!"
	--L.waveMessage = "Wave %d in ~%d sec!"
end

-- Karazhan

L = BigWigs:NewBossLocale("Prince Malchezaar", "itIT")
if L then
	--L.phase1_trigger = "Madness has brought you here to me. I shall be your undoing!"
	--L.phase2_trigger = "Simple fools! Time is the fire in which you'll burn!"
	--L.phase3_trigger = "How can you hope to stand against such overwhelming power?"

	--L.infernal = "Infernals"
	--L.infernal_desc = "Show cooldown timer for Infernal summons."
	--L.infernal_bar = "Incoming Infernal"
	--L.infernal_message = "Infernal Landed! Hellfire in 5sec!"
	--L.infernal_trigger1 = "but the legions I command"
	--L.infernal_trigger2 = "All realities"
end

L = BigWigs:NewBossLocale("Netherspite", "itIT")
if L then
	--L.phase1_message = "Withdrawal - Netherbreaths Over"
	--L.phase1_bar = "Possible Withdrawal"
	--L.phase1_trigger = "%s cries out in withdrawal, opening gates to the nether."
	--L.phase2_message = "Rage - Incoming Netherbreaths!"
	--L.phase2_bar = "Possible Rage"
	--L.phase2_trigger = "%s goes into a nether-fed rage!"
end

L = BigWigs:NewBossLocale("Nightbane Raid", "itIT")
if L then
	--L.name = "Nightbane"

	--L.airphase_trigger = "Miserable vermin. I shall exterminate you from the air!"
	--L.airphase_message = "Flying!"
end

L = BigWigs:NewBossLocale("Romulo & Julianne", "itIT")
if L then
	--L.name = "Romulo & Julianne"

	--L.phase1_message = "Act I - Julianne"
	--L.phase2_message = "Act II - Romulo"
	--L.phase3_message = "Act III - Both"

	--L.poison = "Poison"
	--L.poison_desc = "Warn of a poisoned player."
	--L.poison_message = "Poisoned"

	--L.heal = "Heal"
	--L.heal_desc = "Warn when Julianne casts Eternal Affection."
	--L.heal_message = "Julianne casting Heal!"

	--L.buff = "Self-Buff Alert"
	--L.buff_desc = "Warn when Romulo & Julianne gain a self-buff."
	--L.buff1_message = "Romulo gains Daring!"
	--L.buff2_message = "Julianne gains Devotion!"
end

L = BigWigs:NewBossLocale("Shade of Aran", "itIT")
if L then
	--L.adds_bar = "Elementals despawn"
	L.conjured_elemental = "Elementale Evocato"

	--L.drink = "Drinking"
	--L.drink_desc = "Warn when Aran starts to drink."
	--L.drink_warning = "Low Mana - Drinking Soon!"
	--L.drink_message = "Drinking - AoE Polymorph!"
	--L.drink_bar = "Super Pyroblast Incoming"
end

L = BigWigs:NewBossLocale("The Big Bad Wolf", "itIT")
if L then
	--L.name = "The Big Bad Wolf"

	--L.riding_bar = "%s Running"
end

L = BigWigs:NewBossLocale("The Crone", "itIT")
if L then
	--L.name = "The Crone"

	--L.engage_trigger = "^Oh Tito, we simply must find a way home!"

	--L.spawns = "Spawn Timers"
	--L.spawns_desc = "Timers for when the characters become active."
	--L.spawns_warning = "%s in 5 sec"

	--L.roar = "Roar"
	--L.tinhead = "Tinhead"
	--L.strawman = "Strawman"
	--L.tito = "Tito"
end

L = BigWigs:NewBossLocale("Hyakiss the Lurker", "itIT")
if L then
	L.name = "Hyakiss il Guardingo"
end

-- Outland

L = BigWigs:NewBossLocale("Doomwalker", "itIT")
if L then
	L.name = "Calcarovina"

	--L.engage_trigger = "Do not proceed. You will be eliminated."

	--L.overrun_desc = "Doomwalker will randomly charge someone, knocking them back. Doomwalker will also reset his threat table."

	--L.earthquake_desc = "Doomwalker channels an Earthquake doing 2000 damage every 2 seconds, lasting 8 seconds, and stunning players in his proximity."
end

L = BigWigs:NewBossLocale("Doom Lord Kazzak", "itIT")
if L then
	L.name = "Signore della Rovina Kazzak"

	--L.engage_trigger1 = "The Legion will conquer all!"
	--L.engage_trigger2 = "All mortals will perish!"
end

L = BigWigs:NewBossLocale("High King Maulgar", "itIT")
if L then
	--L.shield_message = "Shield on Blindeye!"
	--L.spellshield_message = "Spell Shield on Krosh!"
	--L.summon_message = "Felhunter being summoned!"
	--L.summon_bar = "Felhunter"
	--L.whirlwind_message = "Maulgar - Whirlwind for 15sec!"

	--L.mage = "Krosh Firehand (Mage)"
	--L.warlock = "Olm the Summoner (Warlock)"
	--L.priest = "Blindeye the Seer (Priest)"
end

L = BigWigs:NewBossLocale("Magtheridon", "itIT")
if L then
	--L.abyssal = "Burning Abyssal"
	--L.abyssal_desc = "Warn when a Burning Abyssal is created."
	--L.abyssal_message = "Burning Abyssal Created (%d)"

	--L.heal = "Heal"
	--L.heal_desc = "Warn when a Hellfire Channeler starts to heal."
	--L.heal_message = "Healing!"

	L.banish = "Esilio"
	--L["30168_desc"] = "Warn when you Banish Magtheridon."
	L.banished = "Esiliato"

	--L.debris_trigger = "Let the walls of this prison tremble"
end

-- Serpentshrine Cavern

L = BigWigs:NewBossLocale("Hydross the Unstable", "itIT")
if L then
	--L.start_trigger = "I cannot allow you to interfere!"

	--L.mark = "Mark"
	--L.mark_desc = "Show warnings and counters for marks."

	--L.stance = "Stance changes"
	--L.stance_desc = "Warn when Hydross changes stances."
	--L.poison_stance = "Hydross is now poisoned!"
	--L.water_stance = "Hydross is now cleaned again!"

	--L.debuff_warn = "Mark at %s%%!"
end

L = BigWigs:NewBossLocale("Fathom-Lord Karathress", "itIT")
if L then
	--L.enrage_trigger = "Guards, attention! We have visitors...."

	--L.totem = "Spitfire Totem"
	--L.totem_desc = "Warn for Spitfire Totems and who cast them."
	--L.totem_message1 = "Tidalvess: Spitfire Totem"
	--L.totem_message2 = "Karathress: Spitfire Totem"
	--L.heal_message = "Caribdis casting heal!"

	--L.priest = "Fathom-Guard Caribdis"
end

L = BigWigs:NewBossLocale("Leotheras the Blind", "itIT")
if L then
	--L.enrage_trigger = "Finally, my banishment ends!"

	--L.phase = "Demon Phase"
	--L.phase_desc = "Estimated demon phase timers."
	--L.phase_icon = "Spell_Shadow_Metamorphosis"
	--L.phase_trigger = "Be gone, trifling elf.  I am in control now!"
	--L.phase_demon = "Demon Phase for 60sec"
	--L.phase_demonsoon = "Demon Phase in 5sec!"
	--L.phase_normalsoon = "Normal Phase in 5sec"
	--L.phase_normal = "Normal Phase!"
	--L.demon_bar = "Demon Phase"
	--L.demon_nextbar = "Next Demon Phase"

	--L.mindcontrol = "Mind Control"
	--L.mindcontrol_desc = "Warn which players are Mind Controlled."
	--L.mindcontrol_warning = "Mind Controlled"

	--L.image = "Image"
	--L.image_desc = "15% Image Split Alerts."
	--L.image_trigger = "No... no! What have you done? I am the master! Do you hear me? I am... aaggh! Can't... contain him."
	--L.image_message = "15% - Image Created!"
	--L.image_warning = "Image Soon!"

	--L.whisper = "Insidious Whisper (Demon)"
	--L.whisper_desc = "Alert what players have Insidious Whisper (Demon)."
	--L.whisper_message = "Demon"
	--L.whisper_bar = "Demons Despawn"
	--L.whisper_soon = "~Demons"
end

L = BigWigs:NewBossLocale("The Lurker Below", "itIT")
if L then
	--L.engage_warning = "%s Engaged - Possible Dive in 90sec"

	--L.dive = "Dive"
	--L.dive_desc = "Timers for when The Lurker Below dives."
	--L.dive_icon = "Spell_Frost_ArcticWinds"
	--L.dive_warning = "Possible Dive in %dsec!"
	--L.dive_bar = "~Dives in"
	--L.dive_message = "Dives - Back in 60sec"

	--L.spout = "Spout"
	--L.spout_desc = "Timers for Spout, may not always be accurate."
	--L.spout_icon = "INV_Weapon_Rifle_02"
	--L.spout_message = "Casting Spout!"
	--L.spout_warning = "Possible Spout in ~3sec!"
	--L.spout_bar = "~Spout"

	--L.emerge_warning = "Back in %dsec"
	--L.emerge_message = "Back - Possible Dive in 90sec"
	--L.emerge_bar = "Back in"
end

L = BigWigs:NewBossLocale("Morogrim Tidewalker", "itIT")
if L then
	--L.grave_bar = "<Watery Graves>"
	--L.grave_nextbar = "~Graves"

	--L.murloc = "Murlocs"
	--L.murloc_desc = "Warn for incoming murlocs."
	--L.murloc_bar = "~Murlocs"
	--L.murloc_message = "Incoming Murlocs!"
	--L.murloc_soon_message = "Murlocs soon!"
	--L.murloc_engaged = "%s Engaged, Murlocs in ~40sec"

	--L.globules = "Globules"
	--L.globules_desc = "Warn for incoming Watery Globules."
	--L.globules_trigger1 = "Soon it will be finished!"
	--L.globules_trigger2 = "There is nowhere to hide!"
	--L.globules_message = "Incoming Globules!"
	--L.globules_warning = "Globules Soon!"
	--L.globules_bar = "Globules Despawn"
end

L = BigWigs:NewBossLocale("Lady Vashj", "itIT")
if L then
	--L.engage_trigger1 = "I did not wish to lower myself by engaging your kind, but you leave me little choice..."
	--L.engage_trigger2 = "I spit on you, surface filth!"
	--L.engage_trigger3 = "Victory to Lord Illidan! "
	--L.engage_trigger4 = "I'll split you from stem to stern!"
	--L.engage_trigger5 = "Death to the outsiders!"
	--L.engage_message = "Entering Phase 1"

	--L.phase = "Phase warnings"
	--L.phase_desc = "Warn when Vashj goes into the different phases."
	--L.phase2_trigger = "The time is now! Leave none standing! "
	--L.phase2_soon_message = "Phase 2 soon!"
	--L.phase2_message = "Phase 2, adds incoming!"
	--L.phase3_trigger = "You may want to take cover. "
	--L.phase3_message = "Phase 3 - Enrage in 4min!"

	--L.elemental = "Tainted Elemental spawn"
	--L.elemental_desc = "Warn when the Tainted Elementals spawn during phase 2."
	--L.elemental_bar = "~Tainted Elemental"
	--L.elemental_soon_message = "Tainted Elemental soon!"

	--L.strider = "Coilfang Strider spawn"
	--L.strider_desc = "Warn when the Coilfang Striders spawn during phase 2."
	--L.strider_bar = "~Strider"
	--L.strider_soon_message = "Strider soon!"

	--L.naga = "Coilfang Elite Naga spawn"
	--L.naga_desc = "Warn when the Coilfang Elite Naga spawn during phase 2."
	--L.naga_bar = "~Naga"
	--L.naga_soon_message = "Naga soon!"

	--L.barrier_desc = "Alert when the barriers go down."
	--L.barrier_down_message = "Barrier %d/4 down!"
end

-- Sunwell Plateau

L = BigWigs:NewBossLocale("Kil'jaeden", "itIT")
if L then
	--L.bomb_cast = "Incoming Big Bomb"
	--L.bomb_nextbar = "Possible Bomb"
	--L.bomb_warning = "Possible bomb in ~10sec"

	--L.orb = "Shield Orb"
	--L.orb_desc = "Warn when a Shield Orb is shadowbolting."
	--L.orb_shooting = "Orb Alive - Shooting People!"

	--L.shield_up = "Shield is UP!"
	--L.deceiver_dies = "Deceiver #%d Killed"

	--L.blueorb = "Dragon Orb"
	--L.blueorb_desc = "Warns on Blue Dragonflight Orb spawns."
	--L.blueorb_message = "Blue Dragonflight Orb ready!"

	--L.kalec_yell = "I will channel my powers into the orbs! Be ready!"
	--L.kalec_yell2 = "I have empowered another orb! Use it quickly!"
	--L.kalec_yell3 = "Another orb is ready! Make haste!"
	--L.kalec_yell4 = "I have channeled all I can! The power is in your hands!"
	--L.phase3_trigger = "I will not be denied! This world shall fall!"
	--L.phase4_trigger = "Do not harbor false hope. You cannot win!"
	--L.phase5_trigger = "Ragh! The powers of the Sunwell turn against me! What have you done? What have you done?!"
end

L = BigWigs:NewBossLocale("Felmyst", "itIT")
if L then
end

L = BigWigs:NewBossLocale("Brutallus", "itIT")
if L then
end

L = BigWigs:NewBossLocale("M'uru", "itIT")
if L then
	--L.sentinel = "Void Sentinel"
	--L.sentinel_desc = "Warn when the Void Sentinel spawns."
	--L.sentinel_next = "Sentinel (%d)"

	--L.humanoid = "Humanoid Adds"
	--L.humanoid_desc = "Warn when the Humanoid Adds spawn."
	--L.humanoid_next = "Humanoids (%d)"
end

L = BigWigs:NewBossLocale("Kalecgos", "itIT")
if L then
	--L.engage_trigger = "Aggh!! No longer will I be a slave to Malygos! Challenge me and you will be destroyed!"
	--L.enrage_trigger = "Sathrovarr drives Kalecgos into a crazed rage!"

	L.sathrovarr = "Sathrovarr il Corruttore"

	--L.portal = "Portal"
	--L.portal_message = "Possible portal in 5 sec!"

	--L.realm_desc = "Tells you who is in the Spectral Realm."
	--L.realm_message = "Spectral Realm: %s (Group %d)"
	--L.nobody = "Nobody"

	--L.curse = "Curse"

	--L.wild_magic_healing = "Wild Magic (Increased healing)"
	--L.wild_magic_healing_desc = "Tells you when you get increased healing from Wild Magic."
	--L.wild_magic_healing_you = "Wild Magic - Healing increased!"

	--L.wild_magic_casting = "Wild Magic (Increased cast time)"
	--L.wild_magic_casting_desc = "Tells you when a healer gets incrased cast time from Wild Magic."
	--L.wild_magic_casting_you = "Wild Magic - Cast time increased!"
	--L.wild_magic_casting_other = "Wild Magic - Cast time increased on %s!"

	--L.wild_magic_hit = "Wild Magic (Decreased hit chance)"
	--L.wild_magic_hit_desc = "Tells you when a tank's chance to hit is reduced by Wild Magic."
	--L.wild_magic_hit_you = "Wild Magic - Hit chance decreased!"
	--L.wild_magic_hit_other = "Wild Magic - Hit chance decreased on %s!"

	--L.wild_magic_threat = "Wild Magic (Increased threat)"
	--L.wild_magic_threat_desc = "Tells you when you get increased threat from Wild Magic."
	--L.wild_magic_threat_you = "Wild Magic - Threat increased!"
end

L = BigWigs:NewBossLocale("The Eredar Twins", "itIT")
if L then
	L.lady = "Sacrolash #3:"
	L.lock = "Alythess #2:"

	L.threat = "Minaccia"

	--L.custom_on_threat = "Threat InfoBox"
	--L.custom_on_threat_desc = "Show second on threat for Grand Warlock Alythess and third on threat for Lady Sacrolash."
end

-- The Eye

L = BigWigs:NewBossLocale("Void Reaver", "itIT")
if L then
end

L = BigWigs:NewBossLocale("High Astromancer Solarian", "itIT")
if L then
end

L = BigWigs:NewBossLocale("Kael'thas Sunstrider", "itIT")
if L then
end
