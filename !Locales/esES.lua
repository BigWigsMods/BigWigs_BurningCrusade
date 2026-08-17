-- Black Temple

local L = BigWigs:NewBossLocale("High Warlord Naj'entus", "esES")
if L then
	L.start_trigger = "¡Moriréis en el nombre de Lady Vashj!"
end

L = BigWigs:NewBossLocale("Supremus", "esES")
if L then
	L.normal_phase_trigger = "¡Supremus golpea el suelo enfadado!"
	L.kite_phase_trigger = "El suelo comienza a abrirse."
	--L.normal_phase = "Normal Phase"
	--L.kite_phase = "Kite Phase"
	--L.next_phase = "Next Phase"
end

L = BigWigs:NewBossLocale("Shade of Akama", "esES")
if L then
	--L.wipe_trigger = "No! Not yet!"
	--L.defender = "Defender" -- Ashtongue Defender
	--L.sorcerer = "Sorcerer" -- Ashtongue Sorcerer
	--L.adds_right = "Adds (Right)"
	--L.adds_left = "Adds (Left)"

	--L.engaged = "Shade of Akama Engaged"
end

L = BigWigs:NewBossLocale("Reliquary of Souls", "esES")
if L then
	L.zero_mana = "Sin Maná"
	--L.zero_mana_desc = "Show the time it will take until the Essence of Desire has reduced everyones maximum mana to 0."
	L.desire_start = "Esencia de Deseo - Sin Maná en 160 seg"
end

L = BigWigs:NewBossLocale("The Illidari Council", "esES")
if L then
	--L.veras = "Veras: %s"
	--L.malande = "Malande: %s"
	--L.gathios = "Gathios: %s"
	--L.zerevor = "Zerevor: %s"

	L.circle_heal_message = "¡Se ha curado! - Prox. en ~20seg"

	--L.magical_immunity = "Immune to magical!"
	--L.physical_immunity = "Immune to physical!"
end

L = BigWigs:NewBossLocale("Illidan Stormrage", "esES")
if L then
	L.barrage_bar = "Tromba"
	L.warmup_trigger = "Akama. Tu hipocresía no me sorprende. Debí acabar contigo y con tus malogrados hermanos hace tiempo."
end

-- Mount Hyjal

L = BigWigs:NewBossLocale("ArchimondeHyjal", "esES")
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

L = BigWigs:NewBossLocale("Hyjal Summit Trash", "esES")
if L then
	L.waves = "Oleadas"
	L.waves_desc = "Avisos aproximados para cada oleada."

	L.ghoul = "Necrófagos"
	L.fiend = "Malignos de cripta"
	L.abom = "Abominación"
	L.necro = "Nigromantes"
	L.banshee = "Almas en pena"
	L.garg = "Gárgolas"
	L.wyrm = "Vermis de escarcha"
	L.fel = "Acechador vil"
	L.infernal = "Infernales"
	L.one = "¡Oleada %d! %d %s"
	L.two = "¡Oleada %d! %d %s, %d %s"
	L.three = "¡Oleada %d! %d %s, %d %s, %d %s"
	L.four = "¡Oleada %d! %d %s, %d %s, %d %s, %d %s"
	L.five = "¡Oleada %d! %d %s, %d %s, %d %s, %d %s, %d %s"
	L.barWave = "Oleada %d aparece"

	L.waveInc = "¡Oleada %d viene!"
	L.message = "¡%s en ~%d seg!"
	L.waveMessage = "¡Oleada %d en ~%d seg!"
end

-- Karazhan

L = BigWigs:NewBossLocale("Prince Malchezaar", "esES")
if L then
	L.phase1_trigger = "La locura os ha traído ante mi. ¡Seré vuestro fin!"
	L.phase2_trigger = "¡Estúpidos! El tiempo es el fuego en el que arderéis!"
	L.phase3_trigger = "¿Cómo podéis esperar rebelaros ante un poder tan aplastante?"

	L.infernal = "Infernales"
	L.infernal_desc = "Muestra temporizadores para la invocación de Infernales."
	L.infernal_bar = "Llega infernal"
	L.infernal_message = "¡Aterrizó Infernal - Llamas infernales en 5seg!"
	L.infernal_trigger1 = "sino a todas las legiones bajo mi mando"
	L.infernal_trigger2 = "todas las dimensiones"
