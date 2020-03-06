-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Title: TouchAndDrag
-- Name: Titwech
-- Course: ICS2O/3C
-- this program displays imgaes that react to a persons finger.

-- hide the status bar
display.setStatusBar(display.hiddenStatusBar)

-- local Variables. I am still trying to get the x-value to set properly
local backgrondImage = display.newImageRect("Images/background.png", 2048, 1536)
local pinkGirl = display.newImageRect("Images/girl1.png", 150, 150)
local pinkGirlWidth = pinkGirl.width
local pinkGirlHeight = pinkGirl.height

local blueGirl = display.newImageRect("Images/girl2.png", 150, 150)
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height

local grayGirl = display.newImageRect("Images/girl5.png", 150, 150)
local grayGirlWidth = grayGirl.width
local grayGirlHeight = grayGirl.height


-- my boolean variables to keep track of which object I touched first
local alreadyTouchedPinkGirl = false
local alreadyTouchedBlueGirl = false
local alreadyTouchedGrayGirl = false

-- set the initial x and y position of myImage
pinkGirl.x = 400
pinkGirl.y = 500

blueGirl.x = 300
blueGirl.y = 200

grayGirl.x = 500
grayGirl.y = 600

-- function: BlueGirlListener
-- Input: touch listener
-- output: none
-- Description: when blue girl is touched, move her
local function blueGirlListener(touch)

	if (touch.phase == "began") then 
		if (alreadyTouchedPinkGirl == false) then
			alreadyTouchedBlueGirl = true
			alreadyTouchedGrayGirl = true
		end
	end

	if ( ( touch.phase == "moved") and ( alreadyTouchedBlueGirl == true) ) then
		blueGirl.x =  touch.x
		blueGirl.y =  touch.y 
	end

	if ( touch.phase == "ended") then
		alreadyTouchedBlueGirl = false
		alreadyTouchedPinkGirl = false
	end
end

-- add the respective listeners to each object
blueGirl: addEventListener("touch", blueGirlListener)

-- function: pinkGirlListener
-- Input: touch listener
-- output: none
-- Description: when pink girl is touched, move her

local function pinkGirlListener(touch)

	if (touch.phase == "began") then 
		if (alreadyTouchedBlueGirl == false) then
			alreadyTouchedPinkGirl = true
		end
	end

	if ( ( touch.phase == "moved") and ( alreadyTouchedPinkGirl == true) ) then
		pinkGirl.x =  touch.x
		pinkGirl.y =  touch.y 
	end

	if ( touch.phase == "ended") then
		alreadyTouchedPinkGirl = false
		alreadyTouchedBlueGirl = false
	end
end

-- add the respective listeners to each object
pinkGirl: addEventListener("touch", pinkGirlListener)

-- function: grayGirlListener
-- Input: touch listener
-- output: none
-- Description: when gray girl is touched, move her

local function grayGirlListener(touch)

	if (touch.phase == "began") then 
		if (alreadyTouchedBlueGirl == false) then
			alreadyTouchedGrayGirl = true
		end
	end

	if ( ( touch.phase == "moved") and ( alreadyTouchedGrayGirl == true) ) then
		grayGirl.x =  touch.x
		grayGirl.y =  touch.y 
	end

	if ( touch.phase == "ended") then
		alreadyTouchedGrayGirl = false
		alreadyTouchedBlueGirl = false
	end
end

-- add the respective listeners to each object
grayGirl: addEventListener("touch", grayGirlListener)

