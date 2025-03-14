local mob_difficulty2 = tonumber(minetest.settings:get("mob_difficulty2") or 0.7)
local mob_chance_multiplier2 = tonumber(minetest.settings:get("mob_chance_multiplier2") or 0.001)
local auto_eat_fast = minetest.settings:get_bool("auto_eat_fast") ~= false
local eat_fast = minetest.settings:get_bool("eat_fast") or false
local bucket_guano = minetest.settings:get_bool("bucket_guano") or false
local lasso = minetest.settings:get_bool("lasso") or false
local saddle = minetest.settings:get_bool("saddle") or false
local net = minetest.settings:get_bool("net") or false
local nametag = minetest.settings:get_bool("nametag") or false
local leather = minetest.settings:get_bool("leather") or false
local shears = minetest.settings:get_bool("shears") or false
local fence_wood = minetest.settings:get_bool("fence_wood") or false
local fence_top = minetest.settings:get_bool("fence_top") or false
local hearing_vines = minetest.settings:get_bool("hearing_vines") or false
local protector = minetest.settings:get_bool("protector") or false
local protector2 = minetest.settings:get_bool("protector2") or false
local meat_raw = minetest.settings:get_bool("meat_raw") or false

minetest.settings:set("mob_difficulty", mob_difficulty2)

minetest.settings:set("mob_chance_multiplier", mob_chance_multiplier2)

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

minetest.register_decoration({
	name = 'xde_modpack:cotton',
	deco_type = 'simple',
	place_on = {"everness:dry_dirt_with_dry_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.1,
		scale = 0.1,
		spread = { x = 50, y = 50, z = 50 },
		seed = 4242,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"everness:baobab_savanna"},
	y_max = 31000,
	y_min = 1,
	decoration = {"farming:cotton_wild"}
})

if auto_eat_fast then
	minetest.register_on_mods_loaded(function()
		if minetest.settings:get_bool("touch_gui") then
			if tph_eating then
				tph_eating["eating_time"] = 0.001
				tph_eating["eating_repeats"] = 6
			end
		end
	end)
end

if eat_fast then
	minetest.register_on_mods_loaded(function()
		if tph_eating then
			tph_eating["eating_time"] = 0.001
			tph_eating["eating_repeats"] = 6
		end
	end)
end

if not bucket_guano then
minetest.unregister_item("animalia:bucket_guano")
end

if not lasso then
minetest.unregister_item("mobs:lasso")
end

if not saddle then
minetest.unregister_item("mobs:saddle")
end

if not net then
minetest.unregister_item("mobs:net")
end

if not nametag then
minetest.unregister_item("mobs:nametag")
end

if not leather then
minetest.unregister_item("mobs:leather")
end

if not shears then
minetest.unregister_item("mobs:shears")
end

if not fence_wood then
minetest.unregister_item("mobs:fence_wood")
end

if not fence_top then
minetest.unregister_item("mobs:fence_top")
end

if not hearing_vines then
minetest.unregister_item("mobs:hearing_vines")
end

if not protector then
minetest.unregister_item("mobs:protector")
end

if not protector2 then
minetest.unregister_item("mobs:protector2")
end

if not meat_raw then
minetest.unregister_item("mobs:meat_raw")
end

if not meat then
minetest.unregister_item("mobs:meat")
end

if not meatblock_raw then
minetest.unregister_item("mobs:meatblock_raw")
end

if not meatblock then
minetest.unregister_item("mobs:meatblock")
end