end

L = BigWigs:NewBossLocale("Netherspite", "esES")
if L then
	L.phase1_message = "Retirada - Aliento abisal terminado"
	L.phase1_bar = "Retirada"
	L.phase1_trigger = "%s grita en retirada, abriendo las puertas al vacío."
	L.phase2_message = "Cólera - ¡Aliento abisal en breve!"
	L.phase2_bar = "Cólera"
	L.phase2_trigger = "¡%s monta en cólera alimentada por el vacío!"
end

L = BigWigs:NewBossLocale("Nightbane Raid", "esES")
if L then
	L.name = "Nocturno"

	L.airphase_trigger = "Miserable alimaña. ¡Te exterminaré del aire!"
	L.airphase_message = "¡Volando!"
end

L = BigWigs:NewBossLocale("Romulo & Julianne", "esES")
if L then
	L.name = "Romulo & Julianne"

	L.phase1_message = "Acto I - Julianne"
	L.phase2_message = "Acto II - Romulo"
	L.phase3_message = "Acto III - Ambos"

	L.poison = "Veneno"
	L.poison_desc = "Avisa sobre jugadores envenenados."
	L.poison_message = "Envenenado"

	L.heal = "Curación"
	L.heal_desc = "Avisa cuando Julianne lanza Afección eterna."
	L.heal_message = "¡Julianne lanzando curación!"

	L.buff = "Auto-Beneficio"
	L.buff_desc = "Avisa cuando Romulo y Julianne reciben activan su propio beneficio."
	L.buff1_message = "¡Romulo gana Arrojo!"
	L.buff2_message = "¡Julianne gana Devoción!"
end

L = BigWigs:NewBossLocale("Shade of Aran", "esES")
if L then
	L.adds_bar = "Elementales"
	L.conjured_elemental = "Elemental conjurado"

	L.drink = "Beber"
	L.drink_desc = "Avisa de cuando Aran comienza a beber."
	L.drink_warning = "¡Maná bajo - Beber pronto!"
	L.drink_message = "¡Bebiendo - Polimorfia de área!"
	L.drink_bar = "~Piroexplosión"
end

L = BigWigs:NewBossLocale("The Big Bad Wolf", "esES")
if L then
	L.name = "El Gran Lobo Malvado"

	L.riding_bar = "%s Corriendo"
end

L = BigWigs:NewBossLocale("The Crone", "esES")
if L then
	L.name = "La Vieja Bruja"

	L.engage_trigger = "^¡Oh, Tito, solo tenemos que buscar la manera de volver a casa!"

	L.spawns = "Activación"
	L.spawns_desc = "Contadores para cuando los persoanjes se activan."
	L.spawns_warning = "¡%s en 5 sec!"

	L.roar = "Rugido"
	L.tinhead = "Cabezalata"
	L.strawman = "Espantapájaros"
	L.tito = "Tito"
end

L = BigWigs:NewBossLocale("Hyakiss the Lurker", "esES")
if L then
	L.name = "Hyakiss el Rondador"
end

-- Outland

L = BigWigs:NewBossLocale("Doomwalker", "esES")
if L then
	L.name = "Caminante del Destino"

	L.engage_trigger = "No continuéis. Seréis eliminados."

	L.overrun_desc = "Avisar cuando Caminante del Destino utiliza Infestar."

	L.earthquake_desc = "Avisar cuando Caminante del Destino utiliza Terremoto."
end

L = BigWigs:NewBossLocale("Doom Lord Kazzak", "esES")
if L then
	L.name = "Señor Apocalíptico Kazzak"

	L.engage_trigger1 = "¡La Legión lo conquistará todo!"
	L.engage_trigger2 = "¡Todo mortal perecerá!"
end

