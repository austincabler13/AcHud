Citizen.CreateThread(function()
    while true do
        -- Get player data
        local player = PlayerPedId()
        local health = GetEntityHealth(player) - 100                      -- Get health, adjust if needed
        local stamina = GetPlayerSprintStaminaRemaining(PlayerId()) * 100 -- Convert to percentage
        local speed = math.floor(GetEntitySpeed(player) * 3.6)            -- Convert m/s to km/h

        -- Send data to NUI (HTML HUD)
        SendNUIMessage({
            health = health,
            stamina = stamina,
            speed = speed
        })

        -- Update every 0.1 seconds
        Citizen.Wait(100)
    end
end)
