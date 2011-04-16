AI = {}

-- waypoints, idėja paveikslėly /images/map_with_waypoints.png
-- veikia taip. masyvo eilės numeris yra waypoint'o numeris
-- way point'e:
-- 1 - x koord
-- 2 - y koord
-- 3 - kur eiti jeigu norim gold
-- 4 - kur eiti jei norim ginklo
-- 5 - kur eiti jeigu norim health'o
-- 6 - kur eiti random, jei norim huntinti
-- vėliau pagal koordinates bus galima apskaičiuoti artimiausią ar pan...

W = {}
W[1] = {700, 630, 2, 2, 2, 2} -- spawn
W[2] = {560, 630, 3, 3, 3, 3}
W[3] = {470, 630, 4, 4, 4, 4}
W[4] = {350, 630, 6, 6, 6, 6}
W[5] = {190, 640, 4, 4, 4, 4} -- weapon
W[6] = {350, 490, 7, 7, 7, 7} -- weapon
W[7] = {300, 490, 8, 8, 8, 8}
W[8] = {180, 350, 9, 9, 9, 9}
W[9] = {180, 220, 10, 10, 10, 10}
W[10] = {270, 180, 11, 11, 11, 11} -- weapon
W[11] = {270, 125, 12, 12, 12, 12}
W[12] = {210, 125, 13, 13, 13, 13} -- gold'as
W[13] = {560, 260, 14, 14, 14, 14} -- trap
W[14] = {640, 300, 15, 15, 15, 15}
W[15] = {730, 310, 19, 19, 19, 19} -- weapon
W[16] = {640, 480, 17, 17, 17, 17}
W[17] = {560, 480, 21, 21, 21, 21} -- health
W[18] = {640, 520, 20, 20, 20, 20}
W[19] = {710, 510, 20, 20, 20, 20}
W[20] = {670, 570, 1, 1, 1, 1}
W[21] = {480, 540, 6, 6, 6, 6}
W[22] = {650, 90, 13, 13, 13, 13}

AI.bazinis_greitis = 50

function AI.load()
	AI.image = love.graphics.newImage(pre.."AI.gif")
	local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
	AI.x = W[12][1]										------------------------------- TODO pradinis waypoint pakeisti
	AI.y = W[12][2]
	
	-- pradiniai parametrai
	AI.state = "gold"				-- pradinis state eina prie aukso
									-- kiti galimi state "health", "weapon", "hunt"
	AI.weapon = "none"				-- ginklo nėra
	AI.gold = 0						-- pradžioje nėra aukso
	AI.health = 100					-- pradinės gyvybės or sth
	AI.min_health = 10				-- kada reikėtų susirūpinti
	AI.weapon_cost = 100			-- tarkim ginklo kaina
	AI.kitasW = 6					-- koks sekantis waypoint
	
end

function AI.update(dt)	
    greitis = AI.bazinis_greitis * dt
	AI.choose_state()
	
	-- tada pažiūrim ar atėjom į waypoint
	if W[AI.kitasW][1] == AI.x and W[AI.kitasW][2] == AI.y
		then 											-- renkamės kitą wp
			if AI.state == "health"
				then
					AI.kitasW = W[AI.kitasW][5]
				elseif AI.state == "gold"
						then
							AI.kitasW = W[AI.kitasW][3]
						elseif AI.state == "weapon"
								then
									AI.kitasW = W[AI.kitasW][4]
								elseif AI.state == "hunt"
										then
											AI.kitasW = W[AI.kitasW][6]
										end
		else 	-- einam toliau link waypoint
		
			if (W[AI.kitasW][1] - AI.x < 0)				-- (jei neigiamas)
				then AI.x = AI.x - greitis
				else AI.x = AI.x + greitis
			end
				
			if (W[AI.kitasW][2] - AI.y < 0)  			-- (jei neigiamas)
				then AI.y = AI.y - greitis
				else AI.y = AI.y + greitis		
			end
			-- jeigu esam taip arti, kad mažiau už vieno judesio atstumą  -- TODO - pataisyti teleportus
			if math.abs(W[AI.kitasW][1] - AI.x) <= 2 or
			   math.abs(W[AI.kitasW][2] - AI.y) <= 2
			   then
					AI.x = W[AI.kitasW][1]
					AI.y = W[AI.kitasW][2]			   
			   end
	end
	
	-- jei jo, renkamės kitą waypoint
	-- reikia funkcijos iš map'o, kad pažiūrėt paviršių pagal koord
	-- pagal paviršių keisis judėjimo greitis
end


function AI.draw()
    local text = greitis.." "..AI.kitasW.." "..W[AI.kitasW][1].." "..W[AI.kitasW][2].." "..AI.x.." "..AI.y
	local width = love.graphics.getWidth()
	local height = love.graphics.getHeight()
	love.graphics.draw(AI.image, AI.x, AI.y, 0, 1, 1, 32, 32) -- 0 -rotation
	love.graphics.print(text, 500, 500)
end

function AI.choose_state()
	-- renkamės "state"
	if AI.health < AI.min_health
		then
			AI.state = "health"
		else
			if AI.weapon == "none"
				then
					if AI.gold < AI.weapon_cost
						then
							AI.state = "gold"
						else
							AI.state = "weapon"
					end
				else
					AI.state = "hunt"
			end
	end
end
