require("prototypes.autoplace-controls")

-- Disable the enemies at start and during chunk generation
for index, unitspawner in pairs(data.raw["unit-spawner"]) do
	if unitspawner.autoplace.force == "enemy" then
		unitspawner.autoplace = null
	end
end
for index, turret in pairs(data.raw["turret"]) do
	if turret.autoplace.force == "enemy" then
		turret.autoplace = null
	end
end

-- Make sure no enemy will evolve or spawn (not sure if needed but just in case)
data.raw["map-settings"]["map-settings"].enemy_evolution.enabled = false;
data.raw["map-settings"]["map-settings"].enemy_expansion.enabled = false;

-- Remove enemy options from map generator dialog
data.raw["autoplace-control"]["enemy-base"] = null

local spawn_cd_max = 15
local spawn_cd_min = 10

-- Add pokemons !
data:extend(
{
  {
    type = "unit-spawner",
    name = "pokemon-nest-fire-1",
    icon = "__NadeoMod__/graphics/spawns/spawn_fire.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 350,
    order="b-b-g",
    subgroup="enemies",
    resistances = {	{type = "fire",		percent = 100},
					{type = "plant",	percent = 100},
					{type = "water",	percent = 100},
					{type = "electric",	percent = 100}
				},
    -- working_sound
    -- dying_sound
    healing_per_tick = 5,
   -- collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    selection_box = {{-1.3, -1.3}, {1.3, 1.3}},
    -- in ticks per 1 pu
    pollution_absorbtion_absolute = 20,
    pollution_absorbtion_proportional = 0.01,
    pollution_to_enhance_spawning = 30000,
	call_for_help_radius = 30,
    -- corpse = "biter-spawner-corpse",
    -- dying_explosion = "blood-explosion-huge",
    -- loot
    max_count_of_owned_units = 3,
    max_friends_around_to_spawn = 2,
    animations =
    {{
      filename = "__NadeoMod__/graphics/spawns/spawn_fire.png",
		line_length = 1,
		width = 48,
		height = 48,
		frame_count = 1,
		direction_count = 1,
		priority = "high",
    }},
    result_units = (function()
                    local res = {}
                    res[1] = {"charmander-wild", {{0.0, 0.3}, {0.7, 0.0}}}
                    return res
                   end)(),
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {spawn_cd_max, spawn_cd_min},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    autoplace =
    {
      sharpness = 0.6,
      control = "pokemon-nest-fire-1",
      order = "b[enemy]-b[biter-spawner]",
      richness_multiplier = 1,
      richness_base = 0,
      force = "enemy",
      peaks =
      {
        { -- first empty layer
          influence = 0,
          richness_influence = 100,
          tier_from_start_optimal = 20,
          tier_from_start_top_property_limit = 20,
          tier_from_start_max_range = 40,
        },
        { -- do not spawn in the starting area
          influence = -10.0,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        { -- 
          influence = 0.425,
          noise_layer = "pokemon-nest-fire-1",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.3,
        },
		-- increase the size when moving further away
        {
          influence = 0.5,
          noise_layer = "pokemon-nest-fire-1",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
          tier_from_start_optimal = 20,
          tier_from_start_top_property_limit = 20,
          tier_from_start_max_range = 40,
        },
		{
			influence = -0.2, 						-- Negative influence reduces value near iron
			max_influence = 0, 						-- Max of 0 stops copper from generating on iron
			noise_layer = "pokemon-nest-plant-1", 	-- Noise layer determines what to avoid
			noise_octaves_difference = -1.8, 		-- Increased effect further from start to match irons own increase
			noise_persistence = 0.45,
		},
		{
			influence = -0.2, 						-- Negative influence reduces value near iron
			max_influence = 0, 						-- Max of 0 stops copper from generating on iron
			noise_layer = "pokemon-nest-electric-1", 	-- Noise layer determines what to avoid
			noise_octaves_difference = -1.8, 		-- Increased effect further from start to match irons own increase
			noise_persistence = 0.45,
		},
		{
			influence = -0.2, 						-- Negative influence reduces value near iron
			max_influence = 0, 						-- Max of 0 stops copper from generating on iron
			noise_layer = "pokemon-nest-water-1", 	-- Noise layer determines what to avoid
			noise_octaves_difference = -1.8, 		-- Increased effect further from start to match irons own increase
			noise_persistence = 0.45,
		},
      }
    }
  },
  {
    type = "unit-spawner",
    name = "pokemon-nest-plant-1",
    icon = "__NadeoMod__/graphics/spawns/spawn_plant.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 350,
    order="b-b-g",
    subgroup="enemies",
    resistances = {	{type = "fire",		percent = 100},
					{type = "plant",	percent = 100},
					{type = "water",	percent = 100},
					{type = "electric",	percent = 100}
				},
    -- working_sound
    -- dying_sound
    healing_per_tick = 5,
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    selection_box = {{-1.3, -1.3}, {1.3, 1.3}},
    -- in ticks per 1 pu
    pollution_absorbtion_absolute = 20,
    pollution_absorbtion_proportional = 0.01,
    pollution_to_enhance_spawning = 30000,
	call_for_help_radius = 30,
    -- corpse = "biter-spawner-corpse",
    -- dying_explosion = "blood-explosion-huge",
    -- loot
    max_count_of_owned_units = 3,
    max_friends_around_to_spawn = 2,
    animations =
    {{
      filename = "__NadeoMod__/graphics/spawns/spawn_plant.png",
		line_length = 1,
		width = 48,
		height = 48,
		frame_count = 1,
		direction_count = 1,
		priority = "high",
    }},
    result_units = (function()
                    local res = {}
                    res[1] = {"raikou-wild", {{0.0, 0.3}, {0.7, 0.0}}}
                    return res
                   end)(),
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {spawn_cd_max, spawn_cd_min},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    autoplace =
    {
      sharpness = 0.6,
      control = "pokemon-nest-plant-1",
      order = "b[enemy]-b[biter-spawner]",
      richness_multiplier = 1,
      richness_base = 0,
      force = "enemy",
      peaks =
      {
        { -- first empty layer
          influence = 0,
          richness_influence = 100,
          tier_from_start_optimal = 20,
          tier_from_start_top_property_limit = 20,
          tier_from_start_max_range = 40,
        },
        { -- do not spawn in the starting area
          influence = -10.0,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        { -- 
          influence = 0.425,
          noise_layer = "pokemon-nest-plant-1",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.3,
        },
        -- increase the size when moving further away
        {
          influence = 0.5,
          noise_layer = "pokemon-nest-plant-1",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
          tier_from_start_optimal = 20,
          tier_from_start_top_property_limit = 20,
          tier_from_start_max_range = 40,
        },
		{
			influence = -0.2, 						-- Negative influence reduces value near iron
			max_influence = 0, 						-- Max of 0 stops copper from generating on iron
			noise_layer = "pokemon-nest-fire-1", 	-- Noise layer determines what to avoid
			noise_octaves_difference = -1.8, 		-- Increased effect further from start to match irons own increase
			noise_persistence = 0.45,
		},
		{
			influence = -0.2, 						-- Negative influence reduces value near iron
			max_influence = 0, 						-- Max of 0 stops copper from generating on iron
			noise_layer = "pokemon-nest-electric-1", 	-- Noise layer determines what to avoid
			noise_octaves_difference = -1.8, 		-- Increased effect further from start to match irons own increase
			noise_persistence = 0.45,
		},
		{
			influence = -0.2, 						-- Negative influence reduces value near iron
			max_influence = 0, 						-- Max of 0 stops copper from generating on iron
			noise_layer = "pokemon-nest-water-1", 	-- Noise layer determines what to avoid
			noise_octaves_difference = -1.8, 		-- Increased effect further from start to match irons own increase
			noise_persistence = 0.45,
		},
      }
    }
  },
  {
    type = "unit-spawner",
    name = "pokemon-nest-water-1",
    icon = "__NadeoMod__/graphics/spawns/spawn_water.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 350,
    order="b-b-g",
    subgroup="enemies",
    resistances = {	{type = "fire",		percent = 100},
					{type = "plant",	percent = 100},
					{type = "water",	percent = 100},
					{type = "electric",	percent = 100}
				},
    -- working_sound
    -- dying_sound
    healing_per_tick = 5,
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    selection_box = {{-1.3, -1.3}, {1.3, 1.3}},
    -- in ticks per 1 pu
    pollution_absorbtion_absolute = 20,
    pollution_absorbtion_proportional = 0.01,
    pollution_to_enhance_spawning = 30000,
	call_for_help_radius = 30,
    -- corpse = "biter-spawner-corpse",
    -- dying_explosion = "blood-explosion-huge",
    -- loot
    max_count_of_owned_units = 3,
    max_friends_around_to_spawn = 2,
    animations =
    {{
      filename = "__NadeoMod__/graphics/spawns/spawn_water.png",
		line_length = 1,
		width = 48,
		height = 48,
		frame_count = 1,
		direction_count = 1,
		priority = "high",
    }},
    result_units = (function()
                    local res = {}
                    res[1] = {"raikou-wild", {{0.0, 0.3}, {0.7, 0.0}}}
                    return res
                   end)(),
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {spawn_cd_max, spawn_cd_min},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    autoplace =
    {
      sharpness = 0.6,
      control = "pokemon-nest-water-1",
      order = "b[enemy]-b[biter-spawner]",
      richness_multiplier = 1,
      richness_base = 0,
      force = "enemy",
      peaks =
      {
        { -- first empty layer
          influence = 0,
          richness_influence = 100,
          tier_from_start_optimal = 20,
          tier_from_start_top_property_limit = 20,
          tier_from_start_max_range = 40,
        },
        { -- do not spawn in the starting area
          influence = -10.0,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        { -- 
          influence = 0.425,
          noise_layer = "pokemon-nest-water-1",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.3,
        },
        -- increase the size when moving further away
        {
          influence = 0.5,
          noise_layer = "pokemon-nest-water-1",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
          tier_from_start_optimal = 20,
          tier_from_start_top_property_limit = 20,
          tier_from_start_max_range = 40,
        },
		{
			influence = -0.2, 						-- Negative influence reduces value near iron
			max_influence = 0, 						-- Max of 0 stops copper from generating on iron
			noise_layer = "pokemon-nest-fire-1", 	-- Noise layer determines what to avoid
			noise_octaves_difference = -1.8, 		-- Increased effect further from start to match irons own increase
			noise_persistence = 0.45,
		},
		{
			influence = -0.2, 						-- Negative influence reduces value near iron
			max_influence = 0, 						-- Max of 0 stops copper from generating on iron
			noise_layer = "pokemon-nest-electric-1", 	-- Noise layer determines what to avoid
			noise_octaves_difference = -1.8, 		-- Increased effect further from start to match irons own increase
			noise_persistence = 0.45,
		},
		{
			influence = -0.2, 						-- Negative influence reduces value near iron
			max_influence = 0, 						-- Max of 0 stops copper from generating on iron
			noise_layer = "pokemon-nest-plant-1", 	-- Noise layer determines what to avoid
			noise_octaves_difference = -1.8, 		-- Increased effect further from start to match irons own increase
			noise_persistence = 0.45,
		},
      }
    }
  },
  {
    type = "unit-spawner",
    name = "pokemon-nest-electric-1",
    icon = "__NadeoMod__/graphics/spawns/spawn_electric.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 350,
    order="b-b-g",
    subgroup="enemies",
    resistances = {	{type = "fire",		percent = 100},
					{type = "plant",	percent = 100},
					{type = "water",	percent = 100},
					{type = "electric",	percent = 100}
				},
    -- working_sound
    -- dying_sound
    healing_per_tick = 5,
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    selection_box = {{-1.3, -1.3}, {1.3, 1.3}},
    -- in ticks per 1 pu
    pollution_absorbtion_absolute = 20,
    pollution_absorbtion_proportional = 0.01,
    pollution_to_enhance_spawning = 30000,
	call_for_help_radius = 30,
    -- corpse = "biter-spawner-corpse",
    -- dying_explosion = "blood-explosion-huge",
    -- loot
    max_count_of_owned_units = 3,
    max_friends_around_to_spawn = 2,
    animations =
    {{
      filename = "__NadeoMod__/graphics/spawns/spawn_electric.png",
		line_length = 1,
		width = 48,
		height = 48,
		frame_count = 1,
		direction_count = 1,
		priority = "high",
    }},
    result_units = (function()
                    local res = {}
                    res[1] = {"raikou-wild", {{0.0, 0.3}, {0.7, 0.0}}}
                    return res
                   end)(),
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {spawn_cd_max, spawn_cd_min},	
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    autoplace =
    {
      sharpness = 0.6,
      control = "pokemon-nest-electric-1",
      order = "b[enemy]-b[biter-spawner]",
      richness_multiplier = 1,
      richness_base = 0,
      force = "enemy",
      peaks =
      {
        { -- first empty layer
          influence = 0,
          richness_influence = 100,
          tier_from_start_optimal = 20,
          tier_from_start_top_property_limit = 20,
          tier_from_start_max_range = 40,
        },
        { -- do not spawn in the starting area
          influence = -10.0,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        { -- 
          influence = 0.425,
          noise_layer = "pokemon-nest-electric-1",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.3,
        },
        -- increase the size when moving further away
        {
          influence = 0.5,
          noise_layer = "pokemon-nest-electric-1",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
          tier_from_start_optimal = 20,
          tier_from_start_top_property_limit = 20,
          tier_from_start_max_range = 40,
        },
		{
			influence = -0.2, 						-- Negative influence reduces value near iron
			max_influence = 0, 						-- Max of 0 stops copper from generating on iron
			noise_layer = "pokemon-nest-fire-1", 	-- Noise layer determines what to avoid
			noise_octaves_difference = -1.8, 		-- Increased effect further from start to match irons own increase
			noise_persistence = 0.45,
		},
		{
			influence = -0.2, 						-- Negative influence reduces value near iron
			max_influence = 0, 						-- Max of 0 stops copper from generating on iron
			noise_layer = "pokemon-nest-plant-1", 	-- Noise layer determines what to avoid
			noise_octaves_difference = -1.8, 		-- Increased effect further from start to match irons own increase
			noise_persistence = 0.45,
		},
		{
			influence = -0.2, 						-- Negative influence reduces value near iron
			max_influence = 0, 						-- Max of 0 stops copper from generating on iron
			noise_layer = "pokemon-nest-water-1", 	-- Noise layer determines what to avoid
			noise_octaves_difference = -1.8, 		-- Increased effect further from start to match irons own increase
			noise_persistence = 0.45,
		},
      }
    }
  }
})