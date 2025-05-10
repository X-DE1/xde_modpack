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

if minetest.get_modpath("comboblock") then
	for clave, valor in pairs(nodes) do
		if string.sub(clave, 1, 10) == "comboblock" then
			local grupos_str = ""
			for clave, number in pairs(valor.groups) do
				if clave == "oddly_breakable_by_hand" or clave == "crumbly" or clave == "cracky" or clave == "choppy" or clave == "snappy" or clave == "explody" or clave == "dig_immediate" or clave == "not_in_creative_inventory" or clave == "flammable" then
					if grupos_str ~= "" then
						grupos_str = grupos_str .. ", "
					end
					grupos_str = grupos_str .. clave .. " = " .. tostring(number)
				end
			end
			local resultado = 'minetest.override_item("' .. clave .. '", {groups={' .. grupos_str .. '}})'
			loadstring(resultado)()
		end
	end
	minetest.register_on_newplayer(function(player)
		minetest.after(0.1, function()
			player:get_inventory():remove_item("main", "comboblock:help 1")
		end)
	end)
end

if minetest.get_modpath("invisiblocks") then
	minetest.clear_craft({output = "invisiblocks:show_stick"})
	minetest.clear_craft({output = "invisiblocks:barrier"})
	minetest.clear_craft({output = "invisiblocks:mob_wall"})
	minetest.clear_craft({output = "invisiblocks:light"})
	minetest.override_item("invisiblocks:show_stick", {groups={}})
end

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
			{"default:goldblock", "default:goldblock", "default:goldblock"}
		}
	})
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
