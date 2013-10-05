-- Copyright © 2013 Marco Lugo
-- Modifications by Joachim LeBlanc

on irccmd(inputData, destinationChannel)
	if destinationChannel is equal to "" then
		return "/debug Invalid destination channel."
	end if
	
	try
		tell application "Finder" to get application file id "com.catpigstudios.Radium3"
	on error
		return "/debug Radium is not installed"
	end try
	
	tell application "System Events"
		tell application "System Events" to set isRunning to exists (processes where name is "Radium")
	end tell
	
	set FBold to (ASCII character 2)
	if (cmd = "help") then
		return ("/echo " & FBold & "Usage:" & FBold & " /radium [play|pause|stop|help] If run without arguments, it'll show the currently playing track and station")
	end if
	
	if not isRunning then
		return "/debug Radium is not running"
	end if
	
	if (cmd = "stop") then
		return cmd_stop()
	else if (cmd = "play") then
		return cmd_play()
	else if (cmd = "pause") then
		return cmd_pause()
	else
		return cmd_default()
	end if
	
end irccmd

on cmd_default()
	tell application "Radium.app"
		if «class ispl» then
			set rstation to «class stat» as string
			set rtrack to «class trac» as string
			return "/sme " & destinationChannel & " is listening to " & rtrack & " on station " & rstation & " with Radium"
		else
			return "/sme " & destinationChannel & " is not listening anything in Radium."
		end if
	end tell
end cmd_default

on cmd_stop()
	tell application "Radium.app"
		if «class ispl» then
			«event rappstop»
			return "/echo Radium stop."
		end if
	end tell
end cmd_stop

on cmd_play()
	tell application "Radium.app"
		«event rappplay»
		return "/echo Radium play."
	end tell
end cmd_play

on cmd_pause()
	tell application "Radium.app"
		if «class ispl» then
			«event rapppaus»
			return "/echo Radium pause."
		end if
	end tell
end cmd_pause

return irccmd("")
