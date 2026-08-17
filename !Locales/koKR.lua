-- Black Temple

local L = BigWigs:NewBossLocale("High Warlord Naj'entus", "koKR")
if L then
	L.start_trigger = "여군주 바쉬의 이름으로 사형에 처하노라!"
end

L = BigWigs:NewBossLocale("Supremus", "koKR")
if L then
	L.normal_phase_trigger =  "궁극의 심연이 분노하여 땅을 내리찍습니다!"
	L.kite_phase_trigger = "땅이 갈라져서 열리기 시작합니다!"
	L.normal_phase = "보통 단계"
	L.kite_phase = "유도 단계"
	L.next_phase = "다음 단계"
end

L = BigWigs:NewBossLocale("Shade of Akama", "koKR")
if L then
	L.wipe_trigger = "아직은! 안돼!"
	L.defender = "수호병" -- Ashtongue Defender
	L.sorcerer = "사술사" -- Ashtongue Sorcerer
	L.adds_right = "몹 추가 (오른쪽)"
	L.adds_left = "몹 추가 (왼쪽)"

	L.engaged = "아카마의 망령 전투 시작"
end

L = BigWigs:NewBossLocale("Reliquary of Souls", "koKR")
if L then
	L.zero_mana = "마나 0"
	L.zero_mana_desc = "욕망의 정수가 모두의 최대 마나를 0으로 감소시키기 까지의 시간을 표시합니다."
	L.desire_start = "욕망의 정수 - 160초 후 마나 0"
end

L = BigWigs:NewBossLocale("The Illidari Council", "koKR")
if L then
	L.veras = "베라스: %s"
	L.malande = "말란데: %s"
	L.gathios = "가디오스: %s"
	L.zerevor = "제레보르: %s"

	L.circle_heal_message = "치유됨! - 다음은 약 20초 후"

	L.magical_immunity = "마법 공격에 면역!"
	L.physical_immunity = "물리 공격에 면역!"
end

L = BigWigs:NewBossLocale("Illidan Stormrage", "koKR")
if L then
	L.barrage_bar = "집중포화"
	L.warmup_trigger = "아카마, 너의 불충은 그리 놀랍지도 않구나. 너희 흉측한 형제들을 벌써 오래전에 없애버렸어야 했는데..."
end

-- Mount Hyjal

L = BigWigs:NewBossLocale("ArchimondeHyjal", "koKR")
if L then
	L.engage_trigger = "아무리 저항해도 소용없다!"
	L.grip_other = "손아귀"
	L.fear_message = "공포, 다음은 약 ~42초 이내!"

	L.killable = "Becomes Killable"
end

L = BigWigs:NewBossLocale("Azgalor", "koKR")
if L then
	L.howl_bar = "~침묵 대기시간"
	L.howl_message = "광역 침묵"
end

L = BigWigs:NewBossLocale("Kaz'rogal", "koKR")
if L then
	L.mark_bar = "다음 징표 (%d)"
	L.mark_warn = "5초 이내 징표!"
end

L = BigWigs:NewBossLocale("Hyjal Summit Trash", "koKR")
if L then
	L.waves = "공격 경고"
	L.waves_desc = "다음 공격에 대한 접근 경고 메세지를 알립니다."

	L.ghoul = "구울"
	L.fiend = "지하마귀"
	L.abom = "누더기골렘"
	L.necro = "어둠의 강령술사"
	L.banshee = "밴시"
	L.garg = "가고일"
	L.wyrm = "서리고룡"
	L.fel = "지옥사냥개"
	L.infernal = "거대한 지옥불정령"
	L.one = "%d번째 공격! %d %s"
	L.two = "%d번째 공격! %d %s, %d %s"
	L.three = "%d번째 공격! %d %s, %d %s, %d %s"
	L.four = "%d번째 공격! %d %s, %d %s, %d %s, %d %s"
	L.five = "%d번째 공격! %d %s, %d %s, %d %s, %d %s, %d %s"
	L.barWave = "%d번째 공격 등장"

	L.waveInc = "%d번째 공격 시작!"
	L.message = "%s 약 %d초 이내!"
	L.waveMessage = "%d번째 공격! 약 %d초 이내"
