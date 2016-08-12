local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local DefC,DefD = defines.command,defines.distraction
local IA = IA --Localise

--Check for the nearby enemys.
function IA.NearbyEnemy(Surface,Pos,Rad)
	local Scan = Surface.find_nearest_enemy{position=Pos, max_distance=Rad}

	if Scan~=nil and Scan.valid then
		return Scan
	end	
end
