multiserver.on_joinplayer = {}
multiserver.on_leaveplayer = {}
multiserver.on_redirect_done = {}
multiserver.on_msg = {}

multiserver.alert = function(msg)
	multiserver.do_rpc("<-ALERT " .. msg, nil)
end

multiserver.get_default_server = function(cb)
	multiserver.do_rpc("<-GETDEFSRV", cb)
end

multiserver.get_player_count = function(cb)
	multiserver.do_rpc("<-GETPEERCNT", cb)
end

multiserver.is_online = function(name, cb)
	multiserver.do_rpc("<-ISONLINE " .. name, cb)
end

multiserver.check_privs = function(name, privs, cb)
	multiserver.do_rpc("<-CHECKPRIVS " .. name .. " " .. minetest.privs_to_string(privs):gsub(",", "|"), cb)
end

multiserver.get_privs = function(name, cb)
	multiserver.do_rpc("<-GETPRIVS " .. name, cb)
end

multiserver.set_privs = function(name, privs)
	multiserver.do_rpc("<-SETPRIVS " .. name .. " " .. minetest.privs_to_string(privs):gsub(",", "|"), nil)
end

multiserver.get_server_name = function(name, cb)
	multiserver.do_rpc("<-GETSRV " .. name, cb)
end

multiserver.redirect = function(name, tosrv)
	multiserver.do_rpc("<-REDIRECT " .. name .. " " .. tosrv, nil)
end

multiserver.get_address = function(name, cb)
	multiserver.do_rpc("<-GETADDR " .. name, cb)
end

multiserver.is_banned = function(name, cb)
	multiserver.do_rpc("<-ISBANNED " .. name, cb)
end

multiserver.ban = function(target)
	multiserver.do_rpc("<-BAN " .. target, nil)
end

multiserver.unban = function(target)
	multiserver.do_rpc("<-UNBAN " .. target, nil)
end

multiserver.send_msg = function(msg)
	multiserver.do_rpc("<-MT2MT " .. msg, nil)
end

multiserver.register_on_joinplayer = function(cb)
	table.insert(multiserver.on_joinplayer, cb)
end

multiserver.register_on_leaveplayer = function(cb)
	table.insert(multiserver.on_leaveplayer, cb)
end

multiserver.register_on_redirect_done = function(cb)
	table.insert(multiserver.on_redirect_done, cb)
end

multiserver.register_on_msg = function(cb)
	table.insert(multiserver.on_msg, cb)
end
