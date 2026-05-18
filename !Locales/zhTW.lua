-- Black Temple

local L = BigWigs:NewBossLocale("High Warlord Naj'entus", "zhTW")
if L then
	L.start_trigger = "你會以瓦許女士之名而死!"
end

L = BigWigs:NewBossLocale("Supremus", "zhTW")
if L then
	L.normal_phase_trigger = "瑟普莫斯憤怒的捶擊地面!"
	L.kite_phase_trigger = "地上開始裂開!"
	L.normal_phase = "普通階段"
	L.kite_phase = "風箏階段"
	L.next_phase = "下一階段"
end

L = BigWigs:NewBossLocale("Shade of Akama", "zhTW")
if L then
	--L.wipe_trigger = "No! Not yet!"
	--L.defender = "Defender" -- Ashtongue Defender
	--L.sorcerer = "Sorcerer" -- Ashtongue Sorcerer
	L.adds_right = "右側小怪"
	L.adds_left = "左側小怪"

	--L.engaged = "Shade of Akama Engaged"
end

L = BigWigs:NewBossLocale("Reliquary of Souls", "zhTW")
if L then
	L.zero_mana = "沒魔"
	L.zero_mana_desc = "當慾望精華出現並開始降低法力值，替法力值歸零顯示計時器。"
	L.desire_start = "慾望精華：160秒後沒魔"
end

L = BigWigs:NewBossLocale("The Illidari Council", "zhTW")
if L then
	L.veras = "維拉斯‧深影：%s"
	L.malande = "瑪蘭黛女士：%s"
	L.gathios = "粉碎者高希歐：%s"
	L.zerevor = "高等虛空術士札瑞佛：%s"

	L.circle_heal_message = "治療成功！約20秒後再次使用。"
	L.circle_fail_message = "%s打斷了！約12秒後再次使用。"

	L.magical_immunity = "魔法免疫！"
	L.physical_immunity = "物理免疫！"
end

L = BigWigs:NewBossLocale("Illidan Stormrage", "zhTW")
if L then
	L.barrage_bar = "黑暗侵襲"
	L.warmup_trigger = "阿卡瑪。你的謊言真是老套。我很久前就該殺了你和你那些畸形的同胞。"
end

-- Mount Hyjal

L = BigWigs:NewBossLocale("ArchimondeHyjal", "zhTW")
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

L = BigWigs:NewBossLocale("Hyjal Summit Trash", "zhTW")
if L then
	L.waves = "階段警報"
	L.waves_desc = "通報下一波小怪來臨訊息"

	L.ghoul = "食屍鬼"
	L.fiend = "地穴捕獵者"
	L.abom = "憎惡"
	L.necro = "幽暗的死靈法師"
	L.banshee = "女妖"
	L.garg = "石像鬼"
	L.wyrm = "冰龍"
	L.fel = "惡魔捕獵者"
	L.infernal = "巨型地獄火"
	L.one = "第 %d 波：%d %s！"
	L.two = "第 %d 波：%d %s、%d %s！"
	L.three = "第 %d 波：%d %s、%d %s、%d %s！"
	L.four = "第 %d 波：%d %s、%d %s、%d %s、%d %s！"
	L.five = "第 %d 波：%d %s、%d %s、%d %s、%d %s、%d %s！"
	L.barWave = "第 %d 波出現！"

	L.waveInc = "第 %d 波即將來臨！"
	L.message = "%s 約 %d 秒後來臨!"
	L.waveMessage = "第 %d 波約 %d 秒後來臨!"
end

-- Karazhan

L = BigWigs:NewBossLocale("Prince Malchezaar", "zhTW")
if L then
	L.phase1_trigger = "瘋狂把你帶到我的面前。我會成為你失敗的原因!"
	L.phase2_trigger = "頭腦簡單的笨蛋!你在燃燒的是時間的火焰!"
	L.phase3_trigger = "你怎能期望抵抗這樣勢不可擋的力量?"

	L.infernal = "地獄火警告"
	L.infernal_desc = "顯示召喚地獄火計時條"
	L.infernal_bar = "地獄火"
	L.infernal_message = "5 秒後召喚地獄火"
	L.infernal_trigger1 = "而是我所率領的整個軍隊"
	L.infernal_trigger2 = "所有的空間對我來說都是開放的"
