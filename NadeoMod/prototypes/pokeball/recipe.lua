data:extend({
	{	-- 7iron/1copper
		type = "recipe",
		name = "pokeball-frame",
		ingredients = {{"iron-plate", 3}, {"iron-gear-wheel", 2}, {"copper-cable", 2}},
		result = "pokeball-frame",
		energy_required = 5
	},
	{	--5iron/3.5copper
		type = "recipe",
		name = "pokeball-reductor-1",
		ingredients = {{"iron-gear-wheel", 2}, {"electronic-circuit", 1}, {"copper-plate", 2}},
		result = "pokeball-reductor-1",
		energy_required = 5
	},
	{	--8iron/10.5copper
		type = "recipe",
		name = "pokeball-converter-1",
		ingredients = {{"basic-inserter", 1}, {"electronic-circuit", 4}, {"copper-cable", 6}},
		result = "pokeball-converter-1",
		energy_required = 5
	},
	{	--20iron/15copper
		type = "recipe",
		name = "pokeball",
		ingredients = {{"pokeball-frame", 1}, {"pokeball-reductor-1", 1}, {"pokeball-converter-1", 1}},
		result = "pokeball-empty",
		energy_required = 2.5
	}
})