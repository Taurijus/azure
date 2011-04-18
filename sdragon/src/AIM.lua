AIM = {}

AIM.bazinis_greitis = 100
AIM.kulkos_greitis = 150	-- bazinis kulkos greitis
AIM.max_health = 100
AIM.min_health = 10				-- kada reikėtų susirūpinti
AIM.startW = 1					-- pradinis waypoint, TO DO random
AIM.delta = 0					-- pradinis laiko momentas
AIM.max_bot = 8					-- botų skaičius

-- waypoints, idėja paveikslėly /images/map_with_waypoints.png
-- veikia taip. masyvo eilės numeris yra waypoint'o numeris
-- way point'e (stulpeliai):
-- 1 - x koord
-- 2 - y koord
-- 3 - kur eiti jeigu norim gold (primary)
-- 4 - gold (optional)
-- 5 - kur eiti jei norim grįžt į spawn point
-- 6 - spawn point optional
-- 7 - kur eiti jeigu norim ginklo ---------------------------
-- 8 - ginklo optional
-- 9 - kur eiti random, jei norim huntinti -------------------
-- 10 - hunt (optional)
-- TODO 11 - bus health'o ieškoti

W = {}
D = {}
W[1] = {960, 1150, 2, 20, 1, 1, 2, 20, 20, 3, 20, 20} 		 -- spawn point 1
W[2] = {760, 1010, 3, 37, 1, 1, 3, 37, 1, 37, 3, 1}
W[3] = {710, 900, 4, 21, 2, 2, 4, 4, 2, 21, 21, 21}
W[4] = {580, 810, 6, 6, 3, 3, 5, 6, 3, 6, 6, 3}
W[5] = {450, 700, 4, 4, 4, 4, 5, 5, 4, 4, 4, 4} 			 -- weapon
W[6] = {740, 700, 7, 7, 4, 21, 6, 6, 4, 7, 21, 21}			 -- weapon
W[7] = {660, 640, 8, 8, 6, 6, 6, 6, 8, 8, 6, 6}
W[8] = {750, 480, 9, 9, 7, 7, 7, 9, 9, 9, 7, 7} 			 -- trap
W[9] = {870, 410, 10, 10, 8, 33, 10, 10, 10, 10, 8, 8}
W[10] = {1010, 440, 11, 11, 9, 13, 10, 10, 13, 13, 9, 9} 	 -- weapon
W[11] = {1060, 400, 12, 12, 10, 10, 10, 10, 10, 10, 10, 10}
W[12] = {990, 350, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11}   -- gold'as
W[13] = {1220, 670, 10, 10, 14, 17, 10, 14, 17, 17, 10, 17}   -- trap
W[14] = {1260, 770, 13, 13, 16, 15, 15, 15, 22, 13, 13, 13}
W[15] = {1360, 860, 14, 34, 19, 19, 15, 15, 14, 34, 34, 23}   -- weapon
W[16] = {1050, 930, 17, 14, 18, 18, 14, 14, 14, 17, 18, 14}
W[17] = {950, 860, 21, 13, 16, 21, 16, 16, 21, 21, 16, 16}   -- health
W[18] = {990, 990, 16, 16, 20, 20, 16, 16, 16, 16, 20, 20}
W[19] = {1070, 1050, 18, 15, 1, 1, 15, 15, 15, 18, 15, 15}
W[20] = {990, 1070, 18, 18, 1, 1, 19, 18, 18, 18, 19, 19}
W[21] = {800, 830, 6, 6, 3, 3, 6, 6, 6, 6, 17, 17}
W[22] = {1460, 630, 13, 13, 23, 13, 23, 23, 13, 23, 14, 14}
W[23] = {1550, 680, 22, 22, 15, 15, 15, 15, 15, 19, 22, 22}
W[24] = {520, 1050, 25, 25, 37, 37, 25, 25, 25, 25, 37, 37}
W[25] = {580, 1005, 26, 26, 24, 24, 26, 26, 26, 26, 24, 24}
W[26] = {490, 930, 27, 27, 25, 25, 27, 27, 27, 27, 25, 25}
W[27] = {370, 1000, 28, 28, 26, 26, 28, 28, 28, 28, 26, 26}
W[28] = {70, 685, 29, 29, 27, 27, 29, 29, 29, 27, 27}
W[29] = {280, 560, 30, 30, 28, 28, 30, 30, 30, 30, 28, 28}
W[30] = {340, 615, 31, 31, 29, 29, 31, 31, 31, 31, 29, 29}
W[31] = {500, 530, 32, 32, 30, 30, 32, 32, 32, 32, 30, 30}
W[32] = {615, 380, 33, 33, 31, 31, 33, 33, 33, 33, 31, 31}
W[33] = {740, 305, 9, 9, 32, 32, 9, 9, 9, 9, 32, 32}
W[34] = {1680, 1110, 35, 35, 15, 15, 10, 10, 35, 35}
W[35] = {1960, 850, 36, 36, 36, 36, 36, 34, 36, 36, 36, 36}
W[36] = {1540, 580, 22, 25, 22, 22, 22, 22, 22, 22, 22, 22}
W[37] = {665, 1230, 24, 24,2 ,2 ,24, 24, 24, 24, 2 , 2}

