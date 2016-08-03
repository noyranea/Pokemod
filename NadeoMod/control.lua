MLC = {
	Math=true, --Load the Math Module?
	Timers=true, --Load the Timer Module?
	Misc=true, --Load the Misc Module?
	Entity=true, --Load the entity module?
	Debug=false --Load the debug module?
}

require "defines"

MoSave = require "mologiccore.base"
ModInterface,MoConfig = {},{} local M = MoConfig


	
remote.add_interface("MoCombat", ModInterface)

function Intialize()
	MoTimers.CreateTimer("ManageCombatDronePosts",1,0,false,ManageCombatDronePosts)
	MoTimers.CreateTimer("ManageCombatDroneAi",1,0,false,ManageCombatDroneAi)
	MoTimers.CreateTimer("SpawnPokemonNearPlayer",1,0,false,SpawnPokemonNearPlayer)
	MoTimers.CreateTimer("ManageWildPokemonAI",1,0,false,ManageWildPokemonAI)
end

script.on_configuration_changed(Intialize)
script.on_init(Intialize) 
