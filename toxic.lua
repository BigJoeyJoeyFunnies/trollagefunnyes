local function onPlayerDied(victim, killer)
    if killer and killer:IsA("Player") then
        local victimName = victim.Name
        local killerName = killer.Name
        
        local killMessage = "Killed " .. victimName .. " - Rest in peace!"
        local customMessage = "L " .. victimName .. " - Gone but not forgotten!"
        local customMessage2 = "Lost " .. victimName .. " - skillissue"

        
        -- Say messages in chat
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
            killMessage, "All"
        )
        
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
            customMessage, "All"
        )
  
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
            customMessage2, "All"
        )
    end
end

game.Players.PlayerAdded:Connect(function(player)
    player.Character:WaitForChild("Humanoid").Died:Connect(function()
        onPlayerDied(player, player:FindFirstChild("creator"))
    end)
end)
 
