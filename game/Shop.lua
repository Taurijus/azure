Shop = {}

function Shop.load()
	Shop.image = love.graphics.newImage(pre.."Shop.png")
	Shop.w = 64
	Shop.h = 64
	Shop.List = {}
    Shop.AddShop(300,150, 1)
    Shop.AddShop(150,300, 2)
end

function Shop.AddShop(xx, yy, weaponid)
	local phyStmp = {}
    phyStmp.b = love.physics.newBody(world, xx, yy, 1,0)
    phyStmp.s = love.physics.newRectangleShape(phyStmp.b, 0, 0, Shop.w, Shop.h, 0)
    phyStmp.s:setData("Shop"..weaponid)
	phyStmp.s:setSensor(true)
	table.insert(Shop.List, {
		image = Shop.image,
		x = xx,
		y = yy,
		vx = 60,
		vy = 60,
		weaponid = weaponid,
		phyShop = phyStmp
	})

end

function Shop.update(dt)

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
