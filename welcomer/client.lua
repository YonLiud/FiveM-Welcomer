local color = {
    r=255,
    b=255,
    g=255,
    a=1
}

-- For Debugging
RegisterCommand('welcomer', function(source)
    on_connect(source) --TODO Remove this on release
end, false)


-- On Player spawn
AddEventHandler("playerSpawned", function(spawn)
    on_connect(player)

end) 


AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    Citizen.Trace('The resource ' .. resourceName .. ' has been started.')
  end)
  
  

-- Callback from the server
RegisterNetEvent("callback", function(isNew)
    Citizen.Trace("Callback " .. tostring(isNew))
    if (isNew) then
        newPlayer()
    else
        returningPlayer()
end)

-- If New Player
function newPlayer()
    DisplayText("Welcome to [CHANGE ME]", 0.6, 0.2, 1, 1.2)
    DisplayText("To open the vMenu Panel, Click F1", 0.6, 0.27)
    DisplayText("To open the Custom Vehicles Panel, Click F3", 0.6, 0.31)
    DisplayText("Join our discord at discord.gg/[link]", 0.6, 0.35)
    
    DisplayText("MAKE SURE YOU READ OUR RULES", 0.6, 0.39, 4, 0.9999)
    DisplayText("To report someone, use /report ID Reason", 0.6, 0.45)
    

end


-- If Returning Player
function returningPlayer()
    DisplayText("Welcome Back", 0.6, 0.2, 1, 1.2)
end


-- Execute on player connect
function on_connect(source)
    TriggerServerEvent('check', GetPlayerName(PlayerId()))
    Citizen.Trace("\nRequest " .. GetPlayerName(PlayerId()) .. " - ")
end


function DisplayText(text,X, Y, font, size)
    Citizen.CreateThread(function()
        greenr,greeng,greenb = 0,255,0
        yellowr,yellowg,yellowb = 255,180,0
        redr,redg,redb = 255,0,0
        local flag = true
        -- Citizen.SetTimeout(10000, function() flag=false end)
        repeat
            Citizen.Wait(1)
            SetTextFont(font or 0)
            SetTextProportional(1)
            SetTextScale(size or 0.6,size or 0.6)
            SetTextColour(255, 102, 255, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(4, 255, 255, 255, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            AddTextComponentString(text)
            DrawText(X, Y) -- X, Y
        until flag == false
    end)
end



function math.round(num, numDecimalPlaces)
	return string.format("%.0f", num)
end