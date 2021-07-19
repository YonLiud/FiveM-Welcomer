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

-- Callback from the server
RegisterNetEvent("callback", function(isNew)
    Citizen.Trace("Callback " .. tostring(isNew))
end)

-- Execute on player connect
function on_connect(source)
    DisplayText("Lorem Ipsum")
    TriggerServerEvent('check', GetPlayerName(PlayerId()))
    Citizen.Trace("\nRequest " .. GetPlayerName(PlayerId()) .. " - ")
end


function DisplayText(text)
    Citizen.CreateThread(function()
        greenr,greeng,greenb = 0,255,0
        yellowr,yellowg,yellowb = 255,180,0
        redr,redg,redb = 255,0,0
        local flag = true
        Citizen.SetTimeout(10000, function() flag=false end)
        repeat
            Citizen.Wait(1)
            SetTextFont(0)
            SetTextProportional(1)
            SetTextScale(0.0, 0.3)
            SetTextColour(128, 128, 200, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            AddTextComponentString(text)
            DrawText(0.405, 0.005)
        until flag == false
    end)
end



function math.round(num, numDecimalPlaces)
	return string.format("%.0f", num)
end