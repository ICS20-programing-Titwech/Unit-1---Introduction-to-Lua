-----------------------------------------------------------------------------------------
-- Title: NumericTextFields
-- Name: Titwech
-- Course: ICS2O/3C
-- created a program that asks the user addition question.
-- and to answe in a Numeric Text Field.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 178/255, 255/255, 102/255)

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- create local variables
local questionObject 
local correctObject 
local numericField 
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. numbers
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	correctAnswer = randomNumber1 + randomNumber2

	--create questionin text object 
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " - "

end 

local function HideCorrect()
	correctAnswer.isVisable = false
	AskQuestion()
end 

local function numericFieldListener()
	
	-- user begins editing "numericField"
	if ( event.phase == "began" ) then 

		-- clear the text Field
		event.target.text =  ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted ( enter key is pressed) set user input to users answer 
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(3000, HideCorrect)
		end

	end		

end 

-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

-- displays a question and sets the colour 
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(25/255, 51/255, 0/255)

-- 
