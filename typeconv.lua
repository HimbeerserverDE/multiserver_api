multiserver.tohex = function(n)
	local r = string.format("%x", n)
	if #r < 2 then r = "0" .. r end
	return r
end

multiserver.fromhex = function(s)
	return tonumber(s, 16)
end

multiserver.frombool = function(b)
	if b then return "true" else return "false" end
end

multiserver.tobool = function(s)
	if s == "true" then return true else return false end
end
