--! DO NOT CHANGE THIS ⬇️
-- For Debugging
RegisterCommand('welcomer', function(source) --? RUN `/WELCOMER` TO SEE THE MESSAGE AGAIN
    on_connect(source)
end, false)


-- On Player spawn
AddEventHandler("playerSpawned", function(spawn)
    on_connect(player)

end) 

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    Citizen.Trace('The resource ' .. resourceName .. ' has been started.\n')

  end)
  
  
-- Callback from the server
RegisterNetEvent("callback", function(isNew)
    Citizen.Trace("Callback " .. tostring(isNew) .. "\n")
    if (isNew) then
        newPlayer()
    else
        returningPlayer()
    end
end)
--! DO NOT CHANGE THIS ⬆️

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
    TriggerServerEvent('check', GetPlayerName(PlayerId()), GetPlayerServerId(PlayerId()) )
    Citizen.Trace("\nRequest " .. GetPlayerName(PlayerId()) .. " - " .. GetPlayerServerId(PlayerId()) .. "\n")
end

--! DO NOT CHANGE THIS ⬇️

function DisplayText(text,X, Y, font, size)
    Citizen.CreateThread(function()
        local opacity = 255
        local shown = true
        Citizen.SetTimeout(10000 --[[Milliseconds until disappears]], function() shown = false end)
        local shownFade = true
        repeat
            Citizen.Wait(1)
        --! DO NOT CHANGE THIS ⬆️
            SetTextFont(font or 0)
            SetTextProportional(0.5)
            SetTextScale(size or 0.6,size or 0.6)
            SetTextColour(255, 102, 255, opacity)
            SetTextDropshadow(0, 0, 0, 0, opacity)
            SetTextEdge(4, 255, 255, 255, opacity)
            SetTextDropShadow()
            SetTextOutline()
        --! DO NOT CHANGE THIS ⬇️
            SetTextEntry("STRING")
            AddTextComponentString(text)
            DrawText(X, Y) -- X, Y 
        until shown == false
        --TODO Add Fade out effect
        -- Citizen.SetTimeout(10000 --[[Milliseconds until disappears]], function() shownFade = false end)
        -- repeat
        --     opacity = opacity - 25.5
        --     Citizen.Wait(1)
        --     --! DO NOT CHANGE THIS ⬆️
        --         SetTextFont(font or 0)
        --         SetTextProportional(0.5)
        --         SetTextScale(size or 0.6,size or 0.6)
        --         SetTextColour(255, 102, 255, opacity)
        --         SetTextDropshadow(0, 0, 0, 0, opacity)
        --         SetTextEdge(4, 255, 255, 255, opacity)
        --         SetTextDropShadow()
        --         SetTextOutline()
        --     --! DO NOT CHANGE THIS ⬇️
        --         SetTextEntry("STRING")
        --         AddTextComponentString(text)
        --         DrawText(X, Y) -- X, Y 
        -- until shownFade == false
        -- opacity = 255
    end)
end

function math.round(num, numDecimalPlaces)
	return string.format("%.0f", num)
end

function changeBool(bool)
    if (bool) then
        bool = false
    end
end