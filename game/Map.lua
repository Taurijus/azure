gamemap = {}
-- x1, y1 - denotes upper left corner of rectangle
-- x2, y2 - denotes lower right corner of rectangle

function gamemap.load()
	-- voidness coords (where player or dragon should not past)
	gamemap.image = love.graphics.newImage("images/Baground1.png")
	gamemap.x = -500
	gamemap.y = -500
	gamemap.xoffset = 500
	gamemap.yoffset = 500
	gamemap.rotatioset = -math.pi/4
	gamemap['void'] = {}
	gamemap.void[1] = {x1 = 0, y1 = 0, x2 = 0 + 158, y2 = 0 + 208}
	gamemap.void[2] = {x1 = 159, y1 = 0, x2 = 159 + 468, y2 = 0 + 76}
	gamemap.void[3] = {x1 = 666, y1 = 42, x2 = 666 + 167, y2 = 42 + 41}
	gamemap.void[4] = {x1 = 874, y1 = 42, x2 = 874 + 84, y2 = 42 + 41}
	gamemap.void[5] = {x1 = 750, y1 = 82, x2 = 750 + 83, y2 = 82 + 84}
	gamemap.void[6] = {x1 = 833, y1 = 124, x2 = 833 + 124, y2 = 124 + 42}
	gamemap.void[7] = {x1 = 915, y1 = 166, x2 = 915 + 42, y2 = 166 + 125}
	gamemap.void[8] = {x1 = 750, y1 = 208, x2 = 750 + 125, y2 = 208 + 82}
	gamemap.void[9] = {x1 = 750, y1 = 332, x2 = 750 + 125, y2 = 332 + 83}
	gamemap.void[10] = {x1 = 916, y1 = 332, x2 = 916 + 84, y2 = 332 + 249}
	gamemap.void[11] = {x1 = 750, y1 = 457, x2 = 750 + 166, y2 = 457 + 375}
	gamemap.void[12] = {x1 = 583, y1 = 675, x2 = 583 + 167, y2 = 675 + 157}
	gamemap.void[13] = {x1 = 417, y1 = 790, x2 = 417 + 166, y2 = 790 + 42}
	gamemap.void[14] = {x1 = 417, y1 = 749, x2 = 417 + 42, y2 = 749 + 83}
	gamemap.void[15] = {x1 = 500, y1 = 667, x2 = 500 + 42, y2 = 677 + 80}
	gamemap.void[16] = {x1 = 292, y1 = 667, x2 = 292 + 82, y2 = 667 + 123}
	gamemap.void[17] = {x1 = 42, y1 = 667, x2 = 42 + 83, y2 = 667 + 123}
	gamemap.void[18] = {x1 = 125, y1 = 667, x2 = 125 + 416, y2 = 667 + 41}
	gamemap.void[19] = {x1 = 125, y1 = 249, x2 = 125 + 35, y2 = 249 + 459}
	gamemap.void[20] = {x1 = 42, y1 = 249, x2 = 42 + 82, y2 = 249 + 83}
	gamemap.void[21] = {x1 = 0, y1 = 541, x2 = 0 + 82, y2 = 541 + 82}

	-- walls coords (where player should not pass)
	gamemap['wall'] = {}
	gamemap.wall[1] = {}
	gamemap.wall[1][1] = {x1 = 583, y1 = 661, x2 = 583 + 170, y2 = 661 + 14}
	gamemap.wall[1][2] = {x1 = 738, y1 = 621, x2 = 738 + 14, y2 = 621 + 54}
	gamemap.wall[2] = {}
	gamemap.wall[2][1] = {x1 = 738, y1 = 456, x2 = 738 + 14, y2 = 456 + 146}
	gamemap.wall[3] = {}
	gamemap.wall[3][1] = {x1 = 738, y1 = 328, x2 = 738 + 14, y2 = 328 + 93}
	gamemap.wall[4] = {}
	gamemap.wall[4][1] = {x1 = 738, y1 = 203, x2 = 738 + 14, y2 = 203 + 93}
	gamemap.wall[5] = {}
	gamemap.wall[5][1] = {x1 = 738, y1 = 76, x2 = 738 + 14, y2 = 76 + 93}
	gamemap.wall[5][2] = {x1 = 697, y1 = 76, x2 = 697 + 55, y2 = 76 + 14}
	gamemap.wall[6] = {}
	gamemap.wall[6][1] = {x1 = 161, y1 = 76, x2 = 161 + 469, y2 = 76 + 14}
	gamemap.wall[6][2] = {x1 = 158, y1 = 76, x2 = 158 + 18, y2 = 76 + 133}
	gamemap.wall[6][3] = {x1 = 431, y1 = 76, x2 = 431 + 14, y2 = 76 + 57}
	gamemap.wall[6][4] = {x1 = 160, y1 = 168, x2 = 160 + 89, y2 = 168 + 14}
	gamemap.wall[7] = {}
	gamemap.wall[7][1] = {x1 = 405, y1 = 153, x2 = 405 + 153, y2 = 153 + 15}
	gamemap.wall[7][2] = {x1 = 431, y1 = 133, x2 = 431 + 14, y2 = 133 + 35}
	gamemap.wall[8] = {}
	gamemap.wall[8][1] = {x1 = 158, y1 = 251, x2 = 158 + 16, y2 = 251 + 423}
	gamemap.wall[8][2] = {x1 = 158, y1 = 661, x2 = 158 + 36, y2 = 661 + 14}
	gamemap.wall[8][3] = {x1 = 158, y1 = 588, x2 = 158 + 36, y2 = 588 + 14}
	gamemap.wall[9] = {}
	gamemap.wall[9][1] = {x1 = 206, y1 = 600, x2 = 206 + 355, y2 = 600 + 14}
	gamemap.wall[10] = {}
	gamemap.wall[10][1] = {x1 = 221, y1 = 247, x2 = 221 + 96, y2 = 247 + 15}
	gamemap.wall[10][2] = {x1 = 303, y1 = 247, x2 = 202 + 14, y2 = 247 + 35}
	gamemap.wall[11] = {}
	gamemap.wall[11][1] = {x1 = 303, y1 = 346, x2 = 303 + 14, y2 = 346 + 94}
	gamemap.wall[12] = {}
	gamemap.wall[12][1] = {x1 = 194, y1 = 588, x2 = 194 + 123, y2 = 588 + 14}
	gamemap.wall[12][2] = {x1 = 303, y1 = 548, x2 = 303 + 14, y2 = 548 + 54}
	gamemap.wall[13] = {}
	gamemap.wall[13][1] = {x1 = 392, y1 = 541, x2 = 392 + 14, y2 = 541 + 62}
	gamemap.wall[13][2] = {x1 = 392, y1 = 587, x2 = 392 + 34, y2 = 587 + 15}
	gamemap.wall[14] = {}
	gamemap.wall[14][1] = {x1 = 530, y1 = 587, x2 = 530 + 107, y2 = 587 + 15}
	gamemap.wall[14][2] = {x1 = 597, y1 = 516, x2 = 597 + 14, y2 = 516 + 86}
	gamemap.wall[15] = {}
	gamemap.wall[15][1] = {x1 = 666, y1 = 375, x2 = 666 + 16, y2 = 375 + 132}
	gamemap.wall[16] = {}
	gamemap.wall[16][1] = {x1 = 597, y1 = 329, x2 = 597 + 14, y2 = 329 + 91}
	gamemap.wall[17] = {}
	gamemap.wall[17][1] = {x1 = 666, y1 = 107, x2 = 666 + 16, y2 = 107 + 142}

	--[[
	set of rectangles. if player hits those, wall with the same index should
	be hidden
	]]
	gamemap['hide'] = {}
	gamemap.hide[1] = {}
	gamemap.hide[1][1] = {x1 = 610, y1 = 631, x2 = 610 + 126, y2 = 631 + 26}
	gamemap.hide[2] = {}
	gamemap.hide[2][1] = {x1 = 712, y1 = 460, x2 = 712 + 25, y2 = 460 + 124}
	gamemap.hide[3] = {}
	gamemap.hide[3][1] = {x1 = 712, y1 = 355, x2 = 712 + 25, y2 = 335 + 73}
	gamemap.hide[4] = {}
	gamemap.hide[4][1] = {x1 = 712, y1 = 212, x2 = 712 + 25, y2 = 212 + 67}
	gamemap.hide[5] = {}
	gamemap.hide[5][1] = {x1 = 712, y1 = 92, x2 = 712 + 25, y2 = 92 + 45}
	gamemap.hide[6] = {}
	gamemap.hide[6][1] = {x1 = 177, y1 = 129, x2 = 177 + 48, y2 = 129 + 37}
	gamemap.hide[7] = {}
	gamemap.hide[7][1] = {x1 = 393, y1 = 110, x2 = 292 + 33, y2 = 110 + 42}
	gamemap.hide[7][2] = {x1 = 451, y1 = 121, x2 = 451 + 93, y2 = 121 + 31}
	gamemap.hide[8] = {}
	gamemap.hide[9] = {}
	gamemap.hide[9][1] = {x1 = 226, y1 = 635, x2 = 226 + 297, y2 = 635 + 22}
	gamemap.hide[10] = {}
	gamemap.hide[10][1] = {x1 = 223, y1 = 225, x2 = 223 + 75, y2 = 225 + 21}
	gamemap.hide[11] = {}
	gamemap.hide[11][1] = {x1 = 284, y1 = 352, x2 = 284 + 17, y2 = 352 + 70}
	gamemap.hide[12] = {}
	gamemap.hide[12][1] = {x1 = 207, y1 = 555, x2 = 207 + 95, y2 = 555 + 29}
	gamemap.hide[13] = {}
	gamemap.hide[13][1] = {x1 = 371, y1 = 544, x2 = 371 + 20, y2 = 544 + 45}
	gamemap.hide[14] = {}
	gamemap.hide[14][1] = {x1 = 538, y1 = 562, x2 = 538 + 57, y2 = 562 + 22}
	gamemap.hide[14][2] = {x1 = 576, y1 = 530, x2 = 576 + 19, y2 = 530 + 54}
	gamemap.hide[15] = {}
	gamemap.hide[15][1] = {x1 = 644, y1 = 388, x2 = 644 + 20, y2 = 388 + 99}
	gamemap.hide[16] = {}
	gamemap.hide[16][1] = {x1 = 580, y1 = 340, x2 = 580 + 15, y2 = 40 + 63}
	gamemap.hide[17] = {}
	gamemap.hide[17][1] = {x1 = 638, y1 = 111, x2 = 638 + 26, y2 = 111 + 128}

