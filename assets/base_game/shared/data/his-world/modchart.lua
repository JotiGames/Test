local color = 'd4d4d4'
function onCreatePost()
	setProperty('boyfriend.color', getColorFromHex(color))
	setProperty('dad.color', getColorFromHex(color))
	setProperty('gf.color', getColorFromHex(color))
end