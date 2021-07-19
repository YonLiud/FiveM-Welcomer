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
    TriggerServerEvent("connection1")
end) 

-- Callback from the server
RegisterNetEvent("callback", function(isNew)
    Citizen.Trace("Callback " .. tostring(isNew))
end)

-- Execute on player connect
function on_connect(source)
    TriggerServerEvent('check', GetPlayerName(PlayerId()))
    Citizen.Trace("\nRequest " .. GetPlayerName(PlayerId()) .. " - ")
end

function ifNewPlayer()
    Citizen.CreateThread(function()
        local start = os.time()
        --repeat until os.time() > start + 10 do
        while true do
            -- The Text
            Citizen.Wait(5)
            SetTextFont(0)  -- 0 -> 4
            SetTextScale(0.4, 0.4)
            SetTextColour(color.r, color.g, color.b, color.a)
            setTextEntry("STRING")
            AddTextComponentString("Welcome")
            DrawText(0.5, 0.5)

            -- The Rectangle
            DrawRect(150,100,3.2,0.05,color.r,color.g,color.b,color.a)

        end
    end)
end