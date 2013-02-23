local L = BigWigs:NewBossLocale("Archimonde", "koKR")
if not L then return end
if L then
	L.engage_trigger = "아무리 저항해도 소용없다!"
	L.grip_other = "손아귀"
	L.fear_message = "공포, 다음은 약 ~42초 이내!"

	L.killable = "Becomes Killable"
end

L = BigWigs:NewBossLocale("Azgalor", "koKR")
if L then
	L. howl_bar = "~침묵 대기시간"
	L. howl_message = "광역 침묵"
end

L = BigWigs:NewBossLocale("Kaz'rogal", "koKR")
if L then
	L.mark_bar = "다음 징표 (%d)"
	L.mark_warn = "5초 이내 징표!"
end