-- drako waypoint'ai (koordX, koordY, angryWay1, angryWay2, angryWay3, home)
D[1] = {990, 680, 2, 3, 3, 1}		-- drako centras							-- TODO pridėti trečią drako kelią ir normalų kelią home
D[2] = {1300, 700, 2, 13, 14, 1}
D[3] = {765, 695, 8, 9, 8, 1}
D[4] = {865, 915, 11, 3, 1, 1}
D[5] = {1060, 550, 6, 3, 6, 1}
D[6] = {1060, 425, 12, 4, 4, 1}
--D[7] = {1300, 700, 2, 13, 5} dar nėra :D
D[8] = {615, 615, 9, 1, 9, 1}
D[9] = {750, 520, 5, 5, 5, 1}
D[10] = {585, 790, 3, 11, 3, 1}
D[11] = {675, 905, 10, 1, 4, 1}
D[12] = {1025, 920, 15, 4, 15, 1}
D[13] = {1255, 805, 12, 5, 14, 1}
D[14] = {1350, 865, 13, 2, 15, 1}
D[15] = {955, 1140, 11, 14, 11, 1}


-- drako funkcijos, iškėliau kad suprast eitų
function AIM.create_dragon()
	Dragon = {
			x = D[1][1],
			y = D[1][2],
			kitasD = D[1][2 + is12()],			
			state = "sleepy", --angry, attack
			weapon = "fangs and superpowers",
			gold = 999999,					-- pradžioje nėra aukso
			rot = 0,
			health = 999999,
			zone = 70,						-- apytikris pavojaus spindulys (for now, jei arti prieina)
			angryness = 0,					-- laikas, kai drakas piktas. kai būna piktas ilgą laiką, vėliau apsnūsta ir grįžta
			greitis = 10,
			angryness_add = 10,
			max_angryness = 100
		  }
end

function AIM.update_dragon(dt)
	AIM.dragon_state(dt)
	AIM.dragon_image()
	if Dragon.state == "angry" or Dragon.state == "home"		-- jei reikia judėti
		then
			-- judama link kitos koord.
			if (D[Dragon.kitasD][1] - Dragon.x < 0)				-- (jei neigiamas)
				then Dragon.x = Dragon.x - greitis
				else Dragon.x = Dragon.x + greitis
			end		
			if (D[Dragon.kitasD][2] - Dragon.y < 0)  			-- (jei neigiamas)
				then Dragon.y = Dragon.y - greitis
				else Dragon.y = Dragon.y + greitis
			end	
			
			-- jeigu esam taip arti, kad mažiau už vieno judesio atstumą
			if math.abs(D[Dragon.kitasD][1] - Dragon.x) <= 5 then Dragon.x = D[Dragon.kitasD][1] end
			if math.abs(D[Dragon.kitasD][2] - Dragon.y) <= 5 then Dragon.y = D[Dragon.kitasD][2] end
			
			if D[Dragon.kitasD][1] == Dragon.x and D[Dragon.kitasD][2] == Dragon.y
			then 	-- renkamės kitą wp
				if Dragon.state == "angry"
					then
						Dragon.kitasD = D[Dragon.kitasD][2 + is12()]
					else
						Dragon.kitasD = D[Dragon.kitasD][6]	
				end				
			end
	end
	
end

function AIM.draw_dragon()
	love.graphics.draw(Dragon.image, Dragon.x,
				Dragon.y, Dragon.rot, 1, 1, 60, 60)
end



