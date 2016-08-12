function GenerateCaptureAnimation(Name, Variation)
	local width, height = 192, 192
	local width_in_frames, height_in_frames = 6, 1
	local scale = 0.6
	
	local frame_count
	if (Variation < 4) then
		frame_count = (2 + Variation) * 24
	else
		frame_count = (1 + Variation) * 24
	end
	
	local animation = {
		width 			= width,
		height 			= height,
		scale 			= scale,
		direction_count = 1,
		priority 		= "high",
		frame_count 	= frame_count,
		stripes 		= {}
	}
	
	for i=1,4 do
		table.insert(	animation.stripes,
						{
							filename = "__NadeoMod__/graphics/pokeballs/"..Name.."/capture_start_"..i..".png",
							width_in_frames = width_in_frames,
							height_in_frames = height_in_frames
						}	)
	end
	for i=1,Variation do
		for j=1,4 do
			table.insert(	animation.stripes,
							{
								filename = "__NadeoMod__/graphics/pokeballs/"..Name.."/capture_run_"..j..".png",
								width_in_frames = width_in_frames,
								height_in_frames = height_in_frames
							}	)
		end
	end
	
	if (Variation < 4) then
		for i=1,4 do
			table.insert(	animation.stripes,
							{
								filename = "__NadeoMod__/graphics/pokeballs/"..Name.."/capture_fail_"..i..".png",
								width_in_frames = width_in_frames,
								height_in_frames = height_in_frames
							}	)
		end
	end
	
	return animation
end

function GenerateCaptureTokens(Name)
	data:extend({
		{
			type = "item",
			name = Name.."-empty-token",
			icon = "__NadeoMod__/graphics/icons/"..Name..".png",
			flags = {},
			order = Name,
			subgroup = "pokemod-capture",
			place_result = "pokeball-empty-token",
			stack_size = 1,
		},
		{
			type = "simple-entity",
			name = Name.."-empty-token",
			max_health = 1,
			render_layer = "smoke",
			icon = "__NadeoMod__/graphics/icons/"..Name..".png",
			picture = {
				filename = "__NadeoMod__/graphics/icons/"..Name..".png",
				width = 22,
				height = 22
			}
		}
	})
	
	for i=1,4 do
		local animation = GenerateCaptureAnimation(Name, i)
		data:extend({
			{
				type = "corpse",
				name = Name.."-empty-token-capture-"..i,
				icon = "__NadeoMod__/graphics/icons/"..Name..".png",
				selectable_in_game = false,
				subgroup = "pokemod-capture",
				order = Name.."-capture-"..i,
				flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
				dying_speed = 1 / (animation.frame_count * 5 / 3),
				time_before_removed = 60*60*15,
				render_layer = "higher-object-above",
				animation = animation
			}
		})
	end	
end

function GeneratePokeballItems(Name)
	data:extend({
		{
			type = "capsule",
			name = Name.."-empty",
			icon = "__NadeoMod__/graphics/icons/"..Name..".png",
			flags = {"goes-to-quickbar"},
			order= Name,
			subgroup="pokemod-standard",
			capsule_action = {
				type = "throw",
				attack_parameters =
				{
					type = "projectile",
					ammo_category = "capsule",
					cooldown = 30,
					projectile_creation_distance = 0.6,
					range = 25,
					ammo_type =
					{
						category = "capsule",
						target_type = "position",
						action =
						{
							type = "direct",
							action_delivery =
							{
								type = "projectile",
								projectile = Name.."-empty",
								starting_speed = 0.3
							}
						}
					}
				}
			},
			stack_size = 20
		},
		{
			type = "projectile",
			name = Name.."-empty",
			flags = {"not-on-map"},
			acceleration = 0.005,
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						{
							type = "create-entity",
							trigger_created_entity= true,
							entity_name = Name.."-empty-token" --pour choper l'event et lancer la capture
						},
					}
				}
			},
			light = {intensity = 0.5, size = 4},
			animation = {
				filename = "__NadeoMod__/graphics/pokeballs/"..Name.."/pokeball_throw.png",
				line_length = 10,
				width = 23,
				height = 22,
				scale = 0.5,
				frame_count = 10,
				direction_count = 1,
				priority = "high",
			},
			--shadow =
			--{
			--filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
			--frame_count = 1,
			--width = 32,
			--height = 32,
			--priority = "high"
			--},
			--smoke = capsule_smoke,
		}
	})
end