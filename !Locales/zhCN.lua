-- Black Temple

local L = BigWigs:NewBossLocale("High Warlord Naj'entus", "zhCN")
if L then
	L.start_trigger = "以瓦丝琪女王的名义，去死吧！"
end

L = BigWigs:NewBossLocale("Supremus", "zhCN")
if L then
	L.normal_phase_trigger = "苏普雷姆斯愤怒地击打着地面！"
	L.kite_phase_trigger = "地面崩裂了！"
	L.normal_phase = "一般阶段"
	L.kite_phase = "风筝阶段"
	L.next_phase = "下一阶段"
end

L = BigWigs:NewBossLocale("Shade of Akama", "zhCN")
if L then
	L.wipe_trigger = "不！我不能死！"
	L.defender = "防御者" -- Ashtongue Defender
	L.sorcerer = "巫师" -- Ashtongue Sorcerer
	L.adds_right = "增援（右侧）"
	L.adds_left = "增援（左侧）"

	L.engaged = "阿卡玛之影激活"
end

L = BigWigs:NewBossLocale("Reliquary of Souls", "zhCN")
if L then
	L.zero_mana = "零法力"
	L.zero_mana_desc = "当欲望精华将减少所有人法力值为零时显示计时器。"
	L.desire_start = "欲望精华！160秒后零法力。"
end

L = BigWigs:NewBossLocale("The Illidari Council", "zhCN")
if L then
	L.veras = "维尔莱斯：%s"
	L.malande = "玛兰德：%s"
	L.gathios = "加西奥斯：%s"
	L.zerevor = "塞勒沃尔：%s"

	L.circle_heal_message = "治疗成功！约20秒后，再次发动。"
	L.circle_fail_message = "%s 打断！约12秒后，再次发动治疗之环。"

	L.magical_immunity = "魔法免疫！"
	L.physical_immunity = "物理免疫！"
end

L = BigWigs:NewBossLocale("Illidan Stormrage", "zhCN")
if L then
	L.barrage_bar = "黑暗壁垒"
	L.warmup_trigger = "阿卡玛。你的两面三刀并没有让我感到意外。我早就应该把你和你那些畸形的同胞全部杀掉。"
end

-- Mount Hyjal

L = BigWigs:NewBossLocale("ArchimondeHyjal", "zhCN")
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

L = BigWigs:NewBossLocale("Hyjal Summit Trash", "zhCN")
if L then
	L.waves = "阶段警报"
	L.waves_desc = "通告下一波来临警报信息。"

	L.ghoul = "食尸鬼"
	L.fiend = "地穴恶魔"
	L.abom = "憎恶"
	L.necro = "阴暗通灵师"
	L.banshee = "女妖"
	L.garg = "石像鬼"
	L.wyrm = "冰霜巨龙"
	L.fel = "恶魔猎犬"
	L.infernal = "地狱火"
	L.one = "第%d波：%d个%s！"
	L.two = "第%d波：%d个%s，%d个%s！"
	L.three = "第%d波：%d个%s，%d个%s，%d个%s！"
	L.four = "第%d波：%d个%s，%d个%s，%d个%s，%d个%s！"
	L.five = "第%d波：%d个%s，%d个%s，%d个%s，%d个%s，%d个%s！"
	L.barWave = "第%d波 出现！"

	L.waveInc = "第%d波 来临！"
	L.message = "%s 在约%d秒后来临！"
	L.waveMessage = "第%d波！将在约%d秒后来临！"
end

-- Karazhan

L = BigWigs:NewBossLocale("Prince Malchezaar", "zhCN")
if L then
	L.phase1_trigger = "疯狂将你们带到我的面前，而我将以死亡终结你们！"
	L.phase2_trigger = "愚蠢的家伙！时间就是吞噬你躯体的烈焰！"
	L.phase3_trigger = "你如何抵挡这无坚不摧的力量？"

	L.infernal = "地狱火警报"
	L.infernal_desc = "显示召唤地狱火冷却时间计时条。"
	L.infernal_bar = "即将 地狱火"
	L.infernal_message = "地狱火出现！5秒后发动，地狱烈焰！"
	L.infernal_trigger1 = "还有我所号令的军团"
	L.infernal_trigger2 = "所有的世界都向我敞开大门"
