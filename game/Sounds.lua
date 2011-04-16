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
	narrowEscape = love.audio.newSource ("sounds/viduramziai_2_1.ogg")
	sounds.fade.fromNow (narrowEscape, viduramziai1, 100)
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
end