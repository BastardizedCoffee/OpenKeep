/*	..................   Loot spawners   ................... */
/obj/effect/spawner/roguemap/loot
	icon_state = "loot"
	probby = 50

/obj/effect/spawner/roguemap/loot/common
	spawned = list(
		/obj/item/roguecoin/copper/pile = 15,		
		/obj/item/rogueweapon/huntingknife = 10, 
		/obj/item/rogueweapon/huntingknife/idagger = 8,
		/obj/item/rogueweapon/huntingknife/idagger/steel = 4,
		/obj/item/rogueweapon/huntingknife/idagger/silver = 2,
		/obj/item/rogueweapon/sword/iron = 3,
		/obj/item/rogueweapon/woodcut = 10,
		/obj/item/rogueweapon/mace = 5,
		/obj/item/quiver/arrows = 5,
		/obj/item/rogueweapon/sword/iron/short = 5,
		/obj/item/clothing/suit/roguetown/armor/leather = 10, 
		/obj/item/clothing/suit/roguetown/armor/gambeson = 15,
		/obj/item/clothing/gloves/roguetown/chain/iron = 3,
		/obj/item/clothing/neck/roguetown/coif = 3,
		/obj/item/clothing/shoes/roguetown/gladiator = 5
		)

/obj/effect/spawner/roguemap/sewerencounter
	icon_state = "srat"
	icon = 'icons/roguetown/mob/monster/rat.dmi'
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/item/reagent_containers/food/snacks/smallrat = 30,		
		/obj/item/reagent_containers/food/snacks/smallrat/dead = 10, 
		/obj/item/organ/guts = 5,
		/obj/item/roguecoin/copper = 5,
		/obj/effect/gibspawner/generic = 5,
		/obj/effect/decal/remains/bigrat = 5,
		/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 1,
		)



/*	..................   Hauntz randomizer   ................... */
/obj/effect/spawner/roguemap/hauntz_random
	icon = 'icons/mob/actions/roguespells.dmi'
	icon_state = "raiseskele"
	alpha = 150
	probby = 50
	spawned = list(	/obj/effect/landmark/events/haunts = 100	)

/*	..................   Dungeon stuff   ................... */
/obj/structure/fluff/statue/xylix
	desc = "Some mad God no doubt."
	icon = 'icons/roguetown/misc/ay.dmi'
	icon_state = "xylix_smile"
	pixel_x = -32
	pixel_y = -16

/obj/structure/fluff/statue/xylix/frown
	icon_state = "xylix_frown"

/turf/open/floor/rogue/sandstone
	icon_state = "sandstone"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/grassland.wav'

/obj/effect/spawner/roguemap/xylixlabyrinth
	icon = 'icons/mob/actions/roguespells.dmi'
	icon_state = "raiseskele"
	alpha = 150
	probby = 50
	color = "#e44aff"
	spawned = list(
		/mob/living/simple_animal/hostile/retaliate/gaseousform/xylix = 30,		
		/mob/living/simple_animal/hostile/rogue/demon/xylix = 10, 
		/mob/living/simple_animal/hostile/rogue/haunt/xylix = 5,
		/obj/structure/glowshroom/single/xylix = 5,
		/obj/item/roguecoin/silver/pile/xylix = 5,
		)

/mob/living/simple_animal/hostile/rogue/demon/xylix
	name = "spectral daemon"
	color = "#c189cb"
	alpha = 200
/mob/living/simple_animal/hostile/rogue/demon/xylix/Initialize()
	switch(pick(1,2,3))
		if (1)
			maxHealth = 30
			health = 30
			melee_damage_lower = 3
			melee_damage_upper = 12		
		if (2)
			maxHealth = 45
			health = 45
			melee_damage_lower = 6
			melee_damage_upper = 18	
		if (3)
			maxHealth = 18
			health = 18
			melee_damage_lower = 9
			melee_damage_upper = 25

