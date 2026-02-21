local L = BigWigs:NewBossLocale("Doomwalker", "deDE")
if not L then return end
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
	L.escape = "Ausbruch"
	L.escape_desc = "Countdown bis Magtheridon ausbricht"
	L.escape_trigger1 = "Die Fesseln von %%s werden schw\195\164cher!"
	L.escape_trigger2 = " Ich... bin... frei!"
	L.escape_warning1 = "%s angegriffen - Ausbruch in 2min!"
	L.escape_warning2 = "Ausbruch in 1min!"
	L.escape_warning3 = "Ausbruch in 30sec!"
	L.escape_warning4 = "Ausbruch in 10sec!"
	L.escape_bar = "Frei..."
	L.escape_message = "%s frei!"

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

