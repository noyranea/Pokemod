data:extend ({
	{
		type = "item",
		name = "dna-electric",
		icon = "__NadeoMod__/graphics/dna/dna-electric.png",
		flags = {"goes-to-quickbar"},
		subgroup = "dna-electric",
		order = "dna-electric",
		stack_size = 50
	},
	{
		type = "item",
		name = "dna-fire",
		icon = "__NadeoMod__/graphics/dna/dna-electric.png", --todo
		flags = {"goes-to-quickbar"},
		subgroup = "dna-fire",
		order = "dna-fire",
		stack_size = 50
	},
	{
		type = "item",
		name = "dna-extractor-1",
		icon = "__base__/graphics/icons/assembling-machine-1.png",
		flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "a[dna-extractor-1]",
		place_result = "dna-extractor-1",
		stack_size = 20
	}
})

data.raw["solar-panel"]["solar-panel"].production = "5MW"