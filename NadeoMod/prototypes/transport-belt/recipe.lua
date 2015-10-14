data:extend(
{ 
  {
    type = "recipe",
    name = "super-transport-belt",
    category = "crafting-with-fluid",
    enabled = false,
	energy_required = 5,
    ingredients =
    {
	  --{"tungsten-gear-wheel", 10},--
      {"express-transport-belt", 1},
      {type="fluid", name="lubricant", amount=5},
    },
    result = "super-transport-belt"
  },
  {
    type = "recipe",
    name = "extreme-transport-belt",
    category = "crafting-with-fluid",
    enabled = false,
	energy_required = 6,
    ingredients =
    {
	--{"tungsten-gear-wheel", 10},--
      {"super-transport-belt", 1},
      {type="fluid", name="lubricant", amount=10},
    },
    result = "extreme-transport-belt"
  }
}
)