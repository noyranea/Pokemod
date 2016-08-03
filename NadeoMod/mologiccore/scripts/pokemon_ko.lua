--script.on_event(defines.events.on_entity_died, function(event)
--	if (event.entity.name == "small-biter")
--	then game.surfaces.nauvis.create_entity{	name = "small-biter-ko", 
--										position = event.entity.position, 
--										force = game.forces.neutral }
--	end
--end)

--script.on_event(defines.events.on_built_entity, function(event)
--	if (event.created_entity.name == "small-biter")
--	then
--		local Pos = E.positionCRASH
--		
--	end
--end)



local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local DefC,DefD = defines.command,defines.distraction
local Drones = Drones --Localise
Drones.Poke_CommandFuncs = {}

function Drones.Poke_CreateCommandFunc(Name,Function)
	Drones.Poke_CommandFuncs[Name]=Function
end

--Check for the nearby enemys.
function Drones.Poke_NearbyEnemy(Surface,Pos,Rad)
	--local Scan = Surface.find_nearest_enemy{position=Pos, max_distance=Rad}
	local Scan = Surface.find_enemy_units(Pos, Rad, game.forces.enemy)
	for  i,e in pairs(Scan) do
		Debug.Print("ennemyscanned"..i)
		if not e.type == "player"
		then
			return e;
		end
	end
end

Drones.Poke_CreateCommandFunc("Idle",function(Drone,Data) 
	--Run Check for enemies.
	local Scan = Drones.Poke_NearbyEnemy(Drone.surface,Drone.position,500)
	if Scan 
	then game.show_message_dialog("targetfound")
		if Scan.valid then
		Drones.SetDroneOrder(Data,Drones.GetAttackCommand(Scan,Drone.position),true)
		return
		end
	end
	Drones.SetDroneOrder(Data,{F="Idle",D={}},false)	
end)

Drones.Poke_CreateCommandFunc("AttackEnemy",function(Drone,Data) 
	local Targ = KTE(Data.T)
	if not Targ or not Targ.valid then
		local Scan = Drones.Poke_NearbyEnemy(Drone.surface,Drone.position,400)
		if Scan 
		then game.show_message_dialog("targetfound")
			if Scan.valid then
			Drones.SetDroneOrder(Data,Drones.GetAttackCommand(Scan,Drone.position),true)
			return
			end
		end
		Drones.SetDroneOrder(Data,{F="Idle",D={DefD.none}},false)	
	end
end)


function ManageWildPokemonAI()
	--MoMisc.Print("Drone Think")
	MoEntity.CallLoop("wildpokemons",function(data)
		local E = KTE(data.entity)
		if not E or E==nil or not E.valid then return false end
		--MoMisc.Print("Test")
		if data.extra.T < game.tick then
			--MoMisc.Print("Think")
			local Wait = 0
			local CMD = data.extra.CMD
			
			--Give the unit order if possible.
			if CMD.C~=nil then
				local CommandValid = true
				local Distance = (util.distance(CMD.P,E.position)/10) --Add calibration based on bot movement speed.
				if CMD.F == "AttackEnemy" then
					local Targ = KTE(CMD.D.T)
					if not Targ or Targ and not Targ.valid or Targ.type == "player" then --Hack around
						CommandValid = false
					end	
				end
				
				if CommandValid then
					E.set_command(CMD.C) 
					data.extra.T = game.tick+(Distance*60)
				end
			end
			
			--Update the map where we are.
			E.force.chart(E.surface,{MoEntity.addtoentpos(E,{y=-5,x=-5}),MoEntity.addtoentpos(E,{y=5,x=5})})

			local CmdFunc = Drones.Poke_CommandFuncs[CMD.F or "None"]
			if CmdFunc then
				CmdFunc(E,CMD.D)
			end
			
			--Incase the drone was removed.
			if CMD.D.Removed then
				return false
			end
			
			--Swap the new command out.
			if CMD.D.NewCMD then
				data.extra.CMD = CMD.D.NewCMD
				if CMD.D.NewThk then
					data.extra.T = 0
				end
			end
		end
		
		return true
	end)
end
MoTimers.CacheFunction("ManageWildPokemonAI",ManageWildPokemonAI)

function SpawnPokemonNearPlayer()
	game.peaceful_mode = true
	local E = game.surfaces.nauvis.create_entity{	name = "small-biter", 
										position = game.player.position, 
										force = game.forces.ennemy }									
	MoEntity.AddToLoop("wildpokemons",E,{T=0,CMD=O or {F="Idle",D={}}})
end								
MoTimers.CacheFunction("SpawnPokemonNearPlayer",SpawnPokemonNearPlayer)