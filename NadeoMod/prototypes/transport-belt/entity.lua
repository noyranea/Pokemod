super_belt_horizontal =
  {
    filename = "__NadeoMod__/graphics/transport-belt/super-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32
  }
super_belt_vertical =
  {
    filename = "__NadeoMod__/graphics/transport-belt/super-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 40
  }
super_belt_ending_top =
  {
    filename = "__NadeoMod__/graphics/transport-belt/super-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 80
  }
super_belt_ending_bottom =
  {
    filename = "__NadeoMod__/graphics/transport-belt/super-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 120
  }
super_belt_ending_side =
  {
    filename = "__NadeoMod__/graphics/transport-belt/super-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 160
  }
super_belt_starting_top =
  {
    filename = "__NadeoMod__/graphics/transport-belt/super-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 200
  }
super_belt_starting_bottom =
  {
    filename = "__NadeoMod__/graphics/transport-belt/super-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 240
  }
super_belt_starting_side =
  {
    filename = "__NadeoMod__/graphics/transport-belt/super-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 280
  }
  
  
extreme_belt_horizontal =
  {
    filename = "__NadeoMod__/graphics/transport-belt/extreme-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32
  }
extreme_belt_vertical =
  {
    filename = "__NadeoMod__/graphics/transport-belt/extreme-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 40
  }
extreme_belt_ending_top =
  {
    filename = "__NadeoMod__/graphics/transport-belt/extreme-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 80
  }
extreme_belt_ending_bottom =
  {
    filename = "__NadeoMod__/graphics/transport-belt/extreme-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 120
  }
extreme_belt_ending_side =
  {
    filename = "__NadeoMod__/graphics/transport-belt/extreme-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 160
  }
extreme_belt_starting_top =
  {
    filename = "__NadeoMod__/graphics/transport-belt/extreme-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 200
  }
extreme_belt_starting_bottom =
  {
    filename = "__NadeoMod__/graphics/transport-belt/extreme-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 240
  }
extreme_belt_starting_side =
  {
    filename = "__NadeoMod__/graphics/transport-belt/extreme-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 280
  }

data:extend(
{
  {
    type = "transport-belt",
    name = "super-transport-belt",
    icon = "__NadeoMod__/graphics/transport-belt/icon/super-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = "super-transport-belt"},
    max_health = 50,
    corpse = "small-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 50
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
      filename = "__NadeoMod__/graphics/transport-belt/super-transport-belt.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      frame_count = 32,
      direction_count = 12
    },
	 belt_horizontal = super_belt_horizontal,
    belt_vertical = super_belt_vertical,
    ending_top = super_belt_ending_top,
    ending_bottom = super_belt_ending_bottom,
    ending_side = super_belt_ending_side,
    starting_top = super_belt_starting_top,
    starting_bottom = super_belt_starting_bottom,
    starting_side = super_belt_starting_side,
    ending_patch = ending_patch_prototype,
    fast_replaceable_group = "transport-belt",
    speed = 0.133
  },
  {
    type = "transport-belt",
    name = "extreme-transport-belt",
    icon = "__NadeoMod__/graphics/transport-belt/icon/extreme-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = "extreme-transport-belt"},
    max_health = 50,
    corpse = "small-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 50
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
      filename = "__NadeoMod__/graphics/transport-belt/extreme-transport-belt.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      frame_count = 32,
      direction_count = 12
    },
	belt_horizontal = extreme_belt_horizontal,
    belt_vertical = extreme_belt_vertical,
    ending_top = extreme_belt_ending_top,
    ending_bottom = extreme_belt_ending_bottom,
    ending_side = extreme_belt_ending_side,
    starting_top = extreme_belt_starting_top,
    starting_bottom = extreme_belt_starting_bottom,
    starting_side = extreme_belt_starting_side,
    ending_patch = ending_patch_prototype,
    fast_replaceable_group = "transport-belt",
    speed = 0.18
  }
 }
)