end
function gamemap.voidTouch()

	for i = 1, #gamemap.void do
		local width = love.graphics.getWidth()
		local height = love.graphics.getHeight()
		local x1 = gamemap.void[i].x1+gamemap.x+gamemap.xoffset
		local y1 = gamemap.void[i].y1+gamemap.y+gamemap.yoffset
		local x2 = gamemap.void[i].x2+gamemap.x+gamemap.xoffset
		local y2 = gamemap.void[i].y2+gamemap.y+gamemap.yoffset
	--love.graphics.print(tostring(x1 .. " " .. y1), 0, i * 10)
	--love.graphics.print(tostring(x2 .. " " .. y2), 0, i * 10)
		if x1<width/2 and x2 >width/2 and y1<height/2 and y2 > height/2 then
			return true
		end
	end 
	return false
end
function gamemap.wallTouch()


	for i = 1, #gamemap.wall do
                for j = 1, #gamemap.wall[i] do
                       local width = love.graphics.getWidth()
			local height = love.graphics.getHeight()
			local x1 = gamemap.wall[i][j].x1+gamemap.x+gamemap.xoffset
			local y1 = gamemap.wall[i][j].y1+gamemap.y+gamemap.yoffset
			local x2 = gamemap.wall[i][j].x2+gamemap.x+gamemap.xoffset
			local y2 = gamemap.wall[i][j].y2+gamemap.y+gamemap.yoffset
	--love.graphics.print(tostring(x1 .. " " .. y1), 0, i * 10)
	--love.graphics.print(tostring(x2 .. " " .. y2), 0, i * 10)
			if x1<width/2 and x2 >width/2 and y1<height/2 and y2 > height/2 then
				return true
			end
                end
        end
