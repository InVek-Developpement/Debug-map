Citizen.CreateThread(function()
    Citizen.Wait(1000)

    while true do
        local playerPed = PlayerPedId()
        local targetEntity = playerPed

        if IsEntityDead(playerPed) or not DoesEntityExist(playerPed) then
            Citizen.Wait(1000)
        else
            local flag_prompt = false
            local veh = GetVehiclePedIsIn(playerPed, false)

            if veh ~= 0 then
                targetEntity = veh
            end

            local coords = GetEntityCoords(targetEntity)
            local _, z = GetGroundZFor_3dCoord(coords.x, coords.y, 150.0, 0)

            if coords.z < config.z_check then
                if not (IsPedSwimming(playerPed) or IsPedSwimmingUnderWater(playerPed) or (not IsPedFalling(playerPed) and veh == 0)) then
                    if IsPedFalling(playerPed) or (veh ~= 0 and IsEntityInAir(veh)) then
                        flag_prompt = true
                    end
                end

                if flag_prompt then
                    drawTxt(config.displayText, 0.5, 0.8, 0.4, {r=255, g=0, b=0, a=255}) -- Rouge pur
                end

                if IsControlJustReleased(0, config.key) and flag_prompt then
                    ClearPedTasksImmediately(playerPed)

                    if config.preset then
                        SetEntityCoordsNoOffset(targetEntity, config.coords.x, config.coords.y, config.coords.z, true, false, false)
                    else
                        SetEntityCoordsNoOffset(targetEntity, coords.x, coords.y, z, true, false, false)
                    end

                    if veh ~= 0 then
                        SetPedIntoVehicle(playerPed, veh, -1)
                    end

                    if config.freeze then
                        FreezeEntityPosition(playerPed, true)
                        Citizen.Wait(config.freeze_time * 1000)
                        FreezeEntityPosition(playerPed, false)
                    end
                end
            end
        end

        Citizen.Wait(5)
    end
end)

function drawTxt(text, x, y, scale, color)
    SetTextFont(0)
    SetTextScale(0.0, scale)
    SetTextColour(color.r, color.g, color.b, color.a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextOutline()
    SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end




