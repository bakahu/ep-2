local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)

for _, v in ipairs(ReplicatedStorage.Source.Controller:GetDescendants()) do
    if v:IsA("ModuleScript") and v.Name:match("Controller$") then
        require(v)
    end
end

local function Logger(args: {any})
    print(args)
    return true
end

Knit.Start({
    -- ServicePromises = false
    Middleware = {Inbound = {Logger}}
}):andThen(function()
    print("Knit Started")
end):catch(warn)