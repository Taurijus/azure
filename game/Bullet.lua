Wall = {x1 = 100, y1 = 300, x2 = 300, y2 = 300}
Bullet = {}
function Bullet.load ()
	Bullet.image = love.graphics.newImage ("images/tracer.png")
	--Bullet.image = love.graphics.newImage(pre.."5.png")
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

function Bullet.intersect (self, o)
	local P = {self.x + math.sin (self.dir), self.y + math.cos (self.dir)}
	local denom = (o.y2 - o.y1) * (P[1] - self.x) - (o.x2 - o.x1) * (P[2] - self.y)
	if denom == 0 then return false end
	local ua = ((o.x2 - o.x1) * (self.y - o.y1) - (o.y2 - o.y1) * (self.x - o.x1)) / denom
	if ua < 0 or ua > 1 then return false end
	ub = ((P[1] - self.x) * (self.y - o.y1) - (P[2] - self.y) * (self.x - o.x1)) / denom
	if ub < 0 or ub > 1 then return false end
	return true
end

function Bullet.draw()
	for i , bullet in ipairs(Bullet.List) do
		love.graphics.draw(bullet.image, bullet.x, bullet.y)
	end
end
