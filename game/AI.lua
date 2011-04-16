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
W[12] = {210, 125, 11, 11, 11, 11} -- gold'as
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

function AI.load()
	AI.image = love.graphics.newImage(pre.."AI.gif")
	local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
	AI.x = width/2
	AI.y = height/2
	AI.rot = 0
	
	-- pradiniai parametrai
	state = "gold"					-- pradinis state eina prie aukso
									-- kiti galimi state "health", "weapon", "hunt"
	weapon = "none"					-- ginklo nėra
	gold = 0						-- pradžioje nėra aukso
	health = 100					-- pradinės gyvybės or sth
	min_health = 10					-- kada reikėtų susirūpinti
	weapon_cost = 100				-- tarkim ginklo kaina
	
end

function AI.update(dt)	
	AI.rot = math.acos(dx/(math.sqrt(dx*dx+dy*dy)))*(dy/math.abs(dy))
	if AI.rot == nil then
		AI.rot = 0
	end
	
	-- renkamės "state"
	if health < min_health
		then
			state = "health"
		else
			if weapon == "none"
				then
					if gold < weapon_cost
						then
							state = "gold"
						else
							state = "weapon"
					end
				else
					state = "hunt"
			end
	end
	
	-- tada pažiūrim ar atėjom į waypoint
	-- jei jo, renkamės kitą waypoint
	-- reikia funkcijos iš map'o, kad pažiūrėt paviršių pagal koord
	-- pagal paviršių keisis judėjimo greitis
end


function AI.draw()
	local width = love.graphics.getWidth()
	local height = love.graphics.getHeight()
	love.graphics.draw(AI.image, AI.x, AI.y, AI.rot, 1, 1, 32, 32)
end
