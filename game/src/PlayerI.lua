
dofile(src..'InventoryPlayerI.lua')
dofile(src..'Shop.lua')
dofile(src..'Bullet.lua')
dofile(src..'Mapping.lua')

PlayerI = {}

function PlayerI.load()
	Shop.load()
	PlayerI.image = love.graphics.newImage(pre.."11.png")
	PlayerI.imgsheet = love.graphics.newImage(pre.."Player_spritesheet.png")
	local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
	PlayerI.x = 1000
	PlayerI.y = 800
	PlayerI.w = 64
	PlayerI.h = 64
	PlayerI.rot = 0
	PlayerI.offx = 300
	PlayerI.offy = 0
	PlayerI.TriggerLock = 0
	PlayerI.Health = 100
	--Player physics
	phyPl = {}
    phyPl.b = love.physics.newBody(world, PlayerI.x, PlayerI.x, 1,0)
    phyPl.s = love.physics.newRectangleShape(phyPl.b, -1*PlayerI.offx, -1*PlayerI.offy, PlayerI.w, PlayerI.h, 0)
    phyPl.s:setData("Player")
	phyPl.s:setSensor(true)
	PlayerI.anim =  newAnimation(PlayerI.imgsheet, 64, 64, 1, 0)
	PlayerI.animd = 0
	PlayerI.animspeed = 0.1
	PlayerI.animframe = 1
	PlayerI.animfront = 0 -- 0 for back, 1 for front
	PlayerI.animscx = 1
	PlayerI.animscy = 1
	Inventory.load()
	PlayerI.currentimage = PlayerI.image
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
		PlayerI.animd = PlayerI.animd + dt
		local moveVectorInvLen = 1.0 / math.sqrt (moveVectorX * moveVectorX + moveVectorY * moveVectorY)
		moveVectorX = moveVectorX * moveVectorInvLen * dt * 200
		moveVectorY = moveVectorY * moveVectorInvLen * dt * 200
		
		local hit, index = mapping.intersect (PlayerI.x, PlayerI.y, PlayerI.x + moveVectorX, PlayerI.y + moveVectorY)
		if hit then
			local wallDeltaX = mapping.wall[index].x2 - mapping.wall[index].x1
			local wallDeltaY = mapping.wall[index].y2 - mapping.wall[index].y1
			local wallDeltaInvLen = 1.0 / math.sqrt (wallDeltaX * wallDeltaX + wallDeltaY * wallDeltaY)
			wallDeltaX = wallDeltaX * wallDeltaInvLen
			wallDeltaY = wallDeltaY * wallDeltaInvLen
			local dot = moveVectorX * wallDeltaX + moveVectorY * wallDeltaY
			hit, index = mapping.intersect (PlayerI.x, PlayerI.y, PlayerI.x + wallDeltaX * dot, PlayerI.y + wallDeltaY * dot)
			if not hit then
				PlayerI.x = PlayerI.x + wallDeltaX * dot
				PlayerI.y = PlayerI.y + wallDeltaY * dot
			end
		else
			PlayerI.x = PlayerI.x + moveVectorX
			PlayerI.y = PlayerI.y + moveVectorY
		end
	end

	--Log coords
	if love.keyboard.isDown("i") then
		coord = PlayerI.x.." "..PlayerI.y
	end
	local x, y = love.mouse.getPosition()
	for i=1,4 do
		if love.keyboard.isDown(i) and Inventory.weapon[i].have then
			Inventory.actWeap = i
		end
	end

	local x, y = love.mouse.getPosition()
	--Physics coord move
	phyPl.b:setX(PlayerI.x)	
	phyPl.b:setY(PlayerI.y)
	local dx, dy
	dx = x-scrWidth/2
	dy = y-scrHeight/2

	if y <= love.graphics.getHeight()/2 then
		PlayerI.animfront = 0
		if x < love.graphics.getWidth()/2  then
			PlayerI.animscx = -1
			PlayerI.animscy = 1 -- virsus kaire
		else
			PlayerI.animscx = 1
			PlayerI.animscy = 1 -- virsus desine
		end
	else
		PlayerI.animfront = 1
		if x < love.graphics.getWidth()/2  then
			PlayerI.animscx = -1
			PlayerI.animscy = 1 -- apacia kaire
		else
			PlayerI.animscx = 1
			PlayerI.animscy = 1 -- virsus desine
		end
	end

	PlayerI.rot = math.acos(dx/(math.sqrt(dx*dx+dy*dy)))*(dy/math.abs(dy))
	if PlayerI.rot == nil then
		PlayerI.rot = 0
	end
	if love.mouse.isDown("l") and PlayerI.TriggerLock == 0 then
		if Inventory.shoot() then
			Bullet.AddShot(PlayerI.x, PlayerI.y, PlayerI.rot, 300)
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
	PlayerI.chooseFrame()	
	local frame = (Inventory.actWeap*2 + PlayerI.animfront)*5
	
	+PlayerI.animframe - 1
	if frame == 0 then
		frame = 1
	end
	PlayerI.anim:seek(frame)
	if PlayerI.animscx == 1 then
		PlayerI.anim:draw(PlayerI.x-32, PlayerI.y-32, 0, PlayerI.animscx, PlayerI.animscy, PlayerI.offx, PlayerI.offy)
	else
		PlayerI.anim:draw(PlayerI.x+32, PlayerI.y-32, 0, PlayerI.animscx, PlayerI.animscy, PlayerI.offx, PlayerI.offy)
	end
	--love.graphics.print(PlayerI.rot, 600, 600)
end

function PlayerI.chooseFrame()
	if PlayerI.animd > PlayerI.animspeed then
		PlayerI.animd = 0
		if PlayerI.animframe < 5 then
			PlayerI.animframe = PlayerI.animframe + 1
		else
			PlayerI.animframe = 1
		end
		
	end
end




Clients = {}
function Clients.load ()
	Clients.IPTable = {}
	rasta  = 0
	totalClients = 0
	Clients.image = love.graphics.newImage (pre.."11.png")
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
