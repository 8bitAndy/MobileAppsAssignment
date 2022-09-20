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
function generatePoints4()
        

    -- Input variables, fixed number of points is 10,000
    local totalPoints = 10000;

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

    local range = math.abs(maxY - minY)
    print("range is: " .. range)

    -- The amount of points that get placed under the function curve
    local pointsUnderCurve = 0;

    -- Area of Cartesian plane
    local areaOfRectangle = graphDomain * maxY;
    
    -- If below the line then add one to points below the line
    for i=1, totalPoints, 1 do

        -- Generate a random floating point number
        local x = math.abs(math.random(minimumX, maximumX - 1) + math.random());

        -- Generate a random floating point number
        local y = minimumX + (range * math.random())

        -- A point is under the curve if it meets this condition
        if  y < ((15 * x ^ 3) + (21 * x ^ 2) + (41 * x) + 3) ^ (1/4)  * (e ^ (-0.5 * x)) then
            pointsUnderCurve = pointsUnderCurve + 1;
        end
    end

    
    print("\nThere are " .. pointsUnderCurve .. " points under the cubic");
    -- Calculate area under the curve
    local temp = (pointsUnderCurve / totalPoints);
    local areaUnderCurve =  temp * areaOfRectangle

    -- Relative error of actual result
    local relativeError = math.abs((areaUnderCurve - 5.7674) / 5.7674)

    print("Area under the curve is: " .. areaUnderCurve);
    print("Relative error is: " .. relativeError);
end


generatePoints3()
generatePoints4()