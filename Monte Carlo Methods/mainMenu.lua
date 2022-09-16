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


local function buttonPress( event )
    
    
    timer.performWithDelay(1)
    print("button pressed changing scene")
    composer.gotoScene("curve1");
    composer.removeScene("mainMenu", true)
end

-- create()
function scene:create( event )
    local sceneGroup = self.view

    -- Code here runs when the scene is entirely on screen
    print("in new scene main menu\n")

    -- Simple test for displaying menu text
    local sceneText = display.newText("Main Menu", display.contentCenterX, display.contentCenterY - 200, "Arial", "40");
    
    local curve2Text = display.newText("Curve 2", display.contentCenterX, display.contentCenterY + 50, "Arial", "20");
    local curve3Text = display.newText("Curve 3", display.contentCenterX, display.contentCenterY + 100, "Arial", "20");
    local curve4Text = display.newText("Curve 4", display.contentCenterX, display.contentCenterY + 150, "Arial", "20");

    -- Test button
    local testButton = display.newRoundedRect( display.contentCenterX, display.contentCenterY, 150, 50, 12 )
    local curve1Text = display.newText("Curve 1", display.contentCenterX, display.contentCenterY, "Arial", "20");
    testButton.strokeWidth = 3
    testButton:setFillColor( 0, 0.5, 1 )
    testButton:setStrokeColor( 1, 1, 1 )

    testButton:addEventListener("tap", buttonPress)

    sceneGroup:insert(sceneText)
    sceneGroup:insert(testButton)
    sceneGroup:insert(curve1Text)
    sceneGroup:insert(curve2Text)
    sceneGroup:insert(curve3Text)
    sceneGroup:insert(curve4Text)
    


end

-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then


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