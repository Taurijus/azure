
dofile(src..'InventoryPlayerI.lua')
dofile(src..'Shop.lua')
dofile(src..'Bullet.lua')
dofile(src..'Mapping.lua')

PlayerI = {}

function PlayerI.load()
	Shop.load()
	PlayerI.image = love.graphics.newImage(pre.."11.png")
	local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
	PlayerI.x = width/2
	PlayerI.y = height/2
	PlayerI.w = 64
	PlayerI.h = 64
	PlayerI.rot = 0
	PlayerI.offx = 32
	PlayerI.offy = 58
	PlayerI.TriggerLock = 0
	--Player physics
	phyPl = {}
    phyPl.b = love.physics.newBody(world, PlayerI.x, PlayerI.x, 1,0)
    phyPl.s = love.physics.newRectangleShape(phyPl.b, -1*PlayerI.offx, -1*PlayerI.offy, PlayerI.w, PlayerI.h, 0)
    phyPl.s:setData("Player")
	phyPl.s:setSensor(true)
	Inventory.load()
	Bullet.load()
	mapping.load()
end

function PlayerI.update(dt)
	local x, y = love.mouse.getPosition()
	if love.keyboard.isDown("left") or love.keyboard.isDown("d") then
		mapping.x = mapping.x + 100 * dt
		PlayerI.x = PlayerI.x - 100 * dt
		if mapping.wallTouch() then
			mapping.x = mapping.x - 100 * dt
			PlayerI.x = PlayerI.x + 100 * dt
		end
    	end
    	if love.keyboard.isDown("right") or love.keyboard.isDown("g") then
		mapping.x = mapping.x - 100 * dt
		PlayerI.x = PlayerI.x + 100 * dt
		if mapping.wallTouch() then
			mapping.x = mapping.x + 100 * dt
			PlayerI.x = PlayerI.x - 100 * dt
		end
    end
    	if love.keyboard.isDown("up") or love.keyboard.isDown("r") then
		mapping.y = mapping.y + 100 * dt
		PlayerI.y = PlayerI.y - 100 * dt
		if mapping.wallTouch() then
			mapping.y = mapping.y - 100 * dt
			PlayerI.y = PlayerI.y + 100 * dt
		end

    	end
    	if love.keyboard.isDown("down") or love.keyboard.isDown("f") then
		mapping.y = mapping.y - 100 * dt 
		PlayerI.y = PlayerI.y + 100 * dt 
		if mapping.wallTouch() then
			mapping.y = mapping.y + 100 * dt
			PlayerI.y = PlayerI.y - 100 * dt
		end
	end
	--Physics coord move
	phyPl.b:setX(PlayerI.x)	
	phyPl.b:setY(PlayerI.y)
	local dx, dy
	dx = x-PlayerI.x
	dy = y-PlayerI.y

	PlayerI.rot = math.acos(dx/(math.sqrt(dx*dx+dy*dy)))*(dy/math.abs(dy))
	if PlayerI.rot == nil then
		PlayerI.rot = 0
	end
	if love.mouse.isDown("l") and PlayerI.TriggerLock == 0 then
		if Inventory.shoot() then
			Bullet.AddShot(PlayerI.x, PlayerI.y,PlayerI.rot, 300)
			PlayerI.TriggerLock = 1
		end
	end
	if not love.mouse.isDown("l") then
		PlayerI.TriggerLock = 0
	end
	Bullet.update(dt)
end


function PlayerI.draw()
	local width = love.graphics.getWidth()
	local height = love.graphics.getHeight()
	Shop.draw()
	Bullet.draw()
	--imapping.draw()
	love.graphics.draw(PlayerI.image, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, PlayerI.rot, -1, 1, PlayerI.offx, PlayerI.offy)	
	Inventory.draw()
end

Clients = {}
function Clients.load ()
	Clients.IPTable = {}
	rasta  = 0
	totalClients = 0
	Clients.image = love.graphics.newImage (pre.."3.png")
end

function Clients.add (ip)
	totalClients = totalClients + 1
	table.insert (Clients.IPTable,
	{
		cip = ip,
		id = totalClients,
		oh = 32,
		ov = 32,
		x = 0,
		y = 0,
		r = 0,
		drawable = false
	})
end

function Clients.remove (ip)
	for i , C in ipairs (Clients.IPTable) do
		if C.cip == ip then
			C.drawable = false
			break
		end
	end
end

function Clients.check (ip)
	for i , C in ipairs (Clients.IPTable) do
	   rasta = 1
		if C.cip == ip then
			return C.id
		end
	end
	return 0
end

function Clients.update (id, x, y, r)
	for i , C in ipairs (Clients.IPTable) do
		if C.id == id then
			C.x = x
			C.y = y
			C.r = r
			C.drawable = true
			break
		end
	end
end

function Clients.draw ()
	for i , C in ipairs (Clients.IPTable) do
		if C.drawable then
			love.graphics.draw (Clients.image, C.x+mapping.x, C.y+mapping.y, C.r, 1, 1, C.oh, C.ov)
		end
	end
end
