MLC = {
	Math=true, --Load the Math Module?
	Timers=true, --Load the Timer Module?
	Misc=true, --Load the Misc Module?
	Entity=true, --Load the entity module?
	Debug=false --Load the debug module?
}

require "defines"
require "math"
require "string"

require "scripts.pokemon-data"

MoSave = require "mologiccore.base"
ModInterface,MoConfig = {},{} local M = MoConfig

require "scripts.base"
	
remote.add_interface("MoCombat", ModInterface)

function Intialize()
	MoTimers.CreateTimer("ManagePokemonAI",				60,		0,	false,	false,	ManagePokemonAI)
	MoTimers.CreateTimer("ManageCaptureAutomatic",		2 * 60,	0,	false,	false,	ManageCaptureAutomatic)
end

script.on_configuration_changed(Intialize)
script.on_init(Intialize) 

script.on_event(defines.events.on_player_created, function(event)
  local player = game.players[event.player_index]
  player.insert("raikou")
  player.insert("iron-plate")
  player.insert("iron-plate")
  player.insert("iron-plate")
  player.insert("iron-plate")
  player.insert("copper-plate")
  player.insert("copper-plate")
  player.insert("copper-plate")
  player.insert("copper-plate")
  player.insert("copper-plate")
  player.insert("basic-inserter")
  player.insert("basic-inserter")
  player.insert("basic-transport-belt")
  player.insert("basic-transport-belt")
  player.insert("long-handed-inserter")
  player.insert("science-pack-1")
  player.insert("lab")
  
  player.insert("assembling-machine-2")
  player.insert("poke-chest")
  player.insert("poke-capturator")
  player.insert("pokeball-empty")
  player.insert("poke-accumulator")
  player.insert("solar-panel")
  player.insert("small-electric-pole")
  player.insert("dna-extractor-1")
  player.insert("dna-electric")
  
  --player.character_running_speed_modifier = 10
---[[	
	game.surfaces.nauvis.create_entity{	name = "raikou-wild-ko", 
										position = game.surfaces.nauvis.find_non_colliding_position("raikou-wild-ko", player.position, 20, 5),
										force = game.forces.neutral }
	game.surfaces.nauvis.create_entity{	name = "charmander-wild-ko", 
										position = game.surfaces.nauvis.find_non_colliding_position("charmander-wild-ko", player.position, 20, 5),
										force = game.forces.neutral }
--]]
end)
