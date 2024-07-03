local color = '7b9ec9'
function onCreatePost()
	setProperty('camHUD.alpha', 0)
	triggerEvent('Camera Follow Pos', -100, 100)
	setProperty('boyfriend.origin.x', 150)
	setProperty('boyfriend.origin.y', 20)
	setProperty('boyfriend.color', getColorFromHex(color))
	setProperty('dad.color', getColorFromHex(color))
	setProperty('gf.color', getColorFromHex(color))
end

function onSongStart()
	doTweenX('tailsTweenX', 'dad', -400, 4, 'backInOut')
	doTweenY('tailsTweenY', 'dad', -500, 5.6, 'cubeInOut')
	doTweenAngle('bfTweenAngle', 'boyfriend', 10, 2.4, 'sineInOut')
end

local doFollow = false
function onBeatHit()
	if curBeat == 10 then
		doFollow = true
	end
	if curBeat == 30 then
		doTweenAlpha('HideHud.', 'camHUD', 1, 0.4)
	end
	if curBeat == 360 then
		doFollow = false
		setProperty('dad.acceleration.x', 120)
		doTweenAlpha('HideHud.', 'camHUD', 0, 2)
		setProperty('cameraSpeed', 0.1)
	end
	if curBeat == 362 then
		triggerEvent('Camera Follow Pos', 900, -1400)
		doTweenZoom('CameraFocusTween', 'camGame', 1, (crochet/250)*8)
		setProperty('defaultCamZoom', 1)
	end
	if curBeat == 392 then
		doTweenAlpha('taeAlphatwn', 'tae', 1, 0.1)
		playAnim('tae', 'bruh')
	end
end

function onTweenCompleted(t)
	if t == 'tailsTweenY' or t == 'tailsSongTweenYSecond' then
		doTweenY('tailsSongTweenY', 'dad', -380, 3, 'cubeInOut')
	end
	if t == 'tailsSongTweenY' then
		doTweenY('tailsSongTweenYSecond', 'dad', -500, 3, 'cubeInOut')
	end
	if t == 'tailsTweenX' then
		setProperty('dad.velocity.x', 30)
	end
	if t == 'bfTweenAngle' then
		doTweenAngle('bfTweenAngleSecond', 'boyfriend', 0, 3, 'sineInOut')
	end
	if t == 'bfTweenAngleSecond' then
		doTweenAngle('bfTweenAngle', 'boyfriend', 10, 3, 'sineInOut')
	end
end

function onUpdate(el)
	if doFollow then
		triggerEvent('Camera Follow Pos', getProperty('dad.x') + 400, getProperty('dad.y') + 520)
	end
	setProperty('boyfriend.x', getProperty('dad.x') + 90)
	setProperty('boyfriend.y', getProperty('dad.y') + 430)
end