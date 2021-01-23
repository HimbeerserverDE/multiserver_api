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

multiserver.get_server_name = function(name, cb)
	multiserver.do_rpc("<-GETSRV " .. name, cb)
end

multiserver.redirect = function(name, tosrv)
	multiserver.do_rpc("<-REDIRECT " .. name .. " " .. tosrv, nil)
end

multiserver.get_address = function(name, cb)
	multiserver.do_rpc("<-GETADDR " .. name, cb)
end
