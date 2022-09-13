-----------------------------------------------------------------------------------------
--
-- main.lua
-- Application by Liam Andrews, Student Number 1054 8022, 11/09/2022
-----------------------------------------------------------------------------------------

-- Start of main

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