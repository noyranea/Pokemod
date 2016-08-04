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
    -- module_specification =
    -- {
      -- module_slots = 2,
      -- module_info_icon_shift = {0, 0.8}
    -- },
    -- allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    -- crafting_categories = {"smelting"},
    -- result_inventory_size = 1,
    -- crafting_speed = 2,
    -- energy_usage = "180kW",
    -- source_inventory_size = 1,
    -- energy_source =
    -- {
      -- type = "electric",
      -- usage_priority = "secondary-input",
      -- emissions = 0.005
    -- },
    -- vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    -- working_sound =
    -- {
      -- sound =
      -- {
        -- filename = "__base__/sound/electric-furnace.ogg",
        -- volume = 0.7
      -- },
      -- apparent_volume = 1.5
    -- },
    -- animation =
    -- {
      -- filename = "__base__/graphics/entity/electric-furnace/electric-furnace-base.png",
      -- priority = "high",
      -- width = 129,
      -- height = 100,
      -- frame_count = 1,
      -- shift = {0.421875, 0}
    -- },
    -- working_visualisations =
    -- {
      -- {
        -- animation =
        -- {
          -- filename = "__base__/graphics/entity/electric-furnace/electric-furnace-heater.png",
          -- priority = "high",
          -- width = 25,
          -- height = 15,
          -- frame_count = 12,
          -- animation_speed = 0.5,
          -- shift = {0.015625, 0.890625}
        -- },
        -- light = {intensity = 0.4, size = 6, shift = {0.0, 1.0}}
      -- },
      -- {
        -- animation =
        -- {
          -- filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-1.png",
          -- priority = "high",
          -- width = 19,
          -- height = 13,
          -- frame_count = 4,
          -- animation_speed = 0.5,
          -- shift = {-0.671875, -0.640625}
        -- }
      -- },
      -- {
        -- animation =
        -- {
          -- filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-2.png",
          -- priority = "high",
          -- width = 12,
          -- height = 9,
          -- frame_count = 4,
          -- animation_speed = 0.5,
          -- shift = {0.0625, -1.234375}
        -- }
      -- }
    -- },
    -- fast_replaceable_group = "furnace"
{
    type = "furnace",
    name = "pokeball-empty-token",
    icon = "__base__/graphics/icons/basic-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
	max_health = 50,
	collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	--render_layer= "smoke",
	source_inventory_size = 1,
    idle_animation = {
		filename = "__NadeoMod__/graphics/raikou/sheet.png",
		line_length = 3,
		width = 37,
		height = 37,
		frame_count = 3,
		direction_count = 8,
		priority = "high",
	
     -- filename = "__NadeoMod__/graphics/raikou/pokeball_lights.png",
     -- priority = "extra-high",
     -- width = 32,
     -- height = 32,
     -- frame_count = 25,
     -- direction_count = 1,
	 -- line_length = 5,
    },
	crafting_categories = {"smelting"},
	 result_inventory_size = 1,
    energy_usage = "0kW",
    crafting_speed = 3,
    energy_source =
    {
     type = "electric",
	 buffer_capacity = "3kW",
     usage_priority = "secondary-input",
     emissions = 0.005
     },
	animation = {
		filename = "__NadeoMod__/graphics/raikou/sheet.png",
		line_length = 3,
		width = 37,
		height = 37,
		frame_count = 3,
		direction_count = 8,
		priority = "high",
	
     -- filename = "__NadeoMod__/graphics/raikou/pokeball_lights.png",
     -- priority = "extra-high",
     -- width = 32,
     -- height = 32,
     -- frame_count = 25,
     -- direction_count = 1,
	 -- line_length = 5,
    }
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