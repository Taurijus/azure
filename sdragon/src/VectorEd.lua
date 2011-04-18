VectorEd = {}

function sqrl (x, y)
	return x * x + y * y
end

function VectorEd.load ()
	VectorEd.active = false
	VectorEd.lineTable = {}
	VectorEd.state = 0
	VectorEd.drag = 0
	VectorEd.front = true
	VectorEd.buffX = 0
	VectorEd.buffY = 0
	VectorEd.origX = 0
	VectorEd.origY = 0
end

function VectorEd.update (dt)
	if active then
		local xx, yy = love.mouse.getPosition ()
		xx = xx + PlayerI.x - scrWidth/2
		yy = yy + PlayerI.y - scrHeight/2
		
		if love.mouse.isDown ("l") then
			if VectorEd.state == 0 then --nothing
				local closest = 0
				local minimum = 25
				local lenght = 0
				local ff
				for i , line in ipairs (VectorEd.lineTable) do
					lenght = sqrl (xx - line.x1, yy - line.y1)
					if lenght < minimum then
						minimum = lenght
						closest = i
						ff = true
					end
					lenght = sqrl (xx - line.x2, yy - line.y2)
					if lenght < minimum then
						minimum = lenght
						closest = i
						ff = false
					end
				end
				if closest ~= 0 then
					VectorEd.state = 1
					VectorEd.drag = closest
					VectorEd.front = ff
					VectorEd.buffX = xx
					VectorEd.buffY = yy
					if VectorEd.front then
						VectorEd.origX = VectorEd.lineTable[VectorEd.drag].x1
						VectorEd.origY = VectorEd.lineTable[VectorEd.drag].y1
					else
						VectorEd.origX = VectorEd.lineTable[VectorEd.drag].x2
						VectorEd.origY = VectorEd.lineTable[VectorEd.drag].y2
					end
				else
					VectorEd.state = 2
					VectorEd.buffX = xx
					VectorEd.buffY = yy
				end
			elseif VectorEd.state == 1 then --dragging
				if VectorEd.front then
					VectorEd.lineTable[VectorEd.drag].x1 = VectorEd.origX - VectorEd.buffX + xx
					VectorEd.lineTable[VectorEd.drag].y1 = VectorEd.origY - VectorEd.buffY + yy
				else
					VectorEd.lineTable[VectorEd.drag].x2 = VectorEd.origX - VectorEd.buffX + xx
					VectorEd.lineTable[VectorEd.drag].y2 = VectorEd.origY - VectorEd.buffY + yy
				end
				buffX = xx
				buffY = yy
			elseif VectorEd.state == 2 then --creating
				
			end
		else
			if VectorEd.state == 1 then
				VectorEd.state = 0
				if VectorEd.front then
					VectorEd.lineTable[VectorEd.drag].x1 = VectorEd.origX - VectorEd.buffX + xx
					VectorEd.lineTable[VectorEd.drag].y1 = VectorEd.origY - VectorEd.buffY + yy
				else
					VectorEd.lineTable[VectorEd.drag].x2 = VectorEd.origX - VectorEd.buffX + xx
					VectorEd.lineTable[VectorEd.drag].y2 = VectorEd.origY - VectorEd.buffY + yy
				end
				buffX = xx
				buffY = yy
			elseif VectorEd.state == 2 then
				VectorEd.state = 0
				VectorEd.add (VectorEd.buffX, VectorEd.buffY, xx, yy)
			end
		end
		if love.keyboard.isDown("f10") then
			VectorEd.finalize ()
		end
		if love.keyboard.isDown("f9") then
			VectorEd.active = false
		end
	elseif love.keyboard.isDown("f9") then
		VectorEd.active = true
	end
end

function VectorEd.add (a, b, c, d)
	table.insert (VectorEd.lineTable, {x1 = a, y1 = b, x2 = c, y2 = d})
end

function VectorEd.draw ()
	love.graphics.setLineWidth (3)
	for i , line in ipairs (VectorEd.lineTable) do
		love.graphics.line (line.x1, line.y1, line.x2, line.y2)
	end
	
	if VectorEd.state == 2 then --creating
		local xx, yy = love.mouse.getPosition ()
		xx = xx + PlayerI.x - scrWidth/2
		yy = yy + PlayerI.y - scrHeight/2
		love.graphics.line (VectorEd.buffX, VectorEd.buffY, xx, yy)
		love.graphics.setLineWidth (1)
	end
	love.graphics.setLineWidth (1)
end

function VectorEd.finalize ()
	local file = love.filesystem.newFile ("vectors.txt")
	file:open ('w')
	file:write ("mapping['wall'] = {}\n")
	for i , line in ipairs (VectorEd.lineTable) do
	file:write ("mapping.wall["..i.."] = {x1 = "..round(line.x1)..", y1 = "..line.y1..", x2 = "..line.x2..", y2 = "..line.y2.."}\n")
	end
	file:close ()
end