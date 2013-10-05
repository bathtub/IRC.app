(*
	Copyright © 2011, Scott Dollins. All rights reserved.
	http://scottdollins.com/

	Redistribution and use in source and binary forms, with or without modification, are 
	permitted provided that the following conditions are met:

		Redistributions of source code must retain the above copyright notice, this list of 
		conditions and the following disclaimer.
	
		Redistributions in binary form must reproduce the above copyright notice, this list 
		of conditions and the following disclaimer in the documentation and/or other materials 
		provided with the distribution.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
	"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED 
	TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
	PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR 
	CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
	EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
	PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
	PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY 
	OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
	NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*)

on irccmd(inputData, destinationChannel)
	if destinationChannel is equal to "" then
		return "/debug Invalid destination channel."
	end if
	
	set spotify_message to "/sme " & destinationChannel & " is not running Spotify."
	
	tell application "System Events"
		tell application "System Events" to set spotify_open to exists (processes where name is "Spotify")
	end tell
	
	if spotify_open then
		tell application "Spotify"
			if player state is playing then
				set spotify_status to "playing"
			else if player state is paused then
				set spotify_status to "paused"
			else if player state is stopped then
				set spotify_status to "stopped"
			end if
		end tell
		
		if spotify_status is "playing" then
			tell application "Spotify"
				set spotify_title to name of current track
				set spotify_artist to artist of current track
				set spotify_album to album of current track
			end tell
			
			set spotify_message to "/sme " & destinationChannel & " is listening to " & spotify_artist & " - " & spotify_title & " from the album " & spotify_album & " on Spotify."
		end if
		
		if spotify_status is "paused" then
			set spotify_message to "/sme " & destinationChannel & " has Spotify paused."
		end if
		
		if spotify_status is "stopped" then
			set spotify_message to "/sme " & destinationChannel & " has Spotify stopped."
		end if
	end if
	
	return spotify_message
end irccmd

