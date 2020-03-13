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
local inCorrectAnswer 
local points = 0
local wrongAnswers
local wrongAnswersText 
local youWin
local youLose 
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. numbers
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	correctAnswer = randomNumber1 + randomNumber2

	--create questionin text object 
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

end 

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end 

local function HideinCorrect()
	inCorrectAnswer.isVisible = false
	AskQuestion()
end 


local function NumericFieldListener(event)
	
	-- user begins editing "numericField"
	if ( event.phase == "began" ) then 

		-- clear the text Field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted ( enter key is pressed) set user input to users answer 
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)
			--give a point if user gets the correct answer
			points = points + 1

			-- update it in the display object
			pointsText.text = "Points = " .. points
		else

			inCorrectAnswer.isVisible = true
			timer.performWithDelay(2000, HideinCorrect)
		end
		event.target.text = ""


	end		

end 

-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

-- displays a question and sets the colour 
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2.5, nil, 50 )
questionObject:setTextColor(25/255, 51/255, 0/255)

-- create the correct text object and make it invisible 
correctObject = display.newText("Correct", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(25/255, 51/255, 0/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible 
inCorrectAnswer = display.newText("Incorrect", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
inCorrectAnswer:setTextColor(252/255, 0/255, 0/255)
inCorrectAnswer.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2.5, 150, 80 )
numericField.inputType = "number"

-- display the amount the points as a text object
pointsText = display.newText("points = " .. points, display.contentWidth/5, display.contentHeight/6, nil, 50)
pointsText:setTextColor(53/255, 107/255, 0/255)

--add the event listener for the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener)

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------

--call the function to ask the question 
AskQuestion()