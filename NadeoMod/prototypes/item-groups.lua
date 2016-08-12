data:extend({
	{
		type = "item-subgroup",
		name = "pokemod-intermediates",
		group = "intermediate-products",
		order = "a"
	},

	{
		type = "item-group",
		name = "pokemod-invisible",
		order = "f",
		inventory_order = "a",
		icon = "__NadeoMod__/graphics/icons/pokeball.png",
	},
	{
		type = "item-subgroup",
		name = "pokemod-capsules",
		group = "pokemod-invisible",
		order = "a"
	},
	{
		type = "item-subgroup",
		name = "pokemod-ko",
		group = "pokemod-invisible",
		order = "b"
	},
	{
		type = "item-subgroup",
		name = "pokemod-units",
		group = "pokemod-invisible",
		order = "c"
	},
	{
		type = "item-subgroup",
		name = "pokemod-capture",
		group = "pokemod-invisible",
		order = "d"
	},
	{
		type = "item-subgroup",
		name = "pokemod-misc",
		group = "pokemod-invisible",
		order = "zz"
	},
	
	{
		type = "item-group",
		name = "pokemod-pokeballs",
		order = "g",
		inventory_order = "a",
		icon = "__NadeoMod__/graphics/icons/pokeball.png",
	},
	{
		type = "item-subgroup",
		name = "pokemod-standard",
		group = "pokemod-pokeballs",
		order = "a"
	},
	
	{
		type = "item-group",
		name = "pokemod-dna",
		order = "h",
		inventory_order = "a",
		icon = "__NadeoMod__/graphics/dna/dna.png",
	},
	{
		type = "item-subgroup",
		name = "dna-electric",
		group = "pokemod-dna",
		order = "a"
	},
	{
		type = "item-subgroup",
		name = "dna-fire",
		group = "pokemod-dna",
		order = "b"
	},
	
	{
		type = "recipe-category",
		name = "dna"
	}
})