L = BigWigs:NewBossLocale("High King Maulgar", "esES")
if L then
	L.shield_message = "¡Escudo en Ciego el Vidente!"
	L.spellshield_message = "¡Escudo hechizos en Krosh!"
	L.summon_message = "¡Invocando manáfago!"
	L.summon_bar = "Manáfago"
	L.whirlwind_message = "¡Maulgar - Torbellino durante 15seg!"

	L.mage = "Krosh Manofuego (Mago)"
	L.warlock = "Olm el Invocador (Brujo)"
	L.priest = "Ciego el Vidente (Sacerdote)"
end

L = BigWigs:NewBossLocale("Magtheridon", "esES")
if L then
	L.abyssal = "Abisal ardiente (Burning Abyssal)"
	L.abyssal_desc = "Avisar cuando se crea un Abisal ardiente."
	L.abyssal_message = "Abisal ardiente creado (%d)"

	L.heal = "Curación"
	L.heal_desc = "Avisar cuando Canalizador Fuego Infernal empieza a curar."
	L.heal_message = "¡Curando!"

	L.banish = "Desterrar"
	L["30168_desc"] = "Avisar cuando destierras a Magtheridon."
	L.banished = "Desterrado"

	L.debris_trigger = "¡Que tiemblen las paredes de esta prisión"
end

-- Serpentshrine Cavern

L = BigWigs:NewBossLocale("Hydross the Unstable", "esES")
if L then
	L.start_trigger = "¡No puedo permitir que interferáis!"

	L.mark = "Marca de Hydross"
	L.mark_desc = "Mostrar avisos y contadores de Marca de Hydross."

	L.stance = "Cambios de Actitud"
	L.stance_desc = "Avisar cuando Hydross cambia de actitud. (Corrupto/Purificado)"
	L.poison_stance = "¡Hydross - Actitud corrupta!"
	L.water_stance = "¡Hydross - Actitud purificada!"

	L.debuff_warn = "¡Marca - %s%%!"
end

L = BigWigs:NewBossLocale("Fathom-Lord Karathress", "esES")
if L then
	L.enrage_trigger = "¡Guardias, atención! Tenemos visita..."

	L.totem = "Tótem escupefuego"
	L.totem_desc = "Avisar sobre Tótem escupefuego y sobre quién lo lanza."
	L.totem_message1 = "Mareavess: Tótem escupefuego"
	L.totem_message2 = "Karathress: Tótem escupefuego"
	L.heal_message = "¡Caribdis - Ola de sanación!"

	L.priest = "Guardia de las profundidades Caribdis"
end

L = BigWigs:NewBossLocale("Leotheras the Blind", "esES")
if L then
	L.enrage_trigger = "¡Al fin acaba mi destierro!"

	L.phase = "Fase demonio"
	L.phase_desc = "Tiempos estimados para fase demonio."
	L.phase_trigger = "¡Desaparece, elfo pusilánime. ¡Yo mando ahora!"
	L.phase_demon = "Fase demonio durante 60 seg"
	L.phase_demonsoon = "¡Fase demonio en 5 seg!"
	L.phase_normalsoon = "Fase normal en 5 seg"
	L.phase_normal = "¡Fase normal!"
	L.demon_bar = "<Fase demonio>"
	L.demon_nextbar = "~Fase demonio"

	L.mindcontrol = "Control mental (Mind Control)"
	L.mindcontrol_desc = "Avisar qué jugadores están siendo controlados mentalmente."
	L.mindcontrol_warning = "Control mental"

	L.image = "Imagen"
	L.image_desc = "Alertas de división de imagen al 15%."
	L.image_trigger = "¡No... no! ¿Qué has hecho? ¡Yo soy el maestro! ¿Me oyes? ¡Yo... ahggg! No...puedo contenerme."
	L.image_message = "¡15% - Imagen creada!"
	L.image_warning = "Imagen en breve"

	L.whisper = "Silbido insidioso (Insidious Whisper)"
	L.whisper_desc = "Avisar quién tiene Silbido insidioso."
	L.whisper_message = "Demonio"
	L.whisper_bar = "<Demonios desaparecen>"
	L.whisper_soon = "~Demonios"
end

