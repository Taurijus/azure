Shop = {}

function Shop.load()
	Shop.image = love.graphics.newImage("images/Shop.png")
	Shop.List = {}
end

function Shop.AddShop(xx, yy)
	table.insert(Shop.List, {
		image = Shop.image,	x = xx,
		y = yy,
		vx = 60,
		vy = 60
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
			return i+1
		end
	end
	return 0
end
