Shop = {}

function Shop.load()
    Shop.image = {}
    for i=1,4 do
		Shop.image[i] = love.graphics.newImage(pre.."Shop"..i..".png")
	end
	Shop.w = 64
	Shop.h = 64
	Shop.List = {}
    Shop.AddShop(450, 700, 1)
    Shop.AddShop(740, 700, 2)
    Shop.AddShop(1010, 440, 3)
    Shop.AddShop(1360, 860, 4)
end

function Shop.AddShop(xx, yy, weaponid)
	local phyStmp = {}
    phyStmp.b = love.physics.newBody(world, xx, yy, 1,0)
    phyStmp.s = love.physics.newRectangleShape(phyStmp.b, 0, 0, Shop.w, Shop.h, 0)
    phyStmp.s:setData("Shop"..weaponid)
	phyStmp.s:setSensor(true)
	table.insert(Shop.List, {
		image = Shop.image[weaponid],
		x = xx,
		y = yy,
		vx = 60,
		vy = 60,
		weaponid = weaponid,
		phyShop = phyStmp
	})

end

function Shop.update(dt)
	local onshop = Shop.OnShop(PlayerI.x, PlayerI.y)
	if onshop ~= 0 then
		Inventory.BuyWeapon(onshop, dt)
	end
end


function Shop.draw()
	for i , shop in ipairs(Shop.List) do
		love.graphics.draw(shop.image, shop.x, shop.y)
		shop.phyShop.b:setX(shop.x)	
		shop.phyShop.b:setY(shop.y)
	end
end

function Shop.OnShop(xx, yy)
	for i , shop in ipairs(Shop.List) do
		if shop.x < xx and shop.x+shop.vx >xx and
			shop.y < yy and shop.y+shop.vy > yy then
			return shop.weaponid
		end
	end
	return 0
end
