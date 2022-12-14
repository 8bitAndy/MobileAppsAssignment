-----------------------------------------------------------------------------------------
--
-- curv1.lua
-- Application by Liam Andrews, Student Number 1054 8022, 11/09/2022
-----------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()

local function optionsButtonPress( event )
    
    -- If options menu is showing, then hide
    if optionsMenu.isVisible == true then
        optionsMenu.isVisible = false;
        pointEntryField.y = optionsMenuBackground.y - 999
    -- If options menu isn't showing and user presses button, then display menu
    else if optionsMenu.isVisible == false then
        pointEntryField.y = optionsMenuBackground.y - 30
        --pointEntryField.isVisible = false
        optionsMenu.isVisible = true;
        end

    end
end

-- Redo the monte carlo method
local function tryAgain( event )
    
    
    timer.performWithDelay(500)
    print("retry button pressed")
    composer.gotoScene("curve1");
    composer.removeScene("curve1", true)
    optionsMenu.isVisible = false;
end

-- Event handler that deals with changing the amount of points to be placed into the graph
local function enterAmountOfPoints(event)

    if ( event.phase == "began" ) then
        -- User begins editing "defaultField"
 
    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "defaultField"
        pointCount = event.target.text
        displayNumPoints.text = "Points: " .. pointCount
    end
end

local function backToMenuButtonPress( event )
    
    
    timer.performWithDelay(500)
    composer.gotoScene("mainMenu");
    composer.removeScene("curve1", true)
    optionsMenu.isVisible = false;
end

local function backButtonPress( event )
    
    
    timer.performWithDelay(500)
    composer.gotoScene("curve4");
    composer.removeScene("curve1", true)
    optionsMenu.isVisible = false;
end

local function forwardButtonPress( event )
    
    
    timer.performWithDelay(500)
    composer.gotoScene("curve2");
    composer.removeScene("curve1", true)
    optionsMenu.isVisible = false;
end



-- Rounds an float with the result having two decimal places
local function round(input)
    -- Formula for truncation
    local result = (math.floor(input * 100)) / 100;

    -- Return the given result
    return result
end

function generatePoints(numberOfPoints)
        

        -- Input variables, fixed number of points is 10,000
        local totalPoints = numberOfPoints;
    
        -- Variable to hold the x and y length and height of the graph
        local graphSize = 5;

        -- Area of Cartesian plane
        local areaOfRectangle = graphSize * graphSize;
    
        -- The amount of points that get placed under the function curve
        local pointsUnderCurve = 0;

        -- The result of calculations to be put into the scene group within the create function
        local results = {}
        
        -- If below the line then add one to points below the line
        for i=1, totalPoints, 1 do

            -- Generate a random floating point number for x
            local x = math.abs(math.random(0, 5) + math.random());

            -- Generate a random floating point number for y
            local y = math.abs(math.random(0, 5) + math.random());
            
            -- A point is under line if it meets this condition
            if x < y then
                -- Render random point on display and add to display group that contains all random points
                pointsUnderCurve = pointsUnderCurve + 1;
                local randomPoint = display.newCircle( (300 + -x ^ 3.15) , ( 55 + y ^ 3.15), 1.25 )
                randomPoint:setFillColor(0, 1, 0 )
                pointDisplay:insert(randomPoint)
            end
        end
    
        -- Calculate area under the curve
        local temp = (pointsUnderCurve / totalPoints);
        local areaUnderCurve =  temp * areaOfRectangle

        -- Relative error of actual result, given as a percentage
        local relativeError = round(((math.abs((areaUnderCurve - 12.5) / 12.5)) * 100))
    
        --print("adding to table")
        -- Add area of curve into results table
        table.insert(results, 0, areaUnderCurve);

        -- Add points under curve into result table
        table.insert(results, 1, pointsUnderCurve);

        -- Add margin of error into table
        table.insert(results, 2, relativeError);

        --print("added to table")

        -- Send to create function
        return results;
end



