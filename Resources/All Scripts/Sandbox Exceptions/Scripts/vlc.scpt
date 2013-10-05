-- Copyright © 2013 Alex Sørlie Glomsaas

on irccmd(inputData, destinationChannel)
	if destinationChannel is equal to "" then
		return "/debug Invalid destination channel."
	end if
	
	tell application "System Events"
		tell application "System Events" to set is_running to exists (processes where name is "VLC")
	end tell
	
	if is_running then
		tell application "VLC"
			if playing then
				set vName to name of current item as string
				
				return "/sme " & destinationChannel & " is watching \"" & noExt(vName) of me & "\" in VLC"
			else
				return "/sme " & destinationChannel & " is not watching anything in VLC."
			end if
		end tell
	else
		return "/echo You are not running VLC."
	end if
end irccmd

on noExt(filename)
	if filename contains "." then
		set filename to ¬
			(the reverse of every character of filename) as string
		
		set x to the offset of "." in filename
		
		set filename to (characters (x + 1) thru -1 of filename) as string
		set filename to (the reverse of every character of filename) as string
	end if
	
	return filename
end noExt

