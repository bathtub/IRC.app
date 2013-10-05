-- Portions of this AppleScript may incorporate work from 3rd 
-- parties. These portions of code are noted. All other work is 
-- Copyright © 2010 — 2013 Codeux Software. See README 
-- for full license information. 

on irccmd(inputData, destinationChannel)
	if destinationChannel is equal to "" then
		return "/debug Invalid destination channel."
	end if
	
	set allApps to "/sme " & destinationChannel & " is currently running: "
	
	tell application "System Events"
		set appList to (every process where background only is false)
		set appCount to count (appList)
	end tell
	
	repeat with p from 1 to appCount
		if p is not 1 then
			set allApps to allApps & ", " & (name of item p of appList)
		else
			set allApps to allApps & (name of item p of appList)
		end if
	end repeat
	
	set allApps to allApps & " — (" & appCount & " Total)"
	
	return allApps
end irccmd