end

L = BigWigs:NewBossLocale("Netherspite", "zhCN")
if L then
	L.phase1_message = "快撤！- 虚空吐息来临！"
	L.phase1_bar = "虚空吐息 - 撤退"
	L.phase1_trigger = "%s在撤退中大声呼喊着，打开了回到虚空的传送门。"
	L.phase2_message = "狂怒！- 地狱吐息来临！"
	L.phase2_bar = "地狱吐息 - 狂怒"
	L.phase2_trigger = "%s的怒火甚至可以充满整个虚空！"
end

L = BigWigs:NewBossLocale("Nightbane Raid", "zhCN")
if L then
	L.name = "夜之魇"

	L.airphase_trigger = "可怜的渣滓。我要腾空而起，让你尝尝毁灭的滋味！"
	L.airphase_message = "升空"
end

L = BigWigs:NewBossLocale("Romulo & Julianne", "zhCN")
if L then
	L.name = "罗密欧和朱丽叶"

	L.phase1_message = "第 I 幕 - 朱丽叶"
	L.phase2_message = "第 II 幕 - 罗密欧"
	L.phase3_message = "第 III 幕 - 同时出场"

	L.poison = "中毒"
	L.poison_desc = "当玩家中毒时发出警报。"
	L.poison_message = "浸毒之刺"

	L.heal = "治疗"
	L.heal_desc = "当朱丽叶施放治疗时警报。"
	L.heal_message = "朱丽叶 施放治疗！"

	L.buff = "自身增益效果警报"
	L.buff_desc = "当罗密欧与朱丽叶获得增益效果时发出警报。"
	L.buff1_message = "罗密欧 获得 卤莽！"
	L.buff2_message = "朱丽叶 获得 虔诚光环！"
end

L = BigWigs:NewBossLocale("Shade of Aran", "zhCN")
if L then
	L.adds_bar = "召唤水元素"
	L.conjured_elemental = "被召唤的元素"

	L.drink = "群体变形"
	L.drink_desc = "当即将施放回魔时发出警报。"
	L.drink_warning = "低法力  即将回魔！"
	L.drink_message = "回魔  群体变形！"
	L.drink_bar = "群体变形术"
end

L = BigWigs:NewBossLocale("The Big Bad Wolf", "zhCN")
if L then
	L.name = "大灰狼"

	L.riding_bar = "快跑：%s"
end

L = BigWigs:NewBossLocale("The Crone", "zhCN")
if L then
	L.name = "巫婆"

	L.engage_trigger = "^啊，托托，我们必须找到回家的路！"

	L.spawns = "启动时间"
	L.spawns_desc = "每个角色激活时间计时。"
	L.spawns_warning = "%s 5秒后，开始攻击！"

	L.roar = "胆小的狮子"
	L.tinhead = "铁皮人"
	L.strawman = "稻草人"
	L.tito = "托托"
end

L = BigWigs:NewBossLocale("Hyakiss the Lurker", "zhCN")
if L then
	L.name = "潜伏者希亚其斯"
end

-- Outland

L = BigWigs:NewBossLocale("Doomwalker", "zhCN")
if L then
	L.name = "末日行者"

	L.engage_trigger = "停止前进。否则你们将被消灭。"

	L.overrun_desc = "当施放泛滥技能时发出警报。"

	L.earthquake_desc = "当施放地震术时发出警告。"
end

L = BigWigs:NewBossLocale("Doom Lord Kazzak", "zhCN")
if L then
	L.name = "末日领主卡扎克"

	L.engage_trigger1 = "军团将会征服一切！"
	L.engage_trigger2 = "所有的凡人都将灭亡！"
end

L = BigWigs:NewBossLocale("High King Maulgar", "zhCN")
if L then
	L.shield_message = "盲眼先知 真言术：盾！"
	L.spellshield_message = "克洛什 法术护盾！速度偷取"
	L.summon_message = "开始召唤 地狱犬！"
	L.summon_bar = "地狱犬"
	L.whirlwind_message = "莫加尔 - 旋风斩！15秒。"

	L.mage = "克洛什·火拳 (法师)"
	L.warlock = "召唤者沃尔姆 (术士)"
	L.priest = "盲眼先知 (牧师)"
