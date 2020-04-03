-----------------------------------------------------------------------------------------
--
-- Title: PhysicsAndCollisions
-- Name: Titwech
-- Course: ICS2O/3C
--  program that has objects that fall and collide with the ground. 
--I added extra objects and modified the location of the angle of the beam.
-----------------------------------------------------------------------------------------

-- -- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics 
local physics = require("physics")

-- start physiscs 
physics.start()
--------------------------------------------------------------------------------------------
-- objects
--------------------------------------------------------------------------------------------
-- ground
local ground = display.newImage("physics/ground.png", 0, 0)
    ground.x = display.contentWidth/2
    ground.y = display.contentHeight/1.01

    -- change the width to be the same as the screen
    ground.width = display.contentWidth

    -- add to physics
    physics.addBody(ground, "static", {friction = 0.5, bounce = 0.3})
--------------------------------------------------------------------------------------------
    local beam = display.newImage("physics/beam.png", 4/2, 0)
    beam.x = display.contentCenterX/5
    beam.y = display.contentCenterY*1.65

    -- width and height of the beam
    beam.height = display.contentHeight*1/10
    beam.width = display.contentWidth/2

    -- rotate the beam -60 degress soits on its angle
    beam:rotate(45)

    -- send it to back layer
    beam:toBack()

    -- add physics
    physics.addBody(beam, "static", {friction = 0.5, bounce = 0.3})

    local beam2 = display.newImage("physics/beam.png", 4/2, 0)
    beam2.x = display.contentCenterX/5
    beam2.y = display.contentCenterY*1.65

    -- width and height of the beam
    beam2.height = display.contentHeight*1/10
    beam2.width = display.contentWidth/1

    -- rotate the beam -60 degress soits on its angle
    beam2:rotate(-45)

    -- send it to back layer
    beam2:toBack()

    beam2.x = 900
    beam2.y = 650   

    -- add physics
    physics.addBody(beam2, "static", {friction = 0.5, bounce = 0.3})

--create bkg
local bkg = display.newImage("physics/bkg.png", 0, 0)
    -- set the x and y pos
    bkg.x = display.contentCenterX
    bkg.y = display.contentCenterY

    -- width and height 
    bkg.width = display.contentWidth
    bkg.height = display.contentHeight


    -- send to back
    bkg:toBack()

--------------------------------------------------------------------------------------------
-- functions
--------------------------------------------------------------------------------------------

-- create the first ball 
local function firstBall ()
    -- craeting first ball
    local ball1 = display.newImage("physics/super_ball.png", 0,0)

    --add to physics
    physics.addBody(ball1, {density = 10.0, friction = 0.5, bounce = 0.3, radius = 25})
end
--------------------------------------------------------------------------------------------
local function secondBall()
    -- craeting first ball
    local ball2 = display.newImage("physics/ball2.png", 0,0)

    --add to physics
    physics.addBody(ball2, {density = 5.0, friction = 0.05, bounce = 0.6, radius = 120})
    
    -- setting the ball half its size
    ball2:scale( 0.5, 0.5 )

end
--------------------------------------------------------------------------------------------
local function thirdBall ()
    -- craeting first ball
    local ball3 = display.newImage("physics/ball3.png", 0,0)

    --add to physics
    physics.addBody(ball3, {density = 0.02, friction = 7.0, bounce = 0.3, radius = 66})

    -- setting the size
    ball3:scale( 0.3, 0.3 )
end
--------------------------------------------------------------------------------------------
local function fourthBall ()
    -- craeting first ball
    local ball4 = display.newImage("physics/ball4.png", 0,0)

    --add to physics
    physics.addBody(ball4, {density = 1.0, friction = 0.05, bounce = 0.06, radius = 55})

    -- setting the size
    ball4:scale( 0.1, 0.1 )
end
--------------------------------------------------------------------------------------------
-- timer delays - call each function after the given millisecond
--------------------------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)
timer.performWithDelay( 2000, thirdBall)
timer.performWithDelay( 3500, fourthBall)




