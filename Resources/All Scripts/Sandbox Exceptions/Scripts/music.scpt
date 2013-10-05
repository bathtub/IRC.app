-- Copyright © 2011 Alex Sørlie 

on irccmd(inputData, destinationChannel)
	if destinationChannel is equal to "" then
		return "/debug Invalid destination channel."
	end if
	
	set listening to "/sme " & destinationChannel & " is not currently running iTunes"
	
	tell application "System Events"
		tell application "System Events" to set is_running to exists (processes where name is "iTunes")
	end tell
	
	if is_running then
		tell application "iTunes"
			set footer to " KB in size"
			
			set musicCount to (count of tracks of playlist "Music")
			
			set musicSize to (size of playlist "Music")
			set musicSize to (musicSize / 1024)
			set musicSize to (round (musicSize * 100)) / 100
			
			if musicSize > 1024 then
				set musicSize to (musicSize / 1024)
				set musicSize to (round (musicSize * 100)) / 100
				set footer to " MB in size "
			end if
			
			if musicSize > 1024 then
				set musicSize to (musicSize / 1024)
				set musicSize to (round (musicSize * 100)) / 100
				set footer to " GB in size"
			end if
			
			if musicSize > 1024 then
				set musicSize to (musicSize / 1024)
				set musicSize to (round (musicSize * 100)) / 100
				set footer to " TB in size"
			end if
			
			return "I have " & musicCount & " songs (" & musicSize & footer & ") in my iTunes library. "
		end tell
	end if
end irccmd