end

L = BigWigs:NewBossLocale("Magtheridon", "zhCN")
if L then
	L.abyssal = "深渊燃魔"
	L.abyssal_desc = "当创造深渊燃魔时发出警报。"
	L.abyssal_message = "深渊燃魔：%d ！"

	L.heal = "治疗"
	L.heal_desc = "当地狱火导魔者施放治疗时发出警报。"
	L.heal_message = "黑暗愈合！"

	L.banish = "放逐术"
	L["30168_desc"] = "当你放逐玛瑟里顿时发出警报。"
	L.banished = "驱逐"

	L.debris_trigger = "我是不会轻易倒下的！让这座牢狱的墙壁颤抖并崩塌吧！"
end

-- Serpentshrine Cavern

L = BigWigs:NewBossLocale("Hydross the Unstable", "zhCN")
if L then
	L.start_trigger = "我不能允许你们介入！"

	L.mark = "印记"
	L.mark_desc = "显示印记警报及计数。"

	L.stance = "形态改变"
	L.stance_desc = "当毒性改变时发出警报。"
	L.poison_stance = "毒形态！"
	L.water_stance = "水形态！"

	L.debuff_warn = "印记施放于 %s%%！"
end

L = BigWigs:NewBossLocale("Fathom-Lord Karathress", "zhCN")
if L then
	L.enrage_trigger = "卫兵！提高警惕！我们有客人来了……"

	L.totem = "溅火图腾"
	L.totem_desc = "当施放溅火图腾时发出警报。"
	L.totem_message1 = "泰达维斯：溅火图腾！"
	L.totem_message2 = "卡拉瑟雷斯：溅火图腾！"
	L.heal_message = "卡莉蒂丝：施放治疗！"

	L.priest = "深水卫士卡莉蒂丝"
end

L = BigWigs:NewBossLocale("Leotheras the Blind", "zhCN")
if L then
	L.enrage_trigger = "我的放逐终于结束了！"

	L.phase = "恶魔形态"
	L.phase_desc = "恶魔形态计时。"
	L.phase_trigger = "滚开吧，脆弱的精灵。现在我说了算！"
	L.phase_demon = "恶魔形态！60秒。"
	L.phase_demonsoon = "5秒后，恶魔形态！"
	L.phase_normalsoon = "5秒后，正常形态！"
	L.phase_normal = "正常形态！"
	L.demon_bar = "恶魔形态"
	L.demon_nextbar = "下一恶魔阶段"

	L.mindcontrol = "精神控制"
	L.mindcontrol_desc = "当玩家受到精神控制时发出警报。"
	L.mindcontrol_warning = "精神控制"

	L.image = "镜像"
	L.image_desc = "当15%镜像分裂时发出警报。"
	L.image_trigger = "不……不！你在干什么？我才是主宰！你听到没有？我……啊啊啊啊！控制……不住了。"
	L.image_message = "15% - 镜像出现！"
	L.image_warning = "即将 镜像！"

	L.whisper = "心魔"
	L.whisper_desc = "当玩家受到心魔时发出警报。"
	L.whisper_message = "心魔"
	L.whisper_bar = "心魔消失"
	L.whisper_soon = "心魔 冷却！"
end

L = BigWigs:NewBossLocale("The Lurker Below", "zhCN")
if L then
	L.engage_warning = "%s 激活！90秒后，可能下潜！"

	L.dive = "下潜"
	L.dive_desc = "下潜计时条。"
	L.dive_warning = "约%d秒后，下潜！"
	L.dive_bar = "下潜"
	L.dive_message = "下潜！60秒后，重新出现。"

	L.spout = "喷涌"
	L.spout_desc = "喷涌计时条。"
	L.spout_message = "喷涌！注意躲避！"
	L.spout_warning = "约3秒后，可能喷涌！"
	L.spout_bar = "可能喷涌"

	L.emerge_warning = "%d秒后，出现！"
	L.emerge_message = "出现！90秒后，再次下潜！"
	L.emerge_bar = "出现"
