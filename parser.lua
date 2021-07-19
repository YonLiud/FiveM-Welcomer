local fileName = "players.json"
function GetPlayers()
    local loadFile= LoadResourceFile(GetCurrentResourceName(), "./" .. fileName)
    local extract = {}
    extract = json.decode(loadFile)
    SaveResourceFile(GetCurrentResourceName(), fileName, json.encode(extract), -1)
    return extract
end

function AddPlayer(playerName)
    local loadFile = LoadResourceFile(GetCurrentResourceName(), "./" .. fileName)
    local information = {tostring(playerName)}
    local extract = GetPlayers()
    if extract == nil then
        extract = information
    else
        table.insert(extract, playerName)
    end
    SaveResourceFile(GetCurrentResourceName(), fileName, json.encode(extract), -1)
end

function IsNewPlayer(playerName)
    local players = GetPlayers()
    local isNew = true
    if players ~= nil then
        for i, v in ipairs(players) do
            if string.lower(tostring(v)) == string.lower(playerName) then
                isNew = false
                break
            end
        end
    end
    if isNew then
        AddPlayer(playerName)
        print("Adding player")
    end
    return isNew
end