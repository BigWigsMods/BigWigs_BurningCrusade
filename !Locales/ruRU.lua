-- Black Temple

local L = BigWigs:NewBossLocale("High Warlord Naj'entus", "ruRU")
if L then
	L.start_trigger = "Вы умрете во имя леди Вайш!"
end

L = BigWigs:NewBossLocale("Supremus", "ruRU")
if L then
	L.normal_phase_trigger = "Супремус в гневе ударяет по земле!"
	L.kite_phase_trigger = "Земля начинает раскалываться!"
	--L.normal_phase = "Normal Phase"
	--L.kite_phase = "Kite Phase"
	--L.next_phase = "Next Phase"
end

L = BigWigs:NewBossLocale("Shade of Akama", "ruRU")
if L then
	--L.wipe_trigger = "No! Not yet!"
	--L.defender = "Defender" -- Ashtongue Defender
	--L.sorcerer = "Sorcerer" -- Ashtongue Sorcerer
	--L.adds_right = "Adds (Right)"
	--L.adds_left = "Adds (Left)"

	--L.engaged = "Shade of Akama Engaged"
end

L = BigWigs:NewBossLocale("Reliquary of Souls", "ruRU")
if L then
	--L.zero_mana = "Zero Mana"
	--L.zero_mana_desc = "Show the time it will take until the Essence of Desire has reduced everyones maximum mana to 0."
	--L.desire_start = "Essence of Desire - Zero Mana in 160 sec"
end

L = BigWigs:NewBossLocale("The Illidari Council", "ruRU")
if L then
	--L.veras = "Veras: %s"
	--L.malande = "Malande: %s"
	--L.gathios = "Gathios: %s"
	--L.zerevor = "Zerevor: %s"

	L.circle_heal_message = "Исцелен! - Следующее через ~20сек"
	L.circle_fail_message = "Прервал %s! - Следующее через ~12sec"

	--L.magical_immunity = "Immune to magical!"
	--L.physical_immunity = "Immune to physical!"
end

L = BigWigs:NewBossLocale("Illidan Stormrage", "ruRU")
if L then
	--L.barrage_bar = "Barrage"
	L.warmup_trigger = "Акама! Твое двуличие меня не удивляет. Мне давным-давно стоило уничтожить тебя и твоих уродливых собратьев."
end

-- Mount Hyjal

L = BigWigs:NewBossLocale("ArchimondeHyjal", "ruRU")
if L then
	L.engage_trigger = "Ваше сопротивление нас не остановит."
	L.grip_other = "Хватка"
	L.fear_message = "Страх! Следующий через ~ 42сек!"

	L.killable = "Becomes Killable"
end

L = BigWigs:NewBossLocale("Azgalor", "ruRU")
if L then
	L.howl_bar = "~перезарядка Воя"
	L.howl_message = "МАСС Молчание"
end

L = BigWigs:NewBossLocale("Kaz'rogal", "ruRU")
if L then
	L.mark_bar = "След Матка (%d)"
	L.mark_warn = "Метка через 5 сек!"
end

L = BigWigs:NewBossLocale("Hyjal Summit Trash", "ruRU")
if L then
	--L.waves = "Wave Warnings"
	--L.waves_desc = "Announce approximate warning messages for the next wave."

	L.ghoul = "Вурдалаков"
	L.fiend = "Некрорахнидов"
	L.abom = "Поганищ"
	L.necro = "Мрачных некроманта"
	L.banshee = "Банши"
	L.garg = "Горгулии"
	L.wyrm = "Ледяная змея"
	L.fel = "Ловчих Скверны"
	L.infernal = "Инферналов"
	L.one = "%d волна! %d %s"
	L.two = "%d волна! %d %s, %d %s"
	L.three = "%d волна! %d %s, %d %s, %d %s"
	L.four = "%d волна! %d %s, %d %s, %d %s, %d %s"
	L.five = "%d волна! %d %s, %d %s, %d %s, %d %s, %d %s"
	L.barWave = "до прихода %d волны"

	L.waveInc = "Идет %d волна!"
	L.message = "%s через ~%d сек!"
	L.waveMessage = "%d волна через ~%d сек!"
