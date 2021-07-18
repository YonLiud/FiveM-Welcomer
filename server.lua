-- local parser = require("parser.lua")


RegisterServerEvent("check")
AddEventHandler("check", function(playerName)
    print("checking - " .. playerName)
    TriggerClientEvent("callback", -1,  playerName)
end)