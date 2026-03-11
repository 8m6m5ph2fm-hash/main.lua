
-- PHANTOM DEFENSE SYSTEM (RECREATED)
-- Auth: Gigs & Xyren Lab
-- Target Key: m4rk1

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PhantomSystem"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- [ UTILS ]
local function createCorner(obj, rad)
    local corner = Instance.new("UICorner", obj)
    corner.CornerRadius = rad or UDim.new(0, 4)
end

-- [ MAIN FRAME ]
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 500, 0, 320)
Main.Position = UDim2.new(0.5, -250, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(15, 17, 22)
Main.BorderSizePixel = 0
createCorner(Main, UDim.new(0, 6))

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(40, 45, 55)
Stroke.Thickness = 1.5

-- [ HEADER SECTION ]
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, -40, 0, 80)
Header.Position = UDim2.new(0, 20, 0, 15)
Header.BackgroundColor3 = Color3.fromRGB(20, 23, 30)
Header.BorderSizePixel = 0
createCorner(Header)

local ShieldIcon = Instance.new("ImageLabel", Header)
ShieldIcon.Size = UDim2.new(0, 40, 0, 40)
ShieldIcon.Position = UDim2.new(0, 15, 0, 20)
ShieldIcon.BackgroundTransparency = 1
ShieldIcon.Image = "rbxassetid://6034822765" -- Shield Icon
ShieldIcon.ImageColor3 = Color3.fromRGB(60, 130, 210)

local Title = Instance.new("TextLabel", Header)
Title.Text = "PHANTOM DEFENSE SYSTEM"
Title.Size = UDim2.new(1, -70, 0, 30)
Title.Position = UDim2.new(0, 65, 0, 15)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.RobotoMono
Title.TextSize = 18
Title.TextXAlignment = "Left"
Title.BackgroundTransparency = 1

local SubTitle = Instance.new("TextLabel", Header)
SubTitle.Text = "Authorization Required — Clearance Level 5"
SubTitle.Size = UDim2.new(1, -70, 0, 20)
SubTitle.Position = UDim2.new(0, 65, 0, 45)
SubTitle.TextColor3 = Color3.fromRGB(120, 125, 140)
SubTitle.Font = Enum.Font.RobotoMono
SubTitle.TextSize = 12
SubTitle.TextXAlignment = "Left"
SubTitle.BackgroundTransparency = 1

-- [ INFO GRID ]
local function createInfoBox(label, val, pos, color)
    local box = Instance.new("Frame", Main)
    box.Size = UDim2.new(0, 145, 0, 45)
    box.Position = pos
    box.BackgroundColor3 = Color3.fromRGB(10, 12, 16)
    createCorner(box)

    local lbl = Instance.new("TextLabel", box)
    lbl.Text = label
    lbl.Size = UDim2.new(1, 0, 0, 20)
    lbl.Position = UDim2.new(0, 8, 0, 4)
    lbl.TextColor3 = Color3.fromRGB(100, 100, 110)
    lbl.Font = Enum.Font.RobotoMono
    lbl.TextSize = 10
    lbl.TextXAlignment = "Left"
    lbl.BackgroundTransparency = 1

    local v = Instance.new("TextLabel", box)
    v.Name = "Value"
    v.Text = val
    v.Size = UDim2.new(1, 0, 0, 20)
    v.Position = UDim2.new(0, 8, 0, 22)
    v.TextColor3 = color
    v.Font = Enum.Font.RobotoMono
    v.TextSize = 13
    v.TextXAlignment = "Left"
    v.BackgroundTransparency = 1
    return v
end

local ThreatVal = createInfoBox("THREAT LEVEL", "ELEVATED", UDim2.new(0, 20, 0, 105), Color3.fromRGB(200, 170, 60))
local EncryptVal = createInfoBox("ENCRYPTION", "AES-256", UDim2.new(0.5, -72, 0, 105), Color3.fromRGB(60, 160, 100))
local SessionVal = createInfoBox("SESSION", "63A0B3", UDim2.new(1, -165, 0, 105), Color3.fromRGB(120, 125, 140))

