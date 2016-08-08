local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local Drones = Drones --Localise

--Ease function to help synchronise changes across all drone spawning.
function Drones.SetupDrone(E,O)
	local Pos = E.position
	MoEntity.AddToLoop("advcomdrones",E,{T=0,CMD=O or {F="Idle",D={}}})
end

--None player spawning of drones.
function Drones.SpawnDrone(E,T,O)
	local V = E.surface.find_non_colliding_position(T, E.position, 10, 1)
	
	local Drone=E.surface.create_entity{name = T, position=V}
	Drone.force=E.force
	Drones.SetupDrone(Drone,O)
end

function Drones.ContainsDrones(E)
	for i,d in pairs(Drones.DroneTypes) do
		local Drones = E.get_item_count(d)
		if Drones > 0 then
			return {T=d,A=Drones}
		end
	end
end

--For Each drone type we want to spawn and act as a drone.
for i,d in pairs(Drones.DroneTypes) do
	MoEntity.SubscribeOnBuilt(d,"dronedetectspawn",Drones.SetupDrone)
end

script.on_event(defines.events.on_trigger_created_entity, function(event)
if event.entity.name == "attack-drone"
then Drones.SetupDrone(event.entity, false)
elseif event.entity.name == "pokeball-empty-token"
	then local Scan = game.surfaces.nauvis.find_entities_filtered{area={{event.entity.position.x-0.5, event.entity.position.y-0.5},{event.entity.position.x+0.5, event.entity.position.y+0.5	}},
															type="unit", force="neutral"}
		for i,u in pairs(Scan) do
			--game.players[0].print(u.name)
			if (u.name == "small-biter-ko")
			then 
				--game.surfaces.nauvis.spill_item_stack(event.entity.position, 
				--							{name="pokeball-raikou", count=1})
				local pos = u.position
				u.destroy()
				local result = math.random(100)
				for i,p in pairs(game.players) do
					p.print("capture roll :"..result)
				end
				if (result < 30) then
					local pokeball = game.surfaces.nauvis.create_entity{	name 		= "pokeball-empty-token-corpse1", 
																			position 	= pos,
																			force 		= game.forces.neutral }
					MoTimers.CreateTimer("Unspawn_Capture", 3*2/3*60, 1, false, Unspawn, { entity = RegKey(pokeball) })
					MoTimers.CreateTimer("Spawn_Capture", 1.8*60, 1, false, Spawn, {	isItemOrElseEntity 	= false,
																					name				= "small-biter-ko",
																					position			= pos,
																					force				= "neutral"
																			})
				elseif (result < 60) then
					local pokeball = game.surfaces.nauvis.create_entity{	name 		= "pokeball-empty-token-corpse2", 
																			position 	= pos,
																			force 		= game.forces.neutral }
					MoTimers.CreateTimer("Unspawn_Capture", 4*2/3*60, 1, false, Unspawn, { entity = RegKey(pokeball) })
					MoTimers.CreateTimer("Spawn_Capture", (4*2/3-0.2)*60, 1, false, Spawn, {	isItemOrElseEntity 	= false,
																								name				= "small-biter-ko",
																								position			= pos,
																								force				= "neutral"
																			})
				elseif (result < 90) then
					local pokeball = game.surfaces.nauvis.create_entity{	name 		= "pokeball-empty-token-corpse3", 
																			position 	= pos,
																			force 		= game.forces.neutral }
					MoTimers.CreateTimer("Unspawn_Capture", 5*2/3*60, 1, false, Unspawn, { entity = RegKey(pokeball) })
					MoTimers.CreateTimer("Spawn_Capture", (5*2/3-0.2)*60, 1, false, Spawn, {	isItemOrElseEntity 	= false,
																								name				= "small-biter-ko",
																								position			= pos,
																								force				= "neutral"
																							})
				else
					local pokeball = game.surfaces.nauvis.create_entity{	name 		= "pokeball-empty-token-corpse4", 
																			position 	= pos,
																			force 		= game.forces.neutral }
					MoTimers.CreateTimer("Unspawn_Capture", 5*2/3*60, 1, false, Unspawn, { entity = RegKey(pokeball) })
					MoTimers.CreateTimer("Spawn_Capture", 5*2/3*60, 1, false, Spawn, {	isItemOrElseEntity 	= true,
																						name				= "pokeball-raikou",
																						position			= pos,
																						force				= "player"
																					})
				end
			end
			--event.entity.energy = event.entity.electric_buffer_size
			--game.player.print(event.entity.name..event.entity.energy..event.entity.electric_buffer_size)
			--MoEntity.AddToLoop("spawner",event.entity) --event.entity.destroy()
		end
		event.entity.destroy()
	end
end)


--For each storage type we want to act as a combat robotics port.
MoEntity.SubscribeOnBuilt("combat-roboport-smart","combatroboport",function(entity) MoEntity.AddToLoop("combatroboticspost",entity) end)
MoEntity.SubscribeOnBuilt("combat-drone-wagon","combatrobowagon",function(entity) MoEntity.AddToLoop("combatroboticspost",entity) end)

if MoConfig.MegaTank then
	MoEntity.SubscribeOnBuilt("mega-tank","megatankcombatroboport",function(entity) MoEntity.AddToLoop("combatroboticspost",entity) end)
end