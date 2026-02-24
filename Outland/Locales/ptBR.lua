local L = BigWigs:NewBossLocale("Doomwalker", "ptBR")
if not L then return end
if L then
	L.name = "Armagedom"

	--L.engage_trigger = "Do not proceed. You will be eliminated."

	--L.overrun_desc = "Doomwalker will randomly charge someone, knocking them back. Doomwalker will also reset his threat table."

	--L.earthquake_desc = "Doomwalker channels an Earthquake doing 2000 damage every 2 seconds, lasting 8 seconds, and stunning players in his proximity."
end

L = BigWigs:NewBossLocale("Doom Lord Kazzak", "ptBR")
if L then
	L.name = "Senhor da Perdição Kazzak"

	--L.engage_trigger1 = "The Legion will conquer all!"
	--L.engage_trigger2 = "All mortals will perish!"
end

L = BigWigs:NewBossLocale("High King Maulgar", "ptBR")
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

L = BigWigs:NewBossLocale("Magtheridon", "ptBR")
if L then
	--L.abyssal = "Burning Abyssal"
	--L.abyssal_desc = "Warn when a Burning Abyssal is created."
	--L.abyssal_message = "Burning Abyssal Created (%d)"

	--L.heal = "Heal"
	--L.heal_desc = "Warn when a Hellfire Channeler starts to heal."
	--L.heal_message = "Healing!"

	L.banish = "Banir"
	--L["30168_desc"] = "Warn when you Banish Magtheridon."
	L.banished = "Banida"

	--L.debris_trigger = "Let the walls of this prison tremble"
end