end

-- Karazhan

L = BigWigs:NewBossLocale("Prince Malchezaar", "ruRU")
if L then
	L.phase1_trigger = "Безумие привело вас сюда, ко мне. Я стану вашей погибелью!"
	L.phase2_trigger = "Простофили! Время – это пламя, в котором вы сгорите!"
	L.phase3_trigger = "Как ты можешь надеяться выстоять против такой ошеломляющей мощи?"

	L.infernal = "Инферналы"
	L.infernal_desc = "Показывает таймеры призыва Инферналов."
	L.infernal_bar = "Появление Инфернала"
	L.infernal_message = "Появление Инфернала! Адское Пламя через 5сек!"
	L.infernal_trigger1 = "но и всем подвластным мне легионам"
	L.infernal_trigger2 = "Безумие привело вас сюда"
end

L = BigWigs:NewBossLocale("Netherspite", "ruRU")
if L then
	L.phase1_message = "Назад - Дыхания Хаоса закончилось"
	L.phase1_bar = "возможен отвод"
	L.phase1_trigger = "%s издает крик, отступая, открывая путь Пустоте."
	L.phase2_message = "Ярость - скоро Дыхание Хаоса!"
	L.phase2_bar = "возможная Ярость"
	L.phase2_trigger = "%s впадает в предельную ярость!"
end

L = BigWigs:NewBossLocale("Nightbane Raid", "ruRU")
if L then
	L.name = "Ночная Погибель"

	L.airphase_trigger = "Жалкий гнус! Я изгоню тебя из воздуха!"
	L.airphase_message = "Полет!"
end

L = BigWigs:NewBossLocale("Romulo & Julianne", "ruRU")
if L then
	L.name = "Ромуло и Джулианна"

	L.phase1_message = "Акт I - Джулианна"
	L.phase2_message = "Акт II - Ромуло"
	L.phase3_message = "Акт III - Вместе"

	L.poison = "Яд"
	L.poison_desc = "Предупреждать о отравлении игроков."
	L.poison_message = "Отравлен"

	L.heal = "Исцеление"
	L.heal_desc = "Предупреждать когда Джульенна применяет Вечную привязанность."
	L.heal_message = "Джулианна выполняет Исцеление!"

	L.buff = "Сигнал о баффах"
	L.buff_desc = "Предупреждать когда Ромуло и Джульенна наносят положительные заклинания на себя."
	L.buff1_message = "Ромуло получил(а) Бесстрашие!"
	L.buff2_message = "Джулианна получил(а) Преданность!"
end

L = BigWigs:NewBossLocale("Shade of Aran", "ruRU")
if L then
	L.adds_bar = "Исчезновение Элементалей"
	L.conjured_elemental = "Сотворенный элементаль"

	L.drink = "Выпивание"
	L.drink_desc = "Предупреждать когда Аран начинает Выпивание."
	L.drink_warning = "Мало маны - Скоро Выпивание!"
	L.drink_message = "Выпивание - Масс Превращение"
	L.drink_bar = "Надвигается Огненная глыба"
end

L = BigWigs:NewBossLocale("The Big Bad Wolf", "ruRU")
if L then
	L.name = "Злой и страшный серый волк"

	L.riding_bar = "%s БЕГИ!!!"
end

L = BigWigs:NewBossLocale("The Crone", "ruRU")
if L then
	L.name = "Ведьма"

	L.engage_trigger = "^О, Тито, нам просто надо найти дорогу домой!"

	L.spawns = "Таймер появления"
	L.spawns_desc = "Таймеры активации персонажей."
	L.spawns_warning = "%s через 5 сек"

	L.roar = "Хохотун"
	L.tinhead = "Медноголовый"
	L.strawman = "Балбес"
	L.tito = "Тито"
end