-- funkcija patikrina žaidėją ar jis neatėjo prie drakono
-- jeigu atėjo, keičia state į "angry"
-- jei praėjo daugiau laiko, eina miegot
-- TODO - patikrint ir botus kažkada :D
function AIM.dragon_state(dt)
	Dlinija = (Dragon.x - PlayerI.x) * (Dragon.x - PlayerI.x)
		   + (Dragon.y - PlayerI.y) * (Dragon.y - PlayerI.y)
	if Dlinija < Dragon.zone * Dragon.zone
		then
			Dragon.state = "angry"
			if Dragon.angryness <= Dragon.max_angryness then
				Dragon.angryness = Dragon.angryness + Dragon.angryness_add
			end
	end
	
	if Dragon.angryness <= 0
		then
			if Dragon.x == D[1][1] and Dragon.y == D[1][2]		-- jei parsivilko namo
				then
					Dragon.angryness = 0
					Dragon.state = "sleepy"
				else
					Dragon.angryness = 0
					Dragon.state = "home"
			end
		else
			Dragon.angryness = Dragon.angryness - dt*10
	end
	
	if Dlinija < Dragon.zone * Dragon.zone * 4 and Dragon.angryness == 0	-- jei yra 4-gubu atstumu už zonos, yra nervingas
		then
			Dragon.state = "annoyed"
		end
	
	----------------------- padaryti, kai grįžta į normalų state.
end

-- funkcija, pakeičianti drakono paveikslėlį pagal state                -- TODO - animuoti pagal tai, į kurią pusę eina?
function AIM.dragon_image()
	if Dragon.state == "angry" then Dragon.image = love.graphics.newImage(pre.."Dragon sprites/angrydark1.png") end
	if Dragon.state == "annoyed" then Dragon.image = love.graphics.newImage(pre.."Dragon sprites/angrydark1.png") end
	if Dragon.state == "home" then Dragon.image = love.graphics.newImage(pre.."Dragon sprites/drakonas is priekio/prdark1.png") end
	if Dragon.state == "sleepy" then Dragon.image = love.graphics.newImage(pre.."Dragon sprites/sleepydark.png") end
end


-- n - botų skaičius
function AIM.load()
	BOT = {}
	AIM.n = 0 --pirmas botas
	AIM.create_bot()
	AIM.create_dragon()
end

function AIM.create_bot()
	AIM.n = AIM.n + 1
	BOT[AIM.n] = {image = love.graphics.newImage(pre.."AI.gif"),
			x = W[AIM.startW][1],
			y = W[AIM.startW][2],
			kitasW = W[AIM.startW][2 + is12()],
			
				-- pradiniai parametrai
			state = "gold",				-- pradinis state eina prie aukso
			weapon = "none",			-- kiti ginklai: "ragatkė", "lankas" etc.
			gold = 0,					-- pradžioje nėra aukso
			fgold = 0,					-- pradžioje nėra ir "false" aukso
			trap = 0,
			rot = 0,
			health = AIM.max_health		-- pradinės gyvybės or sth		
		  }
	
end

function AIM.update(dt)
	AIM.delta = AIM.delta + dt
	math.randomseed(os.time())
	math.random()
	if AIM.delta > math.random(5, 10) and AIM.n < AIM.max_bot
		then AIM.create_bot()
			 AIM.delta = 0
	end
    greitis = AIM.bazinis_greitis * dt
	for i = 1, AIM.n do
		AIM.choose_state(i)	
		-- tada pažiūrim ar atėjom į waypoint
		BOT[i].speed_modifier = math.random(0.8, 1.2)			-- keičiasi boto greitis!
		if W[BOT[i].kitasW][1] == BOT[i].x and W[BOT[i].kitasW][2] == BOT[i].y
			then 											-- renkamės kitą wp
				if BOT[i].state == "gold"
					then
						BOT[i].kitasW = W[BOT[i].kitasW][2 + is12()]
					elseif BOT[i].state == "spawn"
							then
								BOT[i].kitasW = W[BOT[i].kitasW][4 + is12()]
							elseif BOT[i].state == "weapon"
									then
										BOT[i].kitasW = W[BOT[i].kitasW][6 + is12()]
									elseif BOT[i].state == "hunt" or BOT[i].state == "hunt2"
										then
											if BOT[i].state == "hunt"
												then
													BOT[i].kitasW = W[BOT[i].kitasW][8 + is12()]
												else
													BOT[i].kitasW = W[BOT[i].kitasW][10 + is12()]
											end
										end
			else 	-- einam toliau link waypoint
			
				if (W[BOT[i].kitasW][1] - BOT[i].x < 0)				-- (jei neigiamas)
					then BOT[i].x = BOT[i].x - greitis * BOT[i].speed_modifier
					else BOT[i].x = BOT[i].x + greitis * BOT[i].speed_modifier
				end
					
				if (W[BOT[i].kitasW][2] - BOT[i].y < 0)  			-- (jei neigiamas)
					then BOT[i].y = BOT[i].y - greitis * BOT[i].speed_modifier
					else BOT[i].y = BOT[i].y + greitis * BOT[i].speed_modifier	
				end
				-- jeigu esam taip arti, kad mažiau už vieno judesio atstumą
				if math.abs(W[BOT[i].kitasW][1] - BOT[i].x) <= 5 then BOT[i].x = W[BOT[i].kitasW][1] end
				if math.abs(W[BOT[i].kitasW][2] - BOT[i].y) <= 5 then BOT[i].y = W[BOT[i].kitasW][2] end

		end
		if BOT[i].kitasW == nil then BOT[i].kitasW = 1 end
		
		-- šaudom į žaidėją, jeigu matomas. vėliau į kitus AI
		if AIM.isNotVisible(BOT[i].x, BOT[i].y, PlayerI.x, PlayerI.y) == false
			then
				AIM.sauti(i, dt, PlayerI.x, PlayerI.y)
		end
		
		--atnaujinam inventorių, jei įmanoma
		AIM.update_inventory(i)	
	end	
	AIM.update_dragon(dt)
