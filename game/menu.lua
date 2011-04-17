mainMenu = {}

pauseDelta = 0

function mainMenu.load()
	love.mouse.setVisible(true)
	mainMenu.image0 = love.graphics.newImage(pre.."dragon.png")
	mainMenu.imageLoading = love.graphics.newImage(pre.."Loading.png")
	mainMenu.imagePlay = love.graphics.newImage(pre.."dragon_play.png")
	mainMenu.imageQuit = love.graphics.newImage(pre.."dragon_quit.png")
	mainMenu.currentImage = mainMenu.image0
end

function mainMenu.update()
	if love.keyboard.isDown(" ") then
		state = 1
		return
	end
	if mouseInArea(292, 685, 534, 768) then
		mainMenu.currentImage = mainMenu.imagePlay
		if love.mouse.isDown("l") then 
			state = 1			
		end
	elseif mouseInArea(534, 685, 784, 768) then
		mainMenu.currentImage = mainMenu.imageQuit
		if love.mouse.isDown("l") then
			love.quit()
		end
	else 
		mainMenu.currentImage = mainMenu.image0
	end

end

function mainMenu.draw()
	love.graphics.draw(mainMenu.currentImage, 0, 0)
end


function mouseInArea(x1, y1, x2, y2)
	if love.mouse.getX() > x1 and love.mouse.getX() < x2 and love.mouse.getY() > y1 and love.mouse.getY() < y2 then 
		return true
	end
	return false
end


pauseMenu = {}

function pauseMenu.load()
	pauseMenu.image = love.graphics.newImage(pre.."pause.png")
end

function pauseMenu.update(dt)
	pauseDelta = pauseDelta + dt
	if pauseDelta > 0.5 then 
		love.mouse.setVisible(true)
		if (mouseInArea(356, 327, 526, 370) and love.mouse.isDown("l")) or love.keyboard.isDown("escape") then 
			state = 1;
			pauseDelta = 0
		elseif mouseInArea(356, 407, 526, 453) and love.mouse.isDown("l") then
			love.quit()
		end
	end
end

function pauseMenu.draw()
	love.graphics.draw(pauseMenu.image)
end