end

-- Karazhan

L = BigWigs:NewBossLocale("Prince Malchezaar", "koKR")
if L then
	L.phase1_trigger = "여기까지 오다니 정신이 나간 놈들이 분명하구나. 소원이라면 파멸을 시켜주마!"
	L.phase2_trigger = "바보 같으니! 시간은 너의 몸을 태우는 불길이 되리라!"
	L.phase3_trigger = "어찌 감히 이렇게 압도적인 힘에 맞서기를 꿈꾸느냐?"

	L.infernal = "불지옥"
	L.infernal_desc = "불지옥 소환에 대한 재사용 대기시간을 표시합니다."
	L.infernal_bar = "불지옥 등장"
	L.infernal_message = "불지옥 등장! 5초 이내 지옥불!"
	L.infernal_trigger1 = "너희는 나의 군대와 맞서야 한다"
	L.infernal_trigger2 = "모든 차원과 실체가 나를 향해 열려 있노라"
end

L = BigWigs:NewBossLocale("Netherspite", "koKR")
if L then
	L.phase1_message = "물러남 - 황천의 숨결 종료!"
	L.phase1_bar = "물러남 주의"
	L.phase1_trigger = "%s|1이;가; 물러나며 고함을 지르더니 황천의 문을 엽니다."
	L.phase2_message = "분노 - 황천의 숨결 시전!"
	L.phase2_bar = "분노 주의"
	L.phase2_trigger = "%s|1이;가; 황천의 기운을 받고 분노에 휩싸입니다!"
end

L = BigWigs:NewBossLocale("Nightbane Raid", "koKR")
if L then
	L.name = "파멸의 어둠"

	L.airphase_trigger = "이 더러운 기생충들, 내가 하늘에서 너희의 씨를 말리리라!"
	L.airphase_message = "비행!"
end

L = BigWigs:NewBossLocale("Romulo & Julianne", "koKR")
if L then
	L.name = "로밀로 & 줄리엔"

	L.phase1_message = "1 단계 - 줄리엔"
	L.phase2_message = "2 단계 - 로밀로"
	L.phase3_message = "3 단계 - 모두"

	L.poison = "독"
	L.poison_desc = "독에 걸린 플레이어를 알립니다."
	L.poison_message = "중독"

	L.heal = "치유"
	L.heal_desc = "줄리엔이 영원한 사랑 시전 시 경고합니다."
	L.heal_message = "줄리엔 치유 시전 중!"

	L.buff = "버프 알림"
	L.buff_desc = "로밀로와 줄리엔이 버프 획득 시 알립니다."
	L.buff1_message = "로밀로 사랑의 용기 효과 얻음!"
	L.buff2_message = "줄리엔 헌신 효과 얻음!"
end

L = BigWigs:NewBossLocale("Shade of Aran", "koKR")
if L then
	L.adds_bar = "물의 정령"
	L.conjured_elemental = "창조된 정령"

	L.drink = "음료 마시기"
	L.drink_desc = "아란의 망령의 음료 마시기 시작 시 알립니다."
	L.drink_warning = "마나 낮음 - 잠시 후 음료 마시기!"
	L.drink_message = "음료 마시기 - 광역 변이!"
	L.drink_bar = "불덩이 작열 시전"
end

L = BigWigs:NewBossLocale("The Big Bad Wolf", "koKR")
if L then
	L.name = "커다란 나쁜 늑대"

	L.riding_bar = "빨간 두건 - %s"
end

