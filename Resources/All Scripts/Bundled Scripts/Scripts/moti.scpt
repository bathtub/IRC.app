-- "moti" is a script by Noah "Brisk" Darville-Jennings (http://www.noahdj.ca/).

on irccmd(moti, destinationChannel)
	if destinationChannel is equal to "" then
		return "/debug Invalid destination channel."
	end if
	
	if moti is equal to "fistu" then
		return "し(*･∀･)／♡＼(･∀･*) ＢＲＯ　ＦＩＳＴＵ"
	else if moti is equal to "angel" then
		return "☜(⌒▽⌒)☞"
	else if moti is equal to "angry" then
		return "ಠ╭╮ಠ  "
	else if moti is equal to "angry2" then
		return "ಥ_ಥ"
	else if moti is equal to "angry3" then
		return "ಠ_ಠ"
	else if moti is equal to "cheers" then
		return "（ ^_^）o自自o（^_^ ） C H E E R S !"
	else if moti is equal to "doit" then
		return "(☞ﾟヮﾟ)☞"
	else if moti is equal to "doitrev" then
		return "☜(ﾟヮﾟ☜)"
	else if moti is equal to "doit2" then
		return "(☞ﾟヮﾟ)☞  D O   I T !"
	else if moti is equal to "finger" then
		return "(◕_◕)┌∩┐"
	else if moti is equal to "frown" then
		return "(◕︵◕)"
	else if moti is equal to "fusro" then
		return "(╯°O°）╯FUS RO DAH!"
	else if moti is equal to "glare" then
		return "Ò_Ó"
	else if moti is equal to "happy" then
		return "{◕ ◡ ◕}"
	else if moti is equal to "happy2" then
		return "^ㅂ^"
	else if moti is equal to "happy3" then
		return "^_^"
	else if moti is equal to "hug" then
		return "(>^^)> <(^^<)"
	else if moti is equal to "idc" then
		return "（　´_ゝ`）"
	else if moti is equal to "love" then
		return "(｡♥‿♥｡)"
	else if moti is equal to "orly" then
		return "d[ ๏ _ ◉ ]b"
	else if moti is equal to "orly2" then
		return "d[ ๏ _ ◉ ]b   O  R L Y ?"
	else if moti is equal to "panic" then
		return "╱o╲"
	else if moti is equal to "ridic" then
		return "(╯°□°）╯︵ ┻━┻ THIS IS RIDICULOUS"
	else if moti is equal to "shock" then
		return "◉_◉"
	else if moti is equal to "shock2" then
		return "Σ(ﾟДﾟ)"
	else if moti is equal to "shrug" then
		return "┐('～`)┌"
	else if moti is equal to "shrug2" then
		return "┐('～`；)┌"
	else if moti is equal to "shrug3" then
		return "¯\\_(ツ)_/¯"
	else if moti is equal to "smile" then
		return "(•‿•)"
	else if moti is equal to "smile2" then
		return "(｡◕‿◕｡)"
	else if moti is equal to "sorry" then
		return "m( _  _ )m"
	else if moti is equal to "sorry2" then
		return "m( _  _ )m  G O M E N   K U D A S A I ."
	else if moti is equal to "wave" then
		return "<o/"
	else if moti is equal to "wave2" then
		return ".o/"
	else if moti is equal to "wink" then
		return "ᕋ꒪⍹꒡ᕈ"
	else if moti is equal to "wink2" then
		return " ~_^ "
	else if moti is equal to "yay" then
		return "º╲˚\\╭ᴖ_ᴖ╮/˚╱º   Y A Y !"
	else if moti is equal to "zzz" then
		return "┌[；`||～,]┐  z z Z"
	else
		return "/debug Use: '/moti [command]'. Commands: fistu, angel, angry, angry2, angry3, cheers, doit, doitrev, doit2, frown, fusro, glare, happy, happy2, happy3, hug, idc, love, orly, orly2, ridic, shock, shock2, shrug, shrug2, shrug3, smile, sorry, sorry2, wave, wave2, wink, wink2, yay, zzz."
	end if
end irccmd