L = BigWigs:NewBossLocale("The Lurker Below", "esES")
if L then
	L.engage_warning = "%s Activado - Se sumerge en ~90seg"

	L.dive = "Sumergida (Dive)"
	L.dive_desc = "Temporizadores para cuando El Rondador de abajo se sumerge."
	L.dive_warning = "Se sumerge en ~%dseg"
	L.dive_bar = "~Se sumerge"
	L.dive_message = "Se sumerge - Vuelve en 60sec"

	L.spout = "Chorro (Spout)"
	L.spout_desc = "Temporizadores para Chorro, puede no ser del todo preciso."
	L.spout_message = "¡Lanzando Chorro!"
	L.spout_warning = "Posible Chorro en ~3seg"
	L.spout_bar = "~Chorro"

	L.emerge_warning = "Vuelve en %dseg"
	L.emerge_message = "Vuelve - Se sumerge en ~90sec"
	L.emerge_bar = "~Vuelve a superficie"
end

L = BigWigs:NewBossLocale("Morogrim Tidewalker", "esES")
if L then
	L.grave_bar = "<Sepultura de agua> "
	L.grave_nextbar = "~Sepultura de agua"

	L.murloc = "Múrlocs"
	L.murloc_desc = "Avisar de Múrlocs entrantes."
	L.murloc_bar = "~Múrlocs"
	L.murloc_message = "¡Vienen los Múrlocs!"
	L.murloc_soon_message = "Múrlocs en breve"
	L.murloc_engaged = "%s Activado, Múrlocs en ~40seg"

	L.globules = "Glóbulos"
	L.globules_desc = "Avisar cuando aparecen glóbulos de agua."
	L.globules_trigger1 = "Pronto acabará."
	L.globules_trigger2 = "¡No os podéis esconder!"
	L.globules_message = "¡Glóbulos!"
	L.globules_warning = "Glóbulos en breve"
	L.globules_bar = "Glóbulos"
end

L = BigWigs:NewBossLocale("Lady Vashj", "esES")
if L then
	L.engage_trigger1 = "No quería rebajarme y tener contacto con vuestra clase, pero no me dejáis elección..."
	L.engage_trigger2 = "¡Os desprecio, desechos de la superficie!"
	L.engage_trigger3 = "¡Victoria para Lord Illidan!"
	L.engage_trigger4 = "¡Os partiré de cabo a rabo!"
	L.engage_trigger5 = "¡Muerte para los intrusos!"
	L.engage_message = "Entrando en fase 1"

	L.phase = "Fases"
	L.phase_desc = "Avisar sobre cambios de fase."
	L.phase2_trigger = "¡Ha llegado el momento! ¡Que no quede ni uno en pie!"
	L.phase2_soon_message = "Fase 2 en breve"
	L.phase2_message = "¡Fase 2 - Entran refuerzos!"
	L.phase3_trigger = "Os vendrá bien cubriros."
	L.phase3_message = "¡Fase 3 - Enfurecer en 4min!"

	L.elemental = "Elementales máculos (Tainted Elemental)"
	L.elemental_desc = "Avisar cuando aparecen Elementales máculos durante la fase 2."
	L.elemental_bar = "~Elementales máculos"
	L.elemental_soon_message = "Elementales máculos en breve"

	L.strider = "Zancudos Colmillo Torcido (Coilfang Striders)"
	L.strider_desc = "Avisar cuando aparecen Zancudos Colmillo Torcido durante la fase 2."
	L.strider_bar = "~Zancudo"
	L.strider_soon_message = "Zancudo Colmillo Torcido en breve"

	L.naga = "Élite Colmillo Torcido (Coilfang Elite)"
	L.naga_desc = "Avisar cuando aparecen Élites Colmillo Torcido durante la fase 2."
	L.naga_bar = "~Élite Naga"
	L.naga_soon_message = "Élite Colmillo Torcido en breve"

	L.barrier_desc = "Avisar cuand caen las Barreras mágicas."
	L.barrier_down_message = "¡Barrera %d/4 caída!"
end

-- Sunwell Plateau

L = BigWigs:NewBossLocale("Kil'jaeden", "esES")
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