end


function AIM.draw()
	for i = 1, AIM.n do
		love.graphics.draw(BOT[i].image, BOT[i].x,
				BOT[i].y, BOT[i].rot, 1, 1, 32, 32)
	end
	--AIM.botu_info()
	AIM.draw_dragon()
end

function AIM.choose_state(i)
	-- renkamės "state"
	if BOT[i].health < AIM.min_health					-- vėliau pataisyt jeigu health mokamas
		then
			BOT[i].state = "health"
		else
		if BOT[i].weapon == "none"
			then
			--TODO ivertinti ginklo kainą ar pan :D
				if BOT[i].fgold > 0					     -- jei yra nepatvirtinto gold
					then
						BOT[i].state = "spawn"
					elseif								-- irgi to do ėvertinti kainą
						BOT[i].gold < 100 and BOT[i].fgold == 0		
						then
							BOT[i].state = "gold"
							else
								BOT[i].state = "weapon"
				end
			else
				BOT[i].state = "hunt"
				if(i % 2) == 1
					then
						BOT[i].state = "hunt2"
				end
		end
	end
end

-- Funkcija, šaunanti x1 y1 kryptimi (nesvarbu ar yra siena)
-- x1, y1 - player koordinatės
function AIM.sauti(i, dt, x1, y1)
	local dx, dy
	dx = x1-BOT[i].x
	dy = y1-BOT[i].y

	BOT[i].rot = math.acos(dx/(math.sqrt(dx*dx+dy*dy)))*(dy/math.abs(dy))
	if BOT[i].rot == nil then
		BOT[i].rot = 0
	end

	if BOT[i].weapon ~= "none" then
		if BOT[i].bot_cooldown_time == nil then
			BOT[i].bot_cooldown_time = 0
		end
		if BOT[i].bot_cooldown_time >= BOT[i].bullet_cooldown
			then
				Bullet.AddShot(BOT[i].x, BOT[i].y, BOT[i].rot, BOT[i].bullet_speed)
				BOT[i].bot_cooldown_time = math.random(-1 * BOT[i].bullet_cooldown/2, BOT[i].bullet_cooldown/2)	-- truputį modinam cooldown'ą
			else
				BOT[i].bot_cooldown_time = BOT[i].bot_cooldown_time + dt
		end
	end
end

-- Funkcija nusako ar tarp dviejų koordinačių porų yra sienų, ar nėra.
-- Vėliau reikėtų pridėti daugiau objektų, pvz. drakoną.
-- Kam šaudyt į drakoną? :D
function AIM.isNotVisible(x1, y1, x2, y2)		
	for i = 1, #mapping.wall do 				-- per visas sienas
		local denom = (mapping.wall[i].y2 - mapping.wall[i].y1) * (x2 - x1) - (mapping.wall[i].x2 - mapping.wall[i].x1) * (y2 - y1)
		if denom ~= 0 then
			local ua = ((mapping.wall[i].x2 - mapping.wall[i].x1) * (y1 - mapping.wall[i].y1) - (mapping.wall[i].y2 - mapping.wall[i].y1) * (x1 - mapping.wall[i].x1)) / denom
			if ua > 0 and ua < 1 then				
				local ub = ((x2 - x1) * (y1 - mapping.wall[i].y1) - (y2 - y1) * (x1 - mapping.wall[i].x1)) / denom
				if ub > 0 and ub < 1
					then
						return true	
				end
			end
		end	
	end
	
	return false
