AddEventHandler('onClientMapStart', function()
end)

Citizen.CreateThread(function()
    
	while true do

		Citizen.Wait(1000)

        if Config.ui.showHealth and Config.dynamicUI then
            local vida = GetEntityHealth(PlayerPedId()) - 100

            if vida < Config.percentages.healthPercent then
                SendNUIMessage({ action = 'element', task = 'enable', value = 'health' })
            else
                SendNUIMessage({ action = 'element', task = 'disable', value = 'health' })
            end
        end

        if Config.ui.showDrunk and Config.dynamicUI then
            TriggerEvent('esx_status:getStatus', 'drunk', function(status)
                if status.val > Config.percentages.drunkPercent * 10000 then
                    SendNUIMessage({ action = 'element', task = 'enable', value = 'drunk' })
                else
                    SendNUIMessage({ action = 'element', task = 'disable', value = 'drunk' })
                end
            end)
        end

        if Config.ui.showStress and Config.dynamicUI then
            TriggerEvent('esx_status:getStatus', 'stress', function(status)
                if status.val > Config.percentages.stressPercent * 10000 then
                    SendNUIMessage({ action = 'element', task = 'enable', value = 'stress' })
                else
                    SendNUIMessage({ action = 'element', task = 'disable', value = 'stress' })
                end
            end)
        end
        
        if Config.ui.showHunger and Config.dynamicUI then
            TriggerEvent('esx_status:getStatus', 'hunger', function(status)
                if status.val < Config.percentages.hungerPercent * 10000 then
                    SendNUIMessage({ action = 'element', task = 'enable', value = 'hunger' })
                else
                    SendNUIMessage({ action = 'element', task = 'disable', value = 'hunger' })
                end
            end)
        end
        
        if Config.ui.showThirst and Config.dynamicUI then
            TriggerEvent('esx_status:getStatus', 'thirst', function(status)
                if status.val < Config.percentages.thirstPercent * 10000 then
                    SendNUIMessage({ action = 'element', task = 'enable', value = 'thirst' })
                else
                    SendNUIMessage({ action = 'element', task = 'disable', value = 'thirst' })
                end
            end)
        end

        if Config.ui.showDynamicMinimap then
            local radarEnabled = IsRadarEnabled()
    
            if not IsPedInAnyVehicle(PlayerPedId()) and radarEnabled then
                DisplayRadar(false)
            elseif IsPedInAnyVehicle(PlayerPedId()) and not radarEnabled then
                DisplayRadar(true)
            end
    
        else
            DisplayRadar(true)
    
        end

        if Config.healthRegen then
            SetPlayerHealthRechargeMultiplier(PlayerId(), 1.0)
        else
            SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
        end


    end
end)

Citizen.CreateThread(function()
    while true do
        HideHudComponentThisFrame( 1 ) -- Wanted Stars
        HideHudComponentThisFrame( 2 ) -- Weapon Icon
        HideHudComponentThisFrame( 3 ) -- Cash
        HideHudComponentThisFrame( 4 ) -- MP Cash
        HideHudComponentThisFrame( 6 ) -- Vehicle Name
        HideHudComponentThisFrame( 7 ) -- Area Name
        HideHudComponentThisFrame( 8 ) -- Vehicle Class      
        HideHudComponentThisFrame( 9 ) -- Street Name
        HideHudComponentThisFrame( 13 ) -- Cash Change
        HideHudComponentThisFrame( 17 ) -- Save Game  
        HideHudComponentThisFrame( 20 ) -- Weapon Stats
        Citizen.Wait(0)
    end
end)