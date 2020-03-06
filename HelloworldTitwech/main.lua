-----------------------------------------------------------------------------------------
-- Title: HelloWorld
-- Name: Titwech
-- Course: ICS2O/3C
-- displays "hello world" to both the virtual iPad and the console using lua using corona SDK.
-- main.lua
--
-----------------------------------------------------------------------------------------

-- print greeting to the console
print("**** Hello Titwech")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 203/255, 255/255, 111/255)

-- create a local variable
local textObject

-- displays text on the screen at position x = 500 and y = 500 with 
-- a default font style and font size of 50
textObject = display.newText( "Hello, Wal!", 500, 300, nil, 120 )

-- sets the color of the text
textObject:setTextColor(64/255, 101/255, 0/255)

-- displays text on the screen at position x = 500 and y = 500 with 
-- a default font style and font size of 50
textObject = display.newText( "By: Titwech.w", 500, 500, nil, 70 )

