
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
	PlayerI.x = 00
	PlayerI.y = 0
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
	local anykey = false
	local moveVectorX = 0
	local moveVectorY = 0
	
	if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
		moveVectorX = -1
		anykey = true
	end
	if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
		moveVectorX = 1
		anykey = true
	end
	if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
		moveVectorY = -1
		anykey = true
	end
	if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
		moveVectorY = 1
		anykey = true
	end
	
	if anykey then
		local moveVectorInvLen = 200 * dt / math.sqrt (moveVectorX * moveVectorX + moveVectorY * moveVectorY)
		moveVectorX = moveVectorX * moveVectorInvLen
		moveVectorY = moveVectorY * moveVectorInvLen
		
		if mapping.intersect (PlayerI.x, PlayerI.y, PlayerI.x + moveVectorX, PlayerI.y + moveVectorY) ~= true then
			PlayerI.x = PlayerI.x + moveVectorX
			PlayerI.y = PlayerI.y + moveVectorY
		end
	end
	
	local x, y = love.mouse.getPosition()
	
	--Physics coord move
	phyPl.b:setX(PlayerI.x)	
	phyPl.b:setY(PlayerI.y)
	local dx, dy
	dx = x-scrWidth/2
	dy = y-scrHeight/2

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
	--imapping.draw()
	love.graphics.draw(PlayerI.image, PlayerI.x, PlayerI.y, PlayerI.rot, -1, 1, PlayerI.offx, PlayerI.offy)	
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
			love.graphics.draw (Clients.image, C.x, C.y, C.r, 1, 1, C.oh, C.ov)
		end
	end
end
