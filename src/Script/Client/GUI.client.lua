local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer

local Roact = require(ReplicatedStorage.Packages.roact)
local Clock = require(ReplicatedStorage.Source.Layout.Clock)

-- Create our virtual tree describing a full-screen text label.
local tree = Roact.createElement("ScreenGui", {
    IgnoreGuiInset = true,
}, {
	Label = Roact.createElement("TextLabel", {
		Text = "Hello, world!",
		Size = UDim2.new(1, 0, 1, 0),
	}),
})

-- Turn our virtual tree into real instances and put them in PlayerGui
Roact.mount(tree, LocalPlayer.PlayerGui, "HelloWorld")


local PlayerGui = LocalPlayer.PlayerGui

-- Create our UI, which now runs on its own!
local handle = Roact.mount(Roact.createElement(Clock), PlayerGui, "Clock UI")

-- Later, we can destroy our UI and disconnect everything correctly.
wait(10)
Roact.unmount(handle)