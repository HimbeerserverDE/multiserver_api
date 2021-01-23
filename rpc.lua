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
	local rrq = multiserver.fromhex(msg:split(" ")[1])
	if cb[rrq] == nil then return end
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
	elseif cmd == "->SRV" then
		p = msg:split(" ")[3]
	elseif cmd == "->ADDR" then
		p = msg:split(" ")[3]
	end
	cb[rrq](p)
	cb[rrq] = nil
end)
