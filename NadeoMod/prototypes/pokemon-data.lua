require "pokemon-data-helpers"

PokemonData = {}

table.insert(PokemonData,
{
	Name = "raikou",
	Type = "electric",
	HalfSize = {x=0.4, y=0.4},
	Hp = 300, 
	Attack = GetMeleeAttackParameters(	35, 
										10, 
										"electric", 
										{
											filename = "__NadeoMod__/graphics/pokemon/raikou/attack.png",
											line_length = 3,
											width = 43,
											height = 31,
											frame_count = 3,
											direction_count = 8,
											priority = "high",
										},  
										make_biter_roars(0.5)),
	Speed = 0.15, 
	Animation = {
		filename = "__NadeoMod__/graphics/pokemon/raikou/run.png",
		line_length = 3,
		width = 37,
		height = 37,
		frame_count = 3,
		direction_count = 8,
		priority = "high",
		shift = {0, 0}
	},
	Animation_ko = {
		direction_count = 1,
		filename = "__NadeoMod__/graphics/pokemon/raikou/ko.png",
		line_length = 2,
		width = 28,
		height = 27,
		frame_count = 2,
		priority = "high",
		shift = {0, 0}
	}
})

table.insert(PokemonData,
{
	Name = "charmander",
	Type = "fire",
	HalfSize = {x=0.25, y=0.25},
	Hp = 100, 
	Attack = GetMeleeAttackParameters(	50, 
										6, 
										"fire", 
										{
											filename = "__NadeoMod__/graphics/pokemon/charmander/attack.png",
											line_length = 3,
											width = 22,
											height = 22,
											frame_count = 3,
											direction_count = 8,
											priority = "high",
										},  
										make_biter_roars(0.5)),
	Speed = 0.08, 
	Animation = {
		filename = "__NadeoMod__/graphics/pokemon/charmander/run.png",
		line_length = 3,
		width = 22,
		height = 22,
		frame_count = 3,
		direction_count = 8,
		priority = "high",
		shift = {0, 0}
	},
	Animation_ko = {
		direction_count = 1,
		filename = "__NadeoMod__/graphics/pokemon/charmander/ko.png",
		line_length = 2,
		width = 22,
		height = 22,
		frame_count = 2,
		priority = "high",
		shift = {0, 0}
	}
})