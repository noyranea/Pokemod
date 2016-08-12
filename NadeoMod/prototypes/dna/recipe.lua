data:extend({
	{
		type = "recipe",
		name = "dna-extractor-1",
		enabled = true, --hack test
		ingredients =
		{
			{"electronic-circuit", 3},
			{"iron-gear-wheel", 5},
			{"iron-plate", 9}
		},
		result = "dna-extractor-1"
	},
})

for i, pokemon in pairs(PokemonData) do
	GenerateDNARecipe(pokemon)
end