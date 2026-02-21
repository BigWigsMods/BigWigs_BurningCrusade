local L = BigWigs:NewBossLocale("Doomwalker", "esES")
if not L then return end
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
	L.escape = "Libreación"
	L.escape_desc = "Cuenta atrás hasta la liberación de Magtheridon.."
	L.escape_trigger1 = "¡Las cuerdas de %%s empiezan a aflojarse!"
	L.escape_trigger2 = "¡He... sido... liberado!"
	L.escape_warning1 = "¡%s Activado - Liberado en 2min!"
	L.escape_warning2 = "¡Liberado en 1min!"
	L.escape_warning3 = "¡Liberado en 30sec!"
	L.escape_warning4 = "¡Liberado en 10sec!"
	L.escape_bar = "Liberado en..."
	L.escape_message = "¡%s Liberado!"

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
