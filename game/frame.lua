frame = {}

function frame.load()
	frame.image = love.graphics.newImage(pre..'hood.png')
	frame.eye = {
				 [0] = love.graphics.newImage(pre..'akis/0.png'),
				 [1] = love.graphics.newImage(pre..'akis/1.png'),
				 [2] = love.graphics.newImage(pre..'akis/2.png'),
				 [3] = love.graphics.newImage(pre..'akis/3.png')
				}
end

--function frame.update()

--end

function frame.draw()
	love.graphics.draw(frame.image, 0, 0)
	
end
