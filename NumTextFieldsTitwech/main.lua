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
local lives = 4
local wrongAnswers
local wrongAnswersText 
local youWin
local youLose 
local myText
local randomOperator
local correctAnswer1
-- for the timer
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

local heart1 
local heart2
local heart3
local heart4
local incorrectObject
local pointsObject
-----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------
local correctSound = audio.loadSound( "Sounds/correctSound.mp3") 
local wrongSound = audio.loadSound( "Sounds/wrongSound.mp3") 
local correctSoundChannel
local wrongSoundChannel
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------


local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. numbers
	randomNumber1 = math.random(1, 10)
	randomNumber2 = math.random(1, 10)

	correctAnswer = randomNumber1 + randomNumber2

	--create questionin text object 
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- generate a random number bettween 1 and 2
	randomOperator = math.random (1,4)

	-- if the random operator is 1, then so addition
	if	( randomOperator == 1 ) then

		--calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create  question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- otherwise, random operator is  2 , do sub.
	elseif(randomOperator == 2 ) then 
	
		--calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2
		if( correctAnswer < 0) then 
			correctAnswer = randomNumber2 - randomNumber1
			questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
		else
			-- create a question in text object 
			questionObject.text =  randomNumber1 .. " - " ..  randomNumber2 .. "="
		end

	-- otherwise, random operator is  3, then do.
	elseif(randomOperator == 3 ) then 
		--calculate the correct answer
		correctAnswer = randomNumber1 * randomNumber2
		
		--create question in text object
		questionObject.text = randomNumber1 .. " x " .. randomNumber2 .. " = "

	-- otherwise if random operator is 4 divied.
	elseif(randomOperator == 4 ) then 
		--calculate the correct answer
		correctAnswer1 = randomNumber1 * randomNumber2
		correctAnswer = correctAnswer1/randomNumber1
		
		--create question in text object
		questionObject.text = correctAnswer1.. " ÷ " .. randomNumber1 .. " = "

	end


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
			secondsLeft = totalSeconds
			correctObject.isVisible = true
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(2000, HideCorrect)
			if(points == 4) then
				stopTimer()
				youWin.isVisible = true
				inCorrectAnswer.isVisible = false
				correctObject.isVisible = false 
				questionObject.isVisible = false
				numericField.inputtype = false
				pointsText.isVisible = false
				
			end
			--give a point if user gets the correct answer
			points = points + 1

			-- update it in the display object
			pointsText.text = "Points = " .. points
		else
			if(lives == 0) then
				stopTimer()
				heart4.isVisible = false
				wrongSoundChannel = audio.play(wrongSound)
				youLose.isVisible = true
				inCorrectAnswer.isVisible = false
				correctObject.isVisible = false 
				questionObject.isVisible = false
				numericField.inputtype = false
				pointsText.isVisible = false
			else
				--give a point if user gets the correct answer
				lives = lives - 1

				inCorrectAnswer.text = "Incorrect, the correct answer is " .. correctAnswer .. "."
				inCorrectAnswer.isVisible = true
				secondsLeft = totalSeconds
				wrongSoundChannel = audio.play(wrongSound)
				timer.performWithDelay(2000, HideinCorrect)
			
			if (lives == 3 ) then
				heart1.isVisible = false
			elseif(lives == 2) then 
				heart2.isVisible = false
			elseif (lives == 1 ) then
				heart3.isVisible = false
			elseif(lives == 0) then 
				heart4.isVisible = false
			end

			end	
		

		end
		event.target.text = ""
		

	end		

end 
local function updateTime()
	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	--display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1
		if(lives == 0) then
			stopTimer()
			heart4.isVisible = false
			wrongSoundChannel = audio.play(wrongSound)
			youLose.isVisible = true
			inCorrectAnswer.isVisible = false
			correctObject.isVisible = false 
			questionObject.isVisible = false
			numericField.inputtype = false
			pointsText.isVisible = false
		end
	
		if (lives == 3 ) then
			heart1.isVisible = false
		elseif(lives == 2) then 
			heart2.isVisible = false
		elseif (lives == 1 ) then
			heart3.isVisible = false
		elseif(lives == 0) then 
			heart4.isVisible = false
		end
		AskQuestion()


	end
end


-- function taht calls the timer
local function StartTimer()
	-- create s countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay ( 1000, updateTime, 0)
end

function stopTimer ()
	timer.cancel(countDownTimer)
end
-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

-- create clocktext
clockText = display.newText("".. secondsLeft,100, 100, nil, 50 )
clockText:setTextColor(252/255, 0/255, 0/2555)
clockText.x = 190
clockText.y = 100

-- displays a question and sets the colour 
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2.5, nil, 50 )
questionObject:setTextColor(25/255, 51/255, 0/255)

-- create the correct text object and make it invisible 
correctObject = display.newText("Correct", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(25/255, 51/255, 0/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible 
inCorrectAnswer = display.newText("Incorrect, the correct answer is ", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
inCorrectAnswer:setTextColor(252/255, 0/255, 0/255)
inCorrectAnswer.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2.5, 150, 80 )
numericField.inputType = "number"

-- displays you win
youWin = display.newImageRect("Images/youWin.png", 500, 350)
youWin.x = display.contentWidth/2
youWin.y = display.contentHeight*3/4
youWin.isVisible = false

-- displays you win
youLose = display.newImageRect("Images/youLose.png", 500, 350)
youLose.x =  display.contentWidth/2
youLose.y = display.contentHeight*3/4
youLose.isVisible = false

-- display the amount the points as a text object
pointsText = display.newText("points = " .. points, display.contentWidth/5, display.contentHeight/5, nil, 50)
pointsText:setTextColor(53/255, 107/255, 0/255)

-- crete the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png" , 100, 100)
heart1.x = display.contentWidth  * 7/8
heart1.y = display.contentHeight * 1/7

heart2 = display.newImageRect("Images/heart.png" , 100, 100)
heart2.x = display.contentWidth  * 6/8
heart2.y = display.contentHeight * 1/7

heart3 = display.newImageRect("Images/heart.png" , 100, 100)
heart3.x = display.contentWidth  * 5/8
heart3.y = display.contentHeight * 1/7

heart4 = display.newImageRect("Images/heart.png" , 100, 100)
heart4.x = display.contentWidth  * 4/8
heart4.y = display.contentHeight * 1/7

countDownTimer = display.newText("5" , 100, 100)
countDownTimer = display.contentWidth  * 4/8
countDownTimer = display.contentHeight * 1/7

--add the event listener for the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener)

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------

--call the function to ask the question 
AskQuestion()
StartTimer()