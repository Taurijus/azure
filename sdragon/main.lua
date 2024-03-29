--AutoGenerated by DEVotion
pre, src = 'images/', 'sdragon/src/'

state = 0; -- 0-main menu, 1-play, 2-pause
dofile(src..'menu.lua')
dofile(src..'VectorEd.lua')

function loadGame()
	dofile(src..'animation.lua')
	--dofile(src..'dragon.lua')
	dofile(src..'PlayerI.lua')
	dofile(src..'bullet.lua')
	--dofile(src..'AI.lua')
	dofile(src..'AIM.lua')

	dofile(src..'Bar.lua')
	dofile(src..'Mapping.lua')
	dofile (src..'Sounds.lua')
	dofile(src..'Networking.lua')
	dofile(src..'frame.lua')
	pauseMenu.load()
	--Physics
	world = love.physics.newWorld(0, 0, scrWidth, scrHeight)
	world:setGravity(0,0)
	world:setCallbacks(add, persist, rem, result)
	world:setAllowSleep(false)
    --dragon.load()
    PlayerI.load()
	RemoteUsers.load ()
	Bullet.load ()
	mapping.load()
	sleepBar.load(0, 74, 40, 268)
	healthBar.load(0, 430, 40, 280)
	frame.load()
	sounds.load()
	Networking.load ()
	AIM.load()
end

function love.load()
	scrWidth = 1024
	scrHeight = 768
	isFullsreen = false
	vsync = false
	love.graphics.setMode(scrWidth, scrHeight, isFullscreen, vsync, 0 )
	mainMenu.load()
	--VectorEd.load()
end

function add(a, b, coll)
    --text = a.." collding with "..b.." at an angle of "..coll:getNormal().."\n"
end

function persist(a, b, coll)
	if string.find(a, "Shop") ~= nil then
		Inventory.BuyWeapon(tonumber(string.sub(a, 5)), dlt)	
	end
end

text = "physic test"
function rem(a, b, coll)
    text = a.." uncolliding "..b.."\n"
end

function result(a, b, coll)
    text = a.." hit "..b.."resulting with "..coll:getNormal().."\n"
end

function love.update(dt)
	if state == 0 then
		mainMenu.update()
	elseif state == 1 then
		if not isGameLoaded then
			loadGame()
			isGameLoaded = true
		end
		if love.keyboard.isDown("escape") and pauseDelta > 0.5 then
			state = 2;
			pauseDelta = 0
		end
		Shop.update(dt)
		pauseDelta = pauseDelta + dt
		dlt = dt
		--dragon.update(dt)
		PlayerI.update(dt)
		AIM.update(dt)
		Bullet.update (dt)
		sleepBar.update(dt, 1)
		healthBar.update()
		sounds.update (dt)
		Networking.update (dt)
		--VectorEd.update (dt)
		world:update(dt)
	elseif state == 2 then
		pauseMenu.update(dt)
	end
end

function love.draw()
	if state == 0 then 
		mainMenu.draw();
	elseif state == 1 then
		if not isGameLoaded then
			love.graphics.draw(mainMenu.imageLoading, 0, 0)
		else
			love.graphics.push()
			love.graphics.translate(scrWidth/2 - PlayerI.x, scrHeight/2 - PlayerI.y)
			mapping.draw()
			--dragon.draw()
			RemoteUsers.draw ()
			AIM.draw()
			Shop.draw()
			Bullet.draw()
			PlayerI.draw()
			--VectorEd.draw()
			love.graphics.pop()
			sleepBar.draw()
			healthBar.draw()
			Inventory.draw()
			frame.draw()
			--love.graphics.print(PlayerI.x .. " : " .. PlayerI.y, 300, 500)
			--love.graphics.print(text, 300, 550)
		end
	elseif state == 2 then
		love.graphics.push()
		love.graphics.translate(scrWidth/2 - PlayerI.x, scrHeight/2 - PlayerI.y)
		mapping.draw()
		--dragon.draw()
		RemoteUsers.draw ()
		AIM.draw()
		Shop.draw()
		Bullet.draw()
		PlayerI.draw()
		love.graphics.pop()
		sleepBar.draw()
		healthBar.draw()
		Inventory.draw()
		frame.draw()
		pauseMenu.draw()
	end
end

function love.quit()
	-- just some delay before quitting, to make impression we are saving the game
	love.timer.sleep(500)
	love.event.push('q')
end

