--AutoGenerated by DEVotion
pre, src = 'images/', 'game/'

state = 0; -- 0-main menu, 1-play, 2-pause

dofile(src..'dragon.lua')
dofile(src..'PlayerI.lua')
dofile(src..'bullet.lua')
dofile(src..'AI.lua')

dofile(src..'Bar.lua')
dofile(src..'Map.lua')
dofile(src..'Sounds.lua')
dofile(src..'menu.lua')

function loadGame()
	pauseMenu.load()
	--Physics
	world = love.physics.newWorld(-1*scrWidth,-1*scrHeight, scrWidth, scrHeight)
	world:setGravity(0,0)
	world:setCallbacks(add, persist, rem, result)
	world:setAllowSleep(false)
    dragon.load()
    PlayerI.load()
    AI.load()
	Bullet.load ()
	gamemap.load()
	sleepBar.load(0, 75, 36, 266)
	healthBar.load(0, 427, 36, 266)
end

function love.load()
	sounds.load()
	scrWidth = 1024
	scrHeight = 768
	isFullsreen = false
	vsync = false
	isGameLoaded = false
	love.graphics.setMode(scrWidth, scrHeight, isFullscreen, vsync, 0 )
	mainMenu.load()
end

function add(a, b, coll)
    --text = a.." collding with "..b.." at an angle of "..coll:getNormal().."\n"
end

function persist(a, b, coll)
	if string.find(a, "Shop") ~= nil then
		Inventory.BuyWeapon(tonumber(string.sub(a, 5)), dlt)	
	end
end

function rem(a, b, coll)
    --text = a.." uncolliding "..b.."\n"
end

function result(a, b, coll)
    --text = a.." hit "..b.."resulting with "..coll:getNormal().."\n"
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
		pauseDelta = pauseDelta + dt
		dlt = dt
		dragon.update(dt)
		PlayerI.update(dt)
		AI.update(dt)
		Bullet.update (dt)
		sleepBar.update(dt, 1)
		healthBar.update()
		sounds.update (dt)
		world:update(dt)
	elseif state == 2 then
		pauseMenu.update(dt)
	end
end

function love.draw()
	if state == 0 then 
		mainMenu.draw();
	elseif state == 1 and isGameLoaded then
		gamemap.draw()
		dragon.draw()
		PlayerI.draw()
		AI.draw()
		sleepBar.draw()
		healthBar.draw()
	elseif state == 2 then
		pauseMenu.draw()
	end
end

function love.quit()
	-- just some delay before quiting, to make impression we are saving the game
	love.timer.sleep(500)
	love.event.push('q')
end