L = BigWigs:NewBossLocale("The Crone", "koKR")
if L then
	L.name = "마녀"

	L.engage_trigger = "^티토야, 우린 집으로 갈 방법을 찾아야 해!"

	L.spawns = "등장 타이머"
	L.spawns_desc = "피조물 활동 시작에 대한 타이머입니다."
	L.spawns_warning = "5초 이내 %s"

	L.roar = "어흥이"
	L.tinhead = "양철나무꾼"
	L.strawman = "허수아비"
	L.tito = "티토"
end

L = BigWigs:NewBossLocale("Hyakiss the Lurker", "koKR")
if L then
	L.name = "잠복꾼 히아키스"
end

-- Outland

L = BigWigs:NewBossLocale("Doomwalker", "koKR")
if L then
	L.name = "파멸의 절단기"

	L.engage_trigger = "접근 금지. 너희는 제거될 것이다."

	L.overrun_desc = "파멸의 절단기의 괴멸 사용 가능 시 경고합니다."

	L.earthquake_desc = "파멸의 절단기의 지진 사용 가능 시 경고합니다."
end

L = BigWigs:NewBossLocale("Doom Lord Kazzak", "koKR")
if L then
	L.name = "파멸의 군주 카자크"

	L.engage_trigger1 = "불타는 군단이 온 세상을 지배하리라!"
	L.engage_trigger2 = "필멸의 종족은 모두 멸망하리라!"
end

L = BigWigs:NewBossLocale("High King Maulgar", "koKR")
if L then
	L.shield_message = "블라인드아이 보호막!"
	L.spellshield_message = "크로쉬 주문 보호막!"
	L.summon_message = "지옥사냥개 소환!"
	L.summon_bar = "지옥사냥개"
	L.whirlwind_message = "마울가르 - 15초간 소용돌이!"

	L.mage = "크로쉬 파이어핸드 (마법사)"
	L.warlock = "소환사 올름 (흑마법사)"
	L.priest = "현자 블라인드아이 (사제)"
end

L = BigWigs:NewBossLocale("Magtheridon", "koKR")
if L then
	L.abyssal = "불타는 심연"
	L.abyssal_desc = "불타는 심연 생성 시 경고합니다."
	L.abyssal_message = "불타는 심연 생성 (%d)"

	L.heal = "치유"
	L.heal_desc = "지옥불 역술사 치유 시전 시 경고합니다."
	L.heal_message = "치유 시전!"

	L.banish = "추방"
	L["30168_desc"] = "마그테리돈 추방 시 알립니다."
	L.banished = "추방됨"

	L.debris_trigger = "그렇게 쉽게 당할 내가 아니다! 이 감옥의 벽이 흔들리고... 무너지리라!"
end

-- Serpentshrine Cavern

L = BigWigs:NewBossLocale("Hydross the Unstable", "koKR")
if L then
	L.start_trigger = "방해하도록 놔두지 않겠습니다!"

	L.mark = "징표"
	L.mark_desc = "징표에 대한 경고와 카운터를 표시합니다."

	L.stance = "태세 변경"
	L.stance_desc = "불안정한 히드로스의 태세 변경 시 경고합니다."
	L.poison_stance = "히드로스 오염!"
	L.water_stance = "히드로스 정화!"

	L.debuff_warn = "징표 - %s%%!"
end

L = BigWigs:NewBossLocale("Fathom-Lord Karathress", "koKR")
if L then
	L.enrage_trigger = "경비병! 여기 침입자들이 있다..."

	L.totem = "불 뿜는 토템"
	L.totem_desc = "불 뿜는 토템을 시전 시 경고합니다."
	L.totem_message1 = "타이달베스: 불뿜는 토템"
	L.totem_message2 = "카라드레스: 불뿜는 토템"
	L.heal_message = "카리브디스 치유 시전!"

	L.priest = "심연의 경비병 카리브디스"
end

