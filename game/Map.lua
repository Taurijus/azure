gamemap = {}
walls = {}

function gamemap.load()
	gamemap['void'] = {}
	gamemap.void[1] = {x = 0, y = 0, w = 158, h = 208}
	gamemap.void[2] = {x = 159, y = 0, w = 468, h = 76}
	gamemap.void[3] = {x = 666, y = 42, w = 167, h = 41}
	gamemap.void[4] = {x = 874, y = 42, w = 84, h = 41}
	gamemap.void[5] = {x = 750, y = 82, w = 83, h = 84}
	gamemap.void[6] = {x = 833, y = 124, w = 124, h = 42}
	gamemap.void[7] = {x = 915, y = 166, w = 42, h = 125}
	gamemap.void[8] = {x = 750, y = 208, w = 125, h = 82}
	gamemap.void[9] = {x = 750, y = 332, w = 125, h = 83}
	gamemap.void[10] = {x = 916, y = 332, w = 84, h = 249}
	gamemap.void[11] = {x = 750, y = 457, w = 166, h = 375}
	gamemap.void[12] = {x = 583, y = 675, w = 167, h = 157}
	gamemap.void[13] = {x = 417, y = 790, w = 166, h = 42}
	gamemap.void[14] = {x = 417, y = 749, w = 42, h = 83}
	gamemap.void[15] = {x = 500, y = 667, w = 42, h = 80}
	gamemap.void[16] = {x = 292, y = 667, w = 82, h = 123}
	gamemap.void[17] = {x = 42, y = 667, w = 83, h = 123}
	gamemap.void[18] = {x = 125, y = 667, w = 416, h = 41}
	gamemap.void[19] = {x = 125, y = 249, w = 35, h = 459}
	gamemap.void[20] = {x = 42, y = 249, w = 82, h = 83}
	gamemap.void[21] = {x = 0, y = 541, w = 82, h = 82}

end

function gamemap.update()

end

function gamemap.draw()
	--[[ just for checking values
	for i = 1, #gamemap.void do
		love.graphics.print(tostring(gamemap.void[i].x), 0, i * 10)
	end
	]]

end
