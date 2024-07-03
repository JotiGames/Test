local rayNotes = {'FFBA40', 'FFFFFF', '974F22'}
local mightyNotes = {'E11837', 'FFFFFF', '2E2020'}

function onSpawnNote(i, nd, nt, sus)
	if not getPropertyFromGroup('notes', i, 'mustPress') then
		if nt == 'GF Sing' then
			setPropertyFromGroup('notes', i, 'rgbShader.r', getColorFromHex(rayNotes[1]))
			setPropertyFromGroup('notes', i, 'rgbShader.g', getColorFromHex(rayNotes[2]))
			setPropertyFromGroup('notes', i, 'rgbShader.b', getColorFromHex(rayNotes[3]))
		end
		if nt == '' then
			setPropertyFromGroup('notes', i, 'rgbShader.r', getColorFromHex(mightyNotes[1]))
			setPropertyFromGroup('notes', i, 'rgbShader.g', getColorFromHex(mightyNotes[2]))
			setPropertyFromGroup('notes', i, 'rgbShader.b', getColorFromHex(mightyNotes[3]))
		end
	end
end