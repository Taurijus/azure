AI = {}

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
-- 11 - bus health'o ieškoti

W = {}
W[1] = {700, 630, 2, 20, 1, 1, 2, 20, 20, 3} -- spawn point 1
W[2] = {560, 630, 3, 37, 1, 1, 3, 37, 1, 37}
W[3] = {470, 630, 4, 21, 2, 2, 4, 4, 2, 21}
W[4] = {350, 630, 6, 6, 3, 3, 5, 6, 3, 6}
W[5] = {190, 640, 4, 4, 4, 4, 5, 5, 4, 4} -- weapon
W[6] = {350, 490, 7, 7, 4, 21, 6, 6, 7, 4} -- weapon
W[7] = {300, 490, 8, 8, 6, 6, 6, 6, 8, 8}
W[8] = {180, 350, 9, 9, 7, 7, 7, 9, 9, 9} -- trap
W[9] = {180, 220, 10, 10, 8, 33, 10, 10, 10, 10}
W[10] = {270, 180, 11, 11, 9, 13, 10, 10, 13, 13} -- weapon
W[11] = {270, 125, 12, 12, 10, 10, 10, 10, 10, 10}
W[12] = {210, 125, 11, 11, 11, 11, 11, 11, 11, 11} -- gold'as
W[13] = {560, 260, 10, 10, 14, 17, 10, 14, 17, 17} -- trap
W[14] = {640, 300, 13, 13, 16, 15, 15, 15, 22, 13}
W[15] = {730, 310, 14, 34, 19, 19, 15, 15, 14, 34} -- weapon
W[16] = {640, 480, 17, 14, 18, 18, 14, 14, 14, 17}
W[17] = {560, 480, 21, 13, 16, 21, 16, 16, 21, 21} -- health
W[18] = {640, 520, 16, 16, 20, 20, 16, 16, 16, 16}
W[19] = {710, 510, 18, 15, 1, 1, 15, 15, 15, 18}
W[20] = {670, 570, 18, 18, 1, 1, 19, 18, 18, 18}
W[21] = {480, 540, 6, 6, 3, 3, 6, 6, 6, 6}
W[22] = {650, 90, 13, 13, 23, 13, 23, 23, 13, 23}
W[23] = {710, 110, 22, 22, 15, 15, 15, 15, 15, 19}
W[24] = {480, 770, 25, 25, 37, 37, 25, 25, 25, 25}
W[25] = {480, 730, 26, 26, 24, 24, 26, 26, 26, 26}
W[26] = {400, 730, 27, 27, 25, 25, 27, 27, 27, 27}
W[27] = {400, 810, 28, 28, 26, 26, 28, 28, 28, 28}
W[28] = {20, 810, 29, 29, 27, 27, 29, 29, 29, 29}
W[29] = {20, 650, 30, 30, 28, 28, 30, 30, 30, 30}
W[30] = {110, 650, 31, 31, 29, 29, 31, 31, 31, 31}
W[31] = {110, 520, 32, 32, 30, 30, 32, 32, 32, 32}
W[32] = {20, 370, 33, 33, 31, 31, 33, 33, 33, 33}
W[33] = {20, 230, 9, 9, 32, 32, 9, 9, 9, 9}
W[34] = {980, 310, 35, 35, 15, 15, 10, 10, 35, 35}
W[35] = {980, 25, 36, 36, 36, 36, 36, 34, 36, 36}
W[36] = {650, 22, 22, 25, 22, 22, 22, 22, 22, 22}
W[37] = {560, 770, 24, 24, 2, 2, 24, 24, 24, 24}

AI.bazinis_greitis = 100
AI.kulkos_greitis = 300
AI.weapon_cost = 100			-- tarkim ginklo kaina
AI.max_health = 100
AI.health = AI.max_health		-- pradinės gyvybės or sth
AI.min_health = 10				-- kada reikėtų susirūpinti

function AI.load(self)
	AI.image = love.graphics.newImage(pre.."AI.gif")
	local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    AI.startW = 1					-- pradinis waypoint, TO DO random
    
    math.randomseed(os.time())
	math.random()
	self.kitasW = W[AI.startW][round(2.4 + math.random() + math.random(), 0)]
    
	self.x = W[AI.startW][1]
	self.y = W[AI.startW][2]
	
	-- pradiniai parametrai
	self.state = "gold"				-- pradinis state eina prie aukso
									-- kiti galimi state "health", "weapon", "hunt", "spawn"
	self.weapon = "none"			-- kiti ginklai: "ragatkė", "lankas" etc.
	--AI.weapon = "none"
	self.gold = 0						-- pradžioje nėra aukso
	self.fgold = 0					-- pradžioje nėra ir "false" aukso
	self.trap = 0
	self.rot = 0
end