L = BigWigs:NewBossLocale("Leotheras the Blind", "koKR")
if L then
	L.enrage_trigger = "드디어, 내가 풀려났도다!"

	L.phase = "악마 형상"
	L.phase_desc = "악마 형상 예측 타이머입니다."
	L.phase_trigger = "꺼져라, 엘프 꼬맹이. 지금부터는 내가 주인이다!"
	L.phase_demon = "60초간 악마 형상"
	L.phase_demonsoon = "악마 형상 5초 전!"
	L.phase_normalsoon = "보통 형상 5초 전"
	L.phase_normal = "보통 형상!"
	L.demon_bar = "악마 형상"
	L.demon_nextbar = "다음 악마 형상"

	L.mindcontrol = "정신 지배"
	L.mindcontrol_desc = "정신 지배에 걸린 플레이어를 알립니다."
	L.mindcontrol_warning = "정신 지배"

	L.image = "이미지"
	L.image_desc = "15% 이미지 분리에 대한 경고입니다."
	L.image_trigger = "안 돼... 안 돼! 무슨 짓이냐? 내가 주인이야! 내 말 듣지 못해? 나란 말이야! 내가... 으아악! 놈을 억누를 수... 없... 어."
	L.image_message = "15% - 이미지 생성!"
	L.image_warning = "곧 이미지!"

	L.whisper = "음흉한 속삭임"
	L.whisper_desc = "음흉한 속삭임에 걸린 플레이어를 알립니다."
	L.whisper_message = "악마"
	L.whisper_bar = "악마 사라짐"
	L.whisper_soon = "~악마 대기시간"
end

L = BigWigs:NewBossLocale("The Lurker Below", "koKR")
if L then
	L.engage_warning = "%s 전투 시작 - 90초 이내 잠수"

	L.dive = "잠수"
	L.dive_desc = "심연의 잠복꾼 잠수 시 타이머입니다."
	L.dive_warning = "%d초 이내 잠수!"
	L.dive_bar = "~잠수"
	L.dive_message = "잠수 - 60초 이내 출현"

	L.spout = "분출"
	L.spout_desc = "분출에 대한 타이머입니다. 항상 정확하지 않을 수 있습니다."
	L.spout_message = "분출 시전 중!"
	L.spout_warning = "약 3초 이내 분출!"
	L.spout_bar = "분출 가능"

	L.emerge_warning = "%d초 이내 출현"
	L.emerge_message = "출현 - 90초 이내 잠수"
	L.emerge_bar = "출현"
end

L = BigWigs:NewBossLocale("Morogrim Tidewalker", "koKR")
if L then
	L.grave_bar = "<수중 무덤>"
	L.grave_nextbar = "~무덤 대기시간"

	L.murloc = "멀록"
	L.murloc_desc = "멀록 등장에 대한 경고입니다."
	L.murloc_bar = "~멀록 등장 대기시간"
	L.murloc_message = "멀록 등장!"
	L.murloc_soon_message = "잠시 후 멀록 등장!"
	L.murloc_engaged = "%s 전투 시작, 약 40초 후 멀록"

	L.globules = "물방울"
	L.globules_desc = "물방울 등장에 대한 경고입니다."
	L.globules_trigger1 = "곧 끝장내주마!"
	L.globules_trigger2 = "숨을 곳은 아무 데도 없다!"
	L.globules_message = "물방울 등장!"
	L.globules_warning = "잠시 후 물방울!"
	L.globules_bar = "물방울 사라짐"
end

