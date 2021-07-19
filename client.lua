local color = {
    r=255,
    b=255,
    g=255,
    a=1
}

RegisterCommand('welcomer', function(source)
    TriggerServerEvent('check', GetPlayerName(PlayerId()))
    Citizen.Trace("\nRequest " .. GetPlayerName(PlayerId()) .. " - ")
end, false)

RegisterNetEvent("callback", function(isNew)
    Citizen.Trace("Callback " .. tostring(isNew))
end)


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