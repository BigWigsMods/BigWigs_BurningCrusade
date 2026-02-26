local L = BigWigs:NewBossLocale("Prince Malchezaar", "ruRU")
if not L then return end
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
