-- PEPA PIGG (short version)
local P,R,U,C,L = game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),workspace.CurrentCamera,game.Players.LocalPlayer
local Aim,Silent,Aura,Anti,God,Int,Spd,Jmp = false,false,false,false,false,0.25,28,70

local g = Instance.new("ScreenGui",game.CoreGui) g.Name="PEPA_PIGG" g.ResetOnSpawn=false
local f = Instance.new("Frame",g) f.Size=UDim2.new(0,210,0,260) f.Position=UDim2.new(0,10,0.3,0) f.BackgroundColor3=Color3.fromRGB(255,182,193) Instance.new("UICorner",f).CornerRadius=UDim.new(0,10)
local t = Instance.new("TextLabel",f) t.Size=UDim2.new(1,0,0,28) t.BackgroundTransparency=1 t.Text="🐷 PEPA PIG