L = BigWigs:NewBossLocale("Hyakiss the Lurker", "ruRU")
if L then
	L.name = "Хиакисс Скрытень"
end

-- Outland

L = BigWigs:NewBossLocale("Doomwalker", "ruRU")
if L then
	L.name = "Судьболом"

	L.engage_trigger = "Не продолжайте. Вы будете уничтожены."

	--L.overrun_desc = "Alert when Doomwalker uses his Overrun ability."

	--L.earthquake_desc = "Alert when Doomwalker uses his Earthquake ability."
end

L = BigWigs:NewBossLocale("Doom Lord Kazzak", "ruRU")
if L then
	L.name = "Владыка Судеб Каззак"

	--L.engage_trigger1 = "The Legion will conquer all!"
	--L.engage_trigger2 = "All mortals will perish!"
end

L = BigWigs:NewBossLocale("High King Maulgar", "ruRU")
if L then
	L.shield_message = "Щит на Слепоглазе!"
	L.spellshield_message = "Щит заклятий на Кроше!"
	L.summon_message = "Призван Охотник Скверны!"
	L.summon_bar = "Охотник Скверны"
	L.whirlwind_message = "Молгар - Вихрь через 15сек!"

	L.mage = "Крош Огненная Рука (Маг)"
	L.warlock = "Олм Созывающий (Чернокнижник)"
	L.priest = "Слепоглаз Ясновидец (Жрец)"
end

L = BigWigs:NewBossLocale("Magtheridon", "ruRU")
if L then
	L.abyssal = "Горящий дух Бездны"
	L.abyssal_desc = "Предупреждать о создании Горящего духа Бездны."
	L.abyssal_message = "Горящий дух Бездны (%d)"

	L.heal = "Исцеление"
	L.heal_desc = "Предупреждать когда Чаротворцы начинают Исцелять."
	L.heal_message = "Исцеление!"

	L.banish = "Изгнание"
	L["30168_desc"] = "Предупреждать о Изгнании Магтеридона."
	L.banished = "Изгнание"

	L.debris_trigger = "Пусть стены темницы содрогнутся"
end

-- Serpentshrine Cavern

L = BigWigs:NewBossLocale("Hydross the Unstable", "ruRU")
if L then
end

L = BigWigs:NewBossLocale("Fathom-Lord Karathress", "ruRU")
if L then
end

L = BigWigs:NewBossLocale("Leotheras the Blind", "ruRU")
if L then
	L.enrage_trigger = "Наконец-то завершается мое изгнание!"

	L.phase = "Фаза Демона"
	L.phase_desc = "Примерные таймеры Фазы Демона."
	L.phase_trigger = "Уйди, эльфийская мелюзга. Я теперь контролирую ситуацию!"
	L.phase_demon = "Фаза демона в течении 60 сек"
	L.phase_demonsoon = "Фаза демона через 5 сек!"
	L.phase_normalsoon = "Нормальная Фаза через 5 сек"
	L.phase_normal = "Нормальная Фаза!"
	L.demon_bar = "Фаза Демона"
	L.demon_nextbar = "След. Фаза Демона"

	L.mindcontrol = "Контроль над разумом"
	L.mindcontrol_desc = "Предупреждать о том у кого законтролирован разум."
	L.mindcontrol_warning = "Контроль разума"

	L.image = "Изображение"
	L.image_desc = "Тревога на 15%  при расколе изображения."
	L.image_trigger = "Нет… нет! Что ты делаешь? Я господин! Ты меня слышишь? Я… а! Не могу… его сдержать."
	L.image_message = "15% - Изображение Создано!"
	L.image_warning = "Скоро Изображение!"

	L.whisper = "Коварный шепот"
	L.whisper_desc = "Предупреждать когда игрок получает Коварный шепот."
	L.whisper_message = "Демон"
	L.whisper_bar = "Исчезновение Демонов"
	L.whisper_soon = "~перезарядка Демона"
end

L = BigWigs:NewBossLocale("The Lurker Below", "ruRU")
if L then
end

