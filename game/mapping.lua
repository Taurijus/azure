mapping = {}
-- x1, y1 - denotes upper left corner of rectangle
-- x2, y2 - denotes lower right corner of rectangle

function mapping.load()
	-- voidness coords (where player or dragon should not past)
	mapping.image = love.graphics.newImage(pre.."9.png")
	--mapping.image4 = love.graphics.newImage("images/11.png")
	mapping.x = 0
	mapping.y = 0	
	mapping.xx = 0
	mapping.yy = 0
	mapping.file = love.filesystem.newFile("data.txt")
	mapping.file:open('w')

	mapping['wall'] = {}
mapping.wall[1] = {x1 = 839, y1 =406, x2 = 363, y2 = 686}
mapping.wall[2] = {x1 = 363, y1 =686, x2 = 715, y2 = 1010}
mapping.wall[3] = {x1 = 768, y1 =1054, x2 = 955, y2 = 1229}
mapping.wall[4] = {x1 = 955, y1 =1229, x2 = 1217, y2 = 1018}
mapping.wall[5] = {x1 = 1265, y1 =975, x2 = 1352, y2 = 905}
mapping.wall[6] = {x1 = 1404, y1 =862, x2 = 1489, y2 = 795}
mapping.wall[7] = {x1 = 1524, y1 =764, x2 = 1601, y2 = 702}
mapping.wall[8] = {x1 = 1601, y1 =702, x2 = 1549, y2 = 666}
mapping.wall[9] = {x1 = 1464, y1 =609, x2 = 1005, y2 = 310}
mapping.wall[10] = {x1 = 1005, y1 =310, x2 = 892, y2 = 380}

mapping.wall[11] = {x1 = 925, y1 =369, x2 = 985, y2 = 407}
mapping.wall[12] = {x1 = 1254, y1 =482, x2 = 1189, y2 = 529}
mapping.wall[13] = {x1 = 1154, y1 =505, x2 = 1308, y2 = 615}
mapping.wall[14] = {x1 = 1486, y1 =677, x2 = 1360, y2 = 771}
mapping.wall[15] = {x1 = 1192, y1 =777, x2 = 1093, y2 = 853}
mapping.wall[16] = {x1 = 1221, y1 =876, x2 = 1071, y2 = 993}
mapping.wall[17] = {x1 = 979, y1 =933, x2 = 884, y2 = 1005}
mapping.wall[18] = {x1 = 803, y1 =935, x2 = 918, y2 = 1036}
mapping.wall[19] = {x1 = 696, y1 =842, x2 = 670, y2 = 818}
mapping.wall[20] = {x1 = 670, y1 =818, x2 = 735, y2 = 776}
mapping.wall[21] = {x1 = 644, y1 =706, x2 = 586, y2 = 742}
mapping.wall[22] = {x1 = 586, y1 =742, x2 = 470, y2 = 641}
	
mapping.wall[23] = {x1 = 839, y1 =408, x2 = 738, y2 = 335}
mapping.wall[24] = {x1 = 738, y1 =335, x2 = 657, y2 = 380}
mapping.wall[25] = {x1 = 657, y1 =380, x2 = 732, y2 = 431}
mapping.wall[26] = {x1 = 732, y1 =431, x2 = 336, y2 = 654}
mapping.wall[27] = {x1 = 336, y1 =654, x2 = 268, y2 = 596}
mapping.wall[28] = {x1 = 268, y1 =596, x2 = 113, y2 = 678}
mapping.wall[29] = {x1 = 113, y1 =678, x2 = 173, y2 = 746}
mapping.wall[30] = {x1 = 173, y1 =746, x2 = 282, y2 = 683}
mapping.wall[31] = {x1 = 282, y1 =683, x2 = 425, y2 = 820}
mapping.wall[32] = {x1 = 425, y1 =820, x2 = 317, y2 = 890}
mapping.wall[33] = {x1 = 317, y1 =890, x2 = 389, y2 = 967}
mapping.wall[34] = {x1 = 389, y1 =967, x2 = 501, y2 = 896}
mapping.wall[35] = {x1 = 501, y1 =896, x2 = 623, y2 = 1012}
mapping.wall[36] = {x1 = 623, y1 =1012, x2 = 571, y2 = 1052}
mapping.wall[37] = {x1 = 571, y1 =1052, x2 = 611, y2 = 1093}
mapping.wall[38] = {x1 = 611, y1 =1093, x2 = 711, y2 = 1023}
mapping.wall[39] = {x1 = 758, y1 =1066, x2 = 595, y2 = 1179}
mapping.wall[40] = {x1 = 595, y1 =1179, x2 = 468, y2 = 1050}
mapping.wall[41] = {x1 = 468, y1 =1050, x2 = 522, y2 = 1012}
mapping.wall[42] = {x1 = 522, y1 =1012, x2 = 487, y2 = 977}
mapping.wall[43] = {x1 = 487, y1 =977, x2 = 367, y2 = 1049}
mapping.wall[44] = {x1 = 367, y1 =1049, x2 = 21, y2 = 679}
mapping.wall[45] = {x1 = 21, y1 =679, x2 = 290, y2 = 536}
mapping.wall[46] = {x1 = 290, y1 =536, x2 = 355, y2 = 591}
mapping.wall[47] = {x1 = 355, y1 =591, x2 = 452, y2 = 537}
mapping.wall[48] = {x1 = 452, y1 =537, x2 = 388, y2 = 478}
mapping.wall[49] = {x1 = 388, y1 =478, x2 = 745, y2 = 285}
mapping.wall[50] = {x1 = 745, y1 =285, x2 = 883, y2 = 378}
mapping.wall[51] = {x1 = 1473, y1 =605, x2 = 1540, y2 = 557}
mapping.wall[52] = {x1 = 1540, y1 =557, x2 = 2009, y2 = 851}
mapping.wall[53] = {x1 = 2009, y1 =851, x2 = 1690, y2 = 1162}
mapping.wall[54] = {x1 = 1690, y1 =1162, x2 = 1575, y2 = 1080}
mapping.wall[55] = {x1 = 1575, y1 =1080, x2 = 1436, y2 = 1201}
mapping.wall[56] = {x1 = 1436, y1 =1201, x2 = 1223, y2 = 1029}
mapping.wall[57] = {x1 = 1270, y1 =990, x2 = 1427, y2 = 1112}
mapping.wall[58] = {x1 = 1427, y1 =1112, x2 = 1516, y2 = 1032}
mapping.wall[59] = {x1 = 1516, y1 =1032, x2 = 1362, y2 = 915}
mapping.wall[60] = {x1 = 1408, y1 =877, x2 = 1560, y2 = 992}
mapping.wall[61] = {x1 = 1560, y1 =992, x2 = 1642, y2 = 918}
mapping.wall[62] = {x1 = 1642, y1 =918, x2 = 1493, y2 = 810}
mapping.wall[63] = {x1 = 1550, y1 =665, x2 = 1592, y2 = 638}
mapping.wall[64] = {x1 = 1592, y1 =638, x2 = 1549, y2 = 618}
mapping.wall[65] = {x1 = 1549, y1 =618, x2 = 1748, y2 = 744}
mapping.wall[66] = {x1 = 1748, y1 =744, x2 = 1676, y2 = 810}
mapping.wall[67] = {x1 = 1676, y1 =810, x2 = 1837, y2 = 921}
mapping.wall[68] = {x1 = 1837, y1 =921, x2 = 1676, y2 = 1072}
mapping.wall[69] = {x1 = 1676, y1 =1072, x2 = 1621, y2 = 1034}
mapping.wall[70] = {x1 = 1621, y1 =1034, x2 = 1743, y2 = 919}
mapping.wall[71] = {x1 = 1743, y1 =919, x2 = 1535, y2 = 776}
mapping.wall[72] = {x1 = 771, y1 =617, x2 = 872, y2 = 554}
mapping.wall[73] = {x1 = 942, y1 =518, x2 = 967, y2 = 502}
mapping.wall[74] = {x1 = 967, y1 =502, x2 = 891, y2 = 449}
	
	
end



