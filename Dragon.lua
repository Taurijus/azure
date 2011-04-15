function Dragon.load()
	image = love.grapchics.newImage("images/padariukas.bmp")
	x = 0;
	y = 0;
end
function Dragon.update(dt)
x = x+1;
y = y+1;
end


function Dragon.draw()
	love.prapchis.draw(image, x, y)
end
