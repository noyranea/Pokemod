data:extend({
{
    type = "technology",
    name = "dna-processing",
    icon = "__NadeoMod__/graphics/dna/dna.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "dna-extractor-1"
      },
      {
        type = "unlock-recipe",
        recipe = "raikou-to-dna"
      },
		{
        type = "unlock-recipe",
        recipe = "charmander-to-dna"
      }
    },
    unit =
    {
      count = 40,
      ingredients = {{"science-pack-1", 1}},
      time = 5
    },
    order = "a-j"
}
})