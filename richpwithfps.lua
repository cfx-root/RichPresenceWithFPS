local prevframes, fps = 0, 0
Citizen.CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do
        Citizen.Wait(0)
        prevframes = GetFrameCount()
    end
    while true do
        local pId = GetPlayerServerId(PlayerId())
        fps = GetFrameCount() - prevframes
        prevframes = GetFrameCount()
        fps = fps / 10
        fps = fps + 20
        SetDiscordAppId(000000000000000000) -- This is the bot client ID
        SetDiscordRichPresenceAsset('logo_name')
        SetDiscordRichPresenceAssetText('RootBase')
        SetDiscordRichPresenceAssetSmall('logo_name')
        SetDiscordRichPresenceAssetSmallText('RootBase')
        SetRichPresence("ID: "..pId.." | FPS: "..fps)
        Citizen.Wait(10000) -- in MS
    end
end)
