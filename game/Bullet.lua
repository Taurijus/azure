Bullet = {}
function Bullet.load ()
	Bullet.image = love.graphics.newImage ("images/tracer.png")
	--Bullet.image = love.graphics.newImage(pre.."5.png")
	Bullet.List = {}
	Bullet.Count = 0
	Bullet.LastDT = 1
end

function Bullet.AddShot(xx, yy, rot,v)
	Bullet.Count = Bullet.Count + 1
	Bullet.List[Bullet.Count] =
	{
		x = xx,
		y = yy,
		vx = v * math.cos(rot),
		vy = v * math.sin(rot),
		r = rot,
	}

end

function Bullet.update(dt)
	for i = 1, Bullet.Count do
		local bullet = Bullet.List[i]
		if bullet ~= nil then
			bullet.x = bullet.x + bullet.vx * dt
			bullet.y = bullet.y + bullet.vy * dt
			--[[if bullet.x > width or bullet.x < 0 or
				bullet.y > height or bullet.y < 0 then
				table.remove(bullet)
			end]]
			for j = 1, #mapping.wall do
				if Bullet.rectCross (bullet, mapping.wall[j]) then
					Bullet.List[i] = Bullet.List[Bullet.Count]
					Bullet.List[Bullet.Count] = nil
					Bullet.Count = Bullet.Count - 1
					i = i - 1
					break
				end
			end
		end
	end
	Bullet.LastDT = dt * 2
end

function Bullet.lineCross (bullet, obj)
	local P = {bullet.x + bullet.vx * Bullet.LastDT, bullet.y + bullet.vy * Bullet.LastDT}
	local denom = (obj.y2 - obj.y1) * (P[1] - bullet.x) - (obj.x2 - obj.x1) * (P[2] - bullet.y)
	if denom == 0 then return false end
	local ua = ((obj.x2 - obj.x1) * (bullet.y - obj.y1) - (obj.y2 - obj.y1) * (bullet.x - obj.x1)) / denom
	if ua < 0 or ua > 1 then return false end
	local ub = ((P[1] - bullet.x) * (bullet.y - obj.y1) - (P[2] - bullet.y) * (bullet.x - obj.x1)) / denom
	if ub < 0 or ub > 1 then return false end
	return true
end

function Bullet.rectCross (bullet, obj)
	if obj.x1 < bullet.x and  bullet.x < obj.x2 and obj.y1 < bullet.y and  bullet.y < obj.y2 then return true end
end

function Bullet.draw()
	for i, bullet in ipairs(Bullet.List) do
		love.graphics.draw(Bullet.image, bullet.x, bullet.y, bullet.r, 1, 1, 16, 16)
	end
end
