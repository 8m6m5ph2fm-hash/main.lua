-- Xanoxxl V45 - THE CYBER-TECH EDITION
-- Auth: Gigs & Xyren Lab
-- Key: marky

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Xanoxxl_V45_Cyber"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

local UserInputService = game:GetService("UserInputService")
local currentSpeed, currentJump = 16, 50
local speedEnabled, jumpEnabled, infJumpEnabled, headlessEnabled, korbloxEnabled = false, false, false, false, false
local rainbowThemeActive = false
local currentBorderColor = Color3.fromRGB(0, 255, 255)

-- [ DECORATION UTILITY ]
local function createGlow(obj)
    local glow = Instance.new("UIStroke", obj)
    glow.Color = currentBorderColor
    glow.Thickness = 1.5
    glow.Transparency = 0.5
    return glow
end

-- [1] INITIALIZATION (NEON LOADING)
local LoadingFrame = Instance.new("Frame", ScreenGui)
LoadingFrame.Size = UDim2.new(0, 400, 0, 150); LoadingFrame.Position = UDim2.new(0.5, -200, 0.5, -75); LoadingFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5); Instance.new("UICorner", LoadingFrame)
local LStroke = createGlow(LoadingFrame)

local LoadTitle = Instance.new("TextLabel", LoadingFrame); LoadTitle.Size = UDim2.new(1, 0, 0, 50); LoadTitle.Text = "XANOXXL SYSTEM V45"; LoadTitle.TextColor3 = Color3.new(1,1,1); LoadTitle.Font = Enum.Font.GothamBold; LoadTitle.TextSize = 20; LoadTitle.BackgroundTransparency = 1
local LoadStatus = Instance.new("TextLabel", LoadingFrame); LoadStatus.Size = UDim2.new(1, 0, 0, 20); LoadStatus.Position = UDim2.new(0, 0, 0.5, 0); LoadStatus.Text = "Initializing Cyber-Interface..."; LoadStatus.TextColor3 = Color3.fromRGB(0, 255, 255); LoadStatus.Font = Enum.Font.Code; LoadStatus.TextSize = 12; LoadStatus.BackgroundTransparency = 1
local ProgressBar = Instance.new("Frame", LoadingFrame); ProgressBar.Size = UDim2.new(0, 0, 0, 3); ProgressBar.Position = UDim2.new(0.05, 0, 0.85, 0); ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 255); Instance.new("UICorner", ProgressBar)

task.spawn(function()
    local steps = {"Accessing Lab...", "Injecting UI...", "Syncing with cvAI4...", "Ready."}
    for i, v in ipairs(steps) do
        LoadStatus.Text = v
        ProgressBar:TweenSize(UDim2.new((i/4)*0.9, 0, 0, 3), "Out", "Quad", 0.4)
        task.wait(0.5)
    end
    LoadingFrame.Visible = false
end)

-- [2] LOGIN (TECH DESIGN)
local KeyGui = Instance.new("Frame", ScreenGui)
KeyGui.Size = UDim2.new(0, 340, 0, 300); KeyGui.Position = UDim2.new(0.5, -170, 0.5, -150); KeyGui.BackgroundColor3 = Color3.fromRGB(10, 10, 10); KeyGui.Visible = false; Instance.new("UICorner", KeyGui)
createGlow(KeyGui)

local KeyTitle = Instance.new("TextLabel", KeyGui); KeyTitle.Size = UDim2.new(1, 0, 0, 50); KeyTitle.Text = "// ACCESS REQUIRED"; KeyTitle.TextColor3 = Color3.new(1,1,1); KeyTitle.Font = Enum.Font.GothamBold; KeyTitle.TextSize = 16; KeyTitle.BackgroundTransparency = 1
local KeyInput = Instance.new("TextBox", KeyGui); KeyInput.Size = UDim2.new(0, 280, 0, 50); KeyInput.Position = UDim2.new(0.5, -140, 0.4, 0); KeyInput.PlaceholderText = "> Enter Key"; KeyInput.Text = ""; KeyInput.BackgroundColor3 = Color3.fromRGB(20, 20, 20); KeyInput.TextColor3 = Color3.fromRGB(0, 255, 255); Instance.new("UICorner", KeyInput)
local VerifyBtn = Instance.new("TextButton", KeyGui); VerifyBtn.Size = UDim2.new(0, 200, 0, 45); VerifyBtn.Position = UDim2.new(0.5, -100, 0.8, 0); VerifyBtn.Text = "AUTHENTICATE"; VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 150); VerifyBtn.Font = Enum.Font.GothamBold; Instance.new("UICorner", VerifyBtn)
task.delay(2.5, function() KeyGui.Visible = true end)