L = BigWigs:NewBossLocale("Morogrim Tidewalker", "ruRU")
if L then
end

L = BigWigs:NewBossLocale("Lady Vashj", "ruRU")
if L then
	L.engage_trigger1 = "I did not wish to lower myself by engaging your kind, but you leave me little choice..."
	L.engage_trigger2 = "Да плевать я на тебя хотела, мразь!"
	L.engage_trigger3 = "Победа владыки Иллидана! "
	L.engage_trigger4 = "Да я тебя развалю от носа до кормы!"
	L.engage_trigger5 = "Смерть непосвященным!"
	L.engage_message = "Начинается фаза 1"

	L.phase = "Предупреждение о фазах"
	L.phase_desc = "Предупреждать о переходе Вайш в различные фазы."
	L.phase2_trigger = "Время пришло! Не оставляйте никого в живых!"
	L.phase2_soon_message = "Скоро фаза 2!"
	L.phase2_message = "Фаза 2, спавн мобов!"
	L.phase3_trigger = "Вам может потребоваться укрытие. "
	L.phase3_message = "Фаза 3 - исступление через 4 мин!"

	L.elemental = "Появление нечистого элементаля"
	L.elemental_desc = "Предупреждать о появлении нечистого элементаля во время фазы 2."
	L.elemental_bar = "Нечистый элементаль появляется"
	L.elemental_soon_message = "Скоро Нечистый элементаль!"

	L.strider = "Появление страйдеров"
	L.strider_desc = "Предупреждать о появлении Страйдеров в фазе 2."
	L.strider_bar = "Страйдер появляется"
	L.strider_soon_message = "Скоро Страйдер!"

	L.naga = "Появление элитных Наг"
	L.naga_desc = "Предупреждать о появлении элитных Наг в фазе 2."
	L.naga_bar = "Нага появляется"
	L.naga_soon_message = "Скоро Нага!"

	L.barrier_desc = "Предупреждать о разрушении барьеров."
	L.barrier_down_message = "Барьер %d/4 разрушен!"
end

-- Sunwell Plateau

L = BigWigs:NewBossLocale("Kil'jaeden", "ruRU")
if L then
	L.bomb_cast = "Скоро взрыв"
	L.bomb_nextbar = "~ Возможен взрыв"
	L.bomb_warning = "Возможен взрыв ~10 секунд"

	L.orb = "Щитовая сфера"
	L.orb_desc = "Предупреждение о залпе Стрел Тьмы из сферы"
	L.orb_shooting = "Начат обстрел сферой"

	L.shield_up = "Щит поднят!"
	L.deceiver_dies = "Рука Искусителя #%d убита"

	L.blueorb = "Сила Синих драконов"
	L.blueorb_desc = "Предупреждают о появлении Силы Синих Драконов"
	L.blueorb_message = "Сила Синих Драконов готова!"

	L.kalec_yell = "Я наполню сферы своей энергией! Готовьтесь!"
	L.kalec_yell2 = "Я наполнил энергией еще одну сферу! Быстрее используйте ее!"
	L.kalec_yell3 = "Готова еще одна сфера! Торопитесь!"
	L.kalec_yell4 = "Я отдал все, что мог. Моя энергия в ваших руках!"
	L.phase3_trigger = "Никто не остановит меня! Этот мир падет!"
	L.phase4_trigger = "Не стоит тешить себя ложной надеждой! Вам не победить!"
	L.phase5_trigger = "Ахх!.. Сила Солнечного Колодца... обратилась... против меня! Что вы наделали? Что вы наделали?!"
end

L = BigWigs:NewBossLocale("Felmyst", "ruRU")
if L then
	L.phase = "Фазы"
	L.phase_desc = "Предупреждение о смене фаз"
	L.airphase_trigger = "Я сильнее, чем когда-либо прежде!"
	L.takeoff_bar = "Взлет"
	L.takeoff_message = "Взлет через 5 секунд!"
	L.landing_bar = "Посадка"
	L.landing_message = "Посадка через 10 секунд!"

	L.breath = "Дыхание"
	L.breath_desc = "Предупреждение о дыхании."
