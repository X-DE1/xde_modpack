
beds.day_interval.finish = 0.78

minetest.register_craft({
	output = "default:torch",
	recipe = {
		{"group:leaves"},
		{"group:stick"}
	}
})

minetest.register_craft({
	output = "default:wood",
	recipe = {
		{"default:dry_shrub"}
	}
})

minetest.register_craft({
	output = "default:dry_shrub",
	recipe = {
		{"group:stick", "group:stick"},
		{"group:stick", "group:stick"}
	}
})

local nodes = minetest.registered_nodes

for clave, valor in pairs(nodes) do
	if string.find(clave, "trapdoor") then
		minetest.override_item(clave, {climbable = true})
	end
end

if minetest.get_modpath("invisiblocks") then
	minetest.clear_craft({output = "invisiblocks:show_stick"})
	minetest.clear_craft({output = "invisiblocks:barrier"})
	minetest.clear_craft({output = "invisiblocks:mob_wall"})
	minetest.clear_craft({output = "invisiblocks:light"})
	minetest.override_item("invisiblocks:show_stick", {groups={}})
end

if minetest.get_modpath("animalia") and minetest.get_modpath("x_farming") then
	minetest.unregister_item("animalia:bucket_guano")
end

if minetest.get_modpath("animalia") then
	minetest.register_craft({
		output = "animalia:nametag",
		recipe = {
			{"default:paper", "farming:string", "dye:black"}
		}
	})
	dungeon_loot.register({name = "animalia:nametag", chance = 0.6, count = {1, 3}})
end

if minetest.get_modpath("animalia") and minetest.get_modpath("mobs") then
	minetest.unregister_item("mobs:lasso")
	minetest.unregister_item("mobs:saddle")
	minetest.unregister_item("mobs:net")
	minetest.unregister_item("mobs:nametag")
	minetest.unregister_item("mobs:leather")
	minetest.unregister_item("mobs:shears")
	minetest.unregister_item("mobs:fence_wood")
	minetest.unregister_item("mobs:fence_top")
	minetest.unregister_item("mobs:hearing_vines")
	minetest.unregister_item("mobs:protector")
	minetest.unregister_item("mobs:protector2")
	minetest.unregister_item("mobs:meat_raw")
	minetest.unregister_item("mobs:meat")
	minetest.unregister_item("mobs:meatblock_raw")
	minetest.unregister_item("mobs:meatblock")
end

if minetest.get_modpath("x_spawners_api") then
	minetest.unregister_item("mobs:spawner")
end

if minetest.get_modpath("x_farming") then

	minetest.register_craft({
		output = "x_farming:seed_pumpkin 2",
		recipe = {
			{"x_farming:pumpkin_block"}
		}
	})
	minetest.register_craft({
		output = "x_farming:seed_melon",
		recipe = {
			{"x_farming:melon"}
		}
	})
	
	minetest.register_craft({
		output = "x_farming:seed_icefishing",
		recipe = {
			{"group:wool", "farming:string", "group:stick"},
			{"", "farming:string", "group:stick"},
			{"", "farming:string", "group:stick"}
		}
	})

	minetest.override_item("x_farming:cotton_1", {drop = "farming:seed_cotton"})
	minetest.override_item("x_farming:cotton_2", {drop = "farming:seed_cotton"})
	minetest.override_item("x_farming:cotton_3", {drop = "farming:seed_cotton"})
	minetest.override_item("x_farming:cotton_4", {drop = "farming:seed_cotton"})
	minetest.override_item("x_farming:cotton_5", {drop = "farming:seed_cotton"})
	minetest.override_item("x_farming:cotton_6", {drop = "farming:seed_cotton"})
	minetest.override_item("x_farming:cotton_7", {drop = "farming:seed_cotton"})
	minetest.override_item("x_farming:cotton_8", {drop = "farming:seed_cotton"})
	
	minetest.unregister_item("x_farming:cotton")
	minetest.unregister_item("x_farming:string")
	minetest.unregister_item("x_farming:seed_cotton")
	minetest.unregister_item("x_farming:string")

	minetest.unregister_item("x_farming:pillow_red")
	minetest.unregister_item("x_farming:pillow_blue")
	minetest.unregister_item("x_farming:pillow_cyan")
	minetest.unregister_item("x_farming:pillow_grey")
	minetest.unregister_item("x_farming:pillow_pink")
	minetest.unregister_item("x_farming:pillow_black")
	minetest.unregister_item("x_farming:pillow_brown")
	minetest.unregister_item("x_farming:pillow_green")
	minetest.unregister_item("x_farming:pillow_white")
	minetest.unregister_item("x_farming:pillow_orange")
	minetest.unregister_item("x_farming:pillow_violet")
	minetest.unregister_item("x_farming:pillow_yellow")
	minetest.unregister_item("x_farming:pillow_magenta")
	minetest.unregister_item("x_farming:pillow_dark_grey")
	minetest.unregister_item("x_farming:pillow_dark_green")
	minetest.unregister_item("x_farming:pillow_light_blue")

	minetest.clear_craft({
		output = 'x_farming:scarecrow',
		recipe = {
			{ '', 'x_farming:pumpkin_block', '' },
			{ 'x_farming:barley_stack', 'group:pillow', 'x_farming:barley_stack' },
			{ '', 'group:wood', '' },
		}
	})
	minetest.register_craft({
		output = 'x_farming:scarecrow',
		recipe = {
			{ '', 'x_farming:pumpkin_block', '' },
			{ 'x_farming:barley_stack', 'group:wool', 'x_farming:barley_stack' },
			{ '', 'group:wood', '' },
		}
	})

	minetest.register_craft({
		output = 'x_farming:cactus_brick',
		recipe = {
			{ "default:cactus", "default:cactus"},
			{ "default:cactus", "default:cactus"},
		}
	})
	
	minetest.register_craft({
		output = "x_farming:pumpkin_lantern",
		recipe = {
			{"x_farming:pumpkin_block"},
			{"group:torch"}
		}
	})
end

if minetest.get_modpath("x_farming") and minetest.get_modpath("everness") then
	minetest.register_decoration({
		name = 'xde_modpack:cotton',
		deco_type = 'simple',
		place_on = {"everness:dry_dirt_with_dry_grass"},
		sidelen = 16,
		fill_ratio = 0.005,
		biomes = {"everness:baobab_savanna"},
		y_max = 31000,
		y_min = 1,
		decoration = {"farming:cotton_wild"}
	})
	minetest.register_craft({
		output = "everness:cursed_pumpkin_lantern",
		recipe = {
			{"x_farming:pumpkin_block"},
			{"everness:mineral_torch"}
		}
	})
end

if minetest.get_modpath("screwdriver2") then
	minetest.unregister_item("screwdriver:screwdriver")
end

if minetest.get_modpath("xdecor") then
	if minetest.get_modpath("mesecons") then
		minetest.unregister_item("xdecor:lever_off")
		minetest.unregister_item("xdecor:lever_on")
		minetest.unregister_item("xdecor:pressure_wood_off")
		minetest.unregister_item("xdecor:pressure_wood_on")
		minetest.unregister_item("xdecor:pressure_stone_off")
		minetest.unregister_item("xdecor:pressure_stone_on")
	end
	if minetest.get_modpath("x_enchanting") then
		minetest.unregister_item("xdecor:enchantment_table")
	end
	if minetest.get_modpath("x_farming") then
		minetest.unregister_item("xdecor:hive")
		minetest.unregister_item("xdecor:honey")
	end
	if minetest.get_modpath("mobs") then
		minetest.unregister_item("xdecor:cobweb")
	end
end