end

L = BigWigs:NewBossLocale("Netherspite", "zhTW")
if L then
	L.phase1_message = "撒退 - 第一階段光線門"
	L.phase1_bar = "地獄吐息 - 撒退"
	L.phase1_trigger = "%s大聲呼喊撤退，打開通往地獄的門。"
	L.phase2_message = "狂怒 - 第二階段自我放逐"
	L.phase2_bar = "地獄吐息 - 狂怒"
	L.phase2_trigger = "%s陷入一陣狂怒!"
end

L = BigWigs:NewBossLocale("Nightbane Raid", "zhTW")
if L then
	L.name = "夜禍"

	L.airphase_trigger = "悲慘的害蟲。我將讓你消失在空氣中!"
	L.airphase_message = "昇空"
end

L = BigWigs:NewBossLocale("Romulo & Julianne", "zhTW")
if L then
	L.name = "羅慕歐與茱麗葉"

	L.phase1_message = "Act I - 茱麗葉"
	L.phase2_message = "Act II - 羅慕歐"
	L.phase3_message = "Act III - 羅慕歐與茱麗葉"

	L.poison = "中毒警告"
	L.poison_desc = "當有玩家中毒時發送警告"
	L.poison_message = "中毒"

	L.heal = "治療警告"
	L.heal_desc = "當 茱麗葉 施放永恆的影響時發送警告"
	L.heal_message = "茱麗葉 正在施放治療術"

	L.buff = "狀態警告"
	L.buff_desc = "當 羅慕歐 和 茱麗葉 施放狀態時發送警告"
	L.buff1_message = "羅慕歐 在施放增益狀態"
	L.buff2_message = "茱麗葉 在施放增益狀態"
end

L = BigWigs:NewBossLocale("Shade of Aran", "zhTW")
if L then
	L.adds_bar = "召喚水元素"
	L.conjured_elemental = "召喚的元素"

	L.drink = "群體變羊"
	L.drink_desc = "當 埃蘭之影 開始回魔時發送警告"
	L.drink_warning = "埃蘭之影魔力太低"
	L.drink_message = "群體變羊術 - 埃蘭之影開始回魔"
	L.drink_bar = "群體變羊術"
end

L = BigWigs:NewBossLocale("The Big Bad Wolf", "zhTW")
if L then
	L.name = "大野狼"

	L.riding_bar = "%s 快跑！"
end

L = BigWigs:NewBossLocale("The Crone", "zhTW")
if L then
	L.name = "老巫婆"

	L.engage_trigger = "喔多多，我們一定要找到回家的路!"

	L.spawns = "啟動時間"
	L.spawns_desc = "設定各角色啟動時間計時"
	L.spawns_warning = "%s 將在 5 秒後開始攻擊"

	L.roar = "獅子"
	L.tinhead = "機器人"
	L.strawman = "稻草人"
	L.tito = "多多"
end

L = BigWigs:NewBossLocale("Hyakiss the Lurker", "zhTW")
if L then
	L.name = "潛伏者希亞其斯"
end

-- Outland

L = BigWigs:NewBossLocale("Doomwalker", "zhTW")
if L then
	L.name = "厄運行者"

	L.engage_trigger = "別在繼續下去。你將會被消除的。"

	L.overrun_desc = "當厄運行者發動 超越 技能時發出警報"

	L.earthquake_desc = "當厄運行者發動地震術時發出警報"
end

L = BigWigs:NewBossLocale("Doom Lord Kazzak", "zhTW")
if L then
	L.name = "毀滅領主卡札克"

	L.engage_trigger1 = "燃燒軍團將征服一切!"
	L.engage_trigger2 = "所有的凡人都將死亡!"
end

L = BigWigs:NewBossLocale("High King Maulgar", "zhTW")
if L then
	L.shield_message = "先知盲眼施放強效真言術:盾"
	L.spellshield_message = "火手施放法術護盾"
	L.summon_message = "野生地獄獵犬要出來咬人嚕"
	L.summon_bar = "召喚野生惡魔獵犬"
	L.whirlwind_message = "大君王莫卡爾 - 旋風斬 15 秒"

	L.mage = "克羅斯·火手 (法師)"
	L.warlock = "召喚者歐莫 (術士)"
	L.priest = "先知盲眼 (牧師)"