end

L = BigWigs:NewBossLocale("Brutallus", "ruRU")
if L then
	L.engage_trigger = "Аа, новые овечки на заклание?"

	L.burnresist = "Сопротивление Палящему Пламени"
	L.burnresist_desc = "Предупреждать Вас о тех, кто сопротивлении Палящему Пламени."
	L.burn_resist = "%s сопротивляется Палящему Пламени"
end

L = BigWigs:NewBossLocale("M'uru", "ruRU")
if L then
	L.sentinel = "Часовой бездны"
	L.sentinel_desc = "Предупреждать о появлении Часового Бездны."
	L.sentinel_next = "%d-й Часовой Бездны"

	L.humanoid = "Воины клана Темного Меча"
	L.humanoid_desc = "Предупреждать о приходе воинов клана Темного Меча."
	L.humanoid_next = "Воины Темного Меча (%d)"
end

L = BigWigs:NewBossLocale("Kalecgos", "ruRU")
if L then
	L.engage_trigger = "Аххх! Я больше никогда не буду рабом Малигоса! Осмелься бросить мне вызов – и я уничтожу тебя!"
	L.enrage_trigger = "Сатроварр приводит Калесгоса в бешеную ярость!"

	L.sathrovarr = "Сатроварр Осквернитель"

	L.portal = "Портал"
	L.portal_message = "Через 5 секунд возможен Портал!"

	L.realm_desc = "Показывать Вам игроков, затянутых в Спектральную Реальность."
	L.realm_message = "Призрачный мир: %s (Групповой %d)"
	L.nobody = "Никто"

	L.curse = "Проклятье"

	L.wild_magic_healing = "Дикая Магия (Увеличение Исцеления)"
	L.wild_magic_healing_desc = "Предупреждать, когда Вы получите эффект Увеличения Исцеления от Дикой Магии."
	L.wild_magic_healing_you = "Дикая Магия - Эффекты лечения увеличены!"

	L.wild_magic_casting = "Дикая Магия (Замедление заклинаний)"
	L.wild_magic_casting_desc = "Предупреждать когда ваши целители получают Эффект Замедления от  Дикой Магии."
	L.wild_magic_casting_you = "Дикая Магия - Ваши заклинания замедленны!"
	L.wild_magic_casting_other = "Дикая Магия - %s замедляет чтение заклинаний!"

	L.wild_magic_hit = "Дикая Магия (Понижен шанс попадания)"
	L.wild_magic_hit_desc = "Предупреждать когда у танка снижается шанс попадания от Дикой Магии."
	L.wild_magic_hit_you = "Дикая Магия - Ваш шанс попадания понижен!"
	L.wild_magic_hit_other = "Дикая Магия - %s начинает промахиваться по цели!"

	L.wild_magic_threat = "Дикая Магия (Увеличенная угроза)"
	L.wild_magic_threat_desc = "Предупреждать когда Ваша угроза повышается от Дикой Магии."
	L.wild_magic_threat_you = "Дикая Магия - Вы создаете повышенную угрозу!"
end

L = BigWigs:NewBossLocale("The Eredar Twins", "ruRU")
if L then
	L.lady = "Сакролаш #3:"
	L.lock = "Алитесса #2:"

	L.threat = "Угроза"

	--L.custom_on_threat = "Threat InfoBox"
	--L.custom_on_threat_desc = "Show second on threat for Grand Warlock Alythess and third on threat for Lady Sacrolash."
end

-- The Eye

L = BigWigs:NewBossLocale("Void Reaver", "ruRU")
if L then
	L.engage_trigger = "Тревога! Ты отмечен для уничтожения."
end

