data:extend({
 {
    type = "container",
    name = "poke-chest",
    icon = "__base__/graphics/icons/wooden-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "poke-chest"},
    max_health = 50,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    fast_replaceable_group = "container",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    inventory_size = 16,
	emissions_per_tick = 1000,
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    picture =
    {
      filename = "__base__/graphics/entity/wooden-chest/wooden-chest.png",
      priority = "extra-high",
      width = 46,
      height = 33,
      shift = {0.3, 0}
    }
  },
  {
    type = "recipe",
    name = "poke-chest",
    ingredients = {{"wood", 4}},
    result = "poke-chest"
  },
   {
    type = "item",
    name = "poke-chest",
    icon = "__base__/graphics/icons/wooden-chest.png",
    flags = {"goes-to-quickbar"},
    fuel_value = "4MJ",
    subgroup = "storage",
    order = "a[items]-a[poke-chest]",
    place_result = "poke-chest",
    stack_size = 50
  }
 })
