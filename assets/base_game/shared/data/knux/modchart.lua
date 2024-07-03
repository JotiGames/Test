local color = '8f96c4'
function onCreatePost()
	setProperty('boyfriend.color', getColorFromHex(color))
	setProperty('dad.color', getColorFromHex(color))
	setProperty('gf.color', getColorFromHex(color))
	makeAnimatedLuaSprite('kn-cuts', 'Knuckles_Cutscene', getProperty('dad.x') - 40, getProperty('dad.y') - 50)
	setProperty('kn-cuts.color', getColorFromHex(color))
	setProperty('kn-cuts.alpha', 0.0001)
	addLuaSprite('kn-cuts')
end

function onEvent(n, v1, v2)
	if n == 'Change Character' then
		setProperty('boyfriend.color', getColorFromHex(color))
		setProperty('dad.color', getColorFromHex(color))
		setProperty('gf.color', getColorFromHex(color))
		if v2 == 'knuckles-angry' then
			setProperty('dad.visible', false)
		end
	end
end

function onStepHit()
	if curStep == 640 then
		doTweenAlpha('HideHud.', 'camHUD', 0, 0.5)
	end
	if curStep == 646 then
		setProperty('dad.visible', false)
		setProperty('kn-cuts.alpha', 1)
		addAnimationByPrefix('kn-cuts', 'lol', 'Surprised Knux', 24, false)
		playAnim('kn-cuts', 'lol')
	end
	if curStep == 654 then
		doTweenAlpha('ShowHud.', 'camHUD', 1, 0.2)
	end
	if curStep == 656 then
		setProperty('dad.visible', true)
		removeLuaSprite('kn-cuts', true)
	end
end