/mob/living/simple_animal/hostile/rogue/haunt/xylix
	name = "spectral daemon"
	color = "#c189cb"
	alpha = 200
/mob/living/simple_animal/hostile/rogue/haunt/xylix/Initialize()
	switch(pick(1,2,3))
		if (1)
			maxHealth = 40
			health = 40
			melee_damage_lower = 3
			melee_damage_upper = 9		
		if (2)
			maxHealth = 35
			health = 35
			melee_damage_lower = 5
			melee_damage_upper = 14	
		if (3)
			maxHealth = 28
			health = 28
			melee_damage_lower = 8
			melee_damage_upper = 19

/mob/living/simple_animal/hostile/retaliate/gaseousform/xylix
	name = "spectral daemon"
	faction = list("undead")
	color = "#c189cb"
	alpha = 200
/mob/living/simple_animal/hostile/retaliate/gaseousform/xylix/Initialize()
	switch(pick(1,2,3))
		if (1)
			maxHealth = 70
			health = 70
			melee_damage_lower = 2
			melee_damage_upper = 10		
		if (2)
			maxHealth = 60
			health = 60
			melee_damage_lower = 3
			melee_damage_upper = 13	
		if (3)
			maxHealth = 50
			health = 50
			melee_damage_lower = 4
			melee_damage_upper = 16


/obj/structure/glowshroom/single/xylix
	name = ""
	desc = ""
	icon = 'icons/roguetown/items/valuable.dmi'
	icon_state = "s5"

/obj/item/roguecoin/silver/pile/xylix/Initialize()
	. = ..()
	set_quantity(rand(6,9))

/obj/structure/trap/xylix
	name = ""
	desc = ""
	icon_state = ""

/obj/structure/trap/xylix/trap_effect(mob/living/L)
	to_chat(L, "<span class='danger'><B>With a crack, the hostile constructs come out of hiding, stunning you!</B></span>")
	L.electrocute_act(10, src, flags = SHOCK_NOGLOVES) // electrocute act does a message.
	L.Paralyze(20)
	new /mob/living/simple_animal/hostile/retaliate/gaseousform/xylix(loc)
	QDEL_IN(src, 30)


/obj/structure/trap/xylix_healing
	name = ""
	desc = ""
	icon_state = ""

/obj/structure/trap/xylix_healing/trap_effect(mob/living/L)
	to_chat(L, "<span class='danger'><B>Flowers sprouts beneath your feet!</B></span>")
	L.Paralyze(100)
	L.adjustBruteLoss(-10)
	switch(pick(1,2))
		if (1)
			new /obj/structure/flora/ausbushes/lavendergrass (drop_location())
		if (2)
			new /obj/structure/flora/ausbushes/brflowers (drop_location())

	QDEL_IN(src, 200)

/obj/structure/bars/passage/shutter/xy_a
	redstone_id = "xhutterA"
/obj/structure/bars/passage/shutter/open/xy_a
	redstone_id = "xhutterA"

/obj/structure/bars/passage/shutter/xy_b
	redstone_id = "xhutterB"
/obj/structure/bars/passage/shutter/open/xy_b
	redstone_id = "xhutterB"

/obj/structure/bars/passage/shutter/xylix_ab
	redstone_id = "xhutterAB"
/obj/structure/bars/passage/shutter/open/xy_ab
	redstone_id = "xhutterAB"

/obj/structure/lever/wall/xyla
	redstone_id = "xhutterA"
/obj/structure/lever/wall/xylb
	redstone_id = "xhutterB"
/obj/structure/lever/wall/xylab
	redstone_id = "xhutterAB"

/obj/structure/lever/wall/xylrand/Initialize()
	switch(pick(1,2))
		if (1)
			redstone_id = "xhutterA"
		if (2)
			redstone_id = "xhutterB"

