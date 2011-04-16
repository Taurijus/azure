
dofile(src..'InventoryPlayerI.lua')
dofile(src..'Shop.lua')
dofile(src..'Bullet.lua')

PlayerI = {}

function PlayerI.load()
	Shop.load()
	PlayerI.image = love.graphics.newImage(pre.."4.png")
	local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
	PlayerI.x = width/2
	PlayerI.y = height/2
	PlayerI.rot = 0
	PlayerI.offx = 32
	PlayerI.offy = 32
	Inventory.load()
	Bullet.load()
end

function PlayerI.update(dt)
	local x, y = love.mouse.getPosition()
	if love.keyboard.isDown("left") or love.keyboard.isDown("d") then
		PlayerI.x = PlayerI.x - 100 * dt
    end
    if love.keyboard.isDown("right") or love.keyboard.isDown("g") then
		PlayerI.x = PlayerI.x + 100 * dt
    end
    if love.keyboard.isDown("up") or love.keyboard.isDown("r") then
		PlayerI.y = PlayerI.y - 100 * dt
    end
    if love.keyboard.isDown("down") or love.keyboard.isDown("f") then
		PlayerI.y = PlayerI.y + 100 * dt
	end
	local shopid = Shop.OnShop(PlayerI.x, PlayerI.y) 
	if shopid >0 then
		Inventory.BuyWeapon(shopid, dt)
	end
	local dx, dy
	dx = x-PlayerI.x
	dy = y-PlayerI.y

	PlayerI.rot = math.acos(dx/(math.sqrt(dx*dx+dy*dy)))*(dy/math.abs(dy))
	if PlayerI.rot == nil then
		PlayerI.rot = 0
	end
	if love.mouse.isDown("l") then
		if Inventory.shoot() then
			Bullet.AddShot(PlayerI.x, PlayerI.y,PlayerI.rot, 300)
		end
	end
	Bullet.update(dt)
end


function PlayerI.draw()
	local width = love.graphics.getWidth()
	local height = love.graphics.getHeight()
	Shop.draw()
	Bullet.draw()
	love.graphics.draw(PlayerI.image, PlayerI.x, PlayerI.y, PlayerI.rot, 1, 1, PlayerI.offx, PlayerI.offy)	
	Inventory.draw()
end
