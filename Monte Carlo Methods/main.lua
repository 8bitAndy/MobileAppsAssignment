-----------------------------------------------------------------------------------------
--
-- main.lua
-- Application by Liam Andrews, Student Number 1054 8022, 11/09/2022
-----------------------------------------------------------------------------------------

-- Start of main
-- Fix issues with gray bar on android devices
native.setProperty("androidSystemUiVisibility", "immersiveSticky");

-- Initialization of the composer
local composer = require( "composer" )



-- Change scene to first curve
composer.gotoScene("mainMenu")