L = BigWigs:NewBossLocale("Felmyst", "esES")
if L then
	L.phase = "Fases"
	L.phase_desc = "Avisar sobre las fases de suelo y aire."

	L.airphase_trigger = "¡Soy más fuerte que nunca!"
	L.takeoff_bar = "Vuela"
	L.takeoff_message = "¡Vuela en 5 Seg!"

	L.landing_bar = "Aterriza"
	L.landing_message = "¡Aterriza en 10 Seg!"

	L.breath = "Respira hondo"
	L.breath_desc = "Avisar cuando respira hondo."
end

L = BigWigs:NewBossLocale("Brutallus", "esES")
if L then
	L.engage_trigger = "¡Ah, más corderos al matadero!"

	L.burnresist = "Quemar resistido"
	L.burnresist_desc = "Avisar quién resiste Quemar."
	L.burn_resist = "Quemar resistido por %s"
end

L = BigWigs:NewBossLocale("M'uru", "esES")
if L then
	L.sentinel = "Centinela del vacío"
	L.sentinel_desc = "Avisar cuando aparece un centinela del vacío."
	L.sentinel_next = "Centinela (%d)"

	L.humanoid = "Añadidos humanoides"
	L.humanoid_desc = "Avisar cuando aparecen los humanoides."
	L.humanoid_next = "Humanoides (%d)"
end

L = BigWigs:NewBossLocale("Kalecgos", "esES")
if L then
	L.engage_trigger = "¡Aggh! ¡Ya no seré un esclavo de Malygos! ¡Retadme y seréis destruidos!"
	L.enrage_trigger = "¡Sathrovarr induce a Kalecgos a un estado de ira enloquecida!"

	L.sathrovarr = "Sathrovarr el Corruptor"

	L.portal = "Portal"
	L.portal_message = "Posible portal en 5 seg"

	L.realm_desc = "Avisa quién está en el Reino espectral."
	L.realm_message = "Reino espectral: %s (Grupo %d)"
	L.nobody = "Nadie"

	L.curse = "Maldición"

	L.wild_magic_healing = "Magia salvaje (Curación)"
	L.wild_magic_healing_desc = "Te avisa cuando haces curaciones aumentadas por Magia salvaje."
	L.wild_magic_healing_you = "¡Magia salvaje - Curación aumentada!"

	L.wild_magic_casting = "Magia salvaje (Tiempo lanzamiento)"
	L.wild_magic_casting_desc = "Te avisa cuando un sanador tiene el tiempo de lanzamiento aumentado por Magia salvaje."
	L.wild_magic_casting_you = "¡Magia salvaje - Tiempo lanzamiento aumentada!"
	L.wild_magic_casting_other = "¡Magia salvaje - Tiempo lanzamiento aumentado en %s!"

	L.wild_magic_hit = "Magia salvaje (Prob. golpe)"
	L.wild_magic_hit_desc = "Avisa cuando la probabilidad de golpe de un tanque se ve reducida por Magia salvaje."
	L.wild_magic_hit_you = "¡Magia salvaje - Prob. golpe reducida!"
	L.wild_magic_hit_other = "¡Magia salvaje - Prob. golpe reducida en %s!"

	L.wild_magic_threat = "Magia salvaje (Amenaza)"
	L.wild_magic_threat_desc = "Avisa cuando generas más amenaza por Magia salvaje."
	L.wild_magic_threat_you = "¡Magia salvaje - Amenaza generada aumentada!"
end

L = BigWigs:NewBossLocale("The Eredar Twins", "esES")
if L then
	L.lady = "Lady Sacrolash #3:"
	L.lock = "Bruja suprema Alythess #2:"

	L.threat = "Amenaza"

	--L.custom_on_threat = "Threat InfoBox"
	--L.custom_on_threat_desc = "Show second on threat for Grand Warlock Alythess and third on threat for Lady Sacrolash."
end

-- The Eye

L = BigWigs:NewBossLocale("Void Reaver", "esES")
if L then
	L.engage_trigger = "¡Alerta! Estáis marcados para exterminación."
end