L = BigWigs:NewBossLocale("High Astromancer Solarian", "ruRU")
if L then
	--L.engage_trigger = "Tal anu'men no sin'dorei!"

	--L.phase = "Phase"
	--L.phase_desc = "Warn for phase changes."
	--L.phase1_message = "Phase 1 - Split in ~50sec"
	--L.phase2_warning = "Phase 2 Soon!"
	--L.phase2_trigger = "^I become"
	--L.phase2_message = "20% - Phase 2"

	--L.wrath_other = "Wrath"

	--L.split = "Split"
	--L.split_desc = "Warn for split & add spawn."
	--L.split_trigger1 = "I will crush your delusions of grandeur!"
	--L.split_trigger2 = "You are hopelessly outmatched!"
	--L.split_bar = "~Next Split"
	--L.split_warning = "Split in ~7 sec"

	--L.agent_warning = "Split! - Agents in 6 sec"
	--L.agent_bar = "Agents"
	--L.priest_warning = "Priests/Solarian in 3 sec"
	--L.priest_bar = "Priests/Solarian"
end

L = BigWigs:NewBossLocale("Kael'thas Sunstrider", "ruRU")
if L then
	L.engage_trigger = "^Сила. Могущество"
	L.engage_message = "Phase 1"

	L.gaze = "Gaze"
	L.gaze_desc = "Warn when Thaladred focuses on a player."
	L.gaze_trigger = "sets eyes"

	L.fear_soon_message = "Fear soon!"
	L.fear_message = "Fear!"
	L.fear_bar = "~Fear Cooldown"

	L.rebirth = "Phoenix Rebirth"
	L.rebirth_desc = "Approximate Phoenix Rebirth timers."
	L.rebirth_warning = "Possible Rebirth in ~5sec!"
	L.rebirth_bar = "~Possible Rebirth"

	L.pyro = "Pyroblast"
	L.pyro_desc = "Show a 60 second timer for Pyroblast"
	L.pyro_trigger = "%s begins to cast Pyroblast!"
	L.pyro_warning = "Pyroblast in 5sec!"
	L.pyro_message = "Casting Pyroblast!"

	L.phase = "Phase warnings"
	L.phase_desc = "Warn about the various phases of the encounter."
	L.thaladred_inc_trigger = "Посмотрим, как выдержат ваши нервы протви Затемнителя, Таладред!"
	L.sanguinar_inc_trigger = "Вы сумели противостоять кое-кому из моих лучших советников... но никто не может выдержать мощи Молота Кров. Узрите же лорда Сангвинара!"
	L.capernian_inc_trigger = "Каперниан позаботится о том, чтобы ваше пребывание здесь было кратковременным."
	L.telonicus_inc_trigger = "Well done, you have proven worthy to test your skills against my master engineer, Telonicus."
	L.weapons_inc_trigger = "Как видите, у меня в арсенале много оружия."
	L.phase3_trigger = "Возможно, я недооценил вас. Было бы нечестно заставлять вас драться со всеми четырьмя советниками одновременно, но... по отношению к моему народу никто и никогда не поступал честно. Так что я лишь возвращаю должок."
	L.phase4_trigger = "Увы, иногда приходится решать проблемы самостоятельно. Баламоре шаналь!"

	L.flying_trigger = "I have not come this far to be stopped! The future I have planned will not be jeopardized! Now you will taste true power!!"
	L.flying_message = "Phase 5 - Gravity Lapse in 1min"

	L.weapons_inc_message = "Phase 2 - Weapons incoming!"
	L.phase3_message = "Phase 3 - Advisors and Weapons!"
	L.phase4_message = "Phase 4 - Kael'thas incoming!"
	L.phase4_bar = "Kael'thas incoming"

	L.mc = "Mind Control"
	L.mc_desc = "Warn who has Mind Control."

	L.revive_bar = "Adds Revived"
	L.revive_warning = "Adds Revived in 5sec!"

	L.dead_message = "%s dies"

	L.capernian = "Верховный звездочет Каперниан"
	L.sanguinar = "Лорд Сангвинар"
	L.telonicus = "Старший инженер Телоникус"
	L.thaladred = "Таладред Светокрад"
end
