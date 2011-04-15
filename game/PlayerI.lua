

    PlayerI = {}
function PlayerI.load()
	PlayerI.image = love.graphics.newImage("images/PadariukasVio.png")
	PlayerI.x = 0;
	PlayerI.y = 0;
end

function PlayerI.update(dt)
 if love.keyboard.isDown("left") then
	PlayerI.x = PlayerI.x - 100 * dt
    end
    if love.keyboard.isDown("right") then
	PlayerI.x = PlayerI.x + 100 * dt
    end
    if love.keyboard.isDown("up") then
	PlayerI.y = PlayerI.y - 100 * dt
    end
    if love.keyboard.isDown("down") then
	PlayerI.y = PlayerI.y + 100 * dt
end
end


function PlayerI.draw()
	love.graphics.draw(PlayerI.image, PlayerI.x, PlayerI.y)
end