L = BigWigs:NewBossLocale("High Astromancer Solarian", "esES")
if L then
	L.engage_trigger = "¡Tal anu'men no sin'dorei!"

	L.phase = "Fases"
	L.phase_desc = "Avisar sobre cambios de fase."
	L.phase1_message = "Fase 1 - División en ~50seg"
	L.phase2_warning = "¡Fase 2 en breve!"
	L.phase2_trigger = "^Me FUNDO"
	L.phase2_message = "20% - Fase 2"

	L.wrath_other = "Cólera"

	L.split = "División"
	L.split_desc = "Avisar sobre la división y aparición de añadidos."
	L.split_trigger1 = "¡Aplastaré vuestros delirios de grandeza!"
	L.split_trigger2 = "¡Os superamos con creces!"
	L.split_bar = "~División"
	L.split_warning = "División en ~7 seg"

	L.agent_warning = "¡División! - Agentes en 6 seg"
	L.agent_bar = "Agentes"
	L.priest_warning = "Sacerdotes/Solarian en 3 seg"
	L.priest_bar = "Sacerdotes/Solarian"
end

L = BigWigs:NewBossLocale("Kael'thas Sunstrider", "esES")
if L then
	L.engage_trigger = "^Energía. Poder."
	L.engage_message = "Fase 1"

	L.gaze = "Mirada"
	L.gaze_desc = "Avisar cuando Thaladred mira a un jugador."
	L.gaze_trigger = "mira a"

	L.fear_soon_message = "¡Miedo en breve!"
	L.fear_message = "¡Miedo!"
	L.fear_bar = "~Miedo"

	L.rebirth = "Renacer del Fénix"
	L.rebirth_desc = "Temporizadores aproximados para el Renacer del Fénix."
	L.rebirth_warning = "Posible Renacer en ~5seg"
	L.rebirth_bar = "~Posible Renacer"

	L.pyro = "Piroexplosión (Pyroblast)"
	L.pyro_desc = "Mostrar un temporizador de 60 seg. para Piroexplosión."
	L.pyro_trigger = "%s lanza una piroexplosión"
	L.pyro_warning = "Piroexplosión en 5seg"
	L.pyro_message = "¡Lanzando Piroexplosión!"

	L.phase = "Fases"
	L.phase_desc = "Avisar sobre las distintas fases del encuentro."
	L.thaladred_inc_trigger = "¡Veamos cómo aguantan vuestros nervios contra el Ensombrecedor, Thaladred!"
	L.sanguinar_inc_trigger = "Habéis sobrevivido a algunos de mis mejores consejeros... pero nadie puede resistir el poder del Martillo de Sangre. ¡He aquí Lord Sanguinar!"
	L.capernian_inc_trigger = "Capernian se encargará de que vuestra visita sea breve."
	L.telonicus_inc_trigger = "Bien hecho. Parecéis dignos de probar vuestras habilidades con mi maestro ingeniero Telonicus."
	L.weapons_inc_trigger = "Como veis, dispongo de un amplio arsenal..."
	L.phase3_trigger = "Quizás os subestimé. Sería injusto que os enfrentarais a los cuatro consejeros al mismo tiempo, pero... nunca se le ha brindado un trato justo a mi gente. Así que os devuelvo el favor."
	L.phase4_trigger = "Desafortunadamente hay veces en las que tienes que hacer las cosas con tus propias manos. ¡Balamore shanal!"

	L.flying_trigger = "¡No he llegado hasta aquí para que me detengáis! ¡El futuro que he planeado no se pondrá en peligro! ¡Vais a probar el verdadero poder!"
	L.flying_message = "Fase 5 - Gravedad cero en 1min"

	L.weapons_inc_message = "¡Fase 2 - Armas!"
	L.phase3_message = "¡Fase 3 - Consejeros y Armas!"
	L.phase4_message = "¡Fase 4 - Kael'thas!"
	L.phase4_bar = "Kael'thas entra"

	L.mc = "Control mental (Mind Control)"
	L.mc_desc = "Avisar quién tiene Control mental."

	L.revive_bar = "Añadidos revividos"
	L.revive_warning = "¡Añadidos reviven en 5seg!"

	L.dead_message = "%s muere"

	L.capernian = "Gran astromántica Capernian"
	L.sanguinar = "Lord Sanguinar"
	L.telonicus = "Maestro Ingeriero Telonicus"
	L.thaladred = "Thaladred el Oscurecedor"
end
