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
    
    if optionsMenu.isVisible == true then
        optionsMenu.isVisible = false;
    else if optionsMenu.isVisible == false then
        optionsMenu.isVisible = true;
        end

    end
end

local function backToMenuButtonPress( event )
    
    
    timer.performWithDelay(500)
    print("back to menu button pressed")
    composer.gotoScene("mainMenu");
    composer.removeScene("curve1", true)
    optionsMenu.isVisible = false;
end

local function backButtonPress( event )
    
    
    timer.performWithDelay(500)
    print("Forward button pressed")
    composer.gotoScene("curve2");
    composer.removeScene("curve1", true)
    optionsMenu.isVisible = false;
end

local function forwardButtonPress( event )
    
    
    timer.performWithDelay(500)
    print("Back button pressed")
    composer.gotoScene("curve2");
    composer.removeScene("curve1", true)
    optionsMenu.isVisible = false;
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
    
    -- This detects the maximum value that y will take within the x limits of the curve
    for currentX = minimumX, maximumX, 0.001 do
        local currentY = (-(currentX^3) + (6 * (currentX ^ 2)) - currentX + 17)
        if currentY > maxY then
            maxY = currentY 
        end
    end

    print("This is the max y picked: " .. maxY)

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

    

    print("\nThere are " .. pointsUnderCurve .. " points under the cubic");
    -- Calculate area under the curve
    local temp = (pointsUnderCurve / totalPoints);
    local areaUnderCurve =  temp * areaOfRectangle

    -- Relative error of actual result
    local relativeError = math.abs((areaUnderCurve - 222.2500) / 222.2500)

    print("Area under the curve is: " .. areaUnderCurve);
    print("Relative error is: " .. relativeError);
end





-- Trying to get curve 4 working
function generatePoints4(numberOfPoints)
        

    -- Input variables, fixed number of points is 10,000
    local totalPoints = numberOfPoints;

    -- Calculate the domain of the graph by using the x upper and lower limit
    local minimumX = 0;
    local maximumX = 4;
    local graphDomain = math.abs(minimumX - maximumX);
    -- The highest and lowest y value used for limits
    local minY = 0;
    local maxY = 0;

    -- Eulers number, used for creating the curve below
    local e = 2.71828;
    
    -- This detects the maximum value that y will take within the x limits of the curve
    for currentX = minimumX, maximumX, 1 do
        local currentY = ((15 * currentX ^ 3) + (21 * currentX ^ 2) + (41 * currentX) + 3) ^ (1/4)  * (e ^ (-0.5 * currentX))
        if currentY > maxY then
            maxY = currentY 
        end
    end

    print("This is the max y picked: " .. maxY)

    -- The amount of points that get placed under the function curve
    local pointsUnderCurve = 0;

    -- Area of Cartesian plane
    local areaOfRectangle = graphDomain * maxY;
    
    -- If below the line then add one to points below the line
    for i=1, totalPoints, 1 do

        -- Generate a random floating point number
        local x = math.abs(math.random(minimumX, maximumX - 1) + math.random());

        -- Generate a random floating point number
        local y = minimumX + (maxY * math.random())

        -- A point is under the curve if it meets this condition
        if  y < ((15 * x ^ 3) + (21 * x ^ 2) + (41 * x) + 3) ^ (1/4)  * (e ^ (-0.5 * x)) then
            pointsUnderCurve = pointsUnderCurve + 1;
        end
    end

    
    print("\nThere are " .. pointsUnderCurve .. " points under curve 4");
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

    -- Create a new group for the options menu objects
    optionsMenu = display.newGroup()

    -- Code here runs when the scene is first created but has not yet appeared on screen
    print("in new scene \n")

    --generatePoints();
    generatePoints3(10000);
    generatePoints4(10000);

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
    local returnedResultsTable = generatePoints(10000);

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

    -- Popup options menu code
    local optionsMenuBackground = display.newRoundedRect( display.contentCenterX, display.contentCenterY - 25 , 250, 400, 10 )
    optionsMenuBackground.strokeWidth = 5
    optionsMenuBackground:setFillColor( 1, 1, 1 , 0.5)
    optionsMenuBackground:setStrokeColor( 1, 1, 1 )
    local optionsMenuText = display.newText("Options menu", optionsMenuBackground.x, optionsMenuBackground.y - 160, "Arial", "30");
    optionsMenuText:setTextColor(0, 0.2, 1);

    local backToMenuButton = display.newRoundedRect( optionsMenuBackground.x, optionsMenuBackground.y - 80 , 150, 50, 10 )
    backToMenuButton.strokeWidth = 3
    backToMenuButton:setFillColor( 0, 1, 0 , 0.6)
    backToMenuButton:setStrokeColor( 1, 1, 1 )
    backToMenuButton:addEventListener("tap", backToMenuButtonPress);
    local backToMenuButtonText = display.newText("back to menu", backToMenuButton.x, backToMenuButton.y, "Arial", "20");
    backToMenuButtonText:setTextColor(1, 1, 1);

    -- Add options menu objects to display group
    optionsMenu:insert(optionsMenuBackground);
    optionsMenu:insert(optionsMenuText);

    optionsMenu:insert(backToMenuButton);
    optionsMenu:insert(backToMenuButtonText);
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