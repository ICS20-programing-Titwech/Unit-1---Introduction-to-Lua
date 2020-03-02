-----------------------------------------------------------------------------------------
---- Title: MovingObjects
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
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- background image with width and height 
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = .5

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
Runtime: addEventListener("enetrFrame", MoveShip)