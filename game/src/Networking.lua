require("src/LUBE.lua")
require("src/MiddleClass.lua")

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

--Network callbacks
function onClientReceive (data)
end

function onConnect (ip, port)
	Clients.add (ip)
end
function onServerReceive (data, ip, port)
	local id = Clients.check (ip)
	local splitData = string.xpld (data, ";")
	Clients.update (id, tonumber (splitData[1]), tonumber (splitData[2]), tonumber (splitData[3]))
end
function onDisconnect (ip, port)
	Clients.remove (ip)
end

Networking = {}

function Networking.load ()
	serverOrClient = 0
	server = nil
	client = nil
end

function Networking.update (dt)
	if love.keyboard.isDown ("f1") and serverOrClient ~= 1 then
		client = nil
		server = lube.server (18025)
		server:setCallback (onServerReceive, onConnect, onDisconnect)
		server:setHandshake ("Hi!")
		serverOrClient = 1
	end
	if love.keyboard.isDown ("f2") and serverOrClient ~= 2 then
		server = nil
		client = lube.client (18025)
		client:setHandshake("Hi!")
		client:setCallback (onClientReceive)
		client:connect ("127.0.0.1", 18025)
		serverOrClient = 2
	end
	if client ~= nil then
		client:update (dt)
		client:send (PlayerI.x .. ";" .. PlayerI.y .. ";".. PlayerI.rot)
	end
	if server ~= nil then
		server:update(dt)
	end
end
