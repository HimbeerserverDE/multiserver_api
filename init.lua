multiserver = {}

local mp = minetest.get_modpath(minetest.get_current_modname())

dofile(mp .. "/typeconv.lua")
dofile(mp .. "/rpc.lua")
dofile(mp .. "/functions.lua")

minetest.register_on_joinplayer(function(player)
	if player:get_player_name() == "rpc" then
		minetest.after(0, function(player)
			local prop = {
				visual_size = {x = 0, y = 0},
				collisionbox = {0, 0, 0, 0, 0, 0},
			}
			player:set_nametag_attributes({
				color = {a = 0, r = 255, g = 255, b = 255},
			})
			player:set_properties(prop)
		end, player)
	end
end)
