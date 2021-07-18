function GetPlayers()
    local loadFile= LoadResourceFile(GetCurrentResourceName(), "./players.json") -- you only have to do this once in your code, i just put it in since it wont get confusing.
    local extract = {}
    extract = json.decode(loadFile)
    SaveResourceFile(GetCurrentResourceName(), "./players.json", json.encode(extract), -1)
    return extract
end

function AddPlayer(playerName)
    local loadFile = LoadResourceFile(GetCurrentResourceName(), "./players.json")
    local information = {name = playerName}
    SaveResourceFile(GetCurrentResourceName(), "./players.json", json.encode(information), -1)
end

function IsNewPlayer(player)
    local players = GetPlayers()
    -- itterate over players and check if the name is equal to the player name
    for i = 1, #players do
        if players[i]["name"] == playerName then
            return false
        end
    end
    return true
end