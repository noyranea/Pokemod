local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey


function Capture.SetupCaptureAutomatic(E)
	MoEntity.AddToLoop("capture-automatic",E,{T=0})
end
MoEntity.SubscribeOnBuilt("poke-capturator", "capturator", Capture.SetupCaptureAutomatic)

function ManageCaptureAutomatic()
	MoEntity.CallLoop("capture-automatic",function(data)
		local E = KTE(data.entity)
		if not E or E==nil or not E.valid then return false end
		if data.extra.T + 120 < game.tick then -- capture cd
			local inventory = E.get_inventory(defines.inventory.chest)
			if inventory.get_item_count("pokeball-empty") > 0 then -- capture ammo
				local Scan = game.surfaces.nauvis.find_entities_filtered{area={{E.position.x-5, E.position.y-5},{E.position.x+5, E.position.y+5	}}, type="unit", force="neutral"}
				for i,unit in pairs(Scan) do
					if (string.sub(unit.name, -8) == "-wild-ko") then
						local EnergyScan = game.surfaces.nauvis.find_entities_filtered{area={{E.position.x-5, E.position.y-5},{E.position.x+5, E.position.y+5	}}, type="accumulator", force="player"}
						for k,accu in pairs(EnergyScan) do
							if (accu.name == "poke-accumulator" and accu.energy >= 2 * 1000 * 1000) then --2MJ = 1MW (car le cd est de 2s)
								accu.energy = accu.energy - 2 * 1000 * 1000
								data.extra.T = game.tick
								inventory.remove({name="pokeball-empty", count=1})
								game.surfaces.nauvis.create_entity{name="pokeball-empty", position=E.position, target=Scan[i], speed=0.3, source=E}
								return true
							end
						end
					end
				end
			end
		end
		return true
	end)
end
MoTimers.CacheFunction("ManageCaptureAutomatic",ManageCaptureAutomatic)