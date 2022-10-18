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
    if optionsMenu3.isVisible == true then
        optionsMenu3.isVisible = false;
        pointEntryField.y = optionsMenu3Background.y - 999
    -- If options menu isn't showing and user presses button, then display menu
    else if optionsMenu3.isVisible == false then
        pointEntryField.y = optionsMenu3Background.y - 30
        --pointEntryField.isVisible = false
        optionsMenu3.isVisible = true;
        end

    end
end

-- Redo the monte carlo method
local function tryAgain( event )
    timer.performWithDelay(500)
    print("retry button pressed")
    composer.gotoScene("curve3");
    composer.removeScene("curve3", true)
    optionsMenu3.isVisible = false;
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
    composer.removeScene("curve3", true)
    optionsMenu3.isVisible = false;
end

local function backButtonPress( event )
    timer.performWithDelay(500)
    composer.gotoScene("curve2");
    composer.removeScene("curve3", true)
    optionsMenu3.isVisible = false;
end

local function forwardButtonPress( event )
    
    
    timer.performWithDelay(500)
    composer.gotoScene("curve4");
    composer.removeScene("curve3", true)
    optionsMenu3.isVisible = false;
end

-- Rounds an float with the result having two decimal places
local function round(input)
    -- Formula for truncation
    local result = (math.floor(input * 100)) / 100;

    -- Return the given result
    return result
end


-- Trying to get curve 3 working
function generatePoints3(numberOfPoints)
        

    -- Input variables, fixed number of points is 10,000
    local totalPoints = numberOfPoints;

    -- Calculate the domain of the graph by using the x upper and lower limit
    local minimumX = -2;
    local maximumX = 5;
    local graphDomain = math.abs(minimumX  - maximumX);
    -- The highest and lowest y value used for limits
    local minY = 0;
    local maxY = 0;

    local results3 = {}
    
    -- This detects the maximum value that y will take within the x limits of the curve
    for currentX = minimumX, maximumX, 0.001 do
        local currentY = (-(currentX^3) + (6 * (currentX ^ 2)) - currentX + 17)
        if currentY > maxY then
            maxY = currentY 
        end
    end

    -- The amount of points that get placed under the function curve
    local pointsUnderCurve = 0;

    -- Area of Cartesian plane
    local areaOfRectangle = graphDomain * maxY;
    
    -- If below the line then add one to points below the line
    for i=1, totalPoints, 1 do

        -- Generate a random floating point number
        local x = math.abs(math.random(minimumX, maximumX - 1));

        -- Generate a random floating point number

        local y = minimumX + (maxY * math.random())

        -- A point is under the curve if it meets this condition
        if  y <= (-(x^3) + (6 * (x ^ 2)) - x + 17) then
            pointsUnderCurve = pointsUnderCurve + 1;
        end
    end

    
    -- Calculate area under the curve
    local temp = (pointsUnderCurve / totalPoints);
    local areaUnderCurve =  temp * areaOfRectangle

    -- Relative error of actual result
    local relativeError = round(((math.abs((areaUnderCurve - 222.2500) / 222.2500)) * 100))

    -- Add area of curve into results table
    table.insert(results3, 0, areaUnderCurve);

    -- Add points under curve into result table
    table.insert(results3, 1, pointsUnderCurve);

    -- Add margin of error into table
    table.insert(results3, 2, relativeError);


    -- Send to create function
    return results3;
end

