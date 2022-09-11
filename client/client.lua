ESX = nil

--[[CreateThread(function()
	while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Wait(0) end
	while ESX.GetPlayerData().job == nil do Wait(100) end
	ESX.PlayerData = ESX.GetPlayerData()
end)]]--

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
  PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  ESX.PlayerData.job = job
end)

-- Player status
Citizen.CreateThread(function()

	while true do
		Citizen.Wait(500)

		local playerStatus 
		local showPlayerStatus = 0
		playerStatus = { action = 'setStatus', status = {} }

		if Config.ui.showHealth then
			showPlayerStatus = (showPlayerStatus+1)

			playerStatus['isdead'] = false

			playerStatus['status'][showPlayerStatus] = {
				name = 'health',
				value = GetEntityHealth(PlayerPedId()) - 100
			}

			if IsEntityDead(PlayerPedId()) then
				playerStatus.isdead = true
			end
		end

		
		if Config.ui.showDrunk then
			showPlayerStatus = (showPlayerStatus+1)

			TriggerEvent('esx_status:getStatus', 'drunk', function(status)
				playerStatus['status'][showPlayerStatus] = {
					name = 'drunk',
					value = math.floor(status.getPercent())
				}
			end)
		end
		
	
		if Config.ui.showStress  then
			showPlayerStatus = (showPlayerStatus+1)

			TriggerEvent('esx_status:getStatus', 'stress', function(status)
				playerStatus['status'][showPlayerStatus] = {
					name = 'stress',
					value = math.floor(status.getPercent())
				}
			end)
		end

		

		if showPlayerStatus > 0 then
			SendNUIMessage(playerStatus)
		end

	TriggerEvent('esx:getSharedObject', function(obj)
  		ESX = obj
  		ESX.PlayerData = ESX.GetPlayerData()
  	end)


	  	local playerStatus 
  	local showPlayerStatus = 0
  	playerStatus = { action = 'setStatus', status = {} }


  	if Config.ui.showHunger then
  		showPlayerStatus = (showPlayerStatus+1)

  		TriggerEvent('esx_status:getStatus', 'hunger', function(status)
  			playerStatus['status'][showPlayerStatus] = {
  				name = 'hunger',
  				value = math.floor(100-status.getPercent())
  			}
  		end)

  	end

  	if Config.ui.showThirst then
  		showPlayerStatus = (showPlayerStatus+1)

  		TriggerEvent('esx_status:getStatus', 'thirst', function(status)
  			playerStatus['status'][showPlayerStatus] = {
  				name = 'thirst',
  				value = math.floor(100-status.getPercent())
  			}
  		end)
  	end

  	if showPlayerStatus > 0 then
  	    SendNUIMessage(playerStatus)
  	end
    end

end)



AddEventHandler('esx:onPlayerSpawn', function()
	if Config.showServerLogo then
	SendNUIMessage({ action = 'setLogo', value = Config.serverLogo })
	end
	if Config.ui.showHealth then
		SendNUIMessage({ action = 'element', task = 'enable', value = 'health' })
	end
	if Config.ui.showDrunk then
		SendNUIMessage({ action = 'element', task = 'enable', value = 'drunk' })
	end
	if Config.ui.showStress then
		SendNUIMessage({ action = 'element', task = 'enable', value = 'stress' })
	end
	if Config.ui.showHunger then
		SendNUIMessage({ action = 'element', task = 'enable', value = 'hunger' })
	end
	if Config.ui.showThirst then
		SendNUIMessage({ action = 'element', task = 'enable', value = 'thirst' })
	end
end)


function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

exports('createStatus', function(args)
	local statusCreation = { action = 'createStatus', status = args['status'], color = args['color'], icon = args['icon'] }
	SendNUIMessage(statusCreation)
end)

exports('setStatus', function(args)
	local playerStatus = { action = 'setStatus', status = {
		{ name = args['name'], value = args['value'] }
	}}
	SendNUIMessage(playerStatus)
end)