local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local IA = IA --Localise

IA.CommandFuncs = {}

function ManagePokemonAI()
	MoEntity.CallLoop("pokemon-domestic",function(data)
		local E = KTE(data.entity)
		if not E or E==nil or not E.valid then return false end
		if data.extra.T < game.tick then
			local Wait = 0
			local CMD = data.extra.CMD
			
			--Give the unit order if possible.
			if CMD.C~=nil then
				local CommandValid = true
				local Distance = (util.distance(CMD.P,E.position)/10) --Add calibration based on bot movement speed.
				if CMD.F == "AttackEnemy" then
					local Targ = KTE(CMD.D.T)
					if not Targ or Targ and not Targ.valid then --Hack around
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

			local CmdFunc = IA.CommandFuncs[CMD.F or "None"]
			if CmdFunc then
				CmdFunc(E,CMD.D)
			end
			
			--Incase the pokemon was removed.
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
MoTimers.CacheFunction("ManagePokemonAI",ManagePokemonAI)

function IA.CreateCommandFunc(Name,Function)
	IA.CommandFuncs[Name]=Function
end

IA.CreateCommandFunc("None",function(Pokemon,Data) end)