-- [3] MAIN DASHBOARD (SLEEK DESIGN)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 560, 0, 380); MainFrame.Position = UDim2.new(0.5, -280, 0.5, -190); MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12); MainFrame.Visible = false; MainFrame.Active = true; MainFrame.Draggable = true; Instance.new("UICorner", MainFrame)
local MStroke = createGlow(MainFrame)

-- Decorative Corner Lines (Making it look "Canggih")
local function addLine(pos, size)
    local l = Instance.new("Frame", MainFrame); l.Size = size; l.Position = pos; l.BackgroundColor3 = Color3.fromRGB(0, 255, 255); l.BorderSizePixel = 0; l.Transparency = 0.4
end
addLine(UDim2.new(0, 0, 0, 0), UDim2.new(0, 20, 0, 2)) -- Top Left
addLine(UDim2.new(0, 0, 0, 0), UDim2.new(0, 2, 0, 20))

local TopBar = Instance.new("Frame", MainFrame); TopBar.Size = UDim2.new(1, 0, 0, 45); TopBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18); Instance.new("UICorner", TopBar)
local FpsPing = Instance.new("TextLabel", TopBar); FpsPing.Size = UDim2.new(0, 180, 1, 0); FpsPing.Position = UDim2.new(1, -260, 0, 0); FpsPing.Text = "FPS: 60 | PING: 20MS"; FpsPing.TextColor3 = Color3.fromRGB(0, 255, 255); FpsPing.Font = Enum.Font.Code; FpsPing.TextSize = 10; FpsPing.TextXAlignment = "Right"; FpsPing.BackgroundTransparency = 1

local MinBtn = Instance.new("TextButton", TopBar); MinBtn.Size = UDim2.new(0, 30, 0, 30); MinBtn.Position = UDim2.new(1, -75, 0.5, -15); MinBtn.Text = "-"; MinBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30); MinBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", MinBtn)
local CloseBtn = Instance.new("TextButton", TopBar); CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -40, 0.5, -15); CloseBtn.Text = "X"; CloseBtn.BackgroundColor3 = Color3.fromRGB(50, 20, 20); CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50); Instance.new("UICorner", CloseBtn)

local Sidebar = Instance.new("Frame", MainFrame); Sidebar.Size = UDim2.new(0, 160, 1, -55); Sidebar.Position = UDim2.new(0, 5, 0, 50); Sidebar.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Instance.new("UICorner", Sidebar)
local ContentArea = Instance.new("Frame", MainFrame); ContentArea.Size = UDim2.new(1, -185, 1, -70); ContentArea.Position = UDim2.new(0, 175, 0, 60); ContentArea.BackgroundTransparency = 1

local frames = {}
local function createTab(name, pos)
    local btn = Instance.new("TextButton", Sidebar); btn.Size = UDim2.new(1, -20, 0, 38); btn.Position = UDim2.new(0, 10, 0, pos); btn.Text = "  [ " .. name .. " ]"; btn.BackgroundColor3 = Color3.fromRGB(22, 22, 22); btn.TextColor3 = Color3.new(0.8, 0.8, 0.8); btn.Font = Enum.Font.GothamMedium; btn.TextSize = 9; btn.TextXAlignment = "Left"; Instance.new("UICorner", btn)
    local scroll = Instance.new("ScrollingFrame", ContentArea); scroll.Size = UDim2.new(1, 0, 1, 0); scroll.BackgroundTransparency = 1; scroll.Visible = false; scroll.CanvasSize = UDim2.new(0, 0, 2, 0); scroll.ScrollBarThickness = 1
    frames[name] = scroll
    btn.MouseButton1Click:Connect(function() 
        for _, f in pairs(frames) do f.Visible = false end
        for _, b in pairs(Sidebar:GetChildren()) do if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(22, 22, 22); b.TextColor3 = Color3.new(0.8,0.8,0.8) end end
        scroll.Visible = true; btn.BackgroundColor3 = Color3.fromRGB(0, 100, 100); btn.TextColor3 = Color3.new(1,1,1)
    end)
    return scroll
end

-- TAB DEFINITIONS
local PlayerFrame = createTab("PLAYER HUB", 10)
local TradeFrame = createTab("TRADE PRO", 55)
local StealFrame = createTab("STEAL, LIST TRADE", 100)
local BrainrotFrame = createTab("BRAINROT HUB", 145)
local MiscFrame = createTab("SYSTEM MISC", 190)
PlayerFrame.Visible = true

