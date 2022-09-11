fx_version 'adamant'

game 'gta5'

description 'Yero HUD'

version '1.3.0'

ui_page 'html/ui.html'


files {
	'html/ui.html',
	'html/main.css',
	'html/app.js',
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/client.lua',
	'client/dynamicui.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'config.lua',
}

dependencies {
	'es_extended'
}
