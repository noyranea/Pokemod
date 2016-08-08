--Activer quand on aura clean toutes les occurences desdits types
--for i,dmgtype in pairs(data.raw["damage-type"]) do
--	dmgtype = null
--end

data:extend(
{
  {
    type = "damage-type",
    name = "electric"
  },
  {
    type = "damage-type",
    name = "fire"
  },
  {
    type = "damage-type",
    name = "water"
  },
  {
    type = "damage-type",
    name = "plant"
  }  
}
)