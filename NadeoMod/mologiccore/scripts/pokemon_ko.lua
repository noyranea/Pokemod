script.on_event(defines.events.on_entity_died, function(event)
	if (event.entity.name == "small-biter") then
	game.surfaces.nauvis.create_entity{	name = "small-biter-ko", 
										position = event.entity.position, 
										force = game.forces.neutral }
	end
	end
)


--