function mapping.wallTouch()
for i = 1, #mapping.wall do
                       local width = love.graphics.getWidth()
			local height = love.graphics.getHeight()
			local vx1 = mapping.wall[i].x1+PlayerI.x--(width/2)
			local vy1 = mapping.wall[i].y1+PlayerI.y--(height/2)
			local vx2 = mapping.wall[i].x2+PlayerI.x--(width/2)
			local vy2 = mapping.wall[i].y2+PlayerI.y--(height/2)
			local vx3 = mapping.wall[i].x2 - mapping.wall[i].x1
			local vy3 = mapping.wall[i].y2 - mapping.wall[i].y1

			if math.abs(math.sqrt(vx3*vx3+vy3*vy3)-math.sqrt(vx2*vx2+vy2*vy2)-math.sqrt(vx1*vx1+vy1*vy1)) < 3 then
				return true
			end
			
		end
	return false
end

function mapping.update(dt)

--[[	if love.mouse.isDown("l") then
		local x, y = love.mouse.getPosition()
		mapping.xx = x
		mapping.yy = y
		--mapping.file.write( tostring(mapping.xx+mapping.x .. ' '..  mapping.yy+mapping.y)) 
	end]]
	
end
function mapping.draw()

	love.graphics.draw(mapping.image, mapping.x, mapping.y)
		--love.graphics.setColor( 255, 255, 0, 100 ) --Debug version (cool color)
		for i = 1, #mapping.wall do
                        --love.graphics.print(tostring(mapping.wall[i][j].x1), j * 50, i * 10)
			local xx1 = mapping.wall[i].x1
			local yy1 = mapping.wall[i].y1
			local xx2 = mapping.wall[i].x2
			local yy2 = mapping.wall[i].y2
			love.graphics.line(xx1,yy1,xx2,yy2)
		end
		--[[
	local width = love.graphics.getWidth()
	local height = love.graphics.getHeight()
	love.graphics.print(mapping.xx-mapping.x .. ' ' .. mapping.yy-mapping.y, mapping.xx,mapping.yy)
	love.graphics.print(-mapping.x+width/2 .. ' ' ..-mapping.y+height/2,10,20)
	]]
	

end
--[[
sakys true, jei yra nors viena besikertanti siena
]]
function mapping.intersect (x1, y1, x2, y2)		
	for i = 1, #mapping.wall do 				-- per visas sienas
		local denom = (mapping.wall[i].y2 - mapping.wall[i].y1) * (x2 - x1) - (mapping.wall[i].x2 - mapping.wall[i].x1) * (y2 - y1)
		if denom ~= 0 then
			local ua = ((mapping.wall[i].x2 - mapping.wall[i].x1) * (y1 - mapping.wall[i].y1) - (mapping.wall[i].y2 - mapping.wall[i].y1) * (x1 - mapping.wall[i].x1)) / denom
			if ua > 0 and ua < 1 then				
				local ub = ((x2 - x1) * (y1 - mapping.wall[i].y1) - (y2 - y1) * (x1 - mapping.wall[i].x1)) / denom
				if ub > 0 and ub < 1
					then
						return true, i
				end
			end
		end	
	end
	return false, 0
end

