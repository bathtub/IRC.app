-- Copyright © 2011 Alex Sørlie 

on irccmd(inputData, destinationChannel)
	if destinationChannel is equal to "" then
		return "/debug Invalid destination channel."
	end if
	
	if isRunning("Google Chrome") then
		tell application "Chrome"
			set siteurl to URL of active tab of first window
			set sitetitle to title of active tab of first window
			
			if siteurl is not equal to "" and sitetitle is not equal to "" then
				return "/sme " & destinationChannel & " is browsing: " & sitetitle & " <" & siteurl & ">"
			end if
		end tell
	end if
	
	if isRunning("Chromium") then
		tell application "Chromium"
			set siteurl to URL of active tab of first window
			set sitetitle to title of active tab of first window
			
			if siteurl is not equal to "" and sitetitle is not equal to "" then
				return "/sme " & destinationChannel & " is browsing: " & sitetitle & " <" & siteurl & ">"
			end if
		end tell
	end if
	
	if isRunning("Opera") then
		tell application "Opera"
			set siteurl to URL of front document as string
			set sitetitle to name of front document as string
			
			if siteurl is not equal to "" and sitetitle is not equal to "" then
				return "/sme " & destinationChannel & " is browsing: " & sitetitle & " <" & siteurl & ">"
			end if
		end tell
	end if
	
	if isRunning("Safari") then
		tell application "Safari"
			set siteurl to URL of document 1
			set sitetitle to name of document 1
			
			if siteurl is not equal to "" and sitetitle is not equal to "" then
				return "/sme " & destinationChannel & " is browsing: " & sitetitle & " <" & siteurl & ">"
			end if
		end tell
	end if
	
	return "/debug No browser with AppleScript support found."
end irccmd

-- isRunning() AppleScript function from:
-- <http://pastie.org/170796.txt>
on isRunning(appName)
	tell application "System Events"
		set isAppRunning to (name of processes) contains appName
		
		return isAppRunning
	end tell
end isRunning