end

L = BigWigs:NewBossLocale("Magtheridon", "zhTW")
if L then
	L.abyssal = "燃燒的冥淵火"
	L.abyssal_desc = "當地獄火導魔師創造燃燒的冥淵火時發出警報"
	L.abyssal_message = "燃燒的冥淵火已創造 (%d)"

	L.heal = "黑暗治療"
	L.heal_desc = "當地獄火導魔師開始治療時發出警報"
	L.heal_message = "黑暗治療 - 快中斷!"

	L.banish = "放逐術"
	L["30168_desc"] = "當你驅逐 瑪瑟里頓."
	L.banished = "被放逐"

	L.debris_trigger = "我不會這麼輕易就被擊敗!讓這座監獄的牆壁震顫……然後崩塌!"
end

-- Serpentshrine Cavern

L = BigWigs:NewBossLocale("Hydross the Unstable", "zhTW")
if L then
	L.start_trigger = "我不准你涉入這件事!"

	L.mark = "印記"
	L.mark_desc = "印記警報及計數"

	L.stance = "形態改變"
	L.stance_desc = "當 不穩定者海卓司 改變型態時發出警報"
	L.poison_stance = "海卓司轉為毒型態!"
	L.water_stance = "海卓司轉為水狀態!"

	L.debuff_warn = "印記施放於 %s%%"
end

L = BigWigs:NewBossLocale("Fathom-Lord Karathress", "zhTW")
if L then
	L.enrage_trigger = "守衛，注意!我們有訪客了……"

	L.totem = "飛火圖騰"
	L.totem_desc = "飛火圖騰施放警示"
	L.totem_message1 = "提達費斯: 飛火圖騰!"
	L.totem_message2 = "卡拉薩瑞斯: 飛火圖騰!"
	L.heal_message = "治療波 - 快中斷!"

	L.priest = "深淵守衛卡利迪斯"
end

L = BigWigs:NewBossLocale("Leotheras the Blind", "zhTW")
if L then
	L.enrage_trigger = "終於結束了我的流放生涯!"

	L.phase = "惡魔型態"
	L.phase_desc = "惡魔型態計時"
	L.phase_trigger = "消失吧，微不足道的精靈。現在開始由我掌管!"
	L.phase_demon = "惡魔型態 - 持續 60 秒!"
	L.phase_demonsoon = "5 秒內進入惡魔型態!"
	L.phase_normalsoon = "5 秒內回到普通型態!"
	L.phase_normal = "普通型態 - 即將施放旋風斬!"
	L.demon_bar = "惡魔型態"
	L.demon_nextbar = "下一次惡魔型態"

	L.mindcontrol = "心靈控制"
	L.mindcontrol_desc = "當隊友受到心靈控制時警告"
	L.mindcontrol_warning = "心靈控制"

	L.image = "影分身"
	L.image_desc = "15% 分身警告"
	L.image_trigger = "不…不!你做了什麼?我是主人!你沒聽見我在說話嗎?我…..啊!無法…控制它。"
	L.image_message = "15% - 分身出現!"
	L.image_warning = "分身即將出現!"

	L.whisper = "陰險之語"
	L.whisper_desc = "當隊友受到陰險之語時警告"
	L.whisper_message = "內心的惡靈"
	L.whisper_bar = "內心的惡靈消失計時"
	L.whisper_soon = "內心的惡靈冷卻"
end

L = BigWigs:NewBossLocale("The Lurker Below", "zhTW")
if L then
	L.engage_warning = "%s 開始攻擊 - 約90秒後下潛"

	L.dive = "潛水"
	L.dive_desc = "海底潛伏者下潛計時器"
	L.dive_warning = "大約 %d 秒後下潛!"
	L.dive_bar = "下潛"
	L.dive_message = "潛水! 請就位打小兵 (60秒後王再次出現)"

	L.spout = "噴射"
	L.spout_desc = "噴射計時器，僅供參考，不一定準確。"
	L.spout_message = "噴射開始!注意閃避!"
	L.spout_warning = "約 3 秒後噴射!"
	L.spout_bar = "噴射"

	L.emerge_warning = "%d 秒後浮現"
	L.emerge_message = "浮現 - 近戰請等旋風結束上前 (約 90 秒後下潛)"
	L.emerge_bar = "浮現"
