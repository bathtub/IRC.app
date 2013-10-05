-- Portions of this AppleScript may incorporate work from 3rd 
-- parties. These portions of code are noted. All other work is 
-- Copyright © 2010 — 2013 Codeux Software. See README 
-- for full license information. 

on irccmd(inputData, destinationChannel)
	if destinationChannel is equal to "" then
		return "/debug Invalid destination channel."
	end if
	
	return flip_text(inputData)
end irccmd

-- flip_text() AppleScript based on work from:
-- <http://macscripter.net/viewtopic.php?id=32232>
on flip_text(this_text)
	-- set this_text to reverse of characters of this_text as text
	
	set the new_text to ""
	set the comparison_string to "abcdefghijklmnopqrstuvwxyz)([]{}!.!?\",&$"
	set the source_string to "ɐqɔpǝɟƃɥıɾʞʃɯuodbɹsʇnʌʍxʎz()][}{¡˙¿„'⅋$"
	
	repeat with this_char in this_text
		set x to the offset of this_char in the comparison_string
		
		if x is not 0 then
			set the new_text to (character x of the source_string & the new_text) as string
		else
			set the new_text to (this_char & the new_text) as string
		end if
	end repeat
	
	return the new_text
end flip_text

