require("LUBE.lua")
require("MiddleClass.lua")

--kadangi pačios luos string.explode neveikia, sukamės iš padėties
function string.xpld(str, div)
    assert(type(str) == "string" and type(div) == "string", "invalid arguments")
    local o = {}
    while true do
        local pos1,pos2 = str:find(div)
        if not pos1 then
            o[#o+1] = str
            break
        end
        o[#o+1],str = str:sub(1,pos1-1),str:sub(pos2+1)
    end
    return o
end

--Client callbacks
function onClientReceive (data)
	Networking.debug =  "sd:" .. "\n" .. Networking.debug
	local id = Networking.gid (ip)
	local splitData = string.xpld (data, ";")
	if splitData[1] == "u" then
		RemoteUsers.update (id, tonumber (splitData[2]), tonumber (splitData[3]), tonumber (splitData[4]))
	elseif splitData[1] == "b" then
		Bullet.AddShotFromNetworking (tonumber (splitData[2]), tonumber (splitData[3]), tonumber (splitData[4]), tonumber (splitData[5]))
	end
end

--Server callbacks
function onConnect (ip, port)
	Networking.debug =  "c:" .. ip .. "\n" .. Networking.debug
	Networking.add (ip)
end

function onServerReceive (data, ip, port)
	Networking.debug =  "d:" .. ip .. "\n" .. Networking.debug
	local id = Networking.gid (ip)
	local splitData = string.xpld (data, ";")
	if splitData[1] == "u" then
		RemoteUsers.update (id, tonumber (splitData[2]), tonumber (splitData[3]), tonumber (splitData[4]))
	elseif splitData[1] == "b" then
		Bullet.AddShotFromNetworking (tonumber (splitData[2]), tonumber (splitData[3]), tonumber (splitData[4]), tonumber (splitData[5]))
	end
	Networking.forward (ip, data)
end

function onDisconnect (ip, port)
	Networking.debug =  "dc:" .. ip .. "\n" .. Networking.debug
	Networking.rem (ip)
end

Networking = {}

function Networking.load ()
	Networking.serverOrClient = 0
	Networking.server = nil
	Networking.client = nil
	Networking.IPTable = {}
	Networking.debug = "init"
end

function Networking.update (dt)
	if love.keyboard.isDown ("f1") and Networking.serverOrClient ~= 0 then
		Networking.client = nil
		Networking.server = nil
		Networking.serverOrClient = 0
		Networking.debug =  "became nothing\n" .. Networking.debug
	end
	if love.keyboard.isDown ("f2") and Networking.serverOrClient ~= 1 then
		Networking.client = nil
		Networking.server = lube.server (18025)
		Networking.server:setCallback (onServerReceive, onConnect, onDisconnect)
		Networking.server:setHandshake ("SleepingDragon")
		Networking.serverOrClient = 1
		Networking.debug =  "became server\n" .. Networking.debug
	end
	if love.keyboard.isDown ("f3") and Networking.serverOrClient ~= 2 then
		Networking.server = nil
		Networking.client = lube.client (18025)
		Networking.client:setHandshake ("SleepingDragon")
		Networking.client:setCallback (onClientReceive)
		Networking.client:connect ("127.0.0.1", 18025)
		Networking.serverOrClient = 2
		Networking.debug =  "became client\n" .. Networking.debug
	end
	if Networking.client ~= nil then
		Networking.client:update (dt)
		Networking.client:send ("u;" .. PlayerI.x .. ";" .. PlayerI.y .. ";".. PlayerI.rot)
	end
	if Networking.server ~= nil then
		Networking.server:update (dt)
	end
	Networking.debug = Networking.debug:sub (1, 512)
end

function Networking.add (ip)
	table.insert (Networking.IPTable, {clientIP = ip})
	RemoteUsers.add (Networking.gid (ip))
end

function Networking.del (ip)
	table.remove (Networking.IPTable, Networking.gid (ip))
	RemoteUsers.rem (Networking.gid (ip))
end

function Networking.gid (ip)
	for i , C in ipairs (Networking.IPTable) do
		if C.clientIP == ip then
			return i
		end
	end
	return 0
end

function Networking.forward (ip, data)
	for i , C in ipairs (Networking.IPTable) do
		if C.clientIP ~= ip then
			server:send (C.clientIP, data)
			break
		end
	end
end

function Networking.bullet (xx, yy, rr, vv)
	if Networking.client ~= nil then
		Networking.client:send ("b;" .. xx .. ";" .. yy .. ";".. rr .. ";" .. vv)
	end
	if Networking.server ~= nil then
		Networking.server:send ("b;" .. xx .. ";" .. yy .. ";".. rr .. ";" .. vv)
	end
end