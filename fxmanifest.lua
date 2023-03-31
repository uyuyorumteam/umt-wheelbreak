fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "umt-wheelbreak"
description "Break off vehicle wheel"
author "uyuyorum team"
version "1.0.0"
license "GPL-3.0 license"
repository 'https://github.com/uyuyorumteam/umt-wheelbreak'

client_script 'wheelbreak.lua'

dependencies {
	'/server:6351',
    '/onesync',
}