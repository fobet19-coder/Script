PEPA PIGG (short version)
local P,R,U,C,L = game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),workspace.CurrentCamera,game.Players.LocalPlayer
local Aim,Silent,Aura,Anti,God,Int,Spd,Jmp = false,false,false,false,false,0.25,28,70

local g = Instance.new("ScreenGui",game.CoreGui) g.Name="PEPA_PIGG" g.ResetOnSpawn=false
local f = Instance.new("Frame",g) f.Size=UDim2.new(0,210,0,260) f.Position=UDim2.new(0,10,0.3,0) f.BackgroundColor3=Color3.fromRGB(255,182,193) Instance.new("UICorner",f).CornerRadius=UDim.new(0,10)
local t = Instance.new("TextLabel",f) t.Size=UDim2.new(1,0,0,28) t.BackgroundTransparency=1 t.Text="🐷 PEPA PIGG" t.TextColor3=Color3.fromRGB(120,40,80) t.Font=Enum.Font.GothamBold t.TextSize=15

local function Btn(n,y,cb)
	local b=Instance.new("TextButton",f) b.Size=UDim2.new(1,-16,0,26) b.Position=UDim2.new(0,8,0,y) b.BackgroundColor3=Color3.fromRGB(255,220,230) b.Text=n..": OFF" b.TextColor3=Color3.fromRGB(80,30,60) b.Font=Enum.Font.Gotham b.TextSize=12
	Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
	local on=false
	b.MouseButton1Click:Connect(function() on=not on b.Text=n..(on and ": ON" or ": OFF") b.BackgroundColor3=on and Color3.fromRGB(255,150,180) or Color3.fromRGB(255,220,230) cb(on) end)
end

Btn("Aimlock",38,function(v) Aim=v end)
Btn("Silent Aim",70,function(v) Silent=v end)
Btn("Kill Aura",102,function(v) Aura=v end)
Btn("Anti Aim",134,function(v) Anti=v end)
Btn("Modo Divino",166,function(v) God=v end)

local lib=Instance.new("TextButton",f) lib.Size=UDim2.new(1,-16,0,26) lib.Position=UDim2.new(0,8,0,200) lib.BackgroundColor3=Color3.fromRGB(255,100,130) lib.Text="Liberar Ítems" lib.TextColor3=Color3.new(1,1,1) lib.Font=Enum.Font.GothamBold lib.TextSize=12
Instance.new("UICorner",lib).CornerRadius=UDim.new(0,6)
lib.MouseButton1Click:Connect(function()
	local c,bp=L.Character,L:FindFirstChild("Backpack")
	if c then for _,t in pairs(c:GetChildren()) do if t:IsA("Tool") then t.Parent=workspace end end end
	if bp then for _,t in pairs(bp:GetChildren()) do if t:IsA("Tool") then t.Parent=workspace end end end
end)

R.Heartbeat:Connect(function()
	local c=L.Character if not c then return end
	local h=c:FindFirstChildOfClass("Humanoid")
	if h then h.WalkSpeed=Spd h.JumpPower=Jmp if God then h.Health=h.MaxHealth end end
	if Anti and c:FindFirstChild("HumanoidRootPart") then c.HumanoidRootPart.CFrame=c.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(35),0) end
end)

local function Closest()
	local cl,d=nil,170
	for _,p in pairs(P:GetPlayers()) do
		if p\~=L and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
			local pos,on=C:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
			if on then local dist=(Vector2.new(pos.X,pos.Y)-U:GetMouseLocation()).Magnitude if dist<d then cl,d=p,dist end end
		end
	end
	return cl
end

R.RenderStepped:Connect(function()
	local t=Closest()
	if (Aim or Silent) and t and t.Character then
		local part=Silent and (t.Character:FindFirstChild("Head") or t.Character.HumanoidRootPart) or t.Character.HumanoidRootPart
		if part then C.CFrame=C.CFrame:Lerp(CFrame.new(C.CFrame.Position,part.Position),Int) end
	end
	if Aura then
		local root=L.Character and L.Character:FindFirstChild("HumanoidRootPart")
		if root then
			for _,p in pairs(P:GetPlayers()) do
				if p\~=L and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and (root.Position-p.Character.HumanoidRootPart.Position).Magnitude<12 then
					local tool=L.Character:FindFirstChildOfClass("Tool") if tool then pcall(function() tool:Activate() end) end
				end
			end
		end
	end
end)

print("🐷 PEPA PIGG loaded")
