function GetPlayers()
    local file = io.open("players.txt", "r")
    local players = {}
    for line in file:lines() do
        table.insert(players, line)
    end
    -- for _, player in ipairs(players) do
    --     print(player)
    -- end
    file:close()
    return players
end

function AddPlayer(player)
    local file = io.open("players.txt", "a")
    file:write(player .. "\n")
    file:close()
end

function IsNewPlayer(player)
    player = (tostring(player))
    player = string.lower(player)
    local players = GetPlayers()
    for _, p in ipairs(players) do
        p = string.lower(p)
        if p == player then
            return false
        end
    end
    return true
end