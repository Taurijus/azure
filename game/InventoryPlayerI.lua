Inventory = {}

function Inventory.load()
	Inventory.image = love.graphics.newImage(pre.."inventory.png")
	Inventory.bfg = love.graphics.newImage(pre.."1.png")
	Inventory.Dinamitas = love.graphics.newImage(pre.."2.png")
	Inventory.Ragatke = love.graphics.newImage(pre.."3.png")
	Inventory.x = 0
	Inventory.y = 600-160
	Inventory.weapon = 0
	Inventory.Ammo = 0
end

function Inventory.AddWeapon(nr)
	Inventory.weapon = nr
	Inventory.Ammo = 500
end

function Inventory.update(dt)

end


function Inventory.draw()
	local offsetx = 30
	love.graphics.draw(Inventory.image, Inventory.x, Inventory.y)
	if Inventory.weapon == 1 then 
		love.graphics.draw(Inventory.bfg, Inventory.x+offsetx, Inventory.y+10)
	end
		
	if Inventory.weapon == 2 then 
		love.graphics.draw(Inventory.Dinamitas, Inventory.x+offsetx, Inventory.y+10)
	end
	if Inventory.weapon == 3 then 
		love.graphics.draw(Inventory.Ragatke, Inventory.x+offsetx, Inventory.y+10)
	end
	love.graphics.print(Inventory.Ammo, Inventory.x, Inventory.y+10)
end

function Inventory.loaded()
	return math.min(Inventory.weapon, Inventory.Ammo)
end

function Inventory.gun()
	return Inventory.weapon
end

function Inventory.shoot()
	if Inventory.Ammo == 1 then
		Inventory.Ammo = Inventory.Ammo -1
		Inventory.weapon = 0
	else
		Inventory.Ammo = Inventory.Ammo -1
	end	
end