local function createToggle(text, parent, pos, callback)
    local frame = Instance.new("Frame", parent); frame.Size = UDim2.new(0.95, 0, 0, 45); frame.Position = UDim2.new(0, 0, 0, pos); frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", frame)
    local label = Instance.new("TextLabel", frame); label.Size = UDim2.new(0.7, 0, 1, 0); label.Position = UDim2.new(0, 15, 0, 0); label.Text = "> " .. text; label.TextColor3 = Color3.new(1,1,1); label.Font = Enum.Font.Gotham; label.TextSize = 11; label.BackgroundTransparency = 1; label.TextXAlignment = "Left"
    local btn = Instance.new("TextButton", frame); btn.Size = UDim2.new(0, 55, 0, 26); btn.Position = UDim2.new(1, -65, 0.5, -13); btn.Text = "OFF"; btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35); btn.TextColor3 = Color3.new(1,1,1); btn.Font = Enum.Font.GothamBold; btn.TextSize = 10; Instance.new("UICorner", btn)
    local act = false
    btn.MouseButton1Click:Connect(function() act = not act; btn.Text = act and "ON" or "OFF"; btn.BackgroundColor3 = act and Color3.fromRGB(0, 180, 180) or Color3.fromRGB(35, 35, 35); callback(act) end)
end

-- [PLAYER HUB]
local SpdInp = Instance.new("TextBox", PlayerFrame); SpdInp.Size = UDim2.new(0, 160, 0, 40); SpdInp.PlaceholderText = "> Speed (16)"; SpdInp.BackgroundColor3 = Color3.fromRGB(25, 25, 25); SpdInp.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", SpdInp)
local JmpInp = Instance.new("TextBox", PlayerFrame); JmpInp.Size = UDim2.new(0, 160, 0, 40); JmpInp.Position = UDim2.new(0, 175, 0, 0); JmpInp.PlaceholderText = "> Jump (50)"; JmpInp.BackgroundColor3 = Color3.fromRGB(25, 25, 25); JmpInp.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", JmpInp)
SpdInp.FocusLost:Connect(function() currentSpeed = tonumber(SpdInp.Text) or 16 end)
JmpInp.FocusLost:Connect(function() currentJump = tonumber(JmpInp.Text) or 50 end)

createToggle("SPEEDHACK", PlayerFrame, 55, function(s) speedEnabled = s end)
createToggle("JUMPHACK", PlayerFrame, 110, function(s) jumpEnabled = s end)
createToggle("INFINITE JUMP", PlayerFrame, 165, function(s) infJumpEnabled = s end)
createToggle("HEADLESS", PlayerFrame, 220, function(s) headlessEnabled = s end)
createToggle("KORBLOX", PlayerFrame, 275, function(s) korbloxEnabled = s end)

-- [TRADE PRO]
createToggle("VISUAL BRAINROT", TradeFrame, 0, function() end)
createToggle("VISUAL TRADE", TradeFrame, 55, function() end)
createToggle("AUTOACCEPT", TradeFrame, 110, function() end)
createToggle("FREEZE TRADE", TradeFrame, 165, function() end)

-- [STEAL, LIST TRADE]
local SoonTxt = Instance.new("TextLabel", StealFrame); SoonTxt.Size = UDim2.new(1, 0, 0, 100); SoonTxt.Text = "SYSTEM ENCRYPTED\nNEXT UPDATE"; SoonTxt.Font = Enum.Font.Code; SoonTxt.TextSize = 18; SoonTxt.BackgroundTransparency = 1
task.spawn(function() local c = 0 while task.wait() do SoonTxt.TextColor3 = Color3.fromHSV(c, 1, 1); c = (c + 0.01) % 1 end end)

-- [BRAINROT HUB]
local BLabel = Instance.new("TextLabel", BrainrotFrame); BLabel.Size = UDim2.new(1, 0, 0, 30); BLabel.Text = "// INPUT VISUAL DATA"; BLabel.TextColor3 = Color3.fromRGB(0, 255, 255); BLabel.BackgroundTransparency = 1; BLabel.Font = Enum.Font.Code; BLabel.TextSize = 12
local BInput = Instance.new("TextBox", BrainrotFrame); BInput.Size = UDim2.new(0.95, 0, 0, 50); BInput.Position = UDim2.new(0, 0, 0, 45); BInput.PlaceholderText = "> Enter Brainrot Text..."; BInput.BackgroundColor3 = Color3.fromRGB(20, 20, 20); BInput.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", BInput)
local AcceptBtn = Instance.new("TextButton", BrainrotFrame); AcceptBtn.Size = UDim2.new(0.95, 0, 0, 40); AcceptBtn.Position = UDim2.new(0, 0, 0, 110); AcceptBtn.Text = "EXECUTE VISUAL"; AcceptBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 120); AcceptBtn.TextColor3 = Color3.new(1,1,1); AcceptBtn.Font = Enum.Font.GothamBold; Instance.new("UICorner", AcceptBtn)
local ResetBtn = Instance.new("TextButton", BrainrotFrame); ResetBtn.Size = UDim2.new(0.95, 0, 0, 40); ResetBtn.Position = UDim2.new(0, 0, 0, 165); ResetBtn.Text = "FLUSH DATA"; ResetBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40); ResetBtn.TextColor3 = Color3.new(1,1,1); ResetBtn.Font = Enum.Font.GothamBold; Instance.new("UICorner", ResetBtn)

