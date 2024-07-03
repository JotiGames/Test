local color = 'd4d4d4'
local backgroundVars = {'sky', 'grnd', 'river', 'trees', 'backgrass', 'scngrass', 'fall', 'front', 'thng'}
local chartingMode = false
function onCreatePost()
	chartingMode = getPropertyFromClass('states.PlayState', 'chartingMode')
	if not chartingMode then
		setProperty('boyfriend.color', getColorFromHex('000000'))
		setProperty('dad.color', getColorFromHex('000000'))
		setProperty('gf.color', getColorFromHex('000000'))
		for i = 1, #backgroundVars do
			setProperty(backgroundVars[i]..'.alpha', 0.0001)
		end
		makeLuaSprite('whitevoid', 'ХРОМАСЕН ПИДОРАС', 0, 0)
		makeGraphic('whitevoid', 4096, 2048, 'ffffff')
		setScrollFactor('whitevoid', 0, 0)
		screenCenter('whitevoid', 'xy')
		setProperty('whitevoid.alpha', 0)
		addLuaSprite('whitevoid')
		setProperty('camHUD.alpha', 0)
	end
end

function onCreate()
	stupidPrecache()
end

function onSongStart()
	if not chartingMode then
		doTweenAlpha('whitevoidALPHA1БЛЯТЬ!!', 'whitevoid', 1, (crochet/250)*16)
	elseif chartingMode then
		debugPrint('To enable some song events, disable charting mode and restart the song')
	end
	for i = 1,6 do
		removeLuaSprite('line'..i)
		removeLuaSprite('line'..i..'s')
	end
end

function onUpdate(el)
	if getProperty('line1.animation.curAnim.name') == 'idle' and getProperty('line1.animation.curAnim.finished') and curBeat > 16 then
		for i = 1,6 do
			removeLuaSprite('line'..i)
		end
		fromGenesisIdles()
	end
end

function onBeatHit()
	if curBeat == 64 then
		doTweenAlpha('camhudVISIBLEБЛЯТЬ!', 'camHUD', 1, 0.8)
	end
	if curBeat == 128 then
		removeLuaSprite('whitevoid', true)
		for i = 1, #backgroundVars do
			setProperty(backgroundVars[i]..'.alpha', 1)
		end
		setProperty('boyfriend.color', getColorFromHex(color))
		setProperty('dad.color', getColorFromHex(color))
		setProperty('gf.color', getColorFromHex(color))
	end
	if curBeat == 472 then
		fromGenesisIntros()
	end
	if curBeat == 672 then
		for i = 1,6 do
			removeLuaSprite('line'..i..'s', true)
		end
		fromGenesisIntros()
		for i = 1,6 do
			playAnim('line'..i, 'idle', true, true)
		end
		runTimer('NOW!', 0.32)
	end
	if curBeat % 2 == 0 then
		for i = 1,6 do
			playAnim('line'..i..'s', 'idle', true)
		end
	end
end

function stupidPrecache()
	fromGenesisIntros()
	for i = 1,6 do
		setProperty('line'..i..'.alpha', 0.0001)
	end
	fromGenesisIdles()
	for i = 1,6 do
		setProperty('line'..i..'s.alpha', 0.0001)
	end
	
end

function fromGenesisIntros()
	makeAnimatedLuaSprite('line6', 'hisworld/Line6-Intro_Outtro', 440, -310)
	addAnimationByPrefix('line6', 'idle', '6열_Intro Outtro', 24, false)
	setObjectOrder('line6', getObjectOrder('backgrass'))
	addLuaSprite('line6')
	
	makeAnimatedLuaSprite('line5', 'hisworld/Line5-Intro_Outtro', -10, -200)
	addAnimationByPrefix('line5', 'idle', '5열_Intro Outtro', 24, false)
	addLuaSprite('line5')
	
	makeAnimatedLuaSprite('line4', 'hisworld/Line4-Intro_Outtro', 180, 180)
	addAnimationByPrefix('line4', 'idle', '4열_Intro Outtro', 24, false)
	setScrollFactor('line4', 0.95, 0.95)
	setObjectOrder('line4', getObjectOrder('gfGroup'))
	scaleObject('line4', 0.9, 0.9)
	addLuaSprite('line4')
	
	makeAnimatedLuaSprite('line3', 'hisworld/Line3-Intro_Outtro', -680, -120)
	addAnimationByPrefix('line3', 'idle', '3열_Intro Outtro', 24, false)
	addLuaSprite('line3')
	
	makeAnimatedLuaSprite('line2', 'hisworld/Line2-Intro_Outtro', -410, 540)
	addAnimationByPrefix('line2', 'idle', '2열_Intro Outtro', 24, false)
	setObjectOrder('line2', getObjectOrder('dadGroup'))
	addLuaSprite('line2', true)
	
	makeAnimatedLuaSprite('line1', 'hisworld/Line1-Intro_Outtro', -900, 70)
	addAnimationByPrefix('line1', 'idle', '1열_Intro Outtro', 24, false)
	setScrollFactor('line1', 1.5, 1.2)
	setObjectOrder('line1', getObjectOrder('front') + 1)
	addLuaSprite('line1', true)
end

function fromGenesisIdles()
	makeAnimatedLuaSprite('line6s', 'hisworld/Line6-Idle', 440, -310)
	addAnimationByPrefix('line6s', 'idle', '6열_Idle', 24, false)
	setScrollFactor('line6s', 1, 1)
	setObjectOrder('line6s', getObjectOrder('backgrass'))
	addLuaSprite('line6s')
	
	makeAnimatedLuaSprite('line5s', 'hisworld/Line5-Idle', -10, -200)
	addAnimationByPrefix('line5s', 'idle', '5열_Idle', 24, false)
	setScrollFactor('line5s', 1, 1)
	addLuaSprite('line5s')
	
	makeAnimatedLuaSprite('line4s', 'hisworld/Line4-Idle', 180, 180)
	addAnimationByPrefix('line4s', 'idle', '4열_Idle', 24, false)
	setScrollFactor('line4s', 0.95, 0.95)
	scaleObject('line4s', 0.9, 0.9)
	setObjectOrder('line4s', getObjectOrder('gfGroup'))
	addLuaSprite('line4s')
	
	makeAnimatedLuaSprite('line3s', 'hisworld/Line3-Idle', -680, -120)
	addAnimationByPrefix('line3s', 'idle', '3열_Idle', 24, false)
	setScrollFactor('line3s', 1, 1)
	addLuaSprite('line3s')
	
	makeAnimatedLuaSprite('line2s', 'hisworld/Line2-Idle', -410, 540)
	addAnimationByPrefix('line2s', 'idle', '2열_Idle', 24, false)
	setScrollFactor('line2s', 1, 1)
	setObjectOrder('line2s', getObjectOrder('dadGroup'))
	addLuaSprite('line2s', true)
	
	makeAnimatedLuaSprite('line1s', 'hisworld/Line1-Idle', -900, 70)
	addAnimationByPrefix('line1s', 'idle', '1열_Idle', 24, false)
	setScrollFactor('line1s', 1.5, 1.2)
	setObjectOrder('line1s', getObjectOrder('front') + 1)
	addLuaSprite('line1s', true)
end

function onTimerCompleted(tag)
	if tag == 'NOW!' then
		for i = 1,6 do
			removeLuaSprite('line'..i, true)
		end
	end
end