-- create()
function scene:create( event )
    local sceneGroup = self.view

    -- Tells the app that it has been initialized with a set number for pointCount
    appInit = true

    -- Display group for all points to be displayed within the graph
    pointDisplay = display.newGroup()

    -- Create a new group for the options menu objects
    optionsMenu = display.newGroup()

    -- Code here runs when the scene is first created but has not yet appeared on screen
    print("in new scene \n")

    --generatePoints();
 

    -- Creating line for graph boundaries
    local yAxisLine = display.newLine( display.contentCenterX - 150, display.contentCenterY + 100 , display.contentCenterX - 150, display.contentCenterY - 200 )
    local xAxisLine = display.newLine( display.contentCenterX - 150, display.contentCenterY + 100 , display.contentCenterX + 150, display.contentCenterY + 100 )

    -- Creating test line of function y = x
    local functionLine = display.newLine( display.contentCenterX - 150, display.contentCenterY + 100 , display.contentCenterX + 150, display.contentCenterY - 200)
    -- Change the colour of the line
    functionLine:setStrokeColor( 1, 0, 0, 1)
    -- Change the width of the axis line
    functionLine.strokeWidth = 3;
    -- Add function line into scene group for composer scene handling
    sceneGroup:insert(functionLine);

    -- Create line by appending points to the current line for the graph
    --star:append( 305,165, 243,216, 265,290, 200,245, 135,290, 157,215, 95,165, 173,165, 200,90 )

    -- Change the colour of the line
    yAxisLine:setStrokeColor( 1, 1, 1, 1)
    -- Change the width of the axis line
    yAxisLine.strokeWidth = 4

    -- Change the colour of the line
    xAxisLine:setStrokeColor( 1, 1, 1, 1)
    -- Change the width of the axis line
    xAxisLine.strokeWidth = 4

    -- Options button
    local optionsButton = display.newRoundedRect( display.contentCenterX, display.contentCenterY + 275, 150, 50, 12 )
    local optionsButtonText = display.newText("Options", optionsButton.x, optionsButton.y, "Arial", "20");
    optionsButton.strokeWidth = 3
    optionsButton:setFillColor( 0, 0.5, 1 )
    optionsButton:setStrokeColor( 1, 1, 1 )
    -- Add button and button text into scene group
    sceneGroup:insert(optionsButton)
    sceneGroup:insert(optionsButtonText)

    -- Options button
    local backButton = display.newRoundedRect( display.contentCenterX - 110, display.contentCenterY + 275, 50, 50, 10 )
    local backButtonText = display.newText("<", backButton.x, backButton.y, "Arial", "20");
    backButton.strokeWidth = 3
    backButton:setFillColor( 0, 0.5, 1 )
    backButton:setStrokeColor( 1, 1, 1 )
    -- Add button and button text into scene group
    sceneGroup:insert(backButton)
    sceneGroup:insert(backButtonText)

    -- Options button
    local forwardButton = display.newRoundedRect( display.contentCenterX + 110, display.contentCenterY + 275, 50, 50, 10 )
    local forwardButtonText = display.newText(">", forwardButton.x, forwardButton.y, "Arial", "20");
    forwardButton.strokeWidth = 3
    forwardButton:setFillColor( 0, 0.5, 1 )
    forwardButton:setStrokeColor( 1, 1, 1 )
    -- Add button and button text into scene group
    sceneGroup:insert(forwardButton)
    sceneGroup:insert(forwardButtonText)

    -- title of graph
    local sceneText = display.newText("Curve for y = x", display.contentCenterX, display.contentCenterY - 275, "Arial", "30");
    sceneText:setTextColor(1, 0, 1);

    -- Get area under curve and amount of points and put into a table
    local returnedResultsTable = generatePoints(pointCount);

    -- Display the total amount of points at the top of the screen
    local pointCountDisplay = display.newText("Total number of points generated: " .. pointCount, display.contentCenterX, display.contentCenterY - 250, "Arial", "16");
    pointCountDisplay:setTextColor(1, 1, 1);

    --[[] local powerOfTen = 10;
    -- Loop through powers of ten for week 9 deliverable
    for power = 1, 7, 1 do
        print("\n---------------------")
        print("Using power of " .. powerOfTen)
        generatePoints3(powerOfTen)
        powerOfTen = powerOfTen * 10;
    end
    --]]

    -- Assign values from table into variables for use later
    local areaUnderCurve = returnedResultsTable[0];
    local pointsUnderCurve = returnedResultsTable[1];
    local marginOfError = returnedResultsTable[2];

    -- Holds the display text value for area of curve
    local resultText

    -- Holds the display text value for area of curve
    local marginOfErrorText

    -- Simple test for displaying results text onto device screen
    local actualAreaText = display.newText("The actual area under the curve is 12.5", display.contentCenterX, display.contentCenterY + 150, "Arial", "16");

    -- Check to see if there are no points to avoid display error
    if pointCount == "0" or pointCount == 0 then
        resultText = display.newText("The estimated area is unknown", display.contentCenterX, display.contentCenterY + 175, "Arial", "16");
    else
        resultText = display.newText("The estimated area is " .. areaUnderCurve, display.contentCenterX, display.contentCenterY + 175, "Arial", "16");
    end

    local pointsUnderCurveText = display.newText("There are " .. pointsUnderCurve .. " points under the curve", display.contentCenterX, display.contentCenterY + 200, "Arial", "16");

    -- Check to see if there are no points to avoid display error
    if pointCount == "0" or pointCount == 0 then
        marginOfErrorText = display.newText("The margin of error is unknown ", display.contentCenterX, display.contentCenterY + 225, "Arial", "16");
    else
        marginOfErrorText = display.newText("The margin of error is " .. marginOfError.. "%", display.contentCenterX, display.contentCenterY + 225, "Arial", "16");
    end

    -- Display for min and maximum x values
    displayminX = display.newText("0" , display.contentCenterX - 150, display.contentCenterY + 115 , "Arial", "16");
    displayminX:setTextColor(1, 0, 1);
    -- Display for min and maximum x values
    displaymaxX = display.newText("5" , display.contentCenterX + 150, display.contentCenterY + 115 , "Arial", "16");
    displaymaxX:setTextColor(1, 0, 1);
    -- put into scene group
    sceneGroup:insert(displayminX);
    sceneGroup:insert(displaymaxX);

    -- Put results and points under curve into scnee group
    sceneGroup:insert(actualAreaText)
    sceneGroup:insert(resultText);
    sceneGroup:insert(pointsUnderCurveText);
    sceneGroup:insert(marginOfErrorText);

    -- Add event handler to button
    optionsButton:addEventListener("tap", optionsButtonPress);
    -- Add event handler to button
    backButton:addEventListener("tap", backButtonPress);
    -- Add event handler to button
    forwardButton:addEventListener("tap", forwardButtonPress);

    -- Adding display text into the scene group
    sceneGroup:insert(sceneText)
    sceneGroup:insert(pointCountDisplay)
    
    -- Add objects into scene group
    sceneGroup:insert(optionsButton)
    sceneGroup:insert(optionsButtonText)
    sceneGroup:insert(yAxisLine)
    sceneGroup:insert(xAxisLine)

    -- Popup options menu code
    optionsMenuBackground = display.newRoundedRect( display.contentCenterX, display.contentCenterY - 25 , 250, 400, 10 )
    optionsMenuBackground.strokeWidth = 5
    optionsMenuBackground:setFillColor( 0, 0, 0 , 0.9)
    optionsMenuBackground:setStrokeColor( 1, 1, 1, 1)
    local optionsMenuText = display.newText("Options menu", optionsMenuBackground.x, optionsMenuBackground.y - 160, "Arial", "30");
    optionsMenuText:setTextColor(0, 0.2, 1);
    
    -- Code displays a button that takes user back to the menu, along with formatting for said button
    local backToMenuButton = display.newRoundedRect( optionsMenuBackground.x, optionsMenuBackground.y + 120 , 150, 50, 10 )
    backToMenuButton.strokeWidth = 3
    backToMenuButton:setFillColor(  0, 0.5, 1)
    backToMenuButton:setStrokeColor( 1, 1, 1 )
    backToMenuButton:addEventListener("tap", backToMenuButtonPress);
    local backToMenuButtonText = display.newText("Back to menu", backToMenuButton.x, backToMenuButton.y, "Arial", "20");
    backToMenuButtonText:setTextColor(1, 1, 1);

    -- Code displays a button that resets the graph and redoes calculations, along with formatting for said button
    local retryButton = display.newRoundedRect( optionsMenuBackground.x, optionsMenuBackground.y + 45 , 150, 50, 10 )
    retryButton.strokeWidth = 3
    retryButton:setFillColor( 0, 0.5, 1 )
    retryButton:setStrokeColor( 1, 1, 1 )
    retryButton:addEventListener("tap", tryAgain);
    local retryButtonButtonText = display.newText("Recalculate", retryButton.x, retryButton.y, "Arial", "20");
    retryButtonButtonText:setTextColor(1, 1, 1);

    -- Text entry field to change the amount of points generated in a scene, hide off screen until options menu is displayed
    pointEntryField = native.newTextField( optionsMenuBackground.x, optionsMenuBackground.y - 999, 180, 30 )
    pointEntryField.inputType = "number"
    pointEntryField:addEventListener("userInput", enterAmountOfPoints)
    pointEntryField.placeholder =  tostring(pointCount)

    -- Display for the number of points
    displayNumPoints = display.newText("Number of points: " .. pointCount, optionsMenuBackground.x, optionsMenuBackground.y - 80, "Arial", "20");
    displayNumPoints:setTextColor(0, 0.2, 1);

    --pointEntryField = native.newTextField( optionsMenuBackground.x, optionsMenuBackground.y - 30, 180, 30 )


    -- Add options menu objects to display group
    optionsMenu:insert(optionsMenuBackground);
    optionsMenu:insert(optionsMenuText);

    -- Adding buttons onto options menu
    optionsMenu:insert(backToMenuButton);
    optionsMenu:insert(backToMenuButtonText);

    -- Adding buttons onto options menu
    optionsMenu:insert(retryButton);
    optionsMenu:insert(retryButtonButtonText);

    -- Add point entry text and textfield into options display group
    sceneGroup:insert(pointEntryField);
    optionsMenu:insert(displayNumPoints);

    -- Changing visility of options menu to be invisible
    optionsMenu.isVisible = false;
    
end

-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        
    end
end

-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

        -- Hide all points once scene is off the device screen
        pointDisplay.isVisible = false;
        optionsMenu.isVisible = false;
    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene