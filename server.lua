-- local parser = require("parser.lua")


RegisterServerEvent("check")
AddEventHandler("check", function()
    TriggerClientEvent("callback", 1)
end)