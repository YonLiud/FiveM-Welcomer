RegisterServerEvent("check")
AddEventHandler("check", function(playerName, PlayerId)
    check_player(playerName, PlayerId)
end)


function check_player(playerName, PlayerId)
    local newPlayer = false
    if IsNewPlayer(playerName) then
        newPlayer = true
    end
    TriggerClientEvent("callback", PlayerId,  newPlayer)
end