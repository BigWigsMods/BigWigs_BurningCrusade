local L = BigWigs:NewBossLocale("Kil'jaeden", "esMX")
if not L then return end
if L then

end

L = BigWigs:NewBossLocale("Felmyst", "esMX")
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

L = BigWigs:NewBossLocale("Brutallus", "esMX")
if L then
	L.engage_trigger = "¡Ah, más corderos al matadero!"

	L.burnresist = "Quemar resistido"
	L.burnresist_desc = "Avisar quién resiste Quemar."
	L.burn_resist = "Quemar resistido por %s"
end

L = BigWigs:NewBossLocale("M'uru", "esMX")
if L then
	L.sentinel = "Centinela del vacío"
	L.sentinel_desc = "Avisar cuando aparece un centinela del vacío."
	L.sentinel_next = "Centinela (%d)"

	L.humanoid = "Añadidos humanoides"
	L.humanoid_desc = "Avisar cuando aparecen los humanoides."
	L.humanoid_next = "Humanoides (%d)"
end

L = BigWigs:NewBossLocale("Kalecgos", "esMX")
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

L = BigWigs:NewBossLocale("The Eredar Twins", "esMX")
if L then

end