function AI.update(self, dt)	
    greitis = AI.bazinis_greitis * dt
	AI:choose_state()
	
	-- tada pažiūrim ar atėjom į waypoint
	if W[self.kitasW][1] == self.x and W[self.kitasW][2] == self.y
		then 											-- renkamės kitą wp
			if self.state == "gold"
				then
					math.randomseed(os.time())
					math.random()
					self.kitasW = W[self.kitasW][round(2.4 + math.random() + math.random(), 0)]
				elseif self.state == "spawn"
						then
							math.randomseed(os.time())
							math.random()
							self.kitasW = W[self.kitasW][round(4.4 + math.random() + math.random(), 0)]
						elseif self.state == "weapon"
								then
									math.randomseed(os.time())
									math.random()
									self.kitasW = W[self.kitasW][round(6.4 + math.random() + math.random(), 0)]
								elseif self.state == "hunt"
									then
										math.randomseed(os.time())
										math.random()
										self.kitasW = W[self.kitasW][round(8.4 + math.random() + math.random(), 0)]
									end
		else 	-- einam toliau link waypoint
		
			if (W[self.kitasW][1] - self.x < 0)				-- (jei neigiamas)
				then self.x = self.x - greitis
				else self.x = self.x + greitis
			end
				
			if (W[self.kitasW][2] - self.y < 0)  			-- (jei neigiamas)
				then self.y = self.y - greitis
				else self.y = self.y + greitis		
			end
			-- jeigu esam taip arti, kad mažiau už vieno judesio atstumą
			if math.abs(W[self.kitasW][1] - self.x) <= 2 then self.x = W[self.kitasW][1] end
			if math.abs(W[self.kitasW][2] - self.y) <= 2 then self.y = W[self.kitasW][2] end

	end
	
	-- šaudom į žaidėją, jeigu matomas. vėliau į kitus AI
	if isNotVisible(self.x, self.y, PlayerI.x, PlayerI.y) == false
		then
			self:sauti(PlayerI.x, PlayerI.y)
	end
	
	--atnaujinam inventorių, jei įmanoma
	self:update_inventory()
	
end


function AI.draw(self)
	local width = love.graphics.getWidth()
	local height = love.graphics.getHeight()
	love.graphics.draw(AI.image, self.x, self.y, self.rot, 1, 1, 32, 32)
	
	-- šiaip info
	--local text1 = "BOT ginklas: "..AI.weapon.." state: "..AI.state
    --local text2 = "health: ".. AI.health.." false gold: "..AI.fgold.." gold: "..AI.gold
    --local text3 = "next wp: "..AI.kitasW.." trap: "..AI.trap
	--love.graphics.print(text1, 700, 680)
	--love.graphics.print(text2, 700, 710)
	--love.graphics.print(text3, 700, 730)
end

function AI.choose_state(self)
	-- renkamės "state"
	if self.health < self.min_health					-- vėliau pataisyt jeigu health mokamas
		then
			self.state = "health"
		else
			if self.weapon == "none"
				then
					if self.fgold > 0	and self.gold < self.weapon_cost -- jei yra nepatvirtinto gold
						then
							self.state = "spawn"
						elseif
							self.gold < self.weapon_cost and self.fgold == 0		
							then
								self.state = "gold"
								else
									self.state = "weapon"
					end
				else
					self.state = "hunt"
			end
	end
end

-- Funkcija, šaunanti x1 y1 kryptimi (nesvarbu ar yra siena)
-- x1, y1 - player koordinatės
function AI.sauti(self, x1, y1)
	local dx, dy
	dx = x1-self.x
	dy = y1-self.y

	self.rot = math.acos(dx/(math.sqrt(dx*dx+dy*dy)))*(dy/math.abs(dy))
	if self.rot == nil then
		self.rot = 0
	end

	if self.weapon ~= "none" then
			Bullet.AddShot(self.x, self.y, self.rot, self.kulkos_greitis)
		end
end

-- Funkcija nusako ar tarp dviejų koordinačių porų yra sienų, ar nėra.
-- Vėliau reikėtų pridėti daugiau objektų, pvz. drakoną.
-- Kam šaudyt į drakoną? :D
function isNotVisible(x1, y1, x2, y2)		
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
function AI.update_inventory(self)
	if self.x == W[1][1] and self.y == W[1][2]	-- patvirtina parneštą goldą
		then
			self.gold = self.gold + self.fgold
			self.fgold = 0
	end	

	if self.x == W[5][1] and self.y == W[5][2]
		then
			if self.gold >= Inventory.weapon[1].price then
				self.weapon = "weapon 1"
				self.gold = self.gold - Inventory.weapon[1].price
			end
	end
	
	if self.x == W[6][1] and self.y == W[6][2]
		then
			if self.gold >= Inventory.weapon[2].price then
				self.weapon = "weapon 2"
				self.gold = self.gold - Inventory.weapon[2].price
			end
	end
	
	if self.x == W[10][1] and self.y == W[10][2]
		then
			if self.gold >= Inventory.weapon[3].price then
				self.weapon = "weapon 3"
				self.gold = self.gold - Inventory.weapon[3].price
			end
	end
	
	if self.x == W[15][1] and self.y == W[15][2]
		then
			if self.gold >= Inventory.weapon[4].price then
				self.weapon = "weapon 4"
				self.gold = self.gold - Inventory.weapon[4].price
			end
	end
	
	if self.x == W[12][1] and self.y == W[12][2]		--ateina į goldo koord.
		then
			self.fgold = 100
	end
	
	if self.x == W[17][1] and self.y == W[17][2]
		then
			self.health = self.max_health
	end
	
	if self.x == W[13][1] and self.y == W[13][2]
		then
			self.trap = 1
	end
	
	if self.x == W[8][1] and self.y == W[8][2]
		then
			self.trap = 1
	end
	
end
