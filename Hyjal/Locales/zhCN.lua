local L = BigWigs:NewBossLocale("Archimonde", "zhCN")
if not L then return end
if L then
	L.engage_trigger = "你们的抵抗是毫无意义的。"
	L.grip_other = "军团之握"
	L.fear_message = "恐惧！约42秒后再次发动。"

	L.killable = "可以击杀"
end

L = BigWigs:NewBossLocale("Azgalor", "zhCN")
if L then
	L.howl_bar = "阿兹加洛之嚎 冷却"
	L.howl_message = "群体沉默"
end

L = BigWigs:NewBossLocale("Kaz'rogal", "zhCN")
if L then
	L.mark_bar = "下一印记：%d"
	L.mark_warn = "5秒后，印记！"
end

