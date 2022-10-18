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


local function curve1ButtonPress( event )
    
    
    timer.performWithDelay(200)
    print("button pressed changing scene")
    composer.gotoScene("curve1");
    composer.removeScene("mainMenu", true)
end

local function curve2ButtonPress( event )
    
    
    timer.performWithDelay(200)
    print("button pressed changing scene")
    composer.gotoScene("curve2");
    composer.removeScene("mainMenu", true)
end

local function curve3ButtonPress( event )
    
    
    timer.performWithDelay(200)
    print("button pressed changing scene")
    composer.gotoScene("curve3");
    composer.removeScene("mainMenu", true)
end

local function curve4ButtonPress( event )
    
    
    timer.performWithDelay(200)
    print("button pressed changing scene")
    composer.gotoScene("curve4");
    composer.removeScene("mainMenu", true)
end

-- Takes user to error curve scene
local function errorCurveButtonPress( event )
    timer.performWithDelay(200)
    print("button pressed changing scene")
    composer.gotoScene("errorCurve");
    composer.removeScene("mainMenu", true)
end

-- close the app
local function exitButtonPress()
    native.requestExit()
end

-- create()
function scene:create( event )
    local sceneGroup = self.view

    -- Code to check if the app has an initial pointcount for the number of points to be generated
    if appInit == true then
    -- This else will only fire when the app first starts
    else
        --Global variable to hold the amount of points to be generated
        pointCount = 10000;
    end

    -- Simple test for displaying menu text
    local sceneText = display.newText("Monte Carlo\n   Methods", display.contentCenterX, display.contentCenterY - 200, "Arial", "40");


    -- Button for curve 1
    local curve1Button = display.newRoundedRect( display.contentCenterX, display.contentCenterY - 75, 150, 50, 12 )
    local curve1Text = display.newText("Curve 1", curve1Button.x, curve1Button.y, "Arial", "20");
    curve1Button.strokeWidth = 3
    curve1Button:setFillColor( 0, 0.5, 1 )
    curve1Button:setStrokeColor( 1, 1, 1 )
    curve1Button:addEventListener("tap", curve1ButtonPress)

    -- Button for curve 2
    local curve2Button = display.newRoundedRect( display.contentCenterX, display.contentCenterY + 0, 150, 50, 12 )
    local curve2Text = display.newText("Curve 2", curve2Button.x, curve2Button.y, "Arial", "20");
    curve2Button.strokeWidth = 3
    curve2Button:setFillColor( 0, 0.5, 1 )
    curve2Button:setStrokeColor( 1, 1, 1 )
    curve2Button:addEventListener("tap", curve2ButtonPress)

    -- Button for curve 3
    local curve3Button = display.newRoundedRect( display.contentCenterX, display.contentCenterY + 75, 150, 50, 12 )
    local curve3Text = display.newText("Curve 3", curve3Button.x, curve3Button.y, "Arial", "20");
    curve3Button.strokeWidth = 3
    curve3Button:setFillColor( 0, 0.5, 1 )
    curve3Button:setStrokeColor( 1, 1, 1 )
    curve3Button:addEventListener("tap", curve3ButtonPress)

    -- Button for curve 4
    local curve4Button = display.newRoundedRect( display.contentCenterX, display.contentCenterY + 150, 150, 50, 12 )
    local curve4Text = display.newText("Curve 4", curve4Button.x, curve4Button.y, "Arial", "20");
    curve4Button.strokeWidth = 3
    curve4Button:setFillColor( 0, 0.5, 1 )
    curve4Button:setStrokeColor( 1, 1, 1 )
    curve4Button:addEventListener("tap", curve4ButtonPress)

    -- Button for margin of error curve
    local MOEButton = display.newRoundedRect( display.contentCenterX, display.contentCenterY + 225, 150, 50, 12 )
    local MOEButtonText = display.newText("Error curve", MOEButton.x, MOEButton.y, "Arial", "20");
    MOEButton.strokeWidth = 3
    MOEButton:setFillColor( 0, 0.5, 1 )
    MOEButton:setStrokeColor( 1, 1, 1 )
    MOEButton:addEventListener("tap", errorCurveButtonPress)

    -- Button for closing the app
    local exitButton = display.newRoundedRect( display.contentCenterX - 90, display.contentCenterY + 310, 75, 50, 15 )
    local exitButtonText = display.newText("Exit", exitButton.x, exitButton.y, "Arial", "20");
    exitButton.strokeWidth = 3
    exitButton:setFillColor( 0.9, 0, 0)
    exitButton:setStrokeColor( 1, 1, 1 )
    exitButton:addEventListener("tap", exitButtonPress)

    

    
    -- Add everything into the scenegroup
    sceneGroup:insert(sceneText) 
    sceneGroup:insert(curve1Button)
    sceneGroup:insert(curve2Button)
    sceneGroup:insert(curve3Button)
    sceneGroup:insert(curve4Button)
    sceneGroup:insert(MOEButton)
    sceneGroup:insert(exitButton)
    sceneGroup:insert(curve1Text)
    sceneGroup:insert(curve2Text)
    sceneGroup:insert(curve3Text)
    sceneGroup:insert(curve4Text)
    sceneGroup:insert(MOEButtonText)
    sceneGroup:insert(exitButtonText)
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