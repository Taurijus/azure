Bullet = {}

function Bullet.load()
	Bullet.image = love.graphics.newImage("images/5.png")
	Bullet.List = {}
end

function Bullet.AddShot(xx, yy, rot,v)
	table.insert(Bullet.List, {
		image = Bullet.image,	x = xx,
		y = yy,
		vx = v*math.cos(rot),
		vy = v*math.sin(rot)
	})

end

function Bullet.update(dt)
	local width = love.graphics.getWidth()
	local height = love.graphics.getHeight()
	for i , bullet in ipairs(Bullet.List) do
		bullet.x = bullet.x+bullet.vx*dt
		bullet.y = bullet.y+bullet.vy*dt
		if bullet.x > width or bullet.x < 0 or
			bullet.y > height or bullet.y < 0 then
			table.remove(bullet)
		end
	end
end

	


function Bullet.draw()
	for i , bullet in ipairs(Bullet.List) do
		love.graphics.draw(bullet.image, bullet.x, bullet.y)
	end
end
