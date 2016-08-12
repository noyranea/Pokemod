local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local DefC,DefD = defines.command,defines.distraction
local IA = IA --Localise

--Returns a formatted attack command for the engine to handle.
function IA.GetAttackCommand(Target,Start)
	return {F="AttackEnemy",P=Target.position,D={T=RegKey(Target)},C={type=DefC.go_to_location,destination=Target.position,radius=10,distraction=DefD.byenemy}}
end

--Returns a formatted goto command for the engine to handle.
function IA.GetGotoOrder(Position,MaxDist)
	return {type=DefC.go_to_location,destination=Position,radius=MaxDist,distraction=DefD.byenemy}
end

function IA.SetPokemonOrder(Data,Command,Now)
	Data.NewCMD = Command
	Data.NewThk = Now or false
end

IA.CreateCommandFunc("Idle",function(Pokemon,Data) 
	--Run Check for enemies.
	local Scan = IA.NearbyEnemy(Pokemon.surface,Pokemon.position,50)
	if Scan and Scan.valid then
		IA.SetPokemonOrder(Data,IA.GetAttackCommand(Scan,Pokemon.position),true)
		return
	end
	
	-- No target, time to stalk a player until we find enemies
	local Pos = Pokemon.position
	local Ply = MoEntity.closestplayer(Pos.x,Pos.y).position
	IA.SetPokemonOrder(Data,{F="Idle",P=Ply,D={},C=IA.GetGotoOrder(Ply,5)},false)
end)

IA.CreateCommandFunc("AttackEnemy",function(Pokemon,Data) 
	local Targ = KTE(Data.T)
	if not Targ or not Targ.valid then
		local Scan = IA.NearbyEnemy(Pokemon.surface,Pokemon.position,40)
		if Scan and Scan.valid then
			IA.SetPokemonOrder(Data,IA.GetAttackCommand(Scan,Pokemon.position),true)
			return
		end
		IA.SetPokemonOrder(Data,{F="Idle",D={}},false)	
	end
end)








