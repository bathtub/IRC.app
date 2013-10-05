-- Portions of this AppleScript may incorporate work from 3rd 
-- parties. These portions of code are noted. All other work is 
-- Copyright © 2010 — 2013 Codeux Software. See README 
-- for full license information. 

on irccmd(inputData, destinationChannel)
	if destinationChannel is equal to "" then
		return "/debug Invalid destination channel."
	end if
	
	return reverse of characters of inputData as text
end irccmd