end

L = BigWigs:NewBossLocale("Morogrim Tidewalker", "zhTW")
if L then
	L.grave_bar = "<水之墓計時>"
	L.grave_nextbar = "水之墓冷卻"

	L.murloc = "魚人警示"
	L.murloc_desc = "魚人來臨時警示"
	L.murloc_bar = "魚人冷卻"
	L.murloc_message = "魚人出現!"
	L.murloc_soon_message = "魚人即將出現，準備 AE!"
	L.murloc_engaged = "%s 開戰 - 魚人在 40 秒內出現!"

	L.globules = "水珠警示"
	L.globules_desc = "當水珠來臨時警示"
	L.globules_trigger1 = "很快，這一切都將結束!"
	L.globules_trigger2 = "這裡是無處可躲的!"
	L.globules_message = "水珠出現!避開水球!"
	L.globules_warning = "水珠即將出現!"
	L.globules_bar = "水珠消失"
end

L = BigWigs:NewBossLocale("Lady Vashj", "zhTW")
if L then
	L.engage_trigger1 = "我不想要因為跟你這種人交手而降低我自己的身份，但是你們讓我別無選擇……"
	L.engage_trigger2 = "我唾棄你們，地表的渣滓!"
	L.engage_trigger3 = "伊利丹王必勝!"
	L.engage_trigger4 = "我要把你們全部殺死!" -- need chatlog.
	L.engage_trigger5 = "入侵者都要死!"
	L.engage_message = "第一階段 - 開戰!"

	L.phase = "階段警示"
	L.phase_desc = "當瓦許進入不同的階段時警示"
	L.phase2_trigger = "機會來了!一個活口都不要留下!"
	L.phase2_soon_message = "即將進入第二階段!"
	L.phase2_message = "第二階段 - 護衛出現!"
	L.phase3_trigger = "你們最好找掩護。"
	L.phase3_message = "第三階段 - 4 分鐘內狂怒!"

	L.elemental = "污染的元素警示"
	L.elemental_desc = "當第二階段污染的元素出現時警示"
	L.elemental_bar = "<污染的元素計時>"
	L.elemental_soon_message = "污染的元素即將出現!優先集火!"

	L.strider = "盤牙旅行者警示"
	L.strider_desc = "當第二階段盤牙旅行者出現時警示"
	L.strider_bar = "<盤牙旅行者計時>"
	L.strider_soon_message = "盤牙旅行者即將出現!牧師漸隱!"

	L.naga = "盤牙精英警示"
	L.naga_desc = "當第二階段盤牙精英出現時警示"
	L.naga_bar = "盤牙精英計時"
	L.naga_soon_message = "盤牙精英即將出現!中央坦克注意!"

	L.barrier_desc = "當瓦許女士的魔法屏障消失時警示"
	L.barrier_down_message = "魔法屏障 %d/4 解除!"
end

-- Sunwell Plateau

L = BigWigs:NewBossLocale("Kil'jaeden", "zhTW")
if L then
	L.bomb_cast = "即將施放千魂之暗"
	L.bomb_nextbar = "可能施放千魂之暗"
	L.bomb_warning = "約10秒後，可能施放千魂之暗"

	L.orb = "盾之寶珠"
	L.orb_desc = "當盾之寶珠施放暗影箭時發出警報"
	L.orb_shooting = "盾之寶珠開始施放暗影箭"

	L.shield_up = "藍龍之盾啟用"
	L.deceiver_dies = "已殺死基爾加丹之手#%d"

	L.blueorb = "藍龍寶珠 "
	L.blueorb_desc = "當可以使用藍龍寶珠時發出警報"
	L.blueorb_message = "藍龍寶珠已準備好"

	L.kalec_yell = "我會將我的力量導入寶珠中!準備好!"
	L.kalec_yell2 = "我又將能量灌入了另一顆寶珠!快去使用它!"
	L.kalec_yell3 = "又有一顆寶珠準備好了!快點行動!"
	L.kalec_yell4 = "我已經引導出所有的力量了!力量現在掌握在你們的手裡!"
	L.phase3_trigger = "我是不會失敗的!這個世界注定要毀滅!"
	L.phase4_trigger = "別再抱有幻想了!你們不可能贏!"
	L.phase5_trigger = "啊呃!太陽之井的能量……開始……對抗我!你們都做了些什麼?你們都做了些什麼??"
