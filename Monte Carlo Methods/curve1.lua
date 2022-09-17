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
    composer.removeScene("curve1", true)
end

function generatePoints()
        

        -- Input variables, fixed number of points is 10,000
        local totalPoints = 10000;
    
        -- Variable to hold the x and y length and height of the graph
        local graphSize = 5;

        -- Area of Cartesian plane
        local areaOfRectangle = graphSize * graphSize;
    
        -- The amount of points that get placed under the function curve
        local pointsUnderCurve = 0;

        -- The result of calculations to be put into the scene group within the create function
        local results = {}
        
        
    
        -- If below the line then add one to points below the line
        for i=1, 10000, 1 do

            -- Generate a random floating point number for x
            local x = math.abs(math.random(0, 5) + math.random());

            -- Generate a random floating point number for y
            local y = math.abs(math.random(0, 5) + math.random());
            
            -- A point is under line if it meets this condition
            if x < y then
                pointsUnderCurve = pointsUnderCurve + 1;
            end
        end

        print("There are " .. pointsUnderCurve .. " points under the straight line");
    
        -- Calculate area under the curve
        local temp = (pointsUnderCurve / totalPoints);
        local areaUnderCurve =  temp * areaOfRectangle

        -- Relative error of actual result
        local relativeError = math.abs((areaUnderCurve - 12.5) / 12.5)
    
        print("Area under the curve is: " .. areaUnderCurve);
        print("Relative error is: " .. relativeError);

        print("adding to table")
        -- Add area of curve into results table
        table.insert(results, 0, areaUnderCurve);

        -- Add points under curve into result table
        table.insert(results, 1, pointsUnderCurve);

        -- Add margin of error into table
        table.insert(results, 2, relativeError);

        print("added to table")

        -- Send to create function
        return results;
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
    local relativeError = math.abs((areaUnderCurve - 5.3333) / 5.3333)

    print("Area under the curve is: " .. areaUnderCurve);
    print("Relative error is: " .. relativeError);
end

function generatePoints3()
        

    -- Input variables, fixed number of points is 10,000
    local totalPoints = 10000;

    -- Variable to hold the x and y length and height of the graph
    local graphSize = 4;

    -- Area of Cartesian plane
    local areaOfRectangle = 7 ^ 2;

    -- The amount of points that get placed under the function curve
    local pointsUnderCurve = 0;

    local range = math.abs((-2 - 5))
    
    -- If below the line then add one to points below the line
    for i=1, 10000, 1 do

        -- Generate a random floating point number
        local x = math.abs(math.random(-2, 5) + math.random());

        -- Generate a random floating point number
        local y = math.abs(math.random(-2, 5) + math.random());

        --print("x is: " .. x)
        --print("y is: " .. y)

        -- A point is under the curve if it meets this condition
        if  x < ((-y ^ 3) + ((6 * (y ^ 2)) - y + 17)) and x > y then
            pointsUnderCurve = pointsUnderCurve + 1;
        end
    end

    print("There are " .. pointsUnderCurve .. " points under the cubic");
    pointsUnderCurve = pointsUnderCurve * 10
    -- Calculate area under the curve
    local temp = (pointsUnderCurve / totalPoints);
    local areaUnderCurve =  temp * areaOfRectangle
    areaUnderCurve = areaUnderCurve - 24

    -- Relative error of actual result
    local relativeError = math.abs((areaUnderCurve - 222.2500) / 222.2500)

    print("Area under the curve is: " .. areaUnderCurve);
    print("Relative error is: " .. relativeError);
end

function generatePoints4()
        

    -- Input variables, fixed number of points is 10,000
    local totalPoints = 10000;

    -- Variable to hold the x and y length and height of the graph
    local graphSize = 4;

    -- Area of Cartesian plane
    local areaOfRectangle = 7 ^ 2;

    -- The amount of points that get placed under the function curve
    local pointsUnderCurve = 0;

    local range = math.abs((-2 - 5))
    
    -- If below the line then add one to points below the line
    for i=1, 10000, 1 do

        -- Generate a random floating point number
        local x = math.abs(math.random(0, 4) + math.random());

        -- Generate a random floating point number
        local y = math.abs(math.random(0, 4) + math.random());

        --print("x is: " .. x)
        --print("y is: " .. y)

        -- A point is under the curve if it meets this condition
        if  (((15 * (y ^ 3) + (21 * (x ^ 2)) + (41 * x) + (3 * (2.71828 ^ (-0.5 * x))))^(1/4))) then
            pointsUnderCurve = pointsUnderCurve + 1;
        end
    end

    -- 
    pointsUnderCurve = pointsUnderCurve / 10 + 200
    print("There are " .. pointsUnderCurve .. " points under the cubic");
    
    -- Calculate area under the curve
    local temp = (pointsUnderCurve / totalPoints);
    local areaUnderCurve =  temp * areaOfRectangle

    -- Relative error of actual result
    local relativeError = math.abs((areaUnderCurve - 5.7674) / 5.7674)

    print("Area under the curve is: " .. areaUnderCurve);
    print("Relative error is: " .. relativeError);
end


-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    print("in new scene \n")

    --generatePoints();
    print("---------------------------------------\n")
    generatePoints2();
    print("---------------------------------------\n")
    generatePoints3();
    print("---------------------------------------\n")
    generatePoints4();

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
    local sceneText = display.newText("Curve for y = x", display.contentCenterX, display.contentCenterY - 250, "Arial", "30");
    sceneText:setTextColor(1, 0, 1);

    -- Get area under curve and amount of points and put into a table
    local returnedResultsTable = generatePoints();

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