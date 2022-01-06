local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)

-- Knit:AddServices(ServerStorage.Source.Service)

for _, v in ipairs(ServerStorage.Source.Service:GetDescendants()) do
    if v:IsA("ModuleScript") and v.Name:match("Service$") then
        require(v)
    end
end

Knit.Start():andThen(function()
    print("Knit Started")
end):catch(warn)