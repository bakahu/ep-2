local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer

local Roact = require(ReplicatedStorage.Packages.roact)

local Clock = Roact.Component:extend("Clock")

function Clock:init()
    -- In init, we can use setState to set up our initial component state.
    self:setState({
        currentTime = 0
    })
end

-- This render function is almost completely unchanged from the first example.
function Clock:render()
    -- As a convention, we'll pull currentTime out of state right away.
    local currentTime = self.state.currentTime

    return Roact.createElement("ScreenGui", {}, {
        TimeLabel = Roact.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0),
            Text = "Time Elapsed: " .. currentTime
        })
    })
end

-- Set up our loop in didMount, so that it starts running when our
-- component is created.
function Clock:didMount()
    -- Set a value that we can change later to stop our loop
    self.running = true

    -- We don't want to block the main thread, so we spawn a new one!
    spawn(function()
        while self.running do
            -- Because we depend on the previous state, we use the function
            -- variant of setState. This will matter more when Roact gets
            -- asynchronous rendering!
            self:setState(function(state)
                return {
                    currentTime = state.currentTime + 1
                }
            end)

            wait(1)
        end
    end)
end

-- Stop the loop in willUnmount, so that our loop terminates when the
-- component is destroyed.
function Clock:willUnmount()
    self.running = false
end

return Clock