local parser = load("parser.lua")

RegisterServerEvent("check")
AddEventHandler("check", function(playerName)
    check_player(playerName)
end)

function check_player(playerName)
    local newPlayer = false
    if IsNewPlayer(playerName) then
        newPlayer = true
    end

    TriggerClientEvent("callback", -1,  newPlayer)
    -- if(IsNewPlayer(playerName)) then
    --     AddPlayer(playerName)
    --     TriggerClientEvent("callback", -1, true)
    -- else
    --     TriggerClientEvent("callback", -1, false)
    -- end
end