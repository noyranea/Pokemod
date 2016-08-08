data:extend( 
{

{
	type = "item",
	name = "pokeball-empty-token",
	icon = "__NadeoMod__/graphics/raikou/icon_raikou.png",
	flags = {"goes-to-quickbar"},
	order="c",
	subgroup="drone-combat",
	place_result = "pokeball-empty-token",
	stack_size = 20,
},
{
	type = "simple-entity",
	name = "pokeball-empty-token",
	max_health = "50",
	render_layer = "smoke",
	icon = "__NadeoMod__/graphics/raikou/icon_raikou.png",
	picture = {
		filename = "__NadeoMod__/graphics/raikou/pokeball_lights.png",
		width = 192,
		height = 192
	}
},
{
	type = "corpse",
    name = "pokeball-empty-token-corpse1",
    icon = "__base__/graphics/icons/small-biter-corpse.png",
    --selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    dying_speed = 1 / (3 * 2 / 3 * 60),
    time_before_removed = 60*60*15,
	render_layer = "higher-object-above",
    animation = {
		stripes = {
			{
				filename = "__NadeoMod__/graphics/capture/lights_01.png",
				width_in_frames = 6,
				height_in_frames = 1,
			}, 
			{
				filename = "__NadeoMod__/graphics/capture/lights_02.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_03.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_04.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_01.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_02.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_03.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_04.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_05.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_06.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_07.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_08.png",
				width_in_frames = 6,
				height_in_frames = 1,
			}
		},
		width = 192,
		height = 192,
		scale = 0.6,
		frame_count = 72,
		direction_count = 1,
		priority = "high",
	}
},
{
	type = "corpse",
    name = "pokeball-empty-token-corpse2",
    icon = "__base__/graphics/icons/small-biter-corpse.png",
    --selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    dying_speed = 1 / (4 * 2/3 * 60),
    time_before_removed = 60*60*15,
    render_layer = "higher-object-above",
    animation = {
		stripes = {
			{
				filename = "__NadeoMod__/graphics/capture/lights_01.png",
				width_in_frames = 6,
				height_in_frames = 1,
			}, 
			{
				filename = "__NadeoMod__/graphics/capture/lights_02.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_03.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_04.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_01.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_02.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_03.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_04.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_01.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_02.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_03.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_04.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_05.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_06.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_07.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_08.png",
				width_in_frames = 6,
				height_in_frames = 1,
			}
		},
		width = 192,
		height = 192,
		scale = 0.6,
		frame_count = 96,
		direction_count = 1,
		priority = "high",
	}
},
{
	type = "corpse",
    name = "pokeball-empty-token-corpse3",
    icon = "__base__/graphics/icons/small-biter-corpse.png",
    --selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    dying_speed = 1 / (5 * 2/3 * 60),
    time_before_removed = 60*60*15,
    render_layer = "higher-object-above",
    animation = {
		stripes = {
			{
				filename = "__NadeoMod__/graphics/capture/lights_01.png",
				width_in_frames = 6,
				height_in_frames = 1,
			}, 
			{
				filename = "__NadeoMod__/graphics/capture/lights_02.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_03.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_04.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_01.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_02.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_03.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_04.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_01.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_02.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_03.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_04.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_01.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_02.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_03.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_04.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_05.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_06.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_07.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_08.png",
				width_in_frames = 6,
				height_in_frames = 1,
			}
		},
		width = 192,
		height = 192,
		scale = 0.6,
		frame_count = 120,
		direction_count = 1,
		priority = "high",
	}
},
{
	type = "corpse",
    name = "pokeball-empty-token-corpse4",
    icon = "__base__/graphics/icons/small-biter-corpse.png",
    --selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
   dying_speed = 1 / (5 * 2/3 * 60),
    time_before_removed = 60*60*15,
    render_layer = "higher-object-above",
    animation = {
		stripes = {
			{
				filename = "__NadeoMod__/graphics/capture/lights_01.png",
				width_in_frames = 6,
				height_in_frames = 1,
			}, 
			{
				filename = "__NadeoMod__/graphics/capture/lights_02.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_03.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/lights_04.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_01.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_02.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_03.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_04.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_01.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_02.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_03.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_04.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_01.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_02.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_03.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_04.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_01.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_02.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_03.png",
				width_in_frames = 6,
				height_in_frames = 1,
			},
			{
				filename = "__NadeoMod__/graphics/capture/cap_04.png",
				width_in_frames = 6,
				height_in_frames = 1,
			}
		},
		width = 192,
		height = 192,
		scale = 0.6,
		frame_count = 120,
		direction_count = 1,
		priority = "high",
	}
},
{
	type = "capsule",
	name = "pokeball-raikou",
	icon = "__NadeoMod__/graphics/raikou/icon_raikou.png",
	flags = {"goes-to-quickbar"},
	order="c",
	subgroup="drone-combat",
	--place_result = "pokeball-raikou",
	stack_size = 20,
	capsule_action = {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "capsule",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 25,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "pokeball-raikou",
              starting_speed = 0.3
            }
          }
        }
      }
    }
},

{
    type = "projectile",
    name = "pokeball-raikou",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            show_in_tooltip = true,
			trigger_created_entity= true,
            entity_name = "attack-drone"
          },
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation = {
		filename = "__NadeoMod__/graphics/raikou/pokeball_throw.png",
		line_length = 10,
		width = 23,
		height = 22,
		scale = 0.5,
		frame_count = 10,
		direction_count = 1,
		priority = "high",
		animation_speed = 0.3,
		run_mode="backward",
		shift = {0, 0}
	},
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    smoke = capsule_smoke,
},

 {
	type = "capsule",
	name = "pokeball-empty",
	icon = "__NadeoMod__/graphics/raikou/icon_pokeball.png",
	flags = {"goes-to-quickbar"},
	order="c",
	subgroup="drone-combat",
	--place_result = "pokeball-empty",
	capsule_action = {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "capsule",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 25,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "pokeball-empty",
              starting_speed = 0.3
            }
          }
        }
      }
    },
	stack_size = 20
},

 {
    type = "projectile",
    name = "pokeball-empty",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            show_in_tooltip = true,
			trigger_created_entity= true,
            entity_name = "pokeball-empty-token" --pour choper l'event et lancer la capture
          },
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation = {
		filename = "__NadeoMod__/graphics/raikou/pokeball_throw.png",
		line_length = 10,
		width = 23,
		height = 22,
		scale = 0.5,
		frame_count = 10,
		direction_count = 1,
		priority = "high",
		shift = {0, 0}
	},
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    smoke = capsule_smoke,
  }
  })