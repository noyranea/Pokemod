local IA = IA --Localise

--Ease function to help synchronise changes across all pokemon spawning.
function IA.SetupPokemon(E)
	local Pos = E.position
	MoEntity.AddToLoop("pokemon-domestic",E,{T=0,CMD={F="Idle",D={}}})
end


for name, data in pairs(PokemonData) do
	MoEntity.SubscribeOnTriggeredBuild(name.."-domestic", "pokemon-call", IA.SetupPokemon)
end