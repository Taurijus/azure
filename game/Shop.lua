Shop = {}

function Shop.load()
	Shop.image = love.graphics.newImage(pre.."Shop.png")
	Shop.List = {}
    Shop.AddShop(300,150, 1)
    Shop.AddShop(150,300, 2)
end

function Shop.AddShop(xx, yy, weaponid)
	table.insert(Shop.List, {
		image = Shop.image,
		x = xx,
		y = yy,
		vx = 60,
		vy = 60,
		weaponid = weaponid
	})

end

function Shop.update(dt)

end


function Shop.draw()
	for i , shop in ipairs(Shop.List) do
		love.graphics.draw(shop.image, shop.x, shop.y)
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
