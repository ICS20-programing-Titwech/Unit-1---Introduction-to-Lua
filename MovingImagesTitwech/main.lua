-----------------------------------------------------------------------------------------
-- Title: MovingObjects
-- Name: Your Name
-- Course: ICS2O/3C
-- This program moves a beetleship across the screen and then makes it fade out.
-- I added a second objest that moves in a different direction, 
-- fades out and grows in size.
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

--global variables
scrollSpeed = 3

-- background image with width and height 
local backgroundImage = display.newImageRect("Images/nightsky.png", 1024, 768)

-- set the backgroundImage
backgroundImage.x = display.contentWidth/2
backgroundImage.y = display.contentHeight/2


-- background image with width and height 
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- Function: moveShip
-- Input: this function accepts an event listener
-- Output: none 
-- Description: This function adds the scroll speed to the x-value of the ship
local function  MoveShip(event)
	-- add the scroll speed to the x-value of the ship 
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of the ship every time it moves so the it fades out
	beetleship.alpha = beetleship.alpha + 0.01
end

-- MoveShip will be called over and over again
Runtime: addEventListener("enterFrame", MoveShip)

-- background image with width and height 
local planet = display.newImageRect("Images/planet.png", 200, 200)

-- set the image to be transparent
planet.alpha = 1

-- set the initial x and y position of planet
planet.x = 0
planet.y = display.contentHeight/3

-- set the initial x and y position of planet
planet.x = 900
planet.y = 500

-- Function: moveplanet
-- Input: this function accepts an event listener
-- Output: none 
-- Description: This function adds the scroll speed to the x-value of the planet
local function  Moveplanet(event)
	-- add the scroll speed to the x-value of the planet
	planet.x = planet.x - scrollSpeed
	-- change the transparency of the planet every time it moves so the it fades out
	planet.alpha = planet.alpha - 0.001
end

-- Moveplanet will be called over and over again
Runtime: addEventListener("enterFrame", Moveplanet)