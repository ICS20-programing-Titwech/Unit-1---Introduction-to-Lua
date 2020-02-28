-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- set all the variables for the triangle
local verticesTriangle = {0, 130, 130, -130, -130, 130}
local triangle = display.newPolygon(display.contentWidth/4, display.contentHeight/4, verticesTriangle)

-- set the background colour of my screen.Remember that colours are between 0 and 1.
display.setDefault( "background", 243/255, 191/255, 19/255)
 
-- set the colour of the triangle
triangle:setFillColor( 255/255, 96/255, 4/255 )

-- set the width of the border for the triangle
triangle.strokeWidth = 10

--set the triangle at the top right coner of the screen
triangle.anchorX = 0
triangle.anchorY = 0 
triangle.x = 720
triangle.y =20

-- set all the variables for the Dimond
local verticesDimond = {0, 130, -40, 0, 0, -133, 40, 0}
local Dimond = display.newPolygon(display.contentWidth/4, display.contentHeight/4, verticesDimond)

-- set the colour of the Dimond
Dimond:setFillColor( 255/255, 96/255, 4/255 )
