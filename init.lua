local auto_eat_fast = minetest.settings:get_bool("auto_eat_fast") ~= false
local eat_fast = minetest.settings:get_bool("eat_fast") or false

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

if minetest.get_modpath("animalia") and minetest.get_modpath("x_farming") then
	local bucket_guano = minetest.settings:get_bool("bucket_guano") or false
	if not bucket_guano then
		minetest.unregister_item("animalia:bucket_guano")
	end
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
end

if minetest.get_modpath("x_farming") and minetest.get_modpath("everness") then
	minetest.register_decoration({
		name = 'xde_modpack:cotton',
		deco_type = 'simple',
		place_on = {"everness:dry_dirt_with_dry_grass"},
		sidelen = 16,
		fill_ratio = 0.5,
		biomes = {"everness:baobab_savanna"},
		y_max = 31000,
		y_min = 1,
		decoration = {"farming:cotton_wild"}
	})
end
