frame = {}

function frame.load()
	frame.remelis = love.graphics.newImage(pre..'hood.png')
	frame.akis = {
				--for i = 0, 3 do
				--	[i] = love.graphics.newImage(pre..'akis/'i'.png')
				--end
				 [0] = love.graphics.newImage(pre..'akis/0.png'),
				 [1] = love.graphics.newImage(pre..'akis/1.png'),
				 [2] = love.graphics.newImage(pre..'akis/2.png'),
				 [3] = love.graphics.newImage(pre..'akis/3.png') 
				}
				
	frame.auksas = {
					im = {[0] = love.graphics.newImage(pre..'auksas.png'),
						  [1] = love.graphics.newImage(pre..'auksas_rankoje.png')
						 },
					x = 874, y = 592
					}
	frame.ginklai = {x = 739, y = 45}
	frame.spastai = {x = 871, y = 45}
	frame.ginklai_t = {x = 778, y = 159}

end

--function frame.update()

--end

function frame.draw()
	love.graphics.draw(frame.remelis)
	love.graphics.draw(frame.auksas.im[0], frame.auksas.x, frame.auksas.y)
	love.graphics.draw(frame.akis[0])
	love.graphics.draw(Inventory.weapon[Inventory.actWeap].img, frame.ginklai.x, frame.ginklai.y)
	love.graphics.print(Inventory.weapon[Inventory.actWeap].ammo, frame.ginklai_t.x, frame.ginklai_t.y)
end

--function frame.akiesBusena()
--	if Dragon.angriness > 0 and Dragon.angriness < 25 then return 0
--	elseif Dragon.angriness >= 25 and Dragon.angriness < 50 then return 1
--	elseif Dragon.angriness >= 50 and Dragon.angriness < 75 then return 2
--	elseif Dragon.angriness >= 75 and Dragon.angriness <= 100 then return 3
--end
