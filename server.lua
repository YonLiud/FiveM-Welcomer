local parser = load("parser.lua")

RegisterServerEvent("check")
AddEventHandler("check", function(playerName)
    print("checking - " .. playerName)
    check_player(playerName)
end)

function check_player(playerName)
    print(IsNewPlayer(playerName))
end