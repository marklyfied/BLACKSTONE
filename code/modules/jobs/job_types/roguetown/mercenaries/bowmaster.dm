/datum/job/roguetown/mercenary/bowmaster
	title = "Bow Masters"
	flag = BOWMASTER
	department_flag = MERCENARIES
	tutorial = "Unlike the other mercenaries who provide melee support, Bow Masters, specalizes in ranged attacks. The bow masters are usually paid coin to take posts on trees or walls."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Humen", "Half-Elf")
	outfit = /datum/outfit/job/roguetown/mercenary/bowmaster
	display_order = JDO_BOW_MASTER
	selection_color = JCOLOR_MERCENARY
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	min_pq = 0 //good fragger role
	max_pq = null
	cmode_music = 'sound/music/combat_grenzelhoft.ogg'

/datum/outfit/job/roguetown/mercenary/bowmaster/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	beltl = /obj/item/roguekey/mercenary 
	cloak = /obj/item/clothing/cloak/stabard/bowmasters
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	pants = /obj/item/clothing/under/roguetown/trou/leather
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor/
	head = /obj/item/clothing/head/roguetown/helmet/skullcap
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	beltr = /obj/item/quiver/arrows


	var/obj/item/flashlight/flare/torch/T = new()
	T.spark_act()
	H.put_in_hands(T,forced=TRUE)

	if(H.gender == FEMALE)
		var/acceptable = list("Tomboy", "Bob", "Curly Short")
		if(!(H.hairstyle in acceptable))
			H.hairstyle = pick(acceptable)
			H.update_hair()
	//Humie grenzelhofts are always set to be, well, grenzelhoft
	if(ishumannorthern(H))
		var/list/skin_slop = H.dna.species.get_skin_list()
		H.skin_tone = skin_slop["Grenzelhoft"]
		H.update_body()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("endurance", 3)
		H.change_stat("constitution", 1)
		H.change_stat("perception", 2)
		H.change_stat("speed", 3)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
