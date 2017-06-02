local L = BigWigs:NewBossLocale("High Warlord Naj'entus", "koKR")
if not L then return end
if L then
	L.start_trigger = "여군주 바쉬의 이름으로 사형에 처하노라!"
end

L = BigWigs:NewBossLocale("Supremus", "koKR")
if L then
	L.normal_phase_trigger =  "궁극의 심연이 분노하여 땅을 내리찍습니다!"
	L.kite_phase_trigger = "땅이 갈라져서 열리기 시작합니다!"
	--L.normal_phase = "Normal Phase"
	--L.kite_phase = "Kite Phase"
	--L.next_phase = "Next Phase"
end

L = BigWigs:NewBossLocale("Reliquary of Souls", "koKR")
if L then
	L.zero_mana = "마나 0"
	--L.zero_mana_desc = "Show the time it will take until the Essence of Desire has reduced everyones maximum mana to 0."
	L.desire_start = "욕망의 정수 - 160초 후 마나 0"
end

L = BigWigs:NewBossLocale("The Illidari Council", "koKR")
if L then
	--L.veras = "Veras: %s"
	--L.malande = "Malande: %s"
	--L.gathios = "Gathios: %s"
	--L.zerevor = "Zerevor: %s"

	L.circle_heal_message = "치유됨! - 다음은 약 20초 이내"
	L.circle_fail_message = "%s 차단함! - 다음은 약 12초 이내"

	--L.magical_immunity = "Immune to magical!"
	--L.physical_immunity = "Immune to physical!"
end

L = BigWigs:NewBossLocale("Illidan Stormrage", "koKR")
if L then
	L.barrage_bar = "집중포화"
	L.eyeblast_trigger = "배신자의 눈을 똑바로 쳐다봐라!"
	L.warmup_trigger = "아카마, 너의 불충은 그리 놀랍지도 않구나. 너희 흉측한 형제들을 벌써 오래전에 없애버렸어야 했는데..."
end
