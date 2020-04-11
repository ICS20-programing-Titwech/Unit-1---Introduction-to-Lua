-----------------------------------------------------------------------------------------
--
-- -- Title: WhackAMole
-- Name: Titwech Wal
-- Course: ICS2O/3C
-- This program makes a mole appear on the screen for an amount of time and then disappears
----------------------------------------LOCAL VARIABLES-------------------------------------

local mole
local points text

----------------------------------------LOCAL FUNCTIONS-------------------------------------

-- -- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- creating Background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
   
    -- set the colour of the background
    local paint = {
    type = "gradient",
    color1 = { 179/255, 98/255, 64/255 },
    color2 = { 31/255, 12/255, 3/255 },
    directions = "up"
    }
    bkg.fill = paint    
    
    -- setting position
    bkg.anchorX= 0 
    bkg.anchorY = 0 
    bkg.x = 0
    bkg.y = 0


-- creating mole
local mole = display.newImage( "Images/mole.png" , 0,0 )
    -- setting position
    mole.x = display.contentCenterX
    mole.y = display.contentCenterY

    -- scaling the mole
    mole:scale( 0.3, 0.3 )

    -- male invisable
    mole.isVisible = false

  





---------------------------------FUNCTIONS-------------------------------------------------
-- this function that makes the mole appar in a random (x,y) position on the screen
--before calling the hide function
function PopUp()
    --chosing Random POsition on the screen bettween 0 and the size of the screen
    mole.x = math.random( 0,display.contentWidth)
    mole.y = math.random( 0,display.contentHeight)

    -- male visable
    mole.isVisible = true

    -- hide after 500 miliseconds
    timer.performWithDelay( 500, hide.mole)
end

-- this function calls the popup function after 3 seconds
function PopUpDelay()
    timer.performWithDelay( 3000, PopUp)
end
 

-- this funcrtion makes the mole inviable and then calls the popupdelay
function HideMole()
    -- changes visiblity
    mole.isVisible = false
    time.performWithDelay(1000, PopUpDelay)
end

-- this function increnment the score only if the mole mole is clicked it then displays the 
--new score
function Whacked(event)
    -- if touch phase just started
    if(event.phase == "began") then
        --give it in the display objects
        pointsText.text = "Points ="..points
        hitSoundChannel = audio.play(hitSound)
    end
end

function EndGame()
    --end the game
    if(points == 2) then
        mole.isVisible = false
        audio.stop(backgroundSoundChannel)
    end
end

-- function starts the game
function GameStart()
    PopUpDelay()
    EndGame()
end