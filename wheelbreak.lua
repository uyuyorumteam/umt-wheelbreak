local wheelBreakSpeed = 100 -- Speed at which the wheel breaks

--[[ Vehicle classes:
0: Compacts   1: Sedans   2: SUVs   3: Coupes   4: Muscle
5: Sports Classics   6: Sports   7: Super   8: Motorcycles   9: Off-road
10: Industrial   11: Utility   12: Vans   13: Cycles   14: Boats
15: Helicopters   16: Planes   17: Service   18: Emergency   19: Military
20: Commercial   21: Trains ]]
local excludedClasses = {
    [8] = true,
    [9] = true,
    [14] = true,
    [15] = true,
    [16] = true
}

--@param Vehicle class 
--@return boolean
local function isVehicleClassValid(class)
    return not excludedClasses[class]
end

CreateThread(function()
    while true do
        local waitLoop = 5000
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed,false)
            if GetPedInVehicleSeat(vehicle, -1) ~= 0 and isVehicleClassValid(GetVehicleClass(vehicle)) then
                waitLoop = 10
                local vehicleSpeed = math.ceil(GetEntitySpeed(vehicle) * 3.6)
                if HasEntityCollidedWithAnything(vehicle) and vehicleSpeed >= wheelBreakSpeed then
                    local randomWheelIndex = math.random(0,3) -- Wheel index to break off
                    --@see https://github.com/citizenfx/fivem/commit/46205c9ff15bdc9e19d81dd126500a854c8547e9
                    BreakOffVehicleWheel(vehicle, randomWheelIndex, true, false, true, false)
                    waitLoop = 5000
                end
            end
        end
        Wait(waitLoop)
    end
end)
