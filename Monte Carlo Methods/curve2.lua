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
    
    
    timer.performWithDelay(500)
    print("Options button pressed")
    composer.gotoScene("mainMenu");
    composer.removeScene("curve2", true)
end

local function backButtonPress( event )
    
    
    timer.performWithDelay(500)
    print("Back button pressed")
    composer.gotoScene("curve1");
    composer.removeScene("curve2", true)
end

local function forwardButtonPress( event )
    
    
    timer.performWithDelay(500)
    print("forward button pressed")
    composer.gotoScene("curve1");
    composer.removeScene("curve2", true)
end


function generatePoints2()
        

    -- Input variables, fixed number of points is 10,000
    local totalPoints = 10000;

    -- Variable to hold the x and y length and height of the graph
    local graphSize = 4;

    -- Area of Cartesian plane
    local areaOfRectangle = graphSize ^ 2;

    -- The amount of points that get placed under the function curve
    local pointsUnderCurve = 0;

    -- table of results to be returned
    local results2 = {}
    
    -- If below the line then add one to points below the line
    for i=1, 10000, 1 do

        -- Generate a random floating point number
        local x = math.abs(math.random(0, 3) + math.random());

        -- Generate a random floating point number
        local y = math.abs(math.random(-2, 1) + math.random());

        -- A point is under the curve if it meets this condition
        if  x < (y ^ 2) then
            pointsUnderCurve = pointsUnderCurve + 1;
        end
    end

    print("There are " .. pointsUnderCurve .. " points under the quadratic");
    
    -- Calculate area under the curve
    local temp = (pointsUnderCurve / totalPoints);
    local areaUnderCurve =  temp * areaOfRectangle

    -- Relative error of actual result
    local relativeError = (math.abs((areaUnderCurve - 5.3333) / 5.3333))

    print("Area under the curve is: " .. areaUnderCurve);
    print("Relative error is: " .. relativeError);

    print("adding to table")
    -- Add area of curve into results table
    table.insert(results2, 0, areaUnderCurve);

    -- Add points under curve into result table
    table.insert(results2, 1, pointsUnderCurve);

    -- Add margin of error into table
    table.insert(results2, 2, relativeError);

    print("added to table")

    print("values from table")
    print(results2[0])
    print(results2[1])
    print(results2[2])

    -- Send to create function
    return results2;
end

-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    print("in new scene \n")

    -- Creating line for graph boundaries
    local yAxisLine = display.newLine( display.contentCenterX, display.contentCenterY + 100 , display.contentCenterX, display.contentCenterY - 200 )
    local xAxisLine = display.newLine( display.contentCenterX - 150, display.contentCenterY + 100 , display.contentCenterX + 150, display.contentCenterY + 100 )

    -- Creating test line of function y = x
    --local functionLine = display.newLine( display.contentCenterX - 120, display.contentCenterY - 150, display.contentCenterX + 120, display.contentCenterY - 150)
    -- START PLACE( display.contentCenterX - 120, display.contentCenterY - 150)
    -- END PLACE( display.contentCenterX + 120, display.contentCenterY - 150)

    -- initial starting point of curve
    local functionLine = display.newLine( display.contentCenterX, display.contentCenterY, display.contentCenterX + 0.0001, display.contentCenterY)

    -- Create parabola positive side
    for point = 0, 130, 0.01 do
        functionLine:append(display.contentCenterX + point, display.contentCenterY - (((point^2) * 0.018) - 100))
    end

    -- initial starting point of curve
    local functionLine2 = display.newLine( display.contentCenterX, display.contentCenterY, display.contentCenterX + 0.0001, display.contentCenterY)
    -- Create curve on negative side
    for point = 0, -130, -0.01 do
        functionLine2:append(display.contentCenterX + point, display.contentCenterY - (((point^2) * 0.018) - 100))
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
    local optionsButton = display.newRoundedRect( display.contentCenterX, display.contentCenterY + 250, 150, 50, 12 )
    local optionsButtonText = display.newText("Options", optionsButton.x, optionsButton.y, "Arial", "20");
    optionsButton.strokeWidth = 3
    optionsButton:setFillColor( 0, 0.5, 1 )
    optionsButton:setStrokeColor( 1, 1, 1 )
    -- Add button and button text into scene group
    sceneGroup:insert(optionsButton)
    sceneGroup:insert(optionsButtonText)

    -- Options button
    local backButton = display.newRoundedRect( display.contentCenterX - 110, display.contentCenterY + 250, 50, 50, 10 )
    local backButtonText = display.newText("<", backButton.x, backButton.y, "Arial", "20");
    backButton.strokeWidth = 3
    backButton:setFillColor( 0, 0.5, 1 )
    backButton:setStrokeColor( 1, 1, 1 )
    -- Add button and button text into scene group
    sceneGroup:insert(backButton)
    sceneGroup:insert(backButtonText)

    -- Options button
    local forwardButton = display.newRoundedRect( display.contentCenterX + 110, display.contentCenterY + 250, 50, 50, 10 )
    local forwardButtonText = display.newText(">", forwardButton.x, forwardButton.y, "Arial", "20");
    forwardButton.strokeWidth = 3
    forwardButton:setFillColor( 0, 0.5, 1 )
    forwardButton:setStrokeColor( 1, 1, 1 )
    -- Add button and button text into scene group
    sceneGroup:insert(forwardButton)
    sceneGroup:insert(forwardButtonText)

    -- title of graph
    local sceneText = display.newText("Curve for y = x^2", display.contentCenterX, display.contentCenterY - 250, "Arial", "30");
    sceneText:setTextColor(1, 0, 1);

    -- Get area under curve and amount of points and put into a table
    local returnedResultsTable = generatePoints2();

    -- Assign values from table into variables for use later
    local areaUnderCurve = returnedResultsTable[0];
    local pointsUnderCurve = returnedResultsTable[1];
    local marginOfError = returnedResultsTable[2];

    -- Simple test for displaying results text onto device screen
    local resultText = display.newText("The area under the curve is " .. areaUnderCurve, display.contentCenterX, display.contentCenterY + 150, "Arial", "16");
    local pointsUnderCurveText = display.newText("There are " .. pointsUnderCurve .. " points under the curve", display.contentCenterX, display.contentCenterY + 175, "Arial", "16");
    local marginOfErrorText = display.newText("The margin of error is " .. marginOfError, display.contentCenterX, display.contentCenterY + 200, "Arial", "16");

    -- Put results and points under curve into scnee group
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
    -- Add objects into scene group
    sceneGroup:insert(optionsButton)
    sceneGroup:insert(optionsButtonText)
    sceneGroup:insert(yAxisLine)
    sceneGroup:insert(xAxisLine)

    
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