-- create()
function scene:create( event )
    local sceneGroup = self.view

    -- Tells the app that it has been initialized with a set number for pointCount
    appInit = true

    -- Create a new group for the options menu objects
    optionsMenu3 = display.newGroup()

    -- Code here runs when the scene is first created but has not yet appeared on screen
    -- Creating line for graph boundaries
    local yAxisLine = display.newLine( display.contentCenterX - 0, display.contentCenterY + 100 , display.contentCenterX - 0, display.contentCenterY - 200 )
    local xAxisLine = display.newLine( display.contentCenterX - 150, display.contentCenterY + 100 , display.contentCenterX + 150, display.contentCenterY + 100 )

    -- Change the colour of the line
    yAxisLine:setStrokeColor( 1, 1, 1, 1)
    -- Change the width of the axis line
    yAxisLine.strokeWidth = 2

    -- Change the colour of the line
    xAxisLine:setStrokeColor( 1, 1, 1, 1)
    -- Change the width of the axis line
    xAxisLine.strokeWidth = 4


    -- initial starting point of curve
    local functionLine = display.newLine( display.contentCenterX, display.contentCenterY - 30, display.contentCenterX + 0.0001, display.contentCenterY - 30)

    -- Create parabola positive side
    for point = 0, 42, 0.01 do
        functionLine:append(display.contentCenterX + point, display.contentCenterY - (((-point^3 + ((6* point)^2) - point + 17) * 0.01)))
    end

    -- initial starting point of curve
    local functionLine2 = display.newLine( display.contentCenterX, display.contentCenterY, display.contentCenterX + 0.0001, display.contentCenterY)
    -- Create curve on negative side
    for point = 0, -20, -0.01 do
        functionLine2:append(display.contentCenterX + point, display.contentCenterY - (((-point^3 + ((6* point)^2) - point + 17) * 0.01)))
    end

    -- Change the colour of the line
    functionLine2:setStrokeColor( 1, 0, 0, 1)
    -- Change the width of the axis line
    functionLine2.strokeWidth = 3;
    -- Add function line into scene group for composer scene handling
    sceneGroup:insert(functionLine2);

    -- Change the colour of the line
    functionLine:setStrokeColor( 1, 0, 0, 1)
    -- Change the width of the axis line
    functionLine.strokeWidth = 3;
    -- Add function line into scene group for composer scene handling
    sceneGroup:insert(functionLine);

    -- Options button
    local optionsButton = display.newRoundedRect( display.contentCenterX, display.contentCenterY + 275, 150, 50, 12 )
    local optionsButtonText = display.newText("Options", optionsButton.x, optionsButton.y, "Arial", "20");
    optionsButton.strokeWidth = 3
    optionsButton:setFillColor( 0, 0.5, 1 )
    optionsButton:setStrokeColor( 1, 1, 1 )
    -- Add button and button text into scene group
    sceneGroup:insert(optionsButton)
    sceneGroup:insert(optionsButtonText)

    -- back button
    local backButton = display.newRoundedRect( display.contentCenterX - 110, display.contentCenterY + 275, 50, 50, 10 )
    local backButtonText = display.newText("<", backButton.x, backButton.y, "Arial", "20");
    backButton.strokeWidth = 3
    backButton:setFillColor( 0, 0.5, 1 )
    backButton:setStrokeColor( 1, 1, 1 )
    -- Add button and button text into scene group
    sceneGroup:insert(backButton)
    sceneGroup:insert(backButtonText)

    -- forward button
    local forwardButton = display.newRoundedRect( display.contentCenterX + 110, display.contentCenterY + 275, 50, 50, 10 )
    local forwardButtonText = display.newText(">", forwardButton.x, forwardButton.y, "Arial", "20");
    forwardButton.strokeWidth = 3
    forwardButton:setFillColor( 0, 0.5, 1 )
    forwardButton:setStrokeColor( 1, 1, 1 )
    -- Add button and button text into scene group
    sceneGroup:insert(forwardButton)
    sceneGroup:insert(forwardButtonText)

    -- title of graph
    -- title of graph/function to be displayed at top of screen
    local sceneText = display.newImageRect( "curve3.png", 300, 150)
    sceneText.x = display.contentCenterX
    sceneText.y = display.contentCenterY - 275

    -- Display the total amount of points at the top of the screen
    local pointCountDisplay = display.newText("Total number of points generated: " .. pointCount, display.contentCenterX, display.contentCenterY - 240, "Arial", "16");
    pointCountDisplay:setTextColor(1, 1, 1);

    -- Get area under curve and amount of points and put into a table
    local returnedResultsTable = generatePoints3(pointCount);

    -- Assign values from table into variables for use later
    local areaUnderCurve = returnedResultsTable[0];
    local pointsUnderCurve = returnedResultsTable[1];
    local marginOfError = returnedResultsTable[2];

    -- Simple test for displaying results text onto device screen
    local actualAreaText = display.newText("The actual area under the curve is 222.25", display.contentCenterX, display.contentCenterY + 150, "Arial", "16");

    -- Holds the display text value for area of curve
    local resultText

    -- Holds the display text value for area of curve
    local marginOfErrorText
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
    displayminX = display.newText("-2" , display.contentCenterX - 150, display.contentCenterY + 115 , "Arial", "16");
    displayminX:setTextColor(1, 0, 1);
    -- Display for min and maximum x values
    displaymaxX = display.newText("5" , display.contentCenterX + 150, display.contentCenterY + 115 , "Arial", "16");
    displaymaxX:setTextColor(1, 0, 1);
    -- put into scene group
    sceneGroup:insert(displayminX);
    sceneGroup:insert(displaymaxX);


    -- Put results and points under curve into scene group
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

    sceneGroup:insert(sceneText)
    sceneGroup:insert(pointCountDisplay)
    
    -- Add objects into scene group
    sceneGroup:insert(optionsButton)
    sceneGroup:insert(optionsButtonText)
    sceneGroup:insert(yAxisLine)
    sceneGroup:insert(xAxisLine)

    -- Popup options menu code
    optionsMenu3Background = display.newRoundedRect( display.contentCenterX, display.contentCenterY - 25 , 250, 400, 10 )
    optionsMenu3Background.strokeWidth = 5
    optionsMenu3Background:setFillColor( 0, 0, 0 , 0.9)
    optionsMenu3Background:setStrokeColor( 1, 1, 1, 1)
    local optionsMenu3Text = display.newText("Options menu", optionsMenu3Background.x, optionsMenu3Background.y - 160, "Arial", "30");
    optionsMenu3Text:setTextColor(0, 0.2, 1);
    
    -- Code displays a button that takes user back to the menu, along with formatting for said button
    local backToMenuButton = display.newRoundedRect( optionsMenu3Background.x, optionsMenu3Background.y + 120 , 150, 50, 10 )
    backToMenuButton.strokeWidth = 3
    backToMenuButton:setFillColor(  0, 0.5, 1)
    backToMenuButton:setStrokeColor( 1, 1, 1 )
    backToMenuButton:addEventListener("tap", backToMenuButtonPress);
    local backToMenuButtonText = display.newText("Back to menu", backToMenuButton.x, backToMenuButton.y, "Arial", "20");
    backToMenuButtonText:setTextColor(1, 1, 1);

    -- Code displays a button that resets the graph and redoes calculations, along with formatting for said button
    local retryButton = display.newRoundedRect( optionsMenu3Background.x, optionsMenu3Background.y + 45 , 150, 50, 10 )
    retryButton.strokeWidth = 3
    retryButton:setFillColor( 0, 0.5, 1 )
    retryButton:setStrokeColor( 1, 1, 1 )
    retryButton:addEventListener("tap", tryAgain);
    local retryButtonButtonText = display.newText("Recalculate", retryButton.x, retryButton.y, "Arial", "20");
    retryButtonButtonText:setTextColor(1, 1, 1);

    -- Text entry field to change the amount of points generated in a scene, hide off screen until options menu is displayed
    pointEntryField = native.newTextField( optionsMenu3Background.x, optionsMenu3Background.y - 999, 180, 30 )
    pointEntryField.inputType = "number"
    pointEntryField:addEventListener("userInput", enterAmountOfPoints)
    pointEntryField.placeholder =  tostring(pointCount)

    -- Display for the number of points
    displayNumPoints = display.newText("Number of points: " .. pointCount, optionsMenu3Background.x, optionsMenu3Background.y - 80, "Arial", "20");
    displayNumPoints:setTextColor(0, 0.2, 1);

    -- Add options menu objects to display group
    optionsMenu3:insert(optionsMenu3Background);
    optionsMenu3:insert(optionsMenu3Text);

    -- Adding buttons onto options menu
    optionsMenu3:insert(backToMenuButton);
    optionsMenu3:insert(backToMenuButtonText);

    -- Adding buttons onto options menu
    optionsMenu3:insert(retryButton);
    optionsMenu3:insert(retryButtonButtonText);

    -- Add point entry text and textfield into options display group
    sceneGroup:insert(pointEntryField);
    optionsMenu3:insert(displayNumPoints);

    -- Changing visility of options menu to be invisible
    optionsMenu3.isVisible = false;
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
        -- Changing visility of options menu to be invisible
    optionsMenu3.isVisible = false;
        
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