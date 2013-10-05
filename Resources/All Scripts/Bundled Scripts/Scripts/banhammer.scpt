-- Portions of this AppleScript may incorporate work from 3rd 
-- parties. These portions of code are noted. All other work is 
-- Copyright © 2010 — 2013 Codeux Software. See README 
-- for full license information. 

on irccmd(user, destinationChannel)
	if destinationChannel is equal to "" then
		return "/debug Invalid destination channel."
	end if
	
	set user to trim(user)
	
	if user is equal to "" then
		return "/sme " & destinationChannel & " is getting out the ban hammer! ▬▬▬▬▬▬▬▋ Ò╭╮Ó"
	else
		return "You better run " & user & "!
/sme " & destinationChannel & " is getting out the ban hammer! ▬▬▬▬▬▬▬▋ Ò╭╮Ó"
	end if
	
end irccmd

-- trim() AppleScript function from:
-- <http://macscripter.net/viewtopic.php?id=18519>
on trim(someText)
	repeat until someText does not start with " "
		set someText to text 2 thru -1 of someText
	end repeat
	
	repeat until someText does not end with " "
		set someText to text 1 thru -2 of someText
	end repeat
	
	return someText
end trim
