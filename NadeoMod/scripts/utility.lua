local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey

function Spawn(data)
	if (data.isItemOrElseEntity)
	then
		game.surfaces.nauvis.spill_item_stack(	data.position, 
												{	name	= data.name,
													count	=1 })
	else
		if (data.force == "neutral") then
			game.surfaces.nauvis.create_entity{	name 	= data.name, 
											position 	= data.position, 
											force 		= game.forces.neutral }
		elseif (data.force == "enemy") then
			game.surfaces.nauvis.create_entity{	name 	= data.name, 
											position 	= data.position, 
											force 		= game.forces.enemy }
		else
			game.surfaces.nauvis.create_entity{	name 	= data.name, 
											position 	= data.position, 
											force 		= game.forces.player }
		end
	end
end
MoTimers.CacheFunction("Spawn",Spawn)


function Unspawn(data)
	local E = KTE(data.entity)
	if not E or E==nil or not E.valid then return end
	E.destroy()
end
MoTimers.CacheFunction("Unspawn",Unspawn)