Inventory = {}

--Helps config shops
local tobuy = 0
local deltaBuy = 0


function Inventory.load()
	Inventory.image = love.graphics.newImage(pre.."inventory.png")
	--Inventory.bfg = love.graphics.newImage(pre.."1.png")
	--Inventory.Dinamitas = love.graphics.newImage(pre.."2.png")
	--Inventory.Ragatke = love.graphics.newImage(pre.."3.png")
	Inventory.x = 0
	Inventory.y = 600-160
	Inventory.actWeap = 1
	Inventory.weapon = {}
	Inventory.weapon[1] = {
						buyspeed = 1,
						ammo = 100,
						maxammo = 1000,
						bulletspeed = 1,
						img = love.graphics.newImage(pre.."1.png"),
						price = 100,
						cooldown = 0.1,
						have = true
					}
	
	Inventory.weapon[2] = {
						buyspeed = 1,
						ammo = 200,
						maxammo = 1000,
						bulletspeed = 2,
						img = love.graphics.newImage(pre.."2.png"),
						price = 100,
						cooldown = 0.3,
						have = false
					}
					
	Inventory.weapon[3] = {									-- 3 ir 4 yra copy paste, reikėjo botui dar dviejų ginklų, imu juos iš čia
						buyspeed = 1,
						ammo = 100,
						maxammo = 1000,
						bulletspeed = 3,
						img = love.graphics.newImage(pre.."1.png"),
						price = 100,
						cooldown = 0.5,
						have = false
					}
	
	Inventory.weapon[4] = {
						buyspeed = 1,
						ammo = 200,
						maxammo = 1000,
						bulletspeed = 4,
						img = love.graphics.newImage(pre.."2.png"),
						price = 100,
						cooldown = 1,
						have = false
					}
	Inventory.LastShot = 0
	--TO DO fill the  weapons table
end

function round(num, idp)
  return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

function Inventory.BuyWeapon(nr, dt)
	local newDelta = dt*Inventory.weapon[nr].buyspeed*5
	Inventory.actWeap = nr
	--TODO CONFIG BUYING SPEED, dt is around 0.017
	tobuy = round(newDelta, 0)
	if tobuy < 1 then
		deltaBuy = deltaBuy + newDelta
		if deltaBuy > 1 then
			deltaBuy = 0
			tobuy = 1
		end
	else
		deltabuy = 0
	end
	if Inventory.weapon[nr].ammo + tobuy > Inventory.weapon[nr].maxammo then
		tobuy = Inventory.weapon[nr].maxammo - Inventory.weapon[nr].ammo 
	end
	Inventory.weapon[nr].have = true
	Inventory.weapon[nr].ammo = Inventory.weapon[nr].ammo + tobuy
end





function Inventory.update(dt)

end


function Inventory.draw()
	local offsetx = 30
	local i = Inventory.actWeap
	love.graphics.draw(Inventory.image, Inventory.x, Inventory.y)
	love.graphics.draw(Inventory.weapon[i].img, Inventory.x+offsetx, Inventory.y+10)
	love.graphics.print(Inventory.weapon[i].ammo, Inventory.x, Inventory.y+10)
	--Helps config buying speed
	--love.graphics.print(tobuy, Inventory.x+ 300, Inventory.y+10)
end

function Inventory.ammoNotEmpty()
	local i = Inventory.actWeap
	if Inventory.weapon[i].ammo > 0 then
		return true
	end	
	return false
end

function Inventory.getWeap()
	return Inventory.actWeap
end

function Inventory.setWrap(nr)
	Inventory.actWeap = nr
end

function Inventory.shoot()
	local i = Inventory.actWeap
	if love.timer.getTime () - Inventory.LastShot > Inventory.weapon[i].cooldown then
		if Inventory.ammoNotEmpty() then
			Inventory.weapon[i].ammo = Inventory.weapon[i].ammo - 1
			Inventory.LastShot = love.timer.getTime ()
			return true
		end
	end
	return false
end