end

L = BigWigs:NewBossLocale("Morogrim Tidewalker", "zhCN")
if L then
	L.grave_bar = "水之墓穴"
	L.grave_nextbar = "水之墓穴 冷却"

	L.murloc = "鱼群"
	L.murloc_desc = "当鱼群来临时发出警报。"
	L.murloc_bar = "鱼群 冷却"
	L.murloc_message = "鱼群 来临！"
	L.murloc_soon_message = "即将 鱼群！"
	L.murloc_engaged = "%s激活！约40秒后，鱼群出现！"

	L.globules = "水泡"
	L.globules_desc = "当水泡来临时发出警报。"
	L.globules_trigger1 = "很快就都结束了。"
	L.globules_trigger2 = "你们无处可逃！"
	L.globules_message = "水泡 来临！"
	L.globules_warning = "即将 水泡！"
	L.globules_bar = "水泡 消失"
end

L = BigWigs:NewBossLocale("Lady Vashj", "zhCN")
if L then
	L.engage_trigger1 = "我不想贬低自己来获取你的宽容，但是你让我别无选择……"
	L.engage_trigger2 = "我唾弃你们，地表的渣滓！"
	L.engage_trigger3 = "伊利丹大人必胜！"
	L.engage_trigger4 = "逃吧，否则就来受死！"
	L.engage_trigger5 = "入侵者都要受死！"
	L.engage_message = "进入第一阶段！"

	L.phase = "阶段警报"
	L.phase_desc = "当进入不同阶段时发出警报。"
	L.phase2_trigger = "机会来了！一个活口都不要留下！"
	L.phase2_soon_message = "即将 第二阶段！"
	L.phase2_message = "第二阶段 - 援兵 来临！"
	L.phase3_trigger = "你们最好找掩护。"
	L.phase3_message = "第三阶段 - 4分钟后，激怒！"

	L.elemental = "被污染的元素"
	L.elemental_desc = "在第二阶段，被污染的元素计时条。"
	L.elemental_bar = "被污染的元素 来临"
	L.elemental_soon_message = "被污染的元素 即将出现！"

	L.strider = "盘牙巡逻者"
	L.strider_desc = "在第二阶段，盘牙巡逻者计时条。"
	L.strider_bar = "巡逻者 来临"
	L.strider_soon_message = "盘牙巡逻者 即将出现！"

	L.naga = "盘牙精英"
	L.naga_desc = "在第二阶段，盘牙精英计时条。"
	L.naga_bar = "精英 来临"
	L.naga_soon_message = "盘牙精英 即将出现！"

	L.barrier_desc = "当护盾击碎发出警报。"
	L.barrier_down_message = "护盾 - %d/4 击碎！"
end

-- Sunwell Plateau

L = BigWigs:NewBossLocale("Kil'jaeden", "zhCN")
if L then
	L.bomb_cast = "即将 千魂之暗！"
	L.bomb_nextbar = "可能 千魂之暗"
	L.bomb_warning = "约10秒后，可能千魂之暗！"

	L.orb = "护盾宝珠"
	L.orb_desc = "当护盾宝珠施放暗影箭时发出警报。"
	L.orb_shooting = "护盾宝珠 - 暗影箭！"

	L.shield_up = "蓝龙之盾 启用！"
	L.deceiver_dies = "已杀死基尔加丹之手#%d"

	L.blueorb = "蓝龙宝珠"
	L.blueorb_desc = "当蓝龙宝珠可用时发出警报。"
	L.blueorb_message = "蓝龙宝珠已准备好！"

	L.kalec_yell = "我会将我的力量导入宝珠中！准备好！"
	L.kalec_yell2 = "我又将能量灌入了另一颗宝珠！快去使用它！"
	L.kalec_yell3 = "又有一颗宝珠准备好了！快点行动！"
	L.kalec_yell4 = "这是我所能做的一切了！力量现在掌握在你们的手中！"
	L.phase3_trigger = "我是不会失败的！这个世界注定要毁灭！"
	L.phase4_trigger = "别再抱有幻想了！你们不可能赢！"
	L.phase5_trigger = "啊啊啊！太阳之井的能量……开始……对抗我！你们都做了些什么？你们都做了些什么？？"
