-- Example function to update health and stamina, replace with actual game data
Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local health = GetEntityHealth(playerPed) / 2 -- Convert to percentage if needed
        local stamina = 100                           -- Replace with actual stamina calculation

        -- Send NUI message to update HUD
        SendNUIMessage({
            type = "updateHealth",
            health = health
        })

        SendNUIMessage({
            type = "updateStamina",
            stamina = stamina
        })

        Citizen.Wait(1000) -- Update every second
    end
end)
