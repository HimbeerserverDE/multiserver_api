local ch = minetest.mod_channel_join("multiserver")
local rq = 0
local cb = {}

multiserver.do_rpc = function(msg, cbf)
	local data = multiserver.tohex(rq) .. " " .. msg
	rq = rq + 1
	ch:send_all(data)
	cb[rq] = cbf
end

minetest.register_on_modchannel_message(function(channel_name, sender, msg)
	if channel_name ~= "multiserver" then return end

	local rrq = multiserver.fromhex(msg:split(" ")[1])
	local cmd = msg:split(" ")[2]
	local p
	if cmd == "->DEFSRV" then
		p = msg:split(" ")[3]
	elseif cmd == "->PEERCNT" then
		p = tonumber(msg:split(" ")[3])
	elseif cmd == "->ISONLINE" then
		p = multiserver.tobool(msg:split(" ")[3])
	elseif cmd == "->HASPRIVS" then
		p = multiserver.tobool(msg:split(" ")[3])
	elseif cmd == "->PRIVS" then
		p = minetest.string_to_privs(msg:split(" ")[3] or "")
	elseif cmd == "->SRV" then
		p = msg:split(" ")[3]
	elseif cmd == "->ADDR" then
		p = msg:split(" ")[3]
	elseif cmd == "->ISBANNED" then
		p = multiserver.tobool(msg:split(" ")[3])
	elseif cmd == "->JOIN" then
		local name = msg:split(" ")[3]
		local srv = msg:split(" ")[4]
		for _, f in ipairs(multiserver.on_joinplayer) do
			f(name, srv)
		end
	elseif cmd == "->LEAVE" then
		local name = msg:split(" ")[3]
		for _, f in ipairs(multiserver.on_leaveplayer) do
			f(name)
		end
	elseif cmd == "->REDIRECTED" then
		local name = msg:split(" ")[3]
		local newsrv = msg:split(" ")[4]
		local success = multiserver.tobool(msg:split(" ")[5])
		for _, f in ipairs(multiserver.on_redirect_done) do
			f(name, newsrv, success)
		end
	elseif cmd == "->MT2MT" then
		local smsg = msg:split(" ")
		local m = ""
		for i = 3, #smsg do
			m = m .. smsg[i]
			if i < #smsg then m = m .. " " end
		end
		for _, f in ipairs(multiserver.on_msg) do
			f(m)
		end
	end
	if cb[rrq] == nil then return end
	cb[rrq](p)
	cb[rrq] = nil
end)
