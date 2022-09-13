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


-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    print("in new scene \n")

        -- Set the seed for the random generator
    math.randomseed( os.time());

    -- Input variables, fixed number of points is 10,000
    local totalPoints = 10000;

    -- Variable to hold the x and y length and height of the graph
    local graphSize = 5;

    -- Area of Cartesian plane
    local areaOfRectangle = graphSize * graphSize;

    -- The amount of points that get placed under the function curve
    local pointsUnderCurve = math.random(1, 10000);

    print("There are " .. pointsUnderCurve .. " points under the curve");

    local temp = (pointsUnderCurve / totalPoints);
    local areaUnderCurve =  temp * areaOfRectangle

    print("Area under the curve is: " .. areaUnderCurve);

    -- Simple test for displaying results text onto device screen
    local resultText = display.newText("The area under the curve is " .. areaUnderCurve, display.contentCenterX, display.contentCenterY, "Arial", "16");
    local pointsUnderCurveText = display.newText("There are " .. pointsUnderCurve .. " points under the curve", display.contentCenterX, display.contentCenterY + 25, "Arial", "16");
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