end
function gamemap.update()

end
function gamemap.transformX(xx, yy, zz, teta, gama, phi)
return xx*(math.cos(gama)*math.cos(teta))+yy*(math.sin(gama)*math.cos(teta))+zz*(-math.sin(teta))
end
function gamemap.transformY(xx, yy, zz, teta, gama, phi)
return  xx*(-math.sin(gama)*math.cos(phi)+math.sin(phi)*math.sin(teta)*math.cos(gama))+yy*(math.cos(phi)*math.cos(gama)+math.sin(phi)*math.sin(teta)*math.sin(gama))+zz*(math.sin(phi)*math.cos(teta))
end
function gamemap.transformZ(xx, yy, zz, teta, gama, phi)
return 0
end
function gamemap.draw()
	--love.graphics.draw(gamemap.image, gamemap.x, gamemap.y)
	--[[ just for checking values
	]]
	
	for i = 1, #gamemap.void do
		local x1 = gamemap.void[i].x1+gamemap.x+gamemap.xoffset
		local y1 = gamemap.void[i].y1+gamemap.y+gamemap.yoffset
		local x2 = gamemap.void[i].x2+gamemap.x+gamemap.xoffset
		local y2 = gamemap.void[i].y2+gamemap.y+gamemap.yoffset
		love.graphics.line(x1,y1,x2,y2)
		love.graphics.rectangle("line", x1, y1, x2-x1, y2-y1)
	end

	for i = 1, #gamemap.wall do
                for j = 1, #gamemap.wall[i] do
                        --love.graphics.print(tostring(gamemap.wall[i][j].x1), j * 50, i * 10)
			local xx1 = gamemap.wall[i][j].x1+gamemap.x+gamemap.xoffset
			local yy1 = gamemap.wall[i][j].y1+gamemap.y+gamemap.yoffset
			local xx2 = gamemap.wall[i][j].x2+gamemap.x+gamemap.xoffset
			local yy2 = gamemap.wall[i][j].y2+gamemap.y+gamemap.yoffset
			love.graphics.line(xx1,yy1,xx2,yy2)
			love.graphics.rectangle("line", xx1, yy1, xx2-xx1, yy2-yy1)
                end
        end
end