/obj/effect/spawner/roguemap/xylixlabyrinth_frowny
	icon = 'icons/mob/actions/roguespells.dmi'
	icon_state = "tragedy"
	alpha = 150
	probby = 30
	spawned = list(	/obj/structure/trap/xylix_healing = 10, /obj/structure/trap/xylix = 10)

/obj/effect/spawner/roguemap/xylixlabyrinth_smiley
	icon = 'icons/mob/actions/roguespells.dmi'
	icon_state = "comedy"
	alpha = 150
	probby = 30
	spawned = list(	/obj/structure/trap/xylix_healing = 10, /obj/structure/trap/xylix = 10)

/obj/structure/fluff/walldeco/xylfrown
	icon = 'modular/Mapping/icons/decoration.dmi'
	icon_state = "wall_sad"
	pixel_y = 32

/obj/structure/fluff/walldeco/xylsmile
	icon = 'modular/Mapping/icons/decoration.dmi'
	icon_state = "wall_funny"
	pixel_y = 32

/obj/structure/glowshroom/single/xylix
	name = "fancy chest"
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "chestfancy_neu"

/obj/structure/closet/crate/chest/wicker/xyl/PopulateContents()
	switch(pick(1,2))
		if (1)
			new /obj/item/clothing/ring/gold/protection(src)
		if (2)
			new /obj/item/clothing/head/roguetown/jester(src)




/*	..................   Spider stuff   ................... */
/obj/structure/spider/stickyweb/solo
	icon_state = "stickyweb3"

/obj/structure/spider/stickyweb/Initialize()
	if(icon_state == "stickyweb1")
		if(prob(50))
			icon_state = "stickyweb2"
	dir = pick(GLOB.cardinals)
	alpha = rand(80,109)
	switch(pick(1,2))
		if (1)
			static_debris = FALSE		
		if (2)
			static_debris = list(/obj/item/natural/silk = 1)
	. = ..()

/obj/structure/spider/cocoon/Initialize()
	switch(pick(1,2,3,4,5))
		if (1)
			static_debris = list(/obj/item/natural/silk = 3)
			icon_state = pick("cocoon1","cocoon2")
		if (2)
			static_debris = list(/obj/item/natural/silk = 2, /obj/effect/decal/remains/bigrat = 1)
			icon_state = pick("cocoon2","cocoon3")
		if (3)
			static_debris = list(/obj/item/natural/silk = 2, /obj/effect/decal/remains/human = 1)
			icon_state = pick("cocoon_large1","cocoon_large2","cocoon_large3")
		if (4)
			static_debris = list(/obj/item/natural/silk = 2, /obj/effect/decal/cleanable/blood/gibs = 1)
			icon_state = pick("cocoon1","cocoon2","cocoon3")
		if (5)
			static_debris = list(/obj/item/natural/silk = 2, /obj/item/natural/stone = 1)
			icon_state = pick("cocoon1","cocoon2")
	. = ..()



/*	..................   Various mapping aides   ................... */

/obj/structure/roguethrone/statues
	icon = 'modular/Mapping/icons/96x96.dmi'

/turf/open/floor/rogue/tile/kitchen
	icon_state = "tavern"

/obj/machinery/light/rogue/wallfire/big_fireplace
	icon_state = "fireplace1"
	base_state = "fireplace"
	icon = 'icons/roguetown/misc/fireplace64.dmi'




/*	..................   Wizard Shenanigans   ................... */

/obj/structure/circle_protection
	name = "circle of protection"
	icon = 'modular/Mapping/icons/96x96.dmi'
	icon_state = "circle"
	alpha = 180
	pixel_y = -32
	pixel_x = -32
	var/wall_type = /obj/effect/forcefield/wizard
	var/depleted
