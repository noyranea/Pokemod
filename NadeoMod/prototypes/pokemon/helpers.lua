Resists = {}
Resists["plant"] 	= {{type = "fire",percent = -100},{type = "water",percent = 50},{type = "electric", percent = 50},{type = "plant",percent = 50}}
Resists["fire"] 	= {{type = "water",percent = -100},{type = "plant",percent = 50},{type = "fire",percent = 50}}
Resists["water"] 	= {{type = "plant",percent = -100},{type = "fire",percent = 50},{type = "water",percent = 50},{type = "electric", percent = -100}}
Resists["electric"] = {{type = "electric",percent = 50}}

function CreateBasePokemon(Data)
	-- Data.Name : nom de l'espèce
	-- Data.Icon : icône du pokémon capturé ( + "-ko")
	-- Data.Health : base Hp du pokémon
	-- Data.Type : type du pokémon
	-- Data.Size : taille du pokémon dans le world (area)
	-- Data.MovementSpeed : vitesse
	-- Data.Attack : paramètres de l'attaque
	-- Data.Animation : run_animation
	-- Data.Animation_ko : ko_animation
	-- Data.WorkSound : work_sound
	local Resists = {}
	Resists["plant"] 	= {{type = "fire",percent = -100},{type = "water",percent = 50},{type = "electric", percent = 50},{type = "plant",percent = 50}}
	Resists["fire"] 	= {{type = "water",percent = -100},{type = "plant",percent = 50},{type = "fire",percent = 50}}
	Resists["water"] 	= {{type = "plant",percent = -100},{type = "fire",percent = 50},{type = "water",percent = 50},{type = "electric", percent = -100}}
	Resists["electric"] = {{type = "electric",percent = 50}}
	
	data:extend(
	{
		{
			type = "unit",		
			name = Data.Name.."-domestic",
			icon = Data.Icon,
			flags = {"placeable-player", "player-creation", "placeable-off-grid"},
			minable = {hardness = 0.2, mining_time = 0.5, result = Data.Name},
			max_health = Data.Health * 10,
			resistances = Resists[Data.Type],
			order="c",
			subgroup="ammo",
			healing_per_tick = 0.01,
			-- collision_mask = Data.Collisions,
			collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
			selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
			attack_parameters = Data.Attack,
			vision_distance = 30,
			movement_speed = Data.MovementSpeed * 10,
			distance_per_frame = 0.1,
			pollution_to_join_attack = 20000000,
			distraction_cooldown = 300,
			--corpse = "small-remnants",
			destroy_action =
			{
			  type = "direct",
			  action_delivery =
			  {
				type = "instant",
				source_effects =
				{
					type = "create-entity",
					entity_name = "explosion"
				}
			  }
			},
			run_animation = Data.Animation,
			working_sound = Data.WorkSound
		},
		{
			type = "unit",
			name = Data.Name.."-domestic-ko",
			icon = Data.Icon,
			flags = {"placeable-off-grid", "breaths-air"},
			max_health = 1,
			order = "b-b-a",
			subgroup="enemies",
			selectable_in_game = true,
			healing_per_tick = 0.,
			collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
			selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
			attack_parameters =
			{
			  type = "projectile",
			  range = 1,
			  cooldown = 35,
			  ammo_category = "melee",
			  ammo_type = make_unit_melee_ammo_type(6),
			  sound = make_biter_roars(0.5),
			  animation = biterattackanimation(smallbiterscale, small_biter_tint1, small_biter_tint2)
			},
			vision_distance = 0,
			movement_speed = 0.0,
			distance_per_frame = 0.,
			pollution_to_join_attack = 200,
			distraction_cooldown = 300,
			-- corpse = "small-biter-corpse",
			-- dying_explosion = "blood-explosion-small",
			-- dying_sound =  make_biter_dying_sounds(1.0),
			--working_sound =  make_biter_calls(0.7),
			animation  		= Data.Animation_ko, 
			idle_animation 	= Data.Animation_ko, 
			run_animation 	= Data.Animation_ko
		},
		{
			type = "unit",
			name = Data.Name.."-wild",
			icon = Data.Icon,
			flags = {"placeable-enemy", "placeable-off-grid"},
			max_health = Data.Health,
			resistances = Data.Resists,
			order="c",
			subgroup="ammo",
			healing_per_tick = 0.01,
			collision_mask = Data.Collisions,
			collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
			selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
			attack_parameters = Data.Attack,
			vision_distance = 30,
			distance_per_frame = 0.1,
			movement_speed = Data.MovementSpeed,
			distance_per_frame = 0.1,
			pollution_to_join_attack = 200,
			distraction_cooldown = 300,
			--corpse = "small-remnants",
			destroy_action =
			{
			  type = "direct",
			  action_delivery =
			  {
				type = "instant",
				source_effects =
				{
					type = "create-entity",
					entity_name = "explosion"
				}
			  }
			},
			run_animation = Data.Animation,
			working_sound = Data.WorkSound
		},
		{
			type = "unit",
			name = Data.Name.."-wild-ko",
			icon = Data.Icon,
			flags = {"placeable-off-grid", "breaths-air"},
			max_health = 1,
			order = "b-b-a",
			subgroup="enemies",
			selectable_in_game = true,
			healing_per_tick = 0.,
			collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
			selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
			attack_parameters =
			{
			  type = "projectile",
			  range = 1,
			  cooldown = 35,
			  ammo_category = "melee",
			  ammo_type = make_unit_melee_ammo_type(6),
			  sound = make_biter_roars(0.5),
			  animation = biterattackanimation(smallbiterscale, small_biter_tint1, small_biter_tint2)
			},
			vision_distance = 0,
			movement_speed = 0.0,
			distance_per_frame = 0.,
			pollution_to_join_attack = 200,
			distraction_cooldown = 300,
			-- corpse = "small-biter-corpse",
			-- dying_explosion = "blood-explosion-small",
			-- dying_sound =  make_biter_dying_sounds(1.0),
			--working_sound =  make_biter_calls(0.7),
			animation  		=  Data.Animation_ko, 
			idle_animation 	= Data.Animation_ko, 
			run_animation 	= Data.Animation_ko
		},
		{
			type = "capsule",
			name = Data.Name,
			icon = Data.Icon,
			flags = {"goes-to-quickbar"},
			order="c",
			subgroup="drone-combat",
			stack_size = 20,
			capsule_action = {
			  type = "throw",
			  attack_parameters =
			  {
				type = "projectile",
				ammo_category = "capsule",
				cooldown = 30,
				projectile_creation_distance = 0.6,
				range = 25,
				ammo_type =
				{
				  category = "capsule",
				  target_type = "position",
				  action =
				  {
					type = "direct",
					action_delivery =
					{
					  type = "projectile",
					  projectile = Data.Name,
					  starting_speed = 0.3
					}
				  }
				}
			  }
			}
		},
		{
			type = "projectile",
			name = Data.Name,
			flags = {"not-on-map"},
			acceleration = 0.005,
			action =
			{
			  type = "direct",
			  action_delivery =
			  {
				type = "instant",
				target_effects =
				{
				  {
					type = "create-entity",
					show_in_tooltip = true,
					trigger_created_entity= true,
					entity_name = Data.Name.."-domestic"
				  },
				}
			  }
			},
			light = {intensity = 0.5, size = 4},
			animation = {
				filename = "__NadeoMod__/graphics/raikou/pokeball_throw.png",
				line_length = 10,
				width = 23,
				height = 22,
				scale = 0.5,
				frame_count = 10,
				direction_count = 1,
				priority = "high",
				animation_speed = 0.3,
				run_mode="backward",
				shift = {0, 0}
			},
			shadow =
			{
			  filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
			  frame_count = 1,
			  width = 32,
			  height = 32,
			  priority = "high"
			},
			smoke = capsule_smoke,
		},
		--{
		--	type = "item",
		--	name = Data.Name,
		--	icon = Data.Icon,
		--	flags = {"goes-to-quickbar"},
		--	order="c",
		--	subgroup="drone-combat",
		--	place_result = Data.Name.."-domestic",
		--	stack_size = 1
		--},
		{
			type = "item",
			name = Data.Name.."-ko",
			icon = Data.Icon,
			flags = {"goes-to-quickbar"},
			order="c",
			subgroup="drone-combat",
			stack_size = 1
		},
	})
end

CreateBasePokemon({
	Name = "raikou",
	Icon = "__NadeoMod__/graphics/raikou/icon_raikou.png",
	Health = 100,
	Type = "electric",
	Attack =  {
      type = "projectile",
      range = 0.5,
      cooldown = 35,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(6),
      sound = make_biter_roars(0.5),
      animation = biterattackanimation(smallbiterscale, small_biter_tint1, small_biter_tint2)
    },
	MovementSpeed = 0.015,
	--Recipe = {{"iron-ore", 1}},
	--Collisions = {"ghost-layer"},
	Animation = {
		filename = "__NadeoMod__/graphics/raikou/sheet.png",
		line_length = 3,
		width = 37,
		height = 37,
		frame_count = 3,
		direction_count = 8,
		priority = "high",
		shift = {0, 0}
	},
	Animation_ko = {
		direction_count = 1,
		filename = "__NadeoMod__/graphics/raikou/raikou_ko.png",
		line_length = 2,
		width = 28,
		height = 27,
		frame_count = 2,
		priority = "high",
		shift = {0, 0}
	}
})
