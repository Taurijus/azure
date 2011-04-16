dragon = {}

function dragon.load()
	dragon.image = love.graphics.newImage(pre.."padariukas.png")
	dragon.x = 0;
	dragon.y = 0;
	dragon.vx = 1;
	dragon.vy = 1;
end

function dragon.update(dt)
	if dragon.x > 500 then dragon.vx = -1 end
	if dragon.y > 500 then dragon.vy = -1 end
	if dragon.x < 100 then dragon.vx = 1 end
	if dragon.y < 100 then dragon.vy = 1 end

	dragon.y = dragon.y+dragon.vy;
	dragon.x = dragon.x+dragon.vx;
end


function dragon.draw()
	love.graphics.draw(dragon.image, dragon.x, dragon.y)
end
