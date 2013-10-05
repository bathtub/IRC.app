-- Copyright © 2011 Alex Sørlie 

on irccmd(inputData, destinationChannel)
	if destinationChannel is equal to "" then
		return "/debug Invalid destination channel."
	end if
	
	set listening to "/sme " & destinationChannel & " is not running iTunes."
	
	tell application "System Events"
		tell application "System Events" to set isRunning to exists (processes where name is "iTunes")
	end tell
	
	if isRunning then
		tell application "iTunes"
			if player state is playing then
				set resultString to "/sme " & destinationChannel & " is listening to "
				
				if current stream title is not missing value then
					-- The current item is being streamed. Not stored locally. 
					-- This will parse the title of the event being streamed
					-- by dividing along the slash ("-")
					
					if current stream title does not contain " - " then
						return "/debug Unsupported media is playing."
					end if
					
					set {art, nom} to my text_to_list(current stream title, " - ")
					
					set resultString to (resultString & (name of current track) & " streaming \"")
					set resultString to (resultString & art & " - " & nom & "\"")
				else
					-- We are not streaming the current track so we have
					-- to figure out if it is a movie or a song/podcast
					-- then handle it appropriately. 
					
					set trackKind to kind of current track
					
					set supportedPlaylistNames to {"Music", "Movies", "TV Shows", "Podcasts", "iTunes U"}
					
					set moviePlaylistNames to {"Movies", "TV Shows", "Podcasts", "iTunes U"}
					set movieFileTypes to {"MP4", "Movie", "WAV"}
					
					set playlistName to name of current playlist
					
					-- if playlistName is not in supportedPlaylistNames then
					--	return "/debug Unsupported media is playing."
					-- end if
					
					set trackArtist to artist of current track
					set trackName to name of current track
					set trackAlbum to album of current track
					set trackLength to time of current track
					set trackSize to size of current track
					set trackPlayCount to played count of current track
					
					set isWatchingMovie to no
					
					if trackKind contains "MPEG-3 audio file" then set relativeFileType to "MP3"
					if trackKind contains "MPEG-4 video file" then set relativeFileType to "MP4"
					if trackKind contains "QuickTime movie file" then set relativeFileType to "Movie"
					if trackKind contains "AAC" then set relativeFileType to "AAC"
					if trackKind contains "WAV" then set relativeFileType to "WAV"
					if trackKind contains "Apple Lossless" then set relativeFileType to "Apple Lossless"
					
					if playlistName is in moviePlaylistNames and relativeFileType is in movieFileTypes then
						set isWatchingMovie to yes
					end if
					
					if trackAlbum is not "" then
						set hasTrackAlbum to yes
					else
						set hasTrackAlbum to no
					end if
					
					if isWatchingMovie is equal to yes then
						set resultString to "/sme " & destinationChannel & " is watching "
					end if
					
					if trackArtist is not "" then
						set resultString to (resultString & trackArtist & " — ")
					end if
					
					if trackName is "" then
						return "/debug Failed to locate title of current track."
					else
						if hasTrackAlbum is yes then
							set resultString to (resultString & trackName)
						else
							set resultString to (resultString & trackName & " ")
						end if
					end if
					
					if trackAlbum is not "" then
						if playlistName is equal to "Podcasts" then
							set resultString to (resultString & ", from the podcast " & trackAlbum & " ")
						else if playlistName is equal to "TV Shows" then
							set resultString to (resultString & ", from the television show " & trackAlbum & " ")
						else
							set resultString to (resultString & ", from the album " & trackAlbum & " ")
						end if
					end if
					
					if playlistName is equal to "Music" then
						set resultString to (resultString & "[Song] ")
					else if playlistName is equal to "Movies" then
						set resultString to (resultString & "[Movie] ")
					else if playlistName is equal to "Podcasts" then
						set resultString to (resultString & "[Podcast] ")
					else if playlistName is equal to "iTunes U" then
						set resultString to (resultString & "[iTunes U Media] ")
					else if playlistName is equal to "TV Shows" then
						set resultString to (resultString & "[TV Show] ")
					else if (trackKind is equal to "" and trackLength is missing value and trackSize is missing value) then
						set resultString to (resultString & "[iTunes Radio] ")
					end if
				end if
			else
				set resultString to "/sme " & destinationChannel & " is not playing anything in iTunes."
			end if
		end tell
	end if
	
	return resultString
end irccmd

-- text_to_list AppleScript function from:
-- <http://dougscripts.com/itunes/itinfo/locatemf.php>
on text_to_list(txt, delim)
	set saveD to AppleScript's text item delimiters
	
	try
		set AppleScript's text item delimiters to {delim}
		set theList to every text item of txt
	on error errStr number errNum
		set AppleScript's text item delimiters to saveD
		
		error errStr number errNum
	end try
	
	set AppleScript's text item delimiters to saveD
	
	return (theList)
end text_to_list

irccmd("lol", "#test")
