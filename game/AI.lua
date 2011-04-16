AI = {}
function AI.load()
	PlayerI.image = love.graphics.newImage(pre.."4.png")
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
	weapon_cost = 100						-- tarkim ginklo kaina
	
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
end


function AI.draw()
	local width = love.graphics.getWidth()
	local height = love.graphics.getHeight()
	love.graphics.draw(AI.image, AI.x, AI.y, AI.rot, 1, 1, 32, 32)
end