end

L = BigWigs:NewBossLocale("Felmyst", "zhCN")
if L then
	L.phase = "阶段警报"
	L.phase_desc = "当升空或降落阶段时发出警报。"

	L.airphase_trigger = "我比以前更强大了！"
	L.takeoff_bar = "升空"
	L.takeoff_message = "5秒后，升空！"

	L.landing_bar = "降落"
	L.landing_message = "10秒后，降落！"

	L.breath = "深呼吸"
	L.breath_desc = "当施放深呼吸时发出警报。"
end

L = BigWigs:NewBossLocale("Brutallus", "zhCN")
if L then
	L.engage_trigger = "啊，又来了一群小绵羊！"

	L.burnresist = "燃烧抵抗"
	L.burnresist_desc = "当玩家抵抗燃烧攻击发出警报。"
	L.burn_resist = "燃烧抵抗：%s！"
end

L = BigWigs:NewBossLocale("M'uru", "zhCN")
if L then
	L.sentinel = "虚空戒卫"
	L.sentinel_desc = "当虚空戒卫刷新时发出警报。"
	L.sentinel_next = "下一虚空戒卫：%d"

	L.humanoid = "暗誓精灵"
	L.humanoid_desc = "当暗誓精灵刷新时发出警报。"
	L.humanoid_next = "下一暗誓精灵：%d"
end

L = BigWigs:NewBossLocale("Kalecgos", "zhCN")
if L then
	L.engage_trigger = "啊！我不再是玛利苟斯的奴隶了！所有挑战我的人都要被消灭！"
	L.enrage_trigger = "萨索瓦尔将卡雷苟斯逼得狂暴不已！"

	L.sathrovarr = "腐蚀者萨索瓦尔"

	L.portal = "传送"
	L.portal_message = "5秒后,可能发动传送！"

	L.realm_desc = "当玩家在灵魂世界中发出警报."
	L.realm_message = "灵魂世界：%s!(%d 小队）"
	L.nobody = "没有人"

	L.curse = "诅咒"

	L.wild_magic_healing = "狂野魔法（治疗加成）"
	L.wild_magic_healing_desc = "当你从狂野魔法中获得治疗加成时发出警报。"
	L.wild_magic_healing_you = "狂野魔法 - 治疗效果加成！"

	L.wild_magic_casting = "狂野魔法（施法时间延长）"
	L.wild_magic_casting_desc = "当治疗从狂野魔法延长施法时间时发出警报。"
	L.wild_magic_casting_you = "狂野魔法 - 施法时间延长：你！"
	L.wild_magic_casting_other = "狂野魔法 - 施法时间延长：%s!"

	L.wild_magic_hit = "狂野魔法（降低命中率）"
	L.wild_magic_hit_desc = "当 MT 受到狂野魔法降低命中率时发出警报。"
	L.wild_magic_hit_you = "狂野魔法 - 命中率降低：你"
	L.wild_magic_hit_other = "狂野魔法 - 命中率降低：%s!"

	L.wild_magic_threat = "狂野魔法（增加仇恨）"
	L.wild_magic_threat_desc = "当你受到狂野魔法增加仇恨时发出警报。"
	L.wild_magic_threat_you = "狂野魔法 - 增加仇恨！"
end

L = BigWigs:NewBossLocale("The Eredar Twins", "zhCN")
if L then
	L.lady = "萨洛拉丝 #3:"
	L.lock = "奥蕾塞丝 #2:"

	L.threat = "仇恨"

	L.custom_on_threat = "仇恨信息框"
	L.custom_on_threat_desc = "奥蕾塞丝的仇恨显示在第2，萨洛拉丝显示在第3."
end

-- The Eye

L = BigWigs:NewBossLocale("Void Reaver", "zhCN")
if L then
	L.engage_trigger = "警报！消灭入侵者。"
end

