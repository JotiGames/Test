-- Thats regural gf, but she's not singing on "GF Notes"
function onCreate()
	makeAnimatedLuaSprite('fakeGF', 'characters/GF_assets', 240, 70)
	addAnimationByIndices('fakeGF', 'danceLeft', 'GF Dancing Beat', '30,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14')
	addAnimationByIndices('fakeGF', 'danceRight', 'GF Dancing Beat', '15,16,17,18,19,20,21,22,23,24,25,26,27,28,29')
	addAnimationByPrefix('fakeGF', 'sad', 'gf sad')
	addAnimationByPrefix('fakeGF', 'cheer', 'GF Cheer')
	setScrollFactor('fakeGF', 0.95, 0.95)
    playAnim('fakeGF', 'danceRight', false);
	addLuaSprite('fakeGF')
end

function onCountdownTick(step)
    if step == 0 or step == 2 or step == 4 then
        playAnim('fakeGF', 'danceLeft', false);
    elseif step == 1 or step == 3 then
       playAnim('fakeGF', 'danceRight', false);
    end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		playAnim('fakeGF', 'danceLeft', false);
	elseif (curBeat + 1) % 2 == 0 then
		playAnim('fakeGF', 'danceRight', false);
	end
end