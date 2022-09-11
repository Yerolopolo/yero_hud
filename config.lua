Config = {}

Config.serverLogo = 'https://cdn.discordapp.com/attachments/985910996533125160/1011471007690797096/full-logo-stretch-nobg.png'

Config.showServerLogo	= true
Config.healthRegen 		= false -- Toggle health regeneration, default = false

Config.ui = {  -- Enable/Disable HUD elements
	showHealth			= true,
	showDrunk	 		= true,
	showStress	 		= false, -- Requires yero_basicneeds
	showHunger 			= true,
	showThirst	 		= true,

	showDynamicMinimap	= true, -- true = Radar only on when on vehicle, false = Radar always on, default = true
}

Config.dynamicUI		= true -- Toggle dynamic UI (When is active, the UI only shows when an element is below or above the percentages below)

Config.percentages = { -- At what percentage should the HUD show every element?
	healthPercent 		= 99, -- From 0 to 100, default = '99' (Less than)
	drunkPercent 		= 0, -- From 0 to 100, default = 0 (More than)
	stressPercent 		= 75, -- From 0 to 100, default = '75' (More than) 
	hungerPercent 		= 35, -- From 0 to 100, default = '35' (Less than)	
	thirstPercent 		= 35, -- From 0 to 100, default = '35' (Less than)
}