end

-- Funkcija, atnaujinanti inventorių, jeigu AI atėjo į reikiamą laukelį,
-- įskaitant gold, weapons, traps, health
function AIM.update_inventory(i)
	if BOT[i].x == W[1][1] and BOT[i].y == W[1][2]	-- patvirtina parneštą goldą
		then
			BOT[i].gold = BOT[i].gold + BOT[i].fgold
			BOT[i].fgold = 0
	end	

	if BOT[i].x == W[5][1] and BOT[i].y == W[5][2]
		then
			if BOT[i].gold >= Inventory.weapon[1].price then
				BOT[i].weapon = "weapon 1"
				BOT[i].gold = BOT[i].gold - Inventory.weapon[1].price
				BOT[i].bullet_speed = Inventory.weapon[1].bulletspeed * AIM.kulkos_greitis
				BOT[i].bullet_cooldown = Inventory.weapon[1].cooldown
			end
	end
	
	if BOT[i].x == W[6][1] and BOT[i].y == W[6][2]
		then
			if BOT[i].gold >= Inventory.weapon[2].price then
				BOT[i].weapon = "weapon 2"
				BOT[i].gold = BOT[i].gold - Inventory.weapon[2].price
				BOT[i].bullet_speed = Inventory.weapon[2].bulletspeed * AIM.kulkos_greitis
				BOT[i].bullet_cooldown = Inventory.weapon[2].cooldown
			end
	end
	
	if BOT[i].x == W[10][1] and BOT[i].y == W[10][2]
		then
			if BOT[i].gold >= Inventory.weapon[3].price then
				BOT[i].weapon = "weapon 3"
				BOT[i].gold = BOT[i].gold - Inventory.weapon[3].price
				BOT[i].bullet_speed = Inventory.weapon[3].bulletspeed * AIM.kulkos_greitis
				BOT[i].bullet_cooldown = Inventory.weapon[3].cooldown
			end
	end
	
	if BOT[i].x == W[15][1] and BOT[i].y == W[15][2]
		then
			if BOT[i].gold >= Inventory.weapon[4].price then
				BOT[i].weapon = "weapon 4"
				BOT[i].gold = BOT[i].gold - Inventory.weapon[4].price
				BOT[i].bullet_speed = Inventory.weapon[4].bulletspeed * AIM.kulkos_greitis
				BOT[i].bullet_cooldown = Inventory.weapon[4].cooldown
			end
	end
	
	if BOT[i].x == W[12][1] and BOT[i].y == W[12][2]		--ateina į goldo koord.
		then
			BOT[i].fgold = 100
	end
	
	if BOT[i].x == W[17][1] and BOT[i].y == W[17][2]
		then
			BOT[i].health = AIM.max_health ----------------------- to do HEAL sudėtingesnį, pvz pirkti!
	end
	
	if BOT[i].x == W[13][1] and BOT[i].y == W[13][2]
		then
			BOT[i].trap = 1
	end
	
	if BOT[i].x == W[8][1] and BOT[i].y == W[8][2]
		then
			BOT[i].trap = 1
	end
	
end

function AIM.botu_info()
	text1 = "Botu sk: "..AIM.n.." Random sk: "..is12()
	love.graphics.print(text1, 950, 600)
	for i = 1, AIM.n do
	text2 = "Bot "..i.." ginklas: "..BOT[i].weapon.." state: "..BOT[i].state.." gold: ".. BOT[i].gold.." wp: "..BOT[i].kitasW
		love.graphics.print(text2, 1000, 600 + i * 20)
	end
	
	text3 = "Drago busena: "..Dragon.state.." Kitas wp: "..Dragon.kitasD.." Atstumas: "..math.sqrt(Dlinija).." Angryness: "..Dragon.angryness --vėliau sqrt nuimti
	love.graphics.print(text3, 950, 580)	
end

-- Funkcija grąžina vienetą arba dvejetą
function is12()
	math.randomseed(os.time())
	return math.floor(math.random()*100000) % 2 +1
end