/obj/structure/circle_protection/attack_hand(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(depleted)
		to_chat(user, "<span class='notice'>The salt circle has been damaged...</span>")
		return
	if(H.virginity)
		playsound(get_turf(user), 'sound/magic/timestop.ogg', 100, TRUE, -1)
		new wall_type(get_step(src, EAST),user)
		new wall_type(get_step(src, WEST),user)
		new wall_type(get_step(src, NORTH),user)
		new wall_type(get_step(src, SOUTH),user)

		new wall_type(get_step(src, NORTHEAST),user)
		new wall_type(get_step(src, NORTHWEST),user)
		new wall_type(get_step(src, SOUTHEAST),user)
		new wall_type(get_step(src, SOUTHWEST),user)

		depleted = TRUE
		alpha = 90
	else
		to_chat(user, "<span class='notice'>The magick forces are beyond your control.</span>")
/obj/structure/circle_protection/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/reagent_containers/powder/salt))
		to_chat(user, "<span class='notice'>Restoring the salt lines...</span>")
		if(do_after(user,10 SECONDS, target = src))
			depleted = FALSE
			alpha = 180
			qdel(I)
	else
		return ..()	


/*	..................   NOC Device (Fixed scrying ball)   ................... */
/obj/structure/nocdevice
	name = "NOC Device"
	desc = "A intricate lunar observation machine, that allows its user to study the face of Noc in the sky, reflecting he true whereabouts of hidden beings.."
	icon = 'modular/Mapping/icons/96x96.dmi'
	icon_state = "nocdevice"
	plane = -1
	layer = 4.2
	var/mob/current_owner
	var/last_scry
