-- Portions of this AppleScript may incorporate work from 3rd 
-- parties. These portions of code are noted. All other work is 
-- Copyright © 2010 — 2013 Codeux Software. See README 
-- for full license information. 

on irccmd(cmd, destinationChannel)
	if destinationChannel is equal to "" then
		return "/debug Invalid destination channel."
	end if
	
	set scriptResult to replaceText("
", " ", (do shell script cmd))
	set scriptPrefix to characters 1 thru 1 of scriptResult as string
	
	if scriptPrefix is equal to "/" then
		set scriptResult to "/" & scriptResult
	end if
	
	return scriptResult
end irccmd

-- replaceText() AppleScript function from:
-- http://foolsworkshop.com/applescript/2008/05/an-applescript-replace-text-method/
on replaceText(find, replace, subject)
	set prevTIDs to text item delimiters of AppleScript
	set text item delimiters of AppleScript to find
	set subject to text items of subject
	
	set text item delimiters of AppleScript to replace
	set subject to "" & subject
	set text item delimiters of AppleScript to prevTIDs
	
	return subject
end replaceText