L = BigWigs:NewBossLocale("High Astromancer Solarian", "zhCN")
if L then
	L.engage_trigger = "Tal anu'men no sin'dorei!"

	L.phase = "阶段"
	L.phase_desc = "阶段改变警报。"
	L.phase1_message = "第一阶段 - 约50秒后，分裂！"
	L.phase2_warning = "即将 第二阶段！"
	L.phase2_trigger = "^我受够了！现在我要让你们看看宇宙的愤怒！"
	L.phase2_message = "20% - 第二阶段！"

	L.wrath_other = "愤怒"

	L.split = "分裂"
	L.split_desc = "当分裂和增加救援时发出警报。"
	L.split_trigger1 = "我要让你们自以为是的错觉荡然无存！"
	L.split_trigger2 = "你们势单力薄！"
	L.split_bar = "下一分裂"
	L.split_warning = "约7秒后，分裂！"

	L.agent_warning = "分裂！ - 6秒后，日晷密探！"
	L.agent_bar = "日晷密探"
	L.priest_warning = "3秒后，日晷祭司/索兰莉安！"
	L.priest_bar = "日晷祭司/索兰莉安"
end

L = BigWigs:NewBossLocale("Kael'thas Sunstrider", "zhCN")
if L then
	L.engage_trigger = "魔法，能量，我的人民陷入其中不能自拔……自从太阳之井被摧毁之后就是如此。欢迎来到未来。真遗憾，你们无法阻止什么。没有人可以阻止我了！Selama ashal’anore！"
	L.engage_message = "第一阶段 - 四顾问！"

	L.gaze = "凝视"
	L.gaze_desc = "当亵渎者萨拉德雷凝视玩家时发出警报。"
	L.gaze_trigger = "凝视着"

	L.fear_soon_message = "即将 恐惧！"
	L.fear_message = "恐惧！"
	L.fear_bar = "恐惧 冷却"

	L.rebirth = "凤凰复生"
	L.rebirth_desc = "凤凰复生计时条。"
	L.rebirth_warning = "约5秒后，凤凰复生！"
	L.rebirth_bar = "凤凰重生"

	L.pyro = "炎爆术"
	L.pyro_desc = "显示60秒的炎爆术记时条。"
	L.pyro_trigger = "%s开始施放炎爆术！"
	L.pyro_warning = "5秒后，炎爆术！"
	L.pyro_message = "正在施放 炎爆术！"

	L.phase = "阶段警报"
	L.phase_desc = "每阶段首领来领发出警报。"
	L.thaladred_inc_trigger = "让我们来看看你们如何面对亵渎者萨拉德雷！ "
	L.sanguinar_inc_trigger = "你们击败了我最强大的顾问……但是没有人能战胜鲜血之锤。出来吧，萨古纳尔男爵！"
	L.capernian_inc_trigger = "卡波妮娅会很快解决你们的。"
	L.telonicus_inc_trigger = "干得不错。看来你们有能力挑战我的首席技师，塔隆尼库斯。"
	L.weapons_inc_trigger = "你们看，我的个人收藏中有许多武器……"
	L.phase3_trigger = "也许我确实低估了你们。虽然让你们同时面对我的四位顾问显得有些不公平，但是我的人民从来都没有得到过公平的待遇。我只是在以牙还牙。"
	L.phase4_trigger = "唉，有些时候，有些事情，必须得亲自解决才行。Balamore shanal！"

	L.flying_trigger = "我的心血是不会被你们轻易浪费的！我精心谋划的未来是不会被你们轻易破坏的！感受我真正的力量吧！"
	L.flying_message = "第五阶段 - 1分钟后引力失效！"

	L.weapons_inc_message = "第二阶段 - 准备与神器作战！"
	L.phase3_message = "第三阶段 - 四顾问复生！"
	L.phase4_message = "第四阶段 - 凯尔萨斯！"
	L.phase4_bar = "凯尔萨斯 来临"

	L.mc = "精神控制"
	L.mc_desc = "当玩家受到精神控制时发出警报。"

	L.revive_bar = "凤凰复活"
	L.revive_warning = "5秒后，凤凰复活！"

	L.dead_message = "%s死亡了。"

	L.capernian = "星术师卡波妮娅"
	L.sanguinar = "萨古纳尔男爵"
	L.telonicus = "首席技师塔隆尼库斯"
	L.thaladred = "亵渎者萨拉德雷"
end
