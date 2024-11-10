fx_version 'cerulean'
game 'gta5'

author 'Your Name'
description 'FiveM Red-Themed HUD'
version '1.0.1'

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/output.css',
    'ui/script.js',
    '/config.lua',
    '/assets/icons/health-icon.svg',
    '/assets/icons/stamina-icon.svg'
}

server_scripts {
    'server.lua'
}

client_scripts {
    'client.lua'
}