-- [SYSTEM MISC: COLOR THEMES]
local function createColorBtn(name, color, pos)
    local btn = Instance.new("TextButton", MiscFrame); btn.Size = UDim2.new(0.95, 0, 0, 35); btn.Position = UDim2.new(0, 0, 0, pos); btn.Text = "THEME: " .. name; btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25); btn.TextColor3 = color; btn.Font = Enum.Font.Code; Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(function() 
        rainbowThemeActive = (name == "RAINBOW"); currentBorderColor = color
        MStroke.Color = color; LStroke.Color = color
        if name == "RAINBOW" then makeRainbow(MStroke, "Color") end
    end)
end
createColorBtn("ROSE", Color3.fromRGB(255, 0, 127), 0); createColorBtn("VIOLET", Color3.fromRGB(148, 0, 211), 40); createColorBtn("RAINBOW", Color3.new(1,1,1), 80); createColorBtn("PINK", Color3.fromRGB(255, 192, 203), 120); createColorBtn("RED", Color3.fromRGB(255, 0, 0), 160); createColorBtn("AQUA", Color3.fromRGB(0, 255, 255), 200)

-- [5] MINIMIZE & CLOSE
local MinIcon = Instance.new("TextButton", ScreenGui); MinIcon.Size = UDim2.new(0, 60, 0, 60); MinIcon.Position = UDim2.new(0, 20, 0.5, -30); MinIcon.BackgroundColor3 = Color3.fromRGB(10, 10, 10); MinIcon.Text = "XN"; MinIcon.TextColor3 = Color3.fromRGB(0, 255, 255); MinIcon.Visible = false; Instance.new("UICorner", MinIcon); createGlow(MinIcon); MinIcon.Draggable = true
MinBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false; MinIcon.Visible = true end)
MinIcon.MouseButton1Click:Connect(function() MainFrame.Visible = true; MinIcon.Visible = false end)

local ConfFrame = Instance.new("Frame", ScreenGui); ConfFrame.Size = UDim2.new(0, 320, 0, 160); ConfFrame.Position = UDim2.new(0.5, -160, 0.5, -80); ConfFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15); ConfFrame.Visible = false; Instance.new("UICorner", ConfFrame); createGlow(ConfFrame).Color = Color3.fromRGB(255,0,0)
CloseBtn.MouseButton1Click:Connect(function() ConfFrame.Visible = true end)

-- [6] CORE LOGIC
task.spawn(function()
    local lastT, fC = tick(), 0
    while task.wait() do
        fC = fC + 1
        if tick() - lastT >= 1 then
            local p = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
            FpsPing.Text = "FPS: " .. fC .. " | PING: " .. string.sub(p, 1, #p-1) .. "MS"
            fC, lastT = 0, tick()
        end
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                if speedEnabled then hum.WalkSpeed = currentSpeed else hum.WalkSpeed = 16 end
                if jumpEnabled then hum.JumpPower = currentJump; hum.UseJumpPower = true else hum.JumpPower = 50 end
                if headlessEnabled and char:FindFirstChild("Head") then char.Head.Transparency = 1 elseif not headlessEnabled and char:FindFirstChild("Head") then char.Head.Transparency = 0 end
                if korbloxEnabled then for _, v in pairs({"RightUpperLeg", "RightLowerLeg", "RightFoot"}) do if char:FindFirstChild(v) then char[v].Transparency = 1 end end
                elseif not korbloxEnabled then for _, v in pairs({"RightUpperLeg", "RightLowerLeg", "RightFoot"}) do if char:FindFirstChild(v) then char[v].Transparency = 0 end end end
            end
        end)
    end
end)

UserInputService.JumpRequest:Connect(function() if infJumpEnabled then game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end end)
VerifyBtn.MouseButton1Click:Connect(function() if KeyInput.Text == "abigail" then KeyGui:TweenPosition(UDim2.new(0.5, -170, 0.5, -500), "Out", "Back", 0.5) task.wait(0.6) KeyGui.Visible = false; MainFrame.Visible = true end end)
