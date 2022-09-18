-----------------------------------------------------------------------------------------
--
-- main.lua
-- Application by Liam Andrews, Student Number 1054 8022, 11/09/2022
-----------------------------------------------------------------------------------------

-- Start of main

-- Initialization of the composer
--local composer = require( "composer" )



-- Change scene to first curve
--composer.gotoScene("mainMenu")



-- Trying to get curve 3 working
function generatePoints3()
        

    -- Input variables, fixed number of points is 10,000
    local totalPoints = 10000;
    -- Variable to hold the x and y length and height of the graph
    local graphDomain = 7;

    -- The amount of points that get placed under the function curve
    local pointsUnderCurve = 0;

    local minY = 0;
    local maxY = 51;

    -- Area of Cartesian plane
    local areaOfRectangle = graphDomain * maxY;
    
    -- If below the line then add one to points below the line
    for i=1, 10000, 1 do

        -- Generate a random floating point number
        local x = math.abs(math.random(-2, 4) + math.random());

        -- Generate a random floating point number
        local y = math.abs(math.random(minY, maxY - 1) + math.random());

        -- A point is under the curve if it meets this condition
        if  y <= (-(x^3) + (6 * (x ^ 2)) - x + 17) then
            pointsUnderCurve = pointsUnderCurve + 1;
        end
    end

    

    print("\nThere are " .. pointsUnderCurve .. " points under the cubic");
    pointsUnderCurve = pointsUnderCurve
    -- Calculate area under the curve
    local temp = (pointsUnderCurve / totalPoints);
    local areaUnderCurve =  temp * areaOfRectangle

    -- Relative error of actual result
    local relativeError = math.abs((areaUnderCurve - 222.2500) / 222.2500)

    print("Area under the curve is: " .. areaUnderCurve);
    print("Relative error is: " .. relativeError);
end

generatePoints3()