dragon = {}
function dragon.load()
	image = love.graphics.newImage("images/padariukas.png")
	x = 0;
	y = 0;
end

function dragon.update(dt)
x = x+1;
y = y+1;
end


function dragon.draw()
	love.graphics.draw(image, x, y)
end
