sleepBar = {}
function sleepBar.load(x, y, w, h)
	sleepBar.x = x;
	sleepBar.y = y;
	sleepBar.w = w; 
	sleepBar.max_lvl = h; -- max_lvl == stulpelio aukstis
	sleepBar.lvl = sleepBar.max_lvl;
end

function sleepBar.update(dt, d) -- d - trukdymo lygis [0;1]
-- paskaiciuoti pagal tai, ar veikejas juda, ant kokio pavirsiau yra, koki ginkla naudoja
	if d <= 1 then
		sleepBar.lvl = d * sleepBar.max_lvl  -- issibudinimo lygis dideja priklausomai nuo trukdymo
	else
		if sleepBar.lvl > 0 then
			sleepBar.lvl = sleepBar.lvl - 10 * dt  -- kai netrukdoma, mazeja per laika
		end
	end
end

function sleepBar.draw()
	love.graphics.setColor(158, 46, 28, 255)  -- stulpelio spalva (raudona)
	love.graphics.rectangle("fill", sleepBar.x, sleepBar.max_lvl-sleepBar.lvl+sleepBar.y, sleepBar.w, sleepBar.lvl) 
	love.graphics.setColor(255, 255, 255, 255)  
end

healthBar = {}
function healthBar.load(x, y, w, h)
	healthBar.x = x;
	healthBar.y = y;
	healthBar.w = w;
	healthBar.max_lvl = h; -- max_lvl == stulpelio aukstis
	healthBar.lvl = healthBar.max_lvl;
end

function healthBar.update() -- Player.health
	--healthBar.lvl = PlayerI.Health/100 * healthBar.max_lvl;
	healthBar.lvl = healthBar.max_lvl;
end

function healthBar.draw()
	love.graphics.setColor(29, 99, 26, 255) -- zalia
	love.graphics.rectangle("fill", healthBar.x, healthBar.y+healthBar.max_lvl-healthBar.lvl, healthBar.w, healthBar.lvl)  
	love.graphics.setColor(255, 255, 255, 255)
end