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

end

L = BigWigs:NewBossLocale("The Eredar Twins", "esMX")
if L then

end

