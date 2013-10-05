-- Portions of this AppleScript may incorporate work from 3rd 
-- parties. These portions of code are noted. All other work is 
-- Copyright © 2010 — 2013 Codeux Software. See README 
-- for full license information. 

-- This script uses invisible characters for IRC formatting. That
-- is why the result as seen by IRC is not the same as seen
-- in this actual source code.

on irccmd(keyx, destinationChannel)
	if destinationChannel is equal to "" then
		return "/debug Invalid destination channel."
	end if
	
	if keyx is equal to "u" then
		return "04(07╯08°03□12°02）06╯04︵ 08┻03━12┻
THIS IS RIDICULOUS"
	else if keyx is equal to "d" then
		return "┬──┬ ﻿ノ( ゜-゜ノ)
Sorry bro I lost my cool."
	else
		return "ಠ_ಠ"
	end if
end irccmd
