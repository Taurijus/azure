--AutoGenerated by DEVotion
pre, src = 'images/', 'game/'

dofile(src..'dragon.lua')
dofile(src..'PlayerI.lua')
dofile(src..'bullet.lua')
--dofile(src..'AI.lua')
dofile(src..'AIM.lua')

dofile(src..'Bar.lua')
dofile(src..'Mapping.lua')
dofile (src..'Sounds.lua')
dofile(src..'Networking.lua')

function love.load()
	scrWidth = 1024
	scrHeight = 768
	isFullsreen = false
	vsync = false
	love.graphics.setMode(scrWidth, scrHeight, isFullscreen, vsync, 0 )
	--Physics
	world = love.physics.newWorld(-1*scrWidth,-1*scrHeight, scrWidth, scrHeight)
	world:setGravity(0,0)
	world:setCallbacks(add, persist, rem, result)
	world:setAllowSleep(false)
    dragon.load()
    PlayerI.load()
	Clients.load ()
	Bullet.load ()
	mapping.load()
	sleepBar.load(0, 100, 36, 266)
	healthBar.load(0, 350, 36, 266)
	sounds.load ()
	Networking.load ()
	AIM.load()
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
    dlt = dt
	dragon.update(dt)
	PlayerI.update(dt)
	AIM.update(dt)
	Bullet.update (dt)
	sleepBar.update(dt, 0.5)
	healthBar.update()
	sounds.update (dt)
	Networking.update (dt)
	if love.keyboard.isDown("escape") then
		love.quit()
	end
	world:update(dt)
end

function love.draw()
	mapping.draw()
	dragon.draw()
	PlayerI.draw()
	Clients.draw ()
	AIM.draw()
	--sleepBar.draw()
	--healthBar.draw()
end

function love.quit()
	-- just some delay before quiting, to make impression we are saving the game
	love.timer.sleep(500)
	love.event.push('q')
end

