local L = BigWigs:NewBossLocale("Archimonde", "zhTW")
if not L then return end
if L then
	L.engage_trigger = "你反抗是沒有用的。"
	L.grip_other = "軍團之握"
	L.fear_message = "恐懼術! 42 秒後再次發動!"

	L.killable = "可以擊殺"
end

L = BigWigs:NewBossLocale("Azgalor", "zhTW")
if L then
	L.howl_bar = "亞茲加洛之吼冷卻"
	L.howl_message = "群體沉默"
end

L = BigWigs:NewBossLocale("Kaz'rogal", "zhTW")
if L then
	L.mark_bar = "下一次印記: %d"
	L.mark_warn = "約 5 秒後，施放印記!"
end

