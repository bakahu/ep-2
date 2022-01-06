local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)

local MoneyController = Knit.CreateController {
    Name = "MoneyController",
}

function MoneyController:KnitStart()
    local function ObserveMoney(money)
        print("My Money:", money)
    end

    local MoneyService = Knit.GetService("MoneyService")
    MoneyService:GetMoney():andThen(ObserveMoney):catch(warn):andThen(function()
        MoneyService.MoneyChanged:Connect(ObserveMoney)
    end)
    
    print("MoneyController Started")
end

function MoneyController:KnitInit()
    print("MoneyController Initialized")
end

return MoneyController