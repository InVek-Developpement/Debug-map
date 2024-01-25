config = {
	displayText = '~r~Appuyez sur ~b~[E]~s~ ~r~pour vous téléporter au sol!', -- message which will be displayed
	key = 38,  -- key which activates the teleport (https://docs.fivem.net/docs/game-references/controls/)
	preset = false,  -- false: place ped at current location on the ground | true: place ped at preset location in config
	coords = { x = 0.0, y = 0.0, z = 0.0 },  -- coordinates for preset location
	z_check = 0.0,  -- z coordinate to prompt the player at, found 0.0 to be the best
	freeze = false,  -- whether or not to freeze the player for the specified amount after teleporting
	freeze_time = 2,  -- number of seconds to freeze the player
}