end

L = BigWigs:NewBossLocale("Felmyst", "zhTW")
if L then
	L.phase = "階段警報"
	L.phase_desc = "當升空或降落階段時發出警報"
	L.airphase_trigger = "我比以前更強大了!"
	L.takeoff_bar = "升空"
	L.takeoff_message = "約 5 秒後，升空!"
	L.landing_bar = "降落"
	L.landing_message = "約 10 秒後，降落!"

	L.breath = "深呼吸"
	L.breath_desc = "當施放深呼吸時發出警報"
end

L = BigWigs:NewBossLocale("Brutallus", "zhTW")
if L then
	L.engage_trigger = "啊，更多待宰的小羊們!"

	L.burnresist = "燃燒抵抗"
	L.burnresist_desc = "警報誰抵抗了燃燒"
	L.burn_resist = "燃燒抵抗: [%s]"
end

L = BigWigs:NewBossLocale("M'uru", "zhTW")
if L then
	L.sentinel = "虛無哨兵"
	L.sentinel_desc = "當虛無哨兵出現時發出警報"
	L.sentinel_next = "下一波虛無哨兵：%d"

	L.humanoid = "影劍怒法師和影劍狂戰士"
	L.humanoid_desc = "當影劍怒法師和影劍狂戰士出現時發出警報"
	L.humanoid_next = "下一波影劍怒法師和影劍狂戰士：%d"
end

L = BigWigs:NewBossLocale("Kalecgos", "zhTW")
if L then
	L.engage_trigger = "啊!!我不再是瑪里苟斯的奴隸了!所有挑戰我的人都要被消滅!"
	L.enrage_trigger = "塞斯諾瓦將卡雷苟斯逼入了瘋狂的暴怒中!"

	--L.sathrovarr = "Sathrovarr the Corruptor"

	L.portal = "傳送門"
	L.portal_message = "約 5 秒內出現傳送門!"

	L.realm_desc = "提示你誰進入了鬼靈國度"
	L.realm_message = "鬼靈國度: [%s] - 小隊 %d!"
	L.nobody = "沒有人"

	L.curse = "詛咒"

	L.wild_magic_healing = "野性魔法 (治療加成)"
	L.wild_magic_healing_desc = "當你獲得野性魔法 (治療加成) 時提示"
	L.wild_magic_healing_you = "野性魔法 - 治療效果加成!"

	L.wild_magic_casting = "野性魔法 (施法時間延長)"
	L.wild_magic_casting_desc = "當治療職受到野性魔法 (施法時間延長) 時提示"
	L.wild_magic_casting_you = "野性魔法 - 你的施法時間延長!"
	L.wild_magic_casting_other = "野性魔法 - 施法時間延長: [%s]"

	L.wild_magic_hit = "野性魔法 (命中下降)"
	L.wild_magic_hit_desc = "當坦克受到野性魔法 (命中下降) 時提示"
	L.wild_magic_hit_you = "野性魔法 - 你的命中率下降!"
	L.wild_magic_hit_other = "野性魔法 - 命中率下降: [%s]"

	L.wild_magic_threat = "野性魔法 (仇恨增加)"
	L.wild_magic_threat_desc = "當你獲得野性魔法 (仇恨增加) 時提示"
	L.wild_magic_threat_you = "野性魔法 - 你的仇恨值增加!"
end

L = BigWigs:NewBossLocale("The Eredar Twins", "zhTW")
if L then
	--L.lady = "Sacrolash #3:"
	--L.lock = "Alythess #2:"

	L.threat = "仇恨"

	--L.custom_on_threat = "Threat InfoBox"
	--L.custom_on_threat_desc = "Show second on threat for Grand Warlock Alythess and third on threat for Lady Sacrolash."
end

-- The Eye

L = BigWigs:NewBossLocale("Void Reaver", "zhTW")
if L then
	L.engage_trigger = "警告!你已經被標記為消滅的對象。"
end