/obj/structure/nocdevice/attack_hand(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(H.virginity)
		if(world.time < last_scry + 30 SECONDS)
			to_chat(user, "<span class='warning'>I peer into the sky but cannot focus the lens on the face of Noc. Maybe I should wait.</span>")
			return
		var/input = stripped_input(user, "Who are you looking for?", "Scrying Orb")
		if(!input)
			return
		if(!user.key)
			return
		if(world.time < last_scry + 30 SECONDS)
			to_chat(user, "<span class='warning'>I peer into the sky but cannot focus the lens on the face of Noc. Maybe I should wait.</span>")
			return
		if(!user.mind || !user.mind.do_i_know(name=input))
			to_chat(user, "<span class='warning'>I don't know anyone by that name.</span>")
			return
		for(var/mob/living/carbon/human/HL in GLOB.human_list)
			if(HL.real_name == input)
				var/turf/T = get_turf(HL)
				if(!T)
					continue
				var/mob/dead/observer/screye/S = user.scry_ghost()
				if(!S)
					return
				S.ManualFollow(HL)
				last_scry = world.time
				user.visible_message("<span class='danger'>[user] stares into [src], [p_their()] squinting and concentrating...</span>")
				addtimer(CALLBACK(S, TYPE_PROC_REF(/mob/dead/observer, reenter_corpse)), 8 SECONDS)
				if(!HL.stat)
					if(HL.STAPER >= 15)
						if(HL.mind)
							if(HL.mind.do_i_know(name=user.real_name))
								to_chat(HL, "<span class='warning'>I can clearly see the face of [user.real_name] staring at me!.</span>")
								return
						to_chat(HL, "<span class='warning'>I can clearly see the face of an unknown [user.gender == FEMALE ? "woman" : "man"] staring at me!</span>")
						return
					if(HL.STAPER >= 11)
						to_chat(HL, "<span class='warning'>I feel a pair of unknown eyes on me.</span>")
				return
		to_chat(user, "<span class='warning'>I peer into the viewpiece, but Noc does not reveal where [input] is.</span>")
		return
	else
		to_chat(user, "<span class='notice'>Noc looks angry with me...</span>")


/*	..................   Floor decoration   ................... */
/obj/structure/giantfur
	name = "giant fur"
	desc = "Pelt of some gigantic animal, made into a mat."
	icon = 'modular/Mapping/icons/96x96.dmi'
	icon_state = "fur"
	density = FALSE
	anchored = TRUE

/obj/structure/giantfur/small // the irony
	name = "fur pelt"
	desc = "Pelt of a young animal, made into a mat."
	icon_state = "fur_alt"

/turf/open/water/bath/pool
	desc = "Clear water, pleasant temperature. Soothing."
	icon_state = "bathtile_pool"
/turf/open/water/bath/pool/Initialize()
	.  = ..()
	icon_state = "bathtile_pool"

/turf/open/water/bath/pool/mid
	icon_state = "bathtile_pool_mid"
/turf/open/water/bath/pool/mid/Initialize()
	.  = ..()
	icon_state = "bathtile_pool_mid"

/*	..................   Wall decorations   ................... */
/obj/structure/fluff/walldeco/bath // suggestive stonework
	icon = 'modular/Mapping/icons/decoration.dmi'
	icon_state = "bath1"
	pixel_x = -32
	alpha = 210

/obj/structure/fluff/walldeco/bath/two
	icon_state = "bath2"
	pixel_x = -29

/obj/structure/fluff/walldeco/bath/three
	icon_state = "bath3"
	pixel_x = -29

/obj/structure/fluff/walldeco/bath/four
	icon_state = "bath4"
	pixel_y = 32
	pixel_x = 0

/obj/structure/fluff/walldeco/bath/five
	icon_state = "bath5"
	pixel_x = -29

/obj/structure/fluff/walldeco/bath/six
	icon_state = "bath6"
	pixel_x = -29

/obj/structure/fluff/walldeco/bath/seven
	icon_state = "bath7"
	pixel_x = 32

/obj/structure/fluff/walldeco/bath/gents
	icon_state = "gents"
	pixel_x = 0
	pixel_y = 32

/obj/structure/fluff/walldeco/bath/ladies
	icon_state = "ladies"
	pixel_x = 0
	pixel_y = 32

/obj/structure/fluff/walldeco/bath/wallrope
	icon_state = "wallrope"
	layer = WALL_OBJ_LAYER+0.1
	pixel_x = 0
	pixel_y = 0
	color = "#d66262"

/obj/effect/decal/shadow_floor
	name = ""
	desc = ""
	icon = 'modular/Mapping/icons/decoration.dmi'
	icon_state = "shadow_floor"
	mouse_opacity = 0

/obj/effect/decal/shadow_floor/corner
	icon_state = "shad_floorcorn"

/obj/structure/fluff/walldeco/bath/wallpipes
	icon_state = "wallpipe"
	pixel_x = 0
	pixel_y = 32


/obj/structure/fluff/walldeco/bath/random
	icon_state = "bath"
	pixel_y = 32
/obj/structure/fluff/walldeco/bath/random/Initialize()
	. = ..()
	if(icon_state == "bath")
		icon_state = "bath[rand(1,8)]"

/obj/structure/fluff/walldeco/vinez // overlay vines for more flexibile mapping
	icon = 'modular/Mapping/icons/decoration.dmi'
	icon_state = "vinez"

/obj/structure/fluff/walldeco/vinez/l
	pixel_x = -32
/obj/structure/fluff/walldeco/vinez/r
	pixel_x = 32

/obj/structure/fluff/walldeco/vinez/offset
	icon_state = "vinez"
	pixel_y = 32

/obj/structure/rack/rogue/shelf/notdense
	density = FALSE
	pixel_y = 24

/*	..................   Red brick Walls   ................... */
/turf/closed/wall/mineral/rogue/stonebrick/reddish
	color = "#e0b7af"

/turf/closed/wall/mineral/rogue/decostone/fluffstone/reddish
	color = "#fbc5bc"

/turf/closed/wall/mineral/rogue/decostone/cand/reddish
	color = "#fbd2cb"

/obj/structure/stairs/stone/reddish
	color = "#ffddd7"


/*	..................   Lights   ................... */
/obj/machinery/light/rogue/campfire/longlived
	fueluse = 180 MINUTES

/obj/item/candle/yellow/lit/infinite
	light_power = 1
	light_range = 4
	start_lit = TRUE
	infinite = TRUE
	icon_state = "candle1_lit"
	anchored = TRUE

/obj/item/candle/yellow/lit/infinite/strong
	light_power = 2
	light_range = 4
	pixel_x = 4

/obj/machinery/light/rogue/wallfire/candle/lamp // cant get them to start unlit but they work as is
	name = "candle lamp"
	icon = 'modular/Mapping/icons/decoration.dmi'
	icon_state = "candle"
	base_state = "candle"
	layer = WALL_OBJ_LAYER+0.1
	light_power = 0.9
	light_range = 6

/obj/machinery/light/rogue/wallfire/candle/weak
	light_power = 0.9
	light_range = 6
/obj/machinery/light/rogue/wallfire/candle/weak/l
	pixel_x = -32
	pixel_y = 0
/obj/machinery/light/rogue/wallfire/candle/weak/r
	pixel_x = 32
	pixel_y = 0



/*	..................   More chairs   ................... */
/obj/structure/chair/wood/rogue/chair_noble
	name = "fine chair"
	icon_state = "chair_green"
	icon = 'icons/roguetown/misc/structure.dmi'
	item_chair = /obj/item/chair/rogue/chair_nobles
	blade_dulling = DULLING_BASHCHOP
	destroy_sound = 'sound/combat/hits/onwood/destroyfurniture.ogg'
	attacked_sound = "woodimpact"
/obj/item/chair/rogue/chair_nobles
	icon_state = "chair_green"
	origin_type = /obj/structure/chair/wood/rogue/chair_noble

/obj/structure/chair/wood/rogue/chair_noble/purple
	icon_state = "chair_purple"
	item_chair = /obj/item/chair/rogue/chair_nobles/purple
/obj/item/chair/rogue/chair_nobles/purple
	icon_state = "chair_purple"
	origin_type = /obj/structure/chair/wood/rogue/chair_noble/purple

/obj/structure/chair/wood/rogue/chair_noble/red
	icon_state = "chair_red"
	item_chair = /obj/item/chair/rogue/chair_nobles/red
/obj/item/chair/rogue/chair_nobles/red
	icon_state = "chair_purple"
	origin_type = /obj/structure/chair/wood/rogue/chair_noble/red

/*	..................   More tables   ................... */
/obj/structure/table/wood/reinf_long
    icon_state = "tablewood_reinf"

/obj/structure/table/wood/plain_alt
    icon_state = "tablewood_plain"

/obj/structure/table/wood/large_new
    icon_state = "alt_largetable_mid"
/obj/structure/table/wood/large/corner_new
    icon_state = "alt_largetable"

/obj/structure/table/wood/reinforced_alter
    icon_state = "tablewood_alt"

/obj/structure/table/wood/nice/decorated
	icon_state = "tablefine_alt"

/obj/structure/table/wood/nice/decorated_alt
	icon_state = "tablefine_alt2"



/*	..................   Misc   ................... */
/obj/structure/bars/alt
	icon_state = "bars_alt"
	plane = -3
	layer = WALL_OBJ_LAYER+0.05

/obj/item/roguebin/alt
	icon_state = "washbin2"

/obj/structure/mirror/alt
	icon_state = "mirror_alt"

/obj/item/roguestatue/silver/gnome
	name = "petrified gnome"
	desc = "A literal gnome, turned to stone mid-step and put on a matching stone platform. Rather unsettling."
	smeltresult = null
	color = "#617163"


/obj/structure/chair/bench/couch/redleft
	icon_state = "redcouch_alt"
/obj/structure/chair/bench/couch/redright
	icon_state = "redcouch2_alt"


/*	..................   The Drunken Saiga   ................... */
/obj/structure/fluff/walldeco/innsign/saiga
	name = "The Drunken Saiga"
	icon = 'modular/Mapping/icons/decoration.dmi'
	icon_state = "bar_saiga"
	plane = -1
	pixel_x = 3
	pixel_y = 16

/obj/structure/fluff/walldeco/innsign/trophy
	name = "saiga trophy"
	icon = 'modular/Mapping/icons/decoration.dmi'
	icon_state = "saiga_trophy"
	pixel_y = 32

/obj/item/clothing/suit/roguetown/armor/leather/vest/innkeep
	name = "padded vest"
	desc = "Dyed green, belongs to the innkeeper."
	icon_state = "workervest"
	color = "#638b45"

/turf/open/floor/rogue/tile/checker_green
	icon_state = "tile"
	color = "#94df5b"



/*	..................   Areas to play with the music a bit   ................... */
/area/rogue/indoors/town/bath/redhouse // lets try something different
	droning_sound = 'modular/Mapping/sound/Fulminate.ogg'
	converted_type = /area/rogue/outdoors/exposed/bath/redhouse

/area/rogue/outdoors/exposed/bath/redhouse
	droning_sound = 'modular/Mapping/sound/Fulminate.ogg'

/area/rogue/indoors/town/tavern/saiga
	droning_sound = 'modular/Mapping/sound/Folia1490.ogg'
	droning_sound_night = 'modular/Mapping/sound/LeTourdion.ogg'
	converted_type = /area/rogue/outdoors/exposed/tavern/saiga

/area/rogue/outdoors/exposed/tavern/saiga
	droning_sound = 'modular/Mapping/sound/Folia1490.ogg'
	droning_sound_night = 'modular/Mapping/sound/LeTourdion.ogg'


/*	..................   Traveltiles   ................... */ // these are the ones on centcomm, where the actual lair is
/obj/structure/fluff/traveltile/bandit_lair
	aportalid = "banditin"
	aportalgoesto = "banditexit"

/obj/structure/fluff/traveltile/vampire_lair
	aportalid = "vampin"
	aportalgoesto = "vampexit"

/obj/structure/fluff/traveltile/inhumen_lair
	aportalid = "inhumenin"
	aportalgoesto = "inhumenexit"


/obj/structure/fluff/traveltile/to_inhumen_tribe
	name = "to the Deep Bog"
	aportalid = "inhumenexit"
	aportalgoesto = "inhumenin"

/* moved to main. leave this be for now, I want to be able to find the additions I make easily for tweaking
/area/rogue/indoors/bandit_lair
	name = "lair (Bandits)"

/area/rogue/indoors/vampire_manor
	name = "lair (Vampire Lord)"

/area/rogue/outdoors/bog/inhumen_camp
	name = "lair (Inhumen)"
	droning_sound = 'sound/music/area/decap.ogg'
	first_time_text = "THE DEEP BOG"

// Inhumen boss bed. Sleeping on a bear! Kinda comfy, sort of
/obj/structure/bed/rogue/bear
	desc = "A hide of a slain bear. It looks like someone sleeps on it often."
	icon = 'icons/turf/floors/bear.dmi'
	icon_state = "bear"
	pixel_x = -16
	pixel_y = -27

/obj/structure/fluff/walldeco/skullspike // for ground really
	icon = 'modular/Mapping/icons/decoration.dmi'
	icon_state = "skullspike"
	plane = -1
	layer = ABOVE_MOB_LAYER
	pixel_x = 8
	pixel_y = 24

/*	..................   Floors   ................... */
/turf/open/floor/rogue/ruinedwood/darker
	color = "#d9c9b0"
/turf/open/floor/rogue/ruinedwood/turned/darker
	color = "#d9c9b0"


/obj/structure/roguetent/preopen
	density = FALSE

/obj/structure/fluff/clock/dense
	density = TRUE


/obj/structure/closet/crate/chest/crate
	name = "crate"
	base_icon_state = "woodchest"
	icon_state = "woodchest"

/obj/structure/closet/crate/chest/wicker
	name = "wicker basket"
	desc = "Fibers interwoven to make a cheap storage bin."
	base_icon_state = "wicker"
	icon_state = "wicker"
	open_sound = 'sound/items/book_open.ogg'
	open_sound = 'sound/items/book_close.ogg'
	close_sound = 'sound/items/book_close.ogg'

/obj/structure/closet/crate/chest/neu
	name = "sturdy oak chest"
	icon_state = "chest_neu"
	base_icon_state = "chest_neu"

/obj/structure/closet/crate/chest/neu_iron
	name = "reinforced chest"
	icon_state = "chestiron_neu"
	base_icon_state = "chestiron_neu"

/obj/structure/closet/crate/chest/neu_fancy
	name = "fancy chest"
	icon_state = "chestfancy_neu"
	base_icon_state = "chestfancy_neu"

/obj/structure/closet/crate/chest/old_crate
	name = "old crate"
	base_icon_state = "woodchestalt"
	icon_state = "woodchestalt"

/obj/structure/closet/crate/drawer/random
	icon_state = "drawer1"
	base_icon_state = "drawer1"
	pixel_y = 8

/obj/structure/closet/crate/drawer/random/Initialize()
	. = ..()
	if(icon_state == "drawer1")
		base_icon_state = "drawer[rand(1,4)]"
		icon_state = "[base_icon_state]"
	else
		base_icon_state = "drawer1"
		pixel_y = 8

/obj/structure/mineral_door/wood/deadbolt/shutter
	name = "serving hatch"
	desc = "Can be locked from the inside."
	icon_state = "serving"
	base_state = "serving"
	max_integrity = 250
	over_state = "servingopen"
	openSound = 'modular/Neu_Food/sound/blindsopen.ogg'
	closeSound = 'modular/Neu_Food/sound/blindsclose.ogg'
	dir = NORTH
	locked = TRUE

/obj/structure/closet/crate/chest/wicker
	name = "wicker basket"
	desc = "Fibers interwoven to make a cheap storage bin."
	base_icon_state = "wicker"
	icon_state = "wicker"
	open_sound = 'sound/items/book_open.ogg'
	open_sound = 'sound/items/book_close.ogg'
	close_sound = 'sound/items/book_close.ogg'

/obj/structure/closet/crate/chest/neu
	name = "sturdy oak chest"
	icon_state = "chest_neu"
	base_icon_state = "chest_neu"

/obj/structure/closet/crate/chest/neu_iron
	name = "reinforced chest"
	icon_state = "chestiron_neu"
	base_icon_state = "chestiron_neu"

/obj/structure/closet/crate/chest/neu_fancy
	name = "fancy chest"
	icon_state = "chestfancy_neu"
	base_icon_state = "chestfancy_neu"

/obj/structure/closet/crate/chest/old_crate
	name = "old crate"
	base_icon_state = "woodchestalt"
	icon_state = "woodchestalt"

/obj/structure/closet/crate/drawer/random
	icon_state = "drawer1"
	base_icon_state = "drawer1"
	pixel_y = 8

/obj/structure/closet/crate/drawer/random/Initialize()
	. = ..()
	if(icon_state == "drawer1")
		base_icon_state = "drawer[rand(1,4)]"
		icon_state = "[base_icon_state]"
	else
		base_icon_state = "drawer1"
		pixel_y = 8

/obj/structure/mineral_door/wood/deadbolt/shutter
	name = "serving hatch"
	desc = "Can be locked from the inside."
	icon_state = "serving"
	base_state = "serving"
	max_integrity = 250
	over_state = "servingopen"
	openSound = 'modular/Neu_Food/sound/blindsopen.ogg'
	closeSound = 'modular/Neu_Food/sound/blindsclose.ogg'
	dir = NORTH
	locked = TRUE
*/
