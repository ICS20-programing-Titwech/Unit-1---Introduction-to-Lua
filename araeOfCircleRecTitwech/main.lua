-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- -title:araeOfRectangleTitwech
--Name: titwech wal
-- Course ICS20 programming
--this program displays a rectangle and circle shows its area
 
-- create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle
local PI = 3.14
local radiusOfCircle = 500
local mycircle
local AraeOfCircle
 
-- draw the circle thats is half the width and hight of the screen size.
local myCircle = display.newCircle( 800, 800 , 130 )
 
-- anchor the circle in the top right corner of the screen and set its (x,y) position
myCircle.anchorX = 0
myCircle.anchorY = 0 
myCircle.x = 720
myCircle.y =20
 
---- set the colour of the circle
myCircle:setFillColor( 255/255, 96/255, 4/255 )
 
-- set the width of the border
myCircle.strokeWidth = 10
 
-- set the color of the border
myCircle:setStrokeColor(255/255 , 255/255, 255/255 )
 
-- calculate the area
AraeOfCircle = PI * radiusOfCircle * radiusOfCircle
 
--write the area on the screen. Take into consideration the size of the font when positioning it on the screen
    areaText = display.newText("The area of this circle with a radius of  \n" ..
    radiusOfCircle ..  " is " ..
    AraeOfCircle .. " pixels².", 450, 600, Arial, textSize)
    
 -- set the colour of the newText
 areaText:setTextColor(1, 1, 1)
 
-- set the background colour of my screen.Remember that colours are between 0 and 1.
display.setDefault( "background", 243/255, 191/255, 19/255)
 
-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)
 
-- draw the rectangle thats is half the width and hight of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)
 
-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0 
myRectangle.x = 20
myRectangle.y = 20
 
-- set the width of the border
myRectangle.strokeWidth = 10
 
-- set the colour of the rectangle 
myRectangle:setFillColor(255/255, 96/255, 4/255)
 
-- set the color of the border
myRectangle:setStrokeColor(255/255 , 255/255, 255/255)
 
-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle
 
--write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n" ..
    widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
    areaOfRectangle .. " pixels².", 0, 0, Arial, textSize)
 
    -- anchor the text and set its (x,y) position
    areaText.anchorX = 0
    areaText.anchorY = 0 
    areaText.x = 20
    areaText.y = display.contentHeight/2
 
    -- set the colour of the newText
    areaText:setTextColor(1, 1, 1)
 
 
