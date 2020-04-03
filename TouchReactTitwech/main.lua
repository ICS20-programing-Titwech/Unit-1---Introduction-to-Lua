-----------------------------------------------------------------------------------------
-- Title: TouchAndReact
-- Name: Titwech
-- Course: ICS2O/3C
-- displays two buttons, one on top of the other when I click on the blue button it tuns red test appears on the screen as well as an image. 
-----------------------------------------------------------------------------------------

-- set background color
display.setDefault ("background", 198/255, 255/255, 207/255)

-- hide stauts bar 
display.setStatusBar(display.HiddenStatusBar)

-- correct sound
local correctSound = audio.loadSound("Sounds/Correct Answer Sound Effect.mp3") 
local correctSoundChannel 


-- create blue button, set it's position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png",198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create red button, set it's position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false


-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (10/255, 11/255, 159/255)
textObject.isVisible = false

-- create check mark, set it's position and make it visible
local checkmark = display.newImageRect("Images/checkmark.png",198, 96)
checkmark.x = display.contentWidth/2
checkmark.y = display.contentHeight/4
checkmark.isVisible = false

-- Fuction: blueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the red button,
-- and make the blue button disappear
local function blueButtonListener( touch )
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		checkmark.isVisible = true
		textObject.isVisible = true
		correctSoundChannel = audio.play(correctSound)

	end

	if (touch.phase == "ended") then 
		blueButton.isVisible = false
		redButton.isVisible = false
		checkmark.isVisible = false
		textObject.isVisible = false
	end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", blueButtonListener)

-- Fuction: redButtonListener
-- Input: touch listener
-- Output: none
-- Description: when red button is clicked, it will make the text appear with the blue button,
--and make the red button disappear
local function redButtonListener( touch )

	if (touch.phase == "ended") then 
		redButton.isVisible = false
		checkmark.isVisible = false
		blueButton.isVisible = true
		textObject.isVisible = false

	end
end

-- add the respective listeners to each object
redButton:addEventListener("touch", redButtonListener)


