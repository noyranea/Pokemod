function GetMeleeAttackParameters(Cooldown, Damage, Type, Animation, Sound)
	local Attack = {}
	Attack.type = "projectile"
	Attack.range = 0.5
	Attack.cooldown = Cooldown
	Attack.ammo_category = "melee"
	Attack.ammo_type = {
		category = "melee",
		target_type = "entity",
		action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					type = "damage",
					damage = { amount = Damage , type = Type}
				}
			}
		}
	}
	Attack.sound = Sound
	Attack.animation = Animation
	return Attack
end