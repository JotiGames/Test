function onSongStart()
	doTweenZoom('firstFunnyZoom', 'camGame', 0.9, 0.01)
	setProperty('defaultCamZoom', 0.9)
end

function onCreate()
	addCharacterToList('sketh', 1)
	precacheImage('Sketh_Hill')
end

local backgroundVars = {'sky', 'grnd', 'river', 'trees', 'backgrass', 'scngrass', 'fall', 'front'}
function onBeatHit()
	if curBeat == 1 then
		doTweenZoom('secondFunnyZoom', 'camGame', 1.2, 0.01)
		setProperty('defaultCamZoom', 1.2)
	end
	if curBeat == 2 then
		setProperty('defaultCamZoom', 0.6)
		doTweenZoom('secondFunnyZoom', 'camGame', 0.7, 0.7)
	end
	if curBeat == 132 then
		for i = 1, #backgroundVars do
			setProperty(backgroundVars[i]..'.visible', false)
		end
		
		makeLuaSprite('sketh', 'Sketh_Hill', -650, -400)
		addLuaSprite('sketh')
		triggerEvent('Change Character', 'dad', 'sketh')
	end
	if curBeat == 196 then
		for i = 1, #backgroundVars do
			setProperty(backgroundVars[i]..'.visible', true)
		end
		removeLuaSprite('sketh', true)
		
		triggerEvent('Change Character', 'dad', 'sonic')
	end
end