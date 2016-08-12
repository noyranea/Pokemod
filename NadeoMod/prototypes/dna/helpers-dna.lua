function GenerateDNARecipe(Data) 
	data:extend({
		{
			type 			= "recipe",
			name 			= Data.Name.."-to-dna",
			ingredients 	= {{Data.Name, 1}},
			icon 			= "__NadeoMod__/graphics/pokemon/"..Data.Name.."/icon.png",
			result 			= "dna-"..Data.Type,
			category 		= "dna",
			enabled 		= true --hack test
		}
	})
end