L = BigWigs:NewBossLocale("Lady Vashj", "koKR")
if L then
	L.engage_trigger1 = "천한 놈들을 상대하며 품위를 손상시키고 싶진 않았는데... 제 손으로 무덤을 파는구나."
	L.engage_trigger2 = "육지에 사는 더러운 놈들같으니!"
	L.engage_trigger3 = "일리단 군주님께 승리를!"
	L.engage_trigger4 = "머리부터 발끝까지 성치 못할 줄 알아라!"
	L.engage_trigger5 = "침입자들에게 죽음을!"
	L.engage_message = "1단계 시작"

	L.phase = "단계 경고"
	L.phase_desc = "바쉬가 다음 단계로 변경 시 알림니다."
	L.phase2_trigger = "때가 왔다! 한 놈도 살려두지 마라!"
	L.phase2_soon_message = "잠시 후 2 단계!"
	L.phase2_message = "2 단계, 4 종류의 몹 등장!"
	L.phase3_trigger = "숨을 곳이나 마련해 둬라!"
	L.phase3_message = "3 단계 - 4분 이내 격노!"

	L.elemental = "오염된 정령 등장"
	L.elemental_desc = "2 단계에서 오염된 정령 등장 시 경고합니다."
	L.elemental_bar = "오염된 정령 등장"
	L.elemental_soon_message = "잠시 후 오염된 정령!"

	L.strider = "포자손 등장"
	L.strider_desc = "2 단계에서 포자손 등장 시 경고합니다."
	L.strider_bar = "포자손 등장"
	L.strider_soon_message = "잠시 후 포자손!"

	L.naga = "갈퀴송곳니 정예병 나가 등장"
	L.naga_desc = "2 단계에서 갈퀴송곳니 정예병 나가 등장 시 경고합니다."
	L.naga_bar = "갈퀴송곳니 정예병 등장"
	L.naga_soon_message = "잠시 후 정예병!"

	L.barrier_desc = "보호막 손실 시 알립니다."
	L.barrier_down_message = "보호막 %d/4 손실!"
end

-- Sunwell Plateau

L = BigWigs:NewBossLocale("Kil'jaeden", "koKR")
if L then
	L.bomb_cast = "잠시 후 큰 폭탄!"
	L.bomb_nextbar = "~폭탄 가능"
	L.bomb_warning = "약 10초 이내 폭탄 가능!"

	L.orb = "보호의 구슬"
	L.orb_desc = "보호의 구슬의 어둠 화살을 알립니다."
	L.orb_shooting = "구슬 활동 - 어활 공격!"

	L.shield_up = "푸른용의 보호막!"
	L.deceiver_dies = "심복 #%d 처치"

	L.blueorb = "푸른용군단의 수정구"
	L.blueorb_desc = "푸른용군단의 수정구의 생성을 알립니다."
	L.blueorb_message = "푸른용군단의 수정구 준비됨!"

	L.kalec_yell = "수정구에 힘을 쏟겠습니다! 준비하세요!"
	L.kalec_yell2 = "다른 수정구에 힘을 불어넣었습니다! 어서요!"
	L.kalec_yell3 = "다른 수정구가 준비됐습니다! 서두르세요!"
	L.kalec_yell4 = "모든 힘을 수정구에 실었습니다! 이제 그대들의 몫입니다!"
	L.phase3_trigger = "나를 부정할 수는 없다! 이 세계는 멸망하리라!"
	L.phase4_trigger = "헛된 꿈을 꾸고 있구나! 너흰 이길 수 없어!"
	L.phase5_trigger = "으아! 태양샘의 마력이... 나를... 거부한다! 무슨 짓을 한 거지? 무슨 짓을 한 거냐???"
end

L = BigWigs:NewBossLocale("Felmyst", "koKR")
if L then
	L.phase = "단계"
	L.phase_desc = "이륙과 착지 단계에 대해 알립니다."

	L.airphase_trigger = "나는 어느 때보다도 강하다!"
	L.takeoff_bar = "이륙"
	L.takeoff_message = "5초 이내 이륙!"

	L.landing_bar = "착지"
	L.landing_message = "10초 이내 착지!"

	L.breath = "깊은 숨결"
	L.breath_desc = "깊은 숨결을 알립니다."
end

L = BigWigs:NewBossLocale("Brutallus", "koKR")
if L then
	L.engage_trigger = "하, 새끼 양이 잔뜩 몰려오는구나!"

	L.burnresist = "불사르기 저항"
	L.burnresist_desc = "불사르기에 저항한 플레이어를 알립니다."
	L.burn_resist = "%s 불사르기 저항"
end

L = BigWigs:NewBossLocale("M'uru", "koKR")
if L then
	L.sentinel = "공허의 파수병"
	L.sentinel_desc = "공허의 파수병의 소환을 알립니다."
	L.sentinel_next = "공허의 파수병(%d)"

	L.humanoid = "타락한 엘프"
	L.humanoid_desc = "타락한 엘프 등장을 알립니다."
	L.humanoid_next = "타락한 엘프(%d)"
end

L = BigWigs:NewBossLocale("Kalecgos", "koKR")
if L then
	L.engage_trigger = "으아!! 난 이제 말리고스의 노예가 아니다! 덤벼라, 끝장을 내주마!"
	L.enrage_trigger = "사스로바르가 칼렉고스를 억제할 수 없는 분노의 소용돌이에 빠뜨립니다!"

	L.sathrovarr = "타락의 사스로바르"

	L.portal = "차원문"
	L.portal_message = "약 5초이내 차원문!"

	L.realm_desc = "정신 세계에 들어간 플레이어를 알립니다."
	L.realm_message = "정신 세계: %s (%d 파티)"
	L.nobody = "아무도"

	L.curse = "저주"

	L.wild_magic_healing = "마법 폭주 (힐량 증가)"
	L.wild_magic_healing_desc = "당신이 마법 폭주에 의해 힐량이 증가할때 알려줍니다."
	L.wild_magic_healing_you = "마법 폭주 - 힐량 증가!"

	L.wild_magic_casting = "마법 폭주 (시전시간 지연)"
	L.wild_magic_casting_desc = "힐러가 마법 폭주에 의해 시전시간이 지연될때 알려줍니다."
	L.wild_magic_casting_you = "마법 폭주 - 당신은 시전시간 지연!"
	L.wild_magic_casting_other = "마법 폭주 - %s 시전시간 지연!"

	L.wild_magic_hit = "마법 폭주 (적중률 감소)"
	L.wild_magic_hit_desc = "탱커가 마법 폭주에 의해 적중률이 감소할때 알려줍니다."
	L.wild_magic_hit_you = "마법 폭주 - 당신은 적중률 감소!"
	L.wild_magic_hit_other = "마법 폭주 - %s 적중률 감소!"

	L.wild_magic_threat = "마법 폭주 (위협수준 증가)"
	L.wild_magic_threat_desc = "당신이 마법 폭주에 의해 위협수준이 증가할때 알려줍니다."
	L.wild_magic_threat_you = "마법 폭주 - 위협 생성 증가!"
end

L = BigWigs:NewBossLocale("The Eredar Twins", "koKR")
if L then
	L.lady = "사크로래쉬 #3:"
	L.lock = "알리테스 #2:"

	L.threat = "위협"

	--L.custom_on_threat = "Threat InfoBox"
	--L.custom_on_threat_desc = "Show second on threat for Grand Warlock Alythess and third on threat for Lady Sacrolash."
end

-- The Eye

L = BigWigs:NewBossLocale("Void Reaver", "koKR")
if L then
	L.engage_trigger = "경고! 제거 대상 발견!"
end

L = BigWigs:NewBossLocale("High Astromancer Solarian", "koKR")
if L then
	L.engage_trigger = "탈 아누멘 노 신도레이!"

	L.phase = "단계"
	L.phase_desc = "단계 변경에 대해 알립니다."
	L.phase1_message = "1 단계 - 약 50초 이내 분리"
	L.phase2_warning = "잠시 후 2 단계!"
	L.phase2_trigger = "^나는 공허의"
	L.phase2_message = "20% - 2 단계"

	L.wrath_other = "분노"

	L.split = "분리"
	L.split_desc = "분리와 소환에 대한 경고입니다."
	L.split_trigger1 = "그 오만한 콧대를 꺾어주마!"
	L.split_trigger2 = "한 줌의 희망마저 짓밟아주마!"
	L.split_bar = "~다음 분리"
	L.split_warning = "약 7초 이내 분리"

	L.agent_warning = "분리! - 6초 이내 요원"
	L.agent_bar = "요원"
	L.priest_warning = "3초 이내 사제/솔라리안"
	L.priest_bar = "사제/솔라리안"