-- [ INPUT SECTION ]
local KeyInput = Instance.new("TextBox", Main)
KeyInput.Size = UDim2.new(1, -40, 0, 50)
KeyInput.Position = UDim2.new(0, 20, 0, 160)
KeyInput.BackgroundColor3 = Color3.fromRGB(12, 14, 18)
KeyInput.TextColor3 = Color3.new(1, 1, 1)
KeyInput.PlaceholderText = "PHANTOM-XXXX-XXXX-XXXX"
KeyInput.PlaceholderColor3 = Color3.fromRGB(60, 65, 75)
KeyInput.Text = ""
KeyInput.Font = Enum.Font.RobotoMono
KeyInput.TextSize = 14
createCorner(KeyInput)
Instance.new("UIStroke", KeyInput).Color = Color3.fromRGB(50, 20, 20)

local ErrorText = Instance.new("TextLabel", Main)
ErrorText.Text = "INVALID KEY — Access denied"
ErrorText.Size = UDim2.new(1, -40, 0, 20)
ErrorText.Position = UDim2.new(0, 20, 0, 215)
ErrorText.TextColor3 = Color3.fromRGB(200, 60, 60)
ErrorText.Font = Enum.Font.RobotoMono
ErrorText.TextSize = 12
ErrorText.TextXAlignment = "Left"
ErrorText.BackgroundTransparency = 1
ErrorText.Visible = false

local VerifyingText = Instance.new("TextLabel", Main)
VerifyingText.Text = "◆ VERIFYING — Contacting auth server..."
VerifyingText.Size = UDim2.new(1, -40, 0, 20)
VerifyingText.Position = UDim2.new(0, 20, 0, 215)
VerifyingText.TextColor3 = Color3.fromRGB(200, 200, 60)
VerifyingText.Font = Enum.Font.RobotoMono
VerifyingText.TextSize = 11
VerifyingText.TextXAlignment = "Left"
VerifyingText.BackgroundTransparency = 1
VerifyingText.Visible = false

-- [ BUTTONS ]
local AuthBtn = Instance.new("TextButton", Main)
AuthBtn.Size = UDim2.new(1, -40, 0, 45)
AuthBtn.Position = UDim2.new(0, 20, 0, 240)
AuthBtn.BackgroundColor3 = Color3.fromRGB(120, 30, 30)
AuthBtn.TextColor3 = Color3.new(1, 1, 1)
AuthBtn.Text = "▶  AUTHENTICATE"
AuthBtn.Font = Enum.Font.RobotoMono
AuthBtn.TextSize = 14
createCorner(AuthBtn)

local LoadingBar = Instance.new("Frame", Main)
LoadingBar.Size = UDim2.new(0, 0, 0, 2)
LoadingBar.Position = UDim2.new(0, 20, 1, -15)
LoadingBar.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
LoadingBar.BorderSizePixel = 0
LoadingBar.Visible = false

-- [ LOGIC ]
AuthBtn.MouseButton1Click:Connect(function()
    AuthBtn.Visible = false
    VerifyingText.Visible = true
    ErrorText.Visible = false
    ThreatVal.Text = "SCANNING"
    ThreatVal.TextColor3 = Color3.fromRGB(200, 200, 60)
    
    LoadingBar.Visible = true
    LoadingBar.Size = UDim2.new(0, 0, 0, 2)
    LoadingBar:TweenSize(UDim2.new(1, -40, 0, 2), "Out", "Linear", 1.5)
    
    task.wait(1.6)
    
    if KeyInput.Text == "m4rk1" then
        -- CORRECT KEY
        ScreenGui:Destroy() -- Langsung bersih sesuai request
    else
        -- WRONG KEY (Kaya di foto)
        LoadingBar.Visible = false
        AuthBtn.Visible = true
        VerifyingText.Visible = false
        ErrorText.Visible = true
        ThreatVal.Text = "ALERT"
        ThreatVal.TextColor3 = Color3.fromRGB(200, 40, 40)
        KeyInput.Text = ""
    end
end)
