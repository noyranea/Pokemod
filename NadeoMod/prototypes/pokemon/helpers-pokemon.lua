function GeneratePokemonItems(Data)
	data:extend({
		{
			type = "capsule",
			name = Data.Name,
			icon = "__NadeoMod__/graphics/pokemon/"..Data.Name.."/icon.png",
			flags = {"goes-to-quickbar"},
			order = Data.Name,
			subgroup="pokemod-capsules",
			stack_size = 1,
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
				filename = "__NadeoMod__/graphics/pokeballs/pokeball/pokeball_throw.png",
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
			--shadow =
			--{
			--  filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
			--  frame_count = 1,
			--  width = 32,
			--  height = 32,
			--  priority = "high"
			--},
			smoke = capsule_smoke,
		},
		{
			type = "item",
			name = Data.Name.."-ko",
			icon = "__NadeoMod__/graphics/pokemon/"..Data.Name.."/icon.png", --TODO: faire une version ko
			flags = {"goes-to-quickbar"},
			order = Data.Name,
			subgroup="pokemod-ko",
			stack_size = 1
		}
	})
end

function GeneratePokemonUnits(Data)
-- Todo : générer les paramètres d'attaque ici
	
	local Resists = {
		plant 		= {{type = "fire",percent = -100},{type = "water",percent = 50},{type = "electric", percent = 50},{type = "plant",percent = 50}},
		fire 		= {{type = "water",percent = -100},{type = "plant",percent = 50},{type = "fire",percent = 50}},
		water 		= {{type = "plant",percent = -100},{type = "fire",percent = 50},{type = "water",percent = 50},{type = "electric", percent = -100}},
		electric 	= {{type = "electric",percent = 50}}
	}

	data:extend({
		{	-- healthy domestic
			type = "unit",
			name = Data.Name.."-domestic",
			icon = "__NadeoMod__/graphics/pokemon/"..Data.Name.."/icon.png",
			subgroup = "pokemod-units",
			flags = {"placeable-player", "player-creation", "placeable-off-grid"},
			order = Data.Name.."-domestic",
			collision_box = {{-Data.HalfSize.x, -Data.HalfSize.y}, {Data.HalfSize.x, Data.HalfSize.y}},
			selection_box = {{-Data.HalfSize.x * 1.1 - 0.1, -Data.HalfSize.y * 1.1 - 0.1}, {Data.HalfSize.x * 1.1 + 0.1, Data.HalfSize.y * 1.1 + 0.1}},
			distance_per_frame = 0.1,
			movement_speed = Data.Speed,
			max_health = Data.Hp,
			resistances = Resists[Data.Type],
			vision_distance = 30,
			distraction_cooldown = 300,
			pollution_to_join_attack = 20000000,
			attack_parameters = Data.Attack,
			run_animation = Data.Animation
		},
		{	-- healthy wild
			type = "unit",
			name = Data.Name.."-wild",
			icon = "__NadeoMod__/graphics/pokemon/"..Data.Name.."/icon.png",
			subgroup = "pokemod-units",
			flags = {"placeable-enemy", "placeable-off-grid"},
			order = Data.Name.."-wild",
			collision_box = {{-Data.HalfSize.x, -Data.HalfSize.y}, {Data.HalfSize.x, Data.HalfSize.y}},
			selection_box = {{-Data.HalfSize.x * 1.1 - 0.1, -Data.HalfSize.y * 1.1 - 0.1}, {Data.HalfSize.x * 1.1 + 0.1, Data.HalfSize.y * 1.1 + 0.1}},
			distance_per_frame = 0.1,
			movement_speed = Data.Speed,
			max_health = Data.Hp,
			resistances = Resists[Data.Type],
			vision_distance = 30,
			distraction_cooldown = 300,
			pollution_to_join_attack = 200,
			attack_parameters = Data.Attack,
			run_animation = Data.Animation
		},
		{	-- ko domestic
			type = "unit",
			name = Data.Name.."-domestic-ko",
			icon = "__NadeoMod__/graphics/pokemon/"..Data.Name.."/icon.png",
			subgroup = "pokemod-units",
			flags = {"placeable-off-grid", "breaths-air"},
			order = Data.Name.."-domestic-ko",
			collision_box = {{-Data.HalfSize.x, -Data.HalfSize.y}, {Data.HalfSize.x, Data.HalfSize.y}},
			selection_box = {{-Data.HalfSize.x * 1.1 - 0.1, -Data.HalfSize.y * 1.1 - 0.1}, {Data.HalfSize.x * 1.1 + 0.1, Data.HalfSize.y * 1.1 + 0.1}},
			distance_per_frame = 0.1,
			movement_speed = 0,
			max_health = 1,
			resistances = Resists[Data.Type],
			vision_distance = 0,
			distraction_cooldown = 300,
			pollution_to_join_attack = 200,
			attack_parameters = {
				type = "projectile",
				range = 0,
				cooldown = 60000,
				ammo_category = "melee",
				ammo_type = make_unit_melee_ammo_type(6),
				animation = Data.Animation_ko
			},
			run_animation 	= Data.Animation_ko,
			idle_animation 	= Data.Animation_ko,
			animation 		= Data.Animation_ko,
		},
		{	-- ko wild
			type = "unit",
			name = Data.Name.."-wild-ko",
			icon = "__NadeoMod__/graphics/pokemon/"..Data.Name.."/icon.png",
			subgroup = "pokemod-units",
			flags = {"placeable-off-grid", "breaths-air"},
			order = Data.Name.."-wild",
			collision_box = {{-Data.HalfSize.x, -Data.HalfSize.y}, {Data.HalfSize.x, Data.HalfSize.y}},
			selection_box = {{-Data.HalfSize.x * 1.1 - 0.1, -Data.HalfSize.y * 1.1 - 0.1}, {Data.HalfSize.x * 1.1 + 0.1, Data.HalfSize.y * 1.1 + 0.1}},
			distance_per_frame = 0.1,
			movement_speed = 0,
			max_health = 1,
			resistances = Resists[Data.Type],
			vision_distance = 0,
			distraction_cooldown = 300,
			pollution_to_join_attack = 20000,
			attack_parameters = {
				type = "projectile",
				range = 0,
				cooldown = 60000,
				ammo_category = "melee",
				ammo_type = make_unit_melee_ammo_type(6),
				animation = Data.Animation_ko
			},
			run_animation 	= Data.Animation_ko,
			idle_animation 	= Data.Animation_ko,
			animation 		= Data.Animation_ko,
		}
	})
end