end

L = BigWigs:NewBossLocale("Kael'thas Sunstrider", "koKR")
if L then
	L.engage_trigger = "^나의 백성은"
	L.engage_message = "1 단계"

	L.gaze = "주시"
	L.gaze_desc = "플레이어에게 탈라드레드의 주시를 경고합니다."
	L.gaze_trigger = "노려봅니다"

	L.fear_soon_message = "잠시 후 공포!"
	L.fear_message = "공포!"
	L.fear_bar = "~공포 대기 시간"

	L.rebirth = "불사조 환생"
	L.rebirth_desc = "불사조 환생 접근 타이머입니다."
	L.rebirth_warning = "5초 이내 불사조 환생!"
	L.rebirth_bar = "~환생 가능"

	L.pyro = "불덩이 작렬"
	L.pyro_desc = "불덩이 작렬에 대한 60초 타이머를 표시합니다."
	L.pyro_trigger = "%s|1이;가; 불덩이 작렬을 시전합니다!"
	L.pyro_warning = "약 5초 이내 불덩이 작렬!"
	L.pyro_message = "불덩이 작렬 시전!"

	L.phase = "단계 경고"
	L.phase_desc = "단계 변경에 대해 알립니다."
	L.thaladred_inc_trigger = "암흑의 인도자 탈라드레드를 상대로 얼마나 버틸지 볼까?"
	L.sanguinar_inc_trigger = "최고의 조언가를 상대로 잘도 버텨냈군. 허나 그 누구도 붉은 망치의 힘에는 대항할 수 없지. 보아라, 군주 생귀나르를!"
	L.capernian_inc_trigger = "카퍼니안, 놈들이 여기 온 것을 후회하게 해 줘라."
	L.telonicus_inc_trigger = "좋아, 그 정도 실력이면 수석기술자 텔로니쿠스를 상대해 볼만하겠어."
	L.weapons_inc_trigger = "보다시피 내 무기고에는 굉장한 무기가 아주 많지."
	L.phase3_trigger = "네놈들을 과소평가했나 보군. 모두를 한꺼번에 상대하라는 건 불공평한 처사지만, 나의 백성도 공평한 대접을 받은 적 없기는 매한가지. 받은 대로 돌려주겠다."
	L.phase4_trigger = "때론 직접 나서야 할 때도 있는 법이지. 발라모어 샤날!"

	L.flying_trigger = "이대로 물러날 내가 아니다! 반드시 내가 설계한 미래를 실현하리라! 이제 진정한 힘을 느껴 보아라!"
	L.flying_message = "5 단계 - 1분후 중력 붕괴"

	L.weapons_inc_message = "2 단계 - 무기 임박!"
	L.phase3_message = "3 단계 - 조언가와 무기!"
	L.phase4_message = "4 단계 - 캘타스!"
	L.phase4_bar = "잠시 후 캘타스"

	L.mc = "정신 지배"
	L.mc_desc = "정신 지배에 걸린 플레이어를 알립니다."

	L.revive_bar = "조언가 부활"
	L.revive_warning = "5초 이내 조언가 부활!"

	L.dead_message = "%s 처치! 루팅하세요!"

	L.capernian = "대점성술사 카퍼니안"
	L.sanguinar = "군주 생귀나르"
	L.telonicus = "수석기술자 텔로니쿠스"
	L.thaladred = "암흑의 인도자 탈라드레드"
end