L = BigWigs:NewBossLocale("High Astromancer Solarian", "zhTW")
if L then
	L.engage_trigger = "與血精靈為敵者死!"

	L.phase = "階段警告"
	L.phase_desc = "當階段轉換時警告"
	L.phase1_message = "第一階段 - 50 秒內分身!"
	L.phase2_warning = "即將進入第二階段!"
	L.phase2_trigger = "夠了!現在我要呼喚宇宙中失衡的能量。"
	L.phase2_message = "20% - 第二階段!"

	L.wrath_other = "星術師之怒"

	L.split = "分身警告"
	L.split_desc = "當分身與小兵出現時警示"
	L.split_trigger1 = "我會粉碎你那偉大的夢想!"
	L.split_trigger2 = "我的實力遠勝於你!"
	L.split_bar = "下一次分身"
	L.split_warning = "7 秒內分身來臨!"

	L.agent_warning = "分身! - 6 秒內密探出現!"
	L.agent_bar = "密探計時"
	L.priest_warning = "5 秒內牧師、星術師出現!"
	L.priest_bar = "牧師, 星術師計時"
end

L = BigWigs:NewBossLocale("Kael'thas Sunstrider", "zhTW")
if L then
	L.engage_trigger = "能量。力量。我的人民陷入其中不能自拔……自從太陽之井被摧毀之後就顯得更加明顯。歡迎來到未來。真遺憾，你們無法阻止什麼。沒有人可以阻止我了﹗(薩拉斯語)為了人民的正義!"
	L.engage_message = "第一階段 - 四顧問!"

	L.gaze = "凝視"
	L.gaze_desc = "警報誰受到凝視"
	L.gaze_trigger = "凝視著"

	L.fear_soon_message = "即將恐懼!"
	L.fear_message = "恐懼!"
	L.fear_bar = "恐懼冷卻"

	L.rebirth = "鳳凰復生"
	L.rebirth_desc = "顯示鳳凰復生的計時"
	L.rebirth_warning = "約 5 秒內鳳凰可能復生!"
	L.rebirth_bar = "<估計復生時間>"

	L.pyro = "炎爆術"
	L.pyro_desc = "顯示一個 60 秒的炎爆術計時"
	L.pyro_trigger = "開始施放炎爆術"
	L.pyro_warning = "約 5 秒內施放炎爆術!"
	L.pyro_message = "炎爆術!"

	L.phase = "階段警示"
	L.phase_desc = "開啟各階段警示"
	L.thaladred_inc_trigger = "讓我們看看你們這些大膽的狂徒如何反抗晦暗者薩拉瑞德的力量!"
	L.sanguinar_inc_trigger = "你已經努力的打敗了我的幾位最忠誠的諫言者…但是沒有人可以抵抗血錘的力量。等著看桑古納爾的力量吧!"
	L.capernian_inc_trigger = "卡普尼恩將保證你們不會在這裡停留太久。"
	L.telonicus_inc_trigger = "做得好，你已經證明你的實力足以挑戰我的工程大師泰隆尼卡斯。"
	L.weapons_inc_trigger = "你們看，我的個人收藏中有許多武器……"
	L.phase3_trigger = "也許我低估了你。要你一次對付四位諫言者也許對你來說是不太公平，但是……我的人民從未得到公平的對待。我只是以牙還牙而已。"
	L.phase4_trigger = "唉，有些時候，有些事情，必須得親自解決才行。(薩拉斯語)受死吧!"

	L.flying_trigger = "我的心血是不會被你們輕易浪費的!我精心謀劃的未來是不會被你們輕易破壞的!感受我真正的力量吧!"
	L.flying_message = "第五階段 - 1 分鐘內重力流逝!"

	L.weapons_inc_message = "第二階段 - 武器即將出現!"
	L.phase3_message = "第三階段 - 顧問群重生!"
	L.phase4_message = "第四階段 - 王子來臨!"
	L.phase4_bar = "凱爾薩斯來臨"

	L.mc = "精神控制"
	L.mc_desc = "精神控制警報"

	L.revive_bar = "顧問重生"
	L.revive_warning = "顧問在 5 秒內活動! 坦克、治療準備就位!"

	L.dead_message = "%s dies"

	L.capernian = "大星術師卡普尼恩"
	L.sanguinar = "桑古納爾領主"
	L.telonicus = "工程大師泰隆尼卡斯"
	L.thaladred = "扭曲預言家薩拉瑞德"
end
