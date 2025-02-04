--------------------------------------------------------------------------------
-- DO NOT MODIFY THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING!
--------------------------------------------------------------------------------

-- Core
fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

-- Public
name 'pleb-lib'
author 'IngPleb'
version '1.0.0'
description 'Library of modern features & boilerplate lua code.'

dependencies {
    '/onesync',
}

files {
    'modules/*',
    'init.lua',
}