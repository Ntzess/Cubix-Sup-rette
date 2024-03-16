fx_version 'adamant'
game 'gta5'

shared_script 'config.lua'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	"lib/RMenu.lua",
	"lib/menu/RageUI.lua",
	"lib/menu/Menu.lua",
	"lib/menu/MenuController.lua",
	"lib/components/*.lua",
	"lib/menu/elements/*.lua",
	"lib/menu/items/*.lua",
	"lib/menu/panels/*.lua",
	"lib/menu/panels/*.lua",
	"lib/menu/windows/*.lua",
	'client.lua',
}

dependencies {'es_extended'}
