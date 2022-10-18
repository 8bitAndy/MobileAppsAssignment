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
    -- If options menu isn't showing and user presses button, then display menu
    else if optionsMenu.isVisible == false then
        optionsMenu.isVisible = true;
        end

    end
end

local function backToMenuButtonPress( event )
    
    
    timer.performWithDelay(500)
    print("back to menu button pressed")
    composer.gotoScene("mainMenu");
    composer.removeScene("errorCurve", true)
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
            end
        end

        print("There are " .. pointsUnderCurve .. " points under the straight line");
    
        -- Calculate area under the curve
        local temp = (pointsUnderCurve / totalPoints);
        local areaUnderCurve =  temp * areaOfRectangle

        -- Relative error of actual result, given as a percentage
        local relativeError = round(((math.abs((areaUnderCurve - 12.5) / 12.5)) * 100))
    
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



-- create()
function scene:create( event )
    local sceneGroup = self.view

    -- Tells the app that it has been initialized with a set number for pointCount
    appInit = true

    -- Create a new group for the options menu objects
    optionsMenu = display.newGroup()

    -- Code here runs when the scene is first created but has not yet appeared on screen
    print("in new scene \n")

    --generatePoints();
 

    -- Creating line for graph boundaries
    local yAxisLine = display.newLine( display.contentCenterX - 150, display.contentCenterY + 100 , display.contentCenterX - 150, display.contentCenterY - 200 )
    local xAxisLine = display.newLine( display.contentCenterX - 150, display.contentCenterY + 100 , display.contentCenterX + 150, display.contentCenterY + 100 )

    -- Change the colour of the line
    yAxisLine:setStrokeColor( 1, 1, 1, 1)
    -- Change the width of the axis line
    yAxisLine.strokeWidth = 4

    -- Change the colour of the line
    xAxisLine:setStrokeColor( 1, 1, 1, 1)
    -- Change the width of the axis line
    xAxisLine.strokeWidth = 4

    -- Options button
    local optionsButton = display.newRoundedRect( display.contentCenterX, display.contentCenterY + 275, 200, 50, 12 )
    local optionsButtonText = display.newText("Options", optionsButton.x, optionsButton.y, "Arial", "20");
    optionsButton.strokeWidth = 3
    optionsButton:setFillColor( 0, 0.5, 1 )
    optionsButton:setStrokeColor( 1, 1, 1 )
    -- Add button and button text into scene group
    sceneGroup:insert(optionsButton)
    sceneGroup:insert(optionsButtonText)

    -- title of graph
    local sceneText = display.newText("Error curve", display.contentCenterX, display.contentCenterY - 275, "Arial", "30");
    sceneText:setTextColor(1, 0, 1);

    -- Get area under curve and amount of points and put into a table
    local returnedResultsTable = generatePoints(pointCount);

    -- Display the total amount of points at the top of the screen
    local pointCountDisplay = display.newText("*using log of error", display.contentCenterX, display.contentCenterY - 250, "Arial", "16");
    pointCountDisplay:setTextColor(1, 1, 1);

    -- Assign values from table into variables for use later
    local areaUnderCurve = returnedResultsTable[0];
    local pointsUnderCurve = returnedResultsTable[1];
    local marginOfError = returnedResultsTable[2];


    -- Key for graph
    local actualAreaText = display.newText("Curve 1: ", display.contentCenterX, display.contentCenterY + 150, "Arial", "16");
    local resultText = display.newText("Curve 2: ", display.contentCenterX, display.contentCenterY + 175, "Arial", "16");
    local pointsUnderCurveText = display.newText("Curve 3: ", display.contentCenterX, display.contentCenterY + 200, "Arial", "16");
    local marginOfErrorText = display.newText("Curve 4: ", display.contentCenterX, display.contentCenterY + 225, "Arial", "16");

    -- Color key for each curve
    local curve1ColorKey = display.newRoundedRect( display.contentCenterX + 40, display.contentCenterY + 150, 12.5, 12.5, 0 )
    curve1ColorKey:setFillColor(1,0,0)
    sceneGroup:insert(curve1ColorKey)

    -- Color key for each curve
    local curve2ColorKey = display.newRoundedRect( display.contentCenterX + 40, display.contentCenterY + 175, 12.5, 12.5, 0 )
    curve2ColorKey:setFillColor(0,1,0)
    sceneGroup:insert(curve2ColorKey)

    -- Color key for each curve
    local curve3ColorKey = display.newRoundedRect( display.contentCenterX + 40, display.contentCenterY + 200, 12.5, 12.5, 0 )
    curve3ColorKey:setFillColor(0,0,1)
    sceneGroup:insert(curve3ColorKey)

    -- Color key for each curve
    local curve4ColorKey = display.newRoundedRect( display.contentCenterX + 40, display.contentCenterY + 225, 12.5, 12.5, 0 )
    curve4ColorKey:setFillColor(1,1,0)
    sceneGroup:insert(curve4ColorKey)


    -- Display for min and maximum x values
    displayminX = display.newText("10" , display.contentCenterX - 150, display.contentCenterY + 115 , "Arial", "16");
    displayminX:setTextColor(1, 0, 1);
    -- Display for min and maximum x values
    displaymaxX = display.newText("1,000,000" , display.contentCenterX + 120, display.contentCenterY + 115 , "Arial", "16");
    displaymaxX:setTextColor(1, 0, 1);
    -- put into scene group
    sceneGroup:insert(displayminX);
    sceneGroup:insert(displaymaxX);


    -- Labels for x axis
    -- Display for min and maximum x values
    displayX1000000 = display.newText("1,000,000" , display.contentCenterX + 120, display.contentCenterY + 115 , "Arial", "16");
    displayX1000000:setTextColor(1, 0, 1);
    -- put into scene group
    sceneGroup:insert(displayX1000000);

    -- Display for min and maximum x values
    displayX1000000 = display.newText("1,000,000" , display.contentCenterX + 120, display.contentCenterY + 115 , "Arial", "16");
    displayX1000000:setTextColor(1, 0, 1);
    -- put into scene group
    sceneGroup:insert(displayX1000000);

    -- Display for min and maximum x values
    displayX100000 = display.newText("100,000" , display.contentCenterX + 50, display.contentCenterY + 115 , "Arial", "16");
    displayX100000:setTextColor(1, 0, 1);
    -- put into scene group
    sceneGroup:insert(displayX100000);

    -- Display for min and maximum x values
    displayX10000 = display.newText("10,000" , display.contentCenterX - 10, display.contentCenterY + 115 , "Arial", "16");
    displayX10000:setTextColor(1, 0, 1);
    -- put into scene group
    sceneGroup:insert(displayX10000);

    -- Display for min and maximum x values
    displayX1000 = display.newText("1,000" , display.contentCenterX - 60, display.contentCenterY + 115 , "Arial", "16");
    displayX1000:setTextColor(1, 0, 1);
    -- put into scene group
    sceneGroup:insert(displayX1000);


    -- Display for min and maximum x values
    displayX100 = display.newText("100" , display.contentCenterX - 110, display.contentCenterY + 115 , "Arial", "16");
    displayX100:setTextColor(1, 0, 1);
    -- put into scene group
    sceneGroup:insert(displayX100);

    -- Creating test line of function y = x
    local functionLine1 = display.newLine( display.contentCenterX - 150, display.contentCenterY - 140, display.contentCenterX - 110, display.contentCenterY -70)
    -- Change the colour of the line
    functionLine1:setStrokeColor( 1, 0, 0, 1)
    -- Change the width of the axis line
    functionLine1.strokeWidth = 3;
    -- Add function line into scene group for composer scene handling
    sceneGroup:insert(functionLine1);

    -- add on the remaining points for the first RE curve display
    functionLine1:append(display.contentCenterX - 60, display.contentCenterY + 5, display.contentCenterX - 10, display.contentCenterY + 50, display.contentCenterX + 50, display.contentCenterY +70, display.contentCenterX + 120, display.contentCenterY +90)


    -- Creating test line of function y = x
    local functionLine2 = display.newLine( display.contentCenterX - 150, display.contentCenterY - 165, display.contentCenterX - 110, display.contentCenterY -100)
    -- Change the colour of the line
    functionLine2:setStrokeColor( 0, 1, 0)
    -- Change the width of the axis line
    functionLine2.strokeWidth = 3;
    -- Add function line into scene group for composer scene handling
    sceneGroup:insert(functionLine2);

    -- add on the remaining points for the first RE curve display
    functionLine2:append(display.contentCenterX - 60, display.contentCenterY - 45, display.contentCenterX - 10, display.contentCenterY + 45, display.contentCenterX + 50, display.contentCenterY +62.5, display.contentCenterX + 120, display.contentCenterY +85)


    -- Creating test line of function y = x
    local functionLine3 = display.newLine( display.contentCenterX - 150, display.contentCenterY - 120, display.contentCenterX - 110, display.contentCenterY -70)
    -- Change the colour of the line
    functionLine3:setStrokeColor( 0, 0, 1)
    -- Change the width of the axis line
    functionLine3.strokeWidth = 3;
    -- Add function line into scene group for composer scene handling
    sceneGroup:insert(functionLine3);

    -- add on the remaining points for the first RE curve display
    functionLine3:append(display.contentCenterX - 60, display.contentCenterY, display.contentCenterX - 10, display.contentCenterY + 60, display.contentCenterX + 100, display.contentCenterY +70, display.contentCenterX + 120, display.contentCenterY +72)


    -- Creating test line of function y = x
    local functionLine4 = display.newLine( display.contentCenterX - 150, display.contentCenterY - 105, display.contentCenterX - 110, display.contentCenterY -45)
    -- Change the colour of the line
    functionLine4:setStrokeColor( 1, 1, 0)
    -- Change the width of the axis line
    functionLine4.strokeWidth = 3;
    -- Add function line into scene group for composer scene handling
    sceneGroup:insert(functionLine4);

    -- add on the remaining points for the first RE curve display
    functionLine4:append(display.contentCenterX - 60, display.contentCenterY + 50, display.contentCenterX - 10, display.contentCenterY + 80, display.contentCenterX + 100, display.contentCenterY +90, display.contentCenterX + 120, display.contentCenterY +95)





    -- Labels for y axis
    displayY100 = display.newText("1.7" , display.contentCenterX - 130, display.contentCenterY - 185 , "Arial", "16");
    displayY100:setTextColor(1, 1, 1);
    -- put into scene group
    sceneGroup:insert(displayY100);

    
    -- Labels for y axis
    displayY1 = display.newText("1.0" , display.contentCenterX - 80, display.contentCenterY -90, "Arial", "16");
    displayY1:setTextColor(1, 1, 1);
    -- put into scene group
    sceneGroup:insert(displayY1);

    
    -- Labels for y axis
    displayY05 = display.newText("0.5" , display.contentCenterX - 130, display.contentCenterY - 30 , "Arial", "16");
    displayY05:setTextColor(1, 1, 1);
    -- put into scene group
    sceneGroup:insert(displayY05);

    -- Labels for y axis
    displayY01 = display.newText("0.1" , display.contentCenterX - 130, display.contentCenterY + 30  , "Arial", "16");
    displayY01:setTextColor(1, 1, 1);
    -- put into scene group
    sceneGroup:insert(displayY01);
    

    -- Put results and points under curve into scnee group
    sceneGroup:insert(actualAreaText)
    sceneGroup:insert(resultText);
    sceneGroup:insert(pointsUnderCurveText);
    sceneGroup:insert(marginOfErrorText);

    -- Add event handler to button
    optionsButton:addEventListener("tap", optionsButtonPress);

    -- Adding display text into the scene group
    sceneGroup:insert(sceneText)
    sceneGroup:insert(pointCountDisplay)
    
    -- Add objects into scene group
    sceneGroup:insert(optionsButton)
    sceneGroup:insert(optionsButtonText)
    sceneGroup:insert(yAxisLine)
    sceneGroup:insert(xAxisLine)

    -- Popup options menu code
    optionsMenuBackground = display.newRoundedRect( display.contentCenterX, display.contentCenterY - 25 , 250, 200, 10 )
    optionsMenuBackground.strokeWidth = 5
    optionsMenuBackground:setFillColor( 0, 0, 0 , 0.9)
    optionsMenuBackground:setStrokeColor( 1, 1, 1, 1)
    local optionsMenuText = display.newText("Options menu", optionsMenuBackground.x, optionsMenuBackground.y - 50, "Arial", "30");
    optionsMenuText:setTextColor(0, 0.2, 1);
    
    -- Code displays a button that takes user back to the menu, along with formatting for said button
    local backToMenuButton = display.newRoundedRect( optionsMenuBackground.x, optionsMenuBackground.y + 20 , 150, 50, 10 )
    backToMenuButton.strokeWidth = 3
    backToMenuButton:setFillColor(  0, 0.5, 1)
    backToMenuButton:setStrokeColor( 1, 1, 1 )
    backToMenuButton:addEventListener("tap", backToMenuButtonPress);
    local backToMenuButtonText = display.newText("Back to menu", backToMenuButton.x, backToMenuButton.y, "Arial", "20");
    backToMenuButtonText:setTextColor(1, 1, 1);


    -- Add options menu objects to display group
    optionsMenu:insert(optionsMenuBackground);
    optionsMenu:insert(optionsMenuText);

    -- Adding buttons onto options menu
    optionsMenu:insert(backToMenuButton);
    optionsMenu:insert(backToMenuButtonText);

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