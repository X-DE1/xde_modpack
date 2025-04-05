local auto_eat_fast = minetest.settings:get_bool("auto_eat_fast") ~= false
local eat_fast = minetest.settings:get_bool("eat_fast") or false

if minetest.get_modpath("s_brewing") then
	minetest.register_craft({
		output = "s_brewing:boost",
		recipe = {
			{"vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"},
			{"vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"},
			{"default:tinblock", "default:tinblock", "default:tinblock"}
		}
	})
	
	minetest.register_craft({
		output = "s_brewing:stand",
		recipe = {
			{"vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"},
			{"vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"},
			{"default:mese", "default:mese", "default:mese"}
		}
	})
end

if minetest.get_modpath("s_potions_default") and minetest.get_modpath("stamina") then
	minetest.unregister_item("s_potions_default:jump")
end

if auto_eat_fast then
	minetest.register_on_mods_loaded(function()
		if minetest.settings:get_bool("touch_gui") then
			tph_eating["eating_time"] = 0.001
			tph_eating["eating_repeats"] = 6
		end
	end)
end

if eat_fast then
	minetest.register_on_mods_loaded(function()
		tph_eating["eating_time"] = 0.001
		tph_eating["eating_repeats"] = 6
	end)
end

minetest.register_craft({
	output = "default:torch",
	recipe = {
		{"group:leaves"},
		{"group:stick"}
	}
})

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

if minetest.get_modpath("x_farming") then
	minetest.register_craft({
		output = "x_farming:seed_icefishing",
		recipe = {
			{"group:wool", "farming:string", "group:stick"},
			{"", "farming:string", "group:stick"},
			{"", "farming:string", "group:stick"}
		}
	})

	minetest.unregister_item("x_farming:cotton_8")
	minetest.unregister_item("x_farming:cotton_7")
	minetest.unregister_item("x_farming:cotton_6")
	minetest.unregister_item("x_farming:cotton_5")
	minetest.unregister_item("x_farming:cotton_4")
	minetest.unregister_item("x_farming:cotton_3")
	minetest.unregister_item("x_farming:cotton_2")
	minetest.unregister_item("x_farming:cotton_1")
	minetest.unregister_item("x_farming:cotton")
	minetest.unregister_item("x_farming:string")
	minetest.unregister_item("x_farming:seed_cotton")
	minetest.unregister_item("x_farming:string")
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
end
