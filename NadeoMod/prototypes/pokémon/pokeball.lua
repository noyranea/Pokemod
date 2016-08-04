data:extend( 
{

{
	type = "item",
	name = "pokeball-empty-token",
	icon = "__NadeoMod__/graphics/raikou/icon_raikou.png",
	flags = {"goes-to-quickbar"},
	order="c",
	subgroup="drone-combat",
	place_result = "pokeball-empty-token",
	stack_size = 20,
},
{
    type = "transport-belt",
    name = "pokeball-empty-token",
    icon = "__base__/graphics/icons/basic-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = "basic-transport-belt"},
    max_health = 50,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/basic-transport-belt.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 3
    },
    animation_speed_coefficient = 32,
    animations =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      frame_count = 16,
      direction_count = 12
    },
    belt_horizontal = basic_belt_horizontal,
    belt_vertical = basic_belt_vertical,
    ending_top = basic_belt_ending_top,
    ending_bottom = basic_belt_ending_bottom,
    ending_side = basic_belt_ending_side,
    starting_top = basic_belt_starting_top,
    starting_bottom = basic_belt_starting_bottom,
    starting_side = basic_belt_starting_side,
    ending_patch = ending_patch_prototype,
    fast_replaceable_group = "transport-belt",
    speed = 0.03125
},

{
	type = "capsule",
	name = "pokeball-raikou",
	icon = "__NadeoMod__/graphics/raikou/icon_raikou.png",
	flags = {"goes-to-quickbar"},
	order="c",
	subgroup="drone-combat",
	--place_result = "pokeball-raikou",
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
              projectile = "pokeball-raikou",
              starting_speed = 0.3
            }
          }
        }
      }
    }
},

{
    type = "projectile",
    name = "pokeball-raikou",
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
            entity_name = "attack-drone"
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
		frame_count = 10,
		direction_count = 1,
		priority = "high",
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

 {
	type = "capsule",
	name = "pokeball-empty",
	icon = "__NadeoMod__/graphics/raikou/icon_pokeball.png",
	flags = {"goes-to-quickbar"},
	order="c",
	subgroup="drone-combat",
	--place_result = "pokeball-empty",
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
              projectile = "pokeball-empty",
              starting_speed = 0.3
            }
          }
        }
      }
    },
	stack_size = 20
},

 {
    type = "projectile",
    name = "pokeball-empty",
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
            entity_name = "pokeball-empty-token" --pour choper l'event et lancer la capture
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
		frame_count = 10,
		direction_count = 1,
		priority = "high",
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
  }
  })