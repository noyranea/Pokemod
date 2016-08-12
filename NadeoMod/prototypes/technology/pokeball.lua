data:extend({
{
    type = "technology",
    name = "capture-devices",
    icon = "__NadeoMod__/graphics/icons/pokeball.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "pokeball-frame"
      },
      {
        type = "unlock-recipe",
        recipe = "pokeball-reductor-1"
      },
		{
        type = "unlock-recipe",
        recipe = "pokeball-converter-1"
      },
	  {
        type = "unlock-recipe",
        recipe = "pokeball"
      },
    },
    unit =
    {
      count = 20,
      ingredients = {{"science-pack-1", 1}},
      time = 5
    },
    order = "a-j"
}
})