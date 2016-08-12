local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local Capture = Capture --Localise

function Capture.SpawnKo(E)
	game.surfaces.nauvis.create_entity{	name = E.name.."-ko", 
										position = E.position, 
										force = game.forces.neutral }
end

for name, data in pairs(PokemonData) do
	MoEntity.SubscribeOnDeath(name.."-wild", 		"wilddeath", 		Capture.SpawnKo)
	MoEntity.SubscribeOnDeath(name.."-domestic", 	"domesticdeath", 	Capture.SpawnKo)
end

function Capture.Roll(Ball, CatchRate)
	local result = math.random(100)
	if result < CatchRate * Ball then
		return 4
	elseif result < 2 * CatchRate * Ball then
		return 3
	elseif result < 4 * CatchRate * Ball then
		return 2
	else
		return 1
	end
end

function Capture.InitiateCapture(E)
	local pos = E.position
	E.destroy()
	local Scan = game.surfaces.nauvis.find_entities_filtered{area={{pos.x-0.5, pos.y-0.5},{pos.x+0.5, pos.y+0.5	}}, type="unit", force="neutral"}
	for i,u in pairs(Scan) do
		if (string.sub(u.name, -8) == "-wild-ko") then
			local baseName = string.sub(u.name, 0, -9)
			local roll = Capture.Roll(1, PokemonData[baseName].CatchRate)
			--local roll = 1
			if (roll < 4) then
				local pokeball = game.surfaces.nauvis.create_entity{	name 		= "pokeball-empty-token-capture-"..roll, 
																		position 	= pos,
																		force 		= game.forces.neutral }
				MoTimers.CreateTimer("Unspawn_Capture", (roll+2) * 2/3 * 60, 1, false, true, Unspawn, { entity = RegKey(pokeball) })
				MoTimers.CreateTimer("Spawn_Capture", ((roll+2) * 2/3 - 0.2) * 60, 1, false, true, Spawn, {	isItemOrElseEntity 	= false,
																										name				= u.name,
																										position			= u.position,
																										force				= "neutral"
																									})
			else
				local pokeball = game.surfaces.nauvis.create_entity{	name 		= "pokeball-empty-token-capture-4", 
																			position 	= pos,
																			force 		= game.forces.neutral }
					MoTimers.CreateTimer("Unspawn_Capture", 5*2/3*60, 1, false, true, Unspawn, { entity = RegKey(pokeball) })
					MoTimers.CreateTimer("Spawn_Capture", 5*2/3*60, 1, false, true, Spawn, {	isItemOrElseEntity 	= true,
																						name				= baseName,
																						position			= pos,
																						force				= "player"
																					})
			end														
			u.destroy()
			return
		end
	end	
end

MoEntity.SubscribeOnTriggeredBuild("pokeball-empty-token", "pokeball-capture", Capture.InitiateCapture)