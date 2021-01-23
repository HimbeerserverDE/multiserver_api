multiserver = {}

local mp = minetest.get_modpath(minetest.get_current_modname())

dofile(mp .. "/typeconv.lua")
dofile(mp .. "/rpc.lua")
dofile(mp .. "/functions.lua")

minetest.register_on_joinplayer(function(player)
	minetest.after(1, function(name)
		multiserver.get_address(name, function(addr)
			minetest.chat_send_all(addr)
		end)
	end, player:get_player_name())
end)
