dragon = {}
function dragon.load()
	dragon.image = love.graphics.newImage("images/padariukas.png")
	dragon.x = 0;
	dragon.y = 0;
end

function dragon.update(dt)
dragon.x = dragon.x+1;
dragon.y = dragon.y+1;
end


function dragon.draw()
	love.graphics.draw(dragon.image, dragon.x, dragon.y)
end
