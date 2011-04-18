sounds = {}

function sounds.load ()
	sounds.fade = {soundOut = nil, soundIn = nil, start = 0, length = 0}
	sounds.fade.fromNow =
	function (fadeOut, fadeIn, len)
		sounds.fade.soundOut = fadeOut
		sounds.fade.soundIn = fadeIn
		sounds.fade.start = love.timer.getTime ()
		sounds.fade.length = len
		if sounds.fade.soundOut ~= nil then love.audio.play (sounds.fade.soundOut) end
		if sounds.fade.soundIn ~= nil then love.audio.play (sounds.fade.soundIn) end
	end
	viduramziai1 = love.audio.newSource ("sounds/viduramziai_1.ogg")
	pradzia = love.audio.newSource ("sounds/viduramziai_2_1.ogg")
	ciklas = love.audio.newSource ("sounds/viduramziai_2_2.ogg")
	ciklas:setLooping (true)
	sounds.current = pradzia
	sounds.next = ciklas
	love.audio.play (sounds.current)
end

function sounds.update (dt)
	if sounds.fade.length ~= 0 then
		local phase = (love.timer.getTime () - sounds.fade.start) / sounds.fade.length
		if phase > 1 then
			if sounds.fade.soundOut ~= nil then love.audio.stop (sounds.fade.soundOut) end
			if sounds.fade.soundIn ~= nil then sounds.fade.soundIn:setVolume (1) end
			sounds.fade.length = 0
		else
			if sounds.fade.soundOut ~= nil then sounds.fade.soundIn:setVolume (1 - phase) end
			if sounds.fade.soundIn ~= nil then sounds.fade.soundIn:setVolume (phase) end
		end
	end
	if sounds.current ~= nil and sounds.next ~= nil then
		if sounds.current:isStopped () then
			love.audio.play (sounds.next)
			sounds.current = sounds.next
			sounds.next = nil
		end
	end
	
end