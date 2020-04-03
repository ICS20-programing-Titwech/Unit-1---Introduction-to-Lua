-----------------------------------------------------------------------------------------
--
-- -- Title: WhackAMole
-- Name: Titwech Wal
-- Course: ICS2O/3C
-- This program makes a mole appear on the screen for an amount of time and then disappears
-----------------------------------------------------------------------------------------


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
 
-- this Function makes the mole invisable and then calls th epopundelay function
