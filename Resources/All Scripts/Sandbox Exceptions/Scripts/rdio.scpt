-- Copyright © 2013 Alex Sørlie Glomsaas

on irccmd(inputData, destinationChannel)
	if destinationChannel is equal to "" then
		return "/debug Invalid destination channel."
	end if
	
	set listening to "/echo You are not running Rdio."
	
	tell application "System Events"
		tell application "System Events" to set is_running to exists (processes where name is "Rdio")
	end tell
	
	if is_running then
		tell application "Rdio.app"
			set iname to name of the «class pTrk» as string
			set iartist to «class pArt» of «class pTrk» as string
			set ialbum to «class pAlb» of «class pTrk» as string
			
			return "/sme " & destinationChannel & " is listening to " & iartist & " - " & iname & ", from the album " & ialbum & " on Rdio"
		end tell
	end if
	
	return listening
end irccmd

