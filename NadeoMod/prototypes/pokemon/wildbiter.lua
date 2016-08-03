data.raw.unit["small-biter"].corpse = "";
data.raw.unit["small-biter"].run_animation = {
		filename = "__NadeoMod__/graphics/raikou/sheet.png",
		line_length = 3,
		width = 37,
		height = 37,
		frame_count = 3,
		direction_count = 8,
		priority = "high",
		shift = {0, 0}
	}

data:extend({
    type = "unit",
    name = "small-biter-ko",
    icon = "__base__/graphics/icons/small-biter.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    max_health = 15,
    order = "b-b-a",
    subgroup="enemies",
    healing_per_tick = 0.01,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
    attack_parameters =
    {
      type = "projectile",
      range = 0.,
      cooldown = 35,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(6),
      sound = make_biter_roars(0.5),
      animation = biterattackanimation(smallbiterscale, small_biter_tint1, small_biter_tint2)
    },
	resistances = {{type = "laser",percent = 100}},
    vision_distance = 30,
    movement_speed = 0.,
    distance_per_frame = 0.,
    pollution_to_join_attack = 200,
    distraction_cooldown = 300,
    -- corpse = "small-biter-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound =  make_biter_dying_sounds(1.0),
    working_sound =  make_biter_calls(0.7),
    run_animation = {
		filename = "__NadeoMod__/graphics/raikou/sheet.png",
		line_length = 3,
		width = 37,
		height = 37,
		frame_count = 3,
		direction_count = 8,
		priority = "high",
		shift = {0, 0}
	}
  }
)