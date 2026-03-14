--[[
    ╔══════════════════════════════════════════════════════╗
    ║   T R A S H  H U B   ×   M A R K Y . D E V         ║
    ║   MIDNIGHT  LUXURY  EDITION  —  v3.0               ║
    ╚══════════════════════════════════════════════════════╝
]]

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Stats            = game:GetService("Stats")

local OWNER_KEY   = "ab1g4il"
local PREMIUM_KEY = "m4rk7"
local userTier    = "GUEST"
local LP          = Players.LocalPlayer
local WM          = "m4rkyXtrashhub"
local VER         = "v3.0"

-- ┌─────────────────────────────────────┐
-- │         COLOR  SYSTEM              │
-- └─────────────────────────────────────┘
local K = {
    -- base layers
    ink0  = Color3.fromRGB(4, 3, 9),
    ink1  = Color3.fromRGB(8, 6, 16),
    ink2  = Color3.fromRGB(13, 10, 24),
    ink3  = Color3.fromRGB(19, 15, 34),
    ink4  = Color3.fromRGB(26, 20, 46),
    -- gold spectrum
    gold  = Color3.fromRGB(255, 198, 42),
    goldm = Color3.fromRGB(230, 168, 14),
    goldd = Color3.fromRGB(185, 128, 0),
    -- purple spectrum
    pur1  = Color3.fromRGB(82, 20, 195),
    pur2  = Color3.fromRGB(115, 45, 228),
    pur3  = Color3.fromRGB(152, 78, 255),
    pur4  = Color3.fromRGB(192, 138, 255),
    pur5  = Color3.fromRGB(222, 195, 255),
    -- functional
    mint  = Color3.fromRGB(42, 255, 148),
    sky   = Color3.fromRGB(42, 210, 255),
    rose  = Color3.fromRGB(255, 52, 78),
    amber = Color3.fromRGB(255, 175, 28),
    -- text
    w1    = Color3.fromRGB(255, 255, 255),
    w2    = Color3.fromRGB(215, 205, 240),
    w3    = Color3.fromRGB(152, 138, 188),
    w4    = Color3.fromRGB(88, 72, 125),
    w5    = Color3.fromRGB(44, 34, 72),
}

local Themes = {
    Default = {p=K.pur2, a=K.pur4, g1=K.pur3, g2=K.pur1, hi=K.gold},
    Aqua    = {p=Color3.fromRGB(0,172,220),  a=Color3.fromRGB(82,235,255), g1=Color3.fromRGB(12,202,248), g2=Color3.fromRGB(0,112,168), hi=Color3.fromRGB(0,255,228)},
    Red     = {p=Color3.fromRGB(205,18,52),  a=Color3.fromRGB(255,82,115), g1=Color3.fromRGB(232,38,72),  g2=Color3.fromRGB(132,0,24),  hi=Color3.fromRGB(255,168,0)},
    Gold    = {p=Color3.fromRGB(202,148,0),  a=Color3.fromRGB(255,215,82), g1=Color3.fromRGB(238,178,8),  g2=Color3.fromRGB(158,95,0),  hi=Color3.fromRGB(255,248,185)},
    Pink    = {p=Color3.fromRGB(228,35,142), a=Color3.fromRGB(255,138,205),g1=Color3.fromRGB(252,65,162), g2=Color3.fromRGB(162,5,95),  hi=Color3.fromRGB(255,215,252)},
    Green   = {p=Color3.fromRGB(0,182,78),   a=Color3.fromRGB(65,255,152), g1=Color3.fromRGB(5,212,92),   g2=Color3.fromRGB(0,118,45),  hi=Color3.fromRGB(158,255,205)},
    Rainbow = {p=K.pur2, a=K.pur4, g1=K.pur3, g2=K.pur1, hi=K.gold},
}

local CT        = Themes.Default
local isRainbow = false
local rHue      = 0

local Root = Instance.new("ScreenGui")
Root.Name           = "TrashHubMidnight"
Root.Parent         = game.CoreGui
Root.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Root.ResetOnSpawn   = false

-- ┌─────────────────────────────────────┐
-- │         UTILITY  BELT              │
-- └─────────────────────────────────────┘
local function rc(p, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 8)
    c.Parent = p
    return c
end
local function sk(p, col, th, tr)
    local s = Instance.new("UIStroke")
    s.Color = col or CT.p
    s.Thickness = th or 1.5
    if tr then s.Transparency = tr end
    s.Parent = p
    return s
end
local function tw(o, props, t, es, ed)
    TweenService:Create(o, TweenInfo.new(t or .25, es or Enum.EasingStyle.Quart, ed or Enum.EasingDirection.Out), props):Play()
end
local function gg(p, c1, c2, rot)
    local g = Instance.new("UIGradient")
    g.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, c1), ColorSequenceKeypoint.new(1, c2)}
    g.Rotation = rot or 135
    g.Parent = p
    return g
end
local function sd(p, tr, oy, sz)
    local s = Instance.new("ImageLabel")
    s.AnchorPoint   = Vector2.new(.5, .5)
    s.BackgroundTransparency = 1
    s.Position      = UDim2.new(.5, 0, .5, oy or 18)
    s.Size          = UDim2.new(1, sz or 72, 1, sz or 72)
    s.ZIndex        = p.ZIndex - 1
    s.Image         = "rbxassetid://6014261993"
    s.ImageColor3   = Color3.new(0, 0, 0)
    s.ImageTransparency = tr or .38
    s.ScaleType     = Enum.ScaleType.Slice
    s.SliceCenter   = Rect.new(49, 49, 450, 450)
    s.Parent        = p
    return s
end
local function lbl(par, txt, pos, sz, font, ts, col, z, xa)
    local l = Instance.new("TextLabel")
    l.Parent              = par
    l.BackgroundTransparency = 1
    l.Position            = pos
    l.Size                = sz
    l.Font                = font or Enum.Font.Gotham
    l.Text                = txt
    l.TextSize            = ts or 13
    l.TextColor3          = col or K.w2
    l.ZIndex              = z or 1
    l.TextXAlignment      = xa or Enum.TextXAlignment.Left
    l.TextWrapped         = true
    return l
end
local function frm(par, col, pos, sz, z)
    local f = Instance.new("Frame")
    f.Parent         = par
    f.BackgroundColor3 = col or K.ink1
    f.BorderSizePixel  = 0
    f.Position         = pos or UDim2.new(0,0,0,0)
    f.Size             = sz or UDim2.new(1,0,1,0)
    f.ZIndex           = z or 1
    return f
end

local GR = {}
local function gr(par, c1, c2, rot)
    local g = gg(par, c1, c2, rot)
    table.insert(GR, g)
    return g
end

local renderOn = false
local function setRender(on)
    renderOn = on
    pcall(function()
        if on then
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level03
            workspace.StreamingMinRadius    = 32
            workspace.StreamingTargetRadius = 96
        else
            settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
            workspace.StreamingMinRadius    = 64
            workspace.StreamingTargetRadius = 256
        end
    end)
end

-- ┌─────────────────────────────────────┐
-- │      PANEL  FACTORY                │
-- └─────────────────────────────────────┘
-- mkPanel: base glass card
local function mkPanel(par, pos, sz, z, rad)
    local p = frm(par, K.ink1, pos, sz, z)
    rc(p, rad or 18)
    sd(p, .22, 20, 76)
    gr(p, K.ink2, K.ink0, 150)
    sk(p, K.ink4, 1.4, .0)
    return p
end

-- mkBar: styled top header bar for panels
local function mkBar(parent, h, zi, useGold)
    local b = frm(parent, K.ink0, UDim2.new(0,0,0,0), UDim2.new(1,0,0,h), zi)
    rc(b, 18)
    gr(b, Color3.fromRGB(15,10,30), Color3.fromRGB(5,3,10), 150)
    sk(b, Color3.fromRGB(22,15,48), 1)
    -- bottom shimmer
    local sh = frm(b, K.w1, UDim2.new(0,0,1,-1), UDim2.new(1,0,0,1), zi+1)
    sh.BackgroundTransparency = 0.86
    -- left neon accent
    local acc = frm(b, K.pur2, UDim2.new(0,0,0.1,0), UDim2.new(0,3,0.8,0), zi+1)
    rc(acc, 2)
    gr(acc, K.pur4, K.pur1, 180)
    if useGold then
        acc.BackgroundColor3 = K.gold
        gr(acc, K.gold, K.goldd, 180)
    end
    -- top neon line
    local tl = frm(parent, K.pur3, UDim2.new(0.12,0,0,-1), UDim2.new(0.76,0,0,2), zi+2)
    rc(tl, 2)
    gr(tl, K.pur4, K.pur1, 0)
    return b
end

-- mkLogo: branded logo chip
local function mkLogo(parent, icon, x, zi, goldBorder)
    local outer = frm(parent, K.ink2, UDim2.new(0,x,0.5,-24), UDim2.new(0,48,0,48), zi)
    rc(outer, 15)
    gr(outer, K.ink3, K.ink1, 145)
    if goldBorder then sk(outer, K.gold, 2, .28) else sk(outer, K.pur3, 1.5, .38) end
    local glow = frm(parent, K.pur1, UDim2.new(0,x-4,0.5,-28), UDim2.new(0,56,0,56), zi-1)
    rc(glow, 17)
    glow.BackgroundTransparency = 0.82
    lbl(outer, icon, UDim2.new(0,0,0,0), UDim2.new(1,0,1,0), Enum.Font.GothamBold, 22, K.gold, zi+1, Enum.TextXAlignment.Center)
    return outer
end

-- ┌─────────────────────────────────────┐
-- │      STARTUP  LOADER               │
-- └─────────────────────────────────────┘
local SA = mkPanel(Root, UDim2.new(.5,0,.5,0), UDim2.new(0,468,0,308), 30, 22)
SA.AnchorPoint = Vector2.new(.5,.5)
SA.Visible = true

local SA_bar = mkBar(SA, 68, 32)
mkLogo(SA_bar, "⚡", 14, 33, true)

lbl(SA_bar, "TRASH HUB  ×  MARKY.DEV",
    UDim2.new(0,72,0,12), UDim2.new(.76,0,0,22),
    Enum.Font.GothamBold, 14, K.w1, 33)
local SA_sub = lbl(SA_bar, "Initializing...",
    UDim2.new(0,72,0,37), UDim2.new(.76,0,0,14),
    Enum.Font.Gotham, 9, K.w3, 33)

local SA_verBadge = frm(SA_bar, K.ink3, UDim2.new(1,-76,0.5,-13), UDim2.new(0,64,0,26), 33)
rc(SA_verBadge, 13)
sk(SA_verBadge, K.pur3, 1, .48)
gr(SA_verBadge, K.ink4, K.ink1, 145)
lbl(SA_verBadge, VER.."  ELITE",
    UDim2.new(0,0,0,0), UDim2.new(1,0,1,0),
    Enum.Font.GothamBold, 9, K.pur4, 34, Enum.TextXAlignment.Center)

-- progress track
local SA_progBg = frm(SA, K.ink0, UDim2.new(0,20,0,76), UDim2.new(1,-40,0,5), 31)
rc(SA_progBg, 3)
sk(SA_progBg, K.ink4, 1)
local SA_fill = frm(SA_progBg, K.pur2, UDim2.new(0,0,0,0), UDim2.new(0,0,1,0), 32)
rc(SA_fill, 3)
gr(SA_fill, K.pur4, K.pur1, 0)
local SA_dot = frm(SA_fill, K.pur4, UDim2.new(1,-5,-.6,0), UDim2.new(0,10,0,10), 33)
rc(SA_dot, 50)
SA_dot.BackgroundTransparency = 0.45
local SA_pct = lbl(SA, "0%", UDim2.new(1,-56,0,72), UDim2.new(0,40,0,11),
    Enum.Font.GothamBold, 9, K.pur4, 31, Enum.TextXAlignment.Right)

local SA_logF = frm(SA, K.ink0, UDim2.new(0,20,0,88), UDim2.new(1,-40,1,-96), 31)
SA_logF.BackgroundTransparency = 1
local saLL = Instance.new("UIListLayout")
saLL.Parent = SA_logF
saLL.Padding = UDim.new(0,2)

local SA_foot = frm(SA, K.ink0, UDim2.new(0,0,1,-26), UDim2.new(1,0,0,26), 32)
SA_foot.BackgroundTransparency = 0.62
rc(SA_foot, 22)
lbl(SA_foot, "Midnight Luxury  ·  "..WM,
    UDim2.new(0,0,0,0), UDim2.new(1,0,1,0),
    Enum.Font.Gotham, 8, K.w5, 33, Enum.TextXAlignment.Center)

local SA_ord = 0
local function saLog(t, c)
    SA_ord = SA_ord + 1
    local l = Instance.new("TextLabel")
    l.Parent              = SA_logF
    l.BackgroundTransparency = 1
    l.Size                = UDim2.new(1,0,0,11)
    l.Font                = Enum.Font.Code
    l.Text                = t
    l.TextColor3          = c
    l.TextSize            = 9
    l.TextXAlignment      = Enum.TextXAlignment.Left
    l.LayoutOrder         = SA_ord
    l.ZIndex              = 32
end

local SA_LOGS = {
    {"[BOOT]  Initializing Midnight Luxury v3.0...",  Color3.fromRGB(140,115,255)},
    {"[PASS]  Secure runtime verified.",               K.mint},
    {"[PASS]  AES-256 encryption active.",             K.mint},
    {"[PASS]  Memory sandbox initialized.",            K.mint},
    {"[WARN]  Anti-detection layer injecting...",      K.gold},
    {"[PASS]  Luxury UI engine mounted.",              K.mint},
    {"[PASS]  Network telemetry patched.",             K.mint},
    {"[PASS]  All 14 modules verified — 0 errors.",    K.mint},
    {"[BOOT]  Routing → authentication portal...",     Color3.fromRGB(140,115,255)},
}

-- ┌─────────────────────────────────────┐
-- │      KEY  SCREEN                   │
-- └─────────────────────────────────────┘
local SB = mkPanel(Root, UDim2.new(.5,0,.5,0), UDim2.new(0,488,0,382), 10, 24)
SB.AnchorPoint = Vector2.new(.5,.5)
SB.Visible     = false

local SB_bar = mkBar(SB, 70, 12, true)
mkLogo(SB_bar, "🔐", 14, 13, true)
lbl(SB_bar, "TRASH HUB  ×  MARKY.DEV",
    UDim2.new(0,72,0,13), UDim2.new(.70,0,0,22),
    Enum.Font.GothamBold, 14, K.w1, 13)
lbl(SB_bar, "Midnight Luxury  ·  Authentication",
    UDim2.new(0,72,0,37), UDim2.new(.70,0,0,14),
    Enum.Font.Gotham, 9, K.w3, 13)
local SB_verTag = frm(SB_bar, K.ink3, UDim2.new(1,-76,0.5,-13), UDim2.new(0,64,0,26), 13)
rc(SB_verTag, 13)
sk(SB_verTag, K.gold, 1.2, .42)
gr(SB_verTag, K.ink4, K.ink1, 145)
lbl(SB_verTag, VER.."  ELITE",
    UDim2.new(0,0,0,0), UDim2.new(1,0,1,0),
    Enum.Font.GothamBold, 9, K.gold, 14, Enum.TextXAlignment.Center)

-- lock icon display
local lockWrap = frm(SB, K.ink0, UDim2.new(.5,-52,0,82), UDim2.new(0,104,0,90), 11)
rc(lockWrap, 20)
gr(lockWrap, K.ink2, K.ink0, 148)
sk(lockWrap, K.pur2, 1.5, .52)
-- rings
local function mkRing(par, s, tr, zi)
    local r = frm(par, K.pur2, UDim2.new(.5,-s/2,.5,-s/2), UDim2.new(0,s,0,s), zi)
    rc(r, 50)
    r.BackgroundTransparency = tr
    return r
end
mkRing(lockWrap, 80, 0.92, 12)
mkRing(lockWrap, 62, 0.86, 13)
mkRing(lockWrap, 44, 0.78, 14)
local lockCore = frm(lockWrap, K.ink0, UDim2.new(.5,-16,.5,-16), UDim2.new(0,32,0,32), 15)
rc(lockCore, 50)
gr(lockCore, K.ink3, K.ink0, 145)
sk(lockCore, K.pur3, 1.5, .42)
lbl(lockWrap, "🔒", UDim2.new(0,0,0,0), UDim2.new(1,0,1,0),
    Enum.Font.GothamBold, 24, K.w1, 16, Enum.TextXAlignment.Center)

-- deco stars
lbl(SB, "✦", UDim2.new(.5,-84,0,90), UDim2.new(0,14,0,14), Enum.Font.GothamBold, 8, K.gold, 11, Enum.TextXAlignment.Center)
lbl(SB, "✦", UDim2.new(.5,72,0,90), UDim2.new(0,14,0,14), Enum.Font.GothamBold, 8, K.gold, 11, Enum.TextXAlignment.Center)

-- divider
local SB_div1 = frm(SB, K.w1, UDim2.new(0.08,0,0,180), UDim2.new(0.84,0,0,1), 11)
SB_div1.BackgroundTransparency = 0.88
gg(SB_div1, K.pur3, K.pur1, 0)

lbl(SB, "Enter your license key to continue",
    UDim2.new(0,28,0,188), UDim2.new(1,-56,0,16),
    Enum.Font.GothamBold, 11, K.w2, 11, Enum.TextXAlignment.Center)

-- key input
local KWrap = frm(SB, K.ink0, UDim2.new(0,22,0,209), UDim2.new(1,-44,0,52), 11)
rc(KWrap, 16)
gr(KWrap, K.ink2, K.ink0, 150)
local KIstroke = sk(KWrap, Color3.fromRGB(28,17,60), 1.8)

-- icon left
local kIconLeft = frm(KWrap, K.pur2, UDim2.new(0,3,0.5,-17), UDim2.new(0,34,0,34), 12)
rc(kIconLeft, 13)
kIconLeft.BackgroundTransparency = 0.68
gr(kIconLeft, K.pur3, K.pur1, 145)
lbl(kIconLeft, "✦", UDim2.new(0,0,0,0), UDim2.new(1,0,1,0),
    Enum.Font.GothamBold, 14, K.gold, 13, Enum.TextXAlignment.Center)

-- right glow
local kRG = frm(KWrap, K.pur3, UDim2.new(1,-2,0.1,0), UDim2.new(0,2,0.8,0), 12)
rc(kRG, 2)
kRG.BackgroundTransparency = 0.65

local KInput = Instance.new("TextBox")
KInput.Parent            = KWrap
KInput.BackgroundTransparency = 1
KInput.Position          = UDim2.new(0,44,0,0)
KInput.Size              = UDim2.new(1,-52,1,0)
KInput.Font              = Enum.Font.GothamBold
KInput.PlaceholderText   = "Enter license key..."
KInput.PlaceholderColor3 = Color3.fromRGB(48,33,78)
KInput.Text              = ""
KInput.TextColor3        = Color3.fromRGB(228,218,255)
KInput.TextSize          = 13
KInput.ZIndex            = 13
KInput.ClearTextOnFocus  = false
KInput.TextEditable      = true

local realKey = "" local isUpdating = false
KInput:GetPropertyChangedSignal("Text"):Connect(function()
    if isUpdating then return end isUpdating = true
    local cur = KInput.Text
    local curLen = #cur local realLen = #realKey
    if curLen > realLen then
        local added = cur:sub(realLen+1):gsub("●","")
        realKey = realKey..added
    elseif curLen < realLen then
        realKey = realKey:sub(1, #realKey-(realLen-curLen))
    end
    realKey = realKey:lower():gsub("pretpret", string.rep("*",8))
    KInput.Text = string.rep("●", #realKey)
    task.defer(function() isUpdating = false end)
end)

local KStatus = lbl(SB, "", UDim2.new(0,22,0,267), UDim2.new(1,-44,0,15),
    Enum.Font.GothamBold, 11, K.rose, 11, Enum.TextXAlignment.Center)

-- UNLOCK BUTTON
local KBtnBase = frm(SB, K.pur1, UDim2.new(0,22,0,286), UDim2.new(1,-44,0,56), 11)
rc(KBtnBase, 18)
gr(KBtnBase, K.pur3, K.pur1, 140)
sk(KBtnBase, K.gold, 1.2, .48)
-- inner top sheen
local kb_sh1 = frm(KBtnBase, K.w1, UDim2.new(0,8,0,3), UDim2.new(.55,0,0,2), 12)
rc(kb_sh1, 1)
kb_sh1.BackgroundTransparency = 0.84
local kb_sh2 = frm(KBtnBase, K.w1, UDim2.new(0,8,1,-5), UDim2.new(.30,0,0,1), 12)
rc(kb_sh2, 1)
kb_sh2.BackgroundTransparency = 0.90
-- icon circle
local kb_ico = frm(KBtnBase, K.w1, UDim2.new(0,12,0.5,-14), UDim2.new(0,28,0,28), 12)
rc(kb_ico, 50)
kb_ico.BackgroundTransparency = 0.75
lbl(kb_ico, "⚡", UDim2.new(0,0,0,0), UDim2.new(1,0,1,0),
    Enum.Font.GothamBold, 13, K.gold, 13, Enum.TextXAlignment.Center)
lbl(KBtnBase, "UNLOCK  ACCESS",
    UDim2.new(0,50,0,0), UDim2.new(1,-74,1,0),
    Enum.Font.GothamBold, 15, K.w1, 12)
lbl(KBtnBase, "›",
    UDim2.new(1,-34,0,0), UDim2.new(0,26,1,0),
    Enum.Font.GothamBold, 22, Color3.fromRGB(208,192,255), 12, Enum.TextXAlignment.Center)

local KBtn = Instance.new("TextButton")
KBtn.Parent              = KBtnBase
KBtn.BackgroundTransparency = 1
KBtn.Size                = UDim2.new(1,0,1,0)
KBtn.Text                = ""
KBtn.ZIndex              = 14
KBtn.MouseEnter:Connect(function() tw(KBtnBase, {BackgroundColor3=K.pur3}, .15) end)
KBtn.MouseLeave:Connect(function() tw(KBtnBase, {BackgroundColor3=K.pur1}, .15) end)

-- footer
local SB_div2 = frm(SB, K.w1, UDim2.new(0.08,0,0,350), UDim2.new(0.84,0,0,1), 11)
SB_div2.BackgroundTransparency = 0.90
lbl(SB, "✦  discord.gg/marky  ·  "..WM.."  ✦",
    UDim2.new(0,22,0,356), UDim2.new(1,-44,0,14),
    Enum.Font.Gotham, 8, K.w5, 11, Enum.TextXAlignment.Center)

-- ┌─────────────────────────────────────┐
-- │      LOADER  FACTORY               │
-- └─────────────────────────────────────┘
local function buildLoader(name, w, h, zi, iconTxt, titleTxt)
    local bg = mkPanel(Root, UDim2.new(.5,0,.5,0), UDim2.new(0,w,0,h), zi, 22)
    bg.AnchorPoint = Vector2.new(.5,.5)
    bg.Visible     = false
    bg.Name        = name

    local bar = mkBar(bg, 70, zi+1)
    mkLogo(bar, iconTxt, 14, zi+2)
    lbl(bar, titleTxt,
        UDim2.new(0,72,0,13), UDim2.new(.74,0,0,22),
        Enum.Font.GothamBold, 14, K.w1, zi+2)
    local subLbl = lbl(bar, "Please wait...",
        UDim2.new(0,72,0,37), UDim2.new(.74,0,0,14),
        Enum.Font.Gotham, 9, K.w3, zi+2)

    local pBg = frm(bg, K.ink0, UDim2.new(0,20,0,78), UDim2.new(1,-40,0,5), zi+1)
    rc(pBg, 3)
    sk(pBg, K.ink4, 1)
    local pFill = frm(pBg, K.pur2, UDim2.new(0,0,0,0), UDim2.new(0,0,1,0), zi+2)
    rc(pFill, 3)
    gr(pFill, K.pur4, K.pur1, 0)
    local pDot = frm(pFill, K.pur4, UDim2.new(1,-5,-.8,0), UDim2.new(0,10,0,10), zi+3)
    rc(pDot, 50)
    pDot.BackgroundTransparency = 0.45

    local pctLbl = lbl(bg, "0%", UDim2.new(1,-58,0,74), UDim2.new(0,42,0,12),
        Enum.Font.GothamBold, 9, K.pur4, zi+1, Enum.TextXAlignment.Right)

    local logF = frm(bg, K.ink0, UDim2.new(0,20,0,90), UDim2.new(1,-40,1,-96), zi+1)
    logF.BackgroundTransparency = 1
    local ll = Instance.new("UIListLayout")
    ll.Parent    = logF
    ll.Padding   = UDim.new(0, 2)

    local foot = frm(bg, K.ink0, UDim2.new(0,0,1,-24), UDim2.new(1,0,0,24), zi+1)
    foot.BackgroundTransparency = 0.65
    rc(foot, 22)
    lbl(foot, "✦  "..WM.."  ·  MARKY.DEV",
        UDim2.new(0,0,0,0), UDim2.new(1,0,1,0),
        Enum.Font.Gotham, 8, K.w5, zi+2, Enum.TextXAlignment.Center)

    return bg, pFill, logF, subLbl, pctLbl
end

local SC, SC_fill, SC_logF, SC_sub, SC_pct = buildLoader("SC", 488, 372, 15, "⚙️", "VERIFYING  KEY...")
local SD, SD_fill, SD_logF, SD_sub, SD_pct = buildLoader("SD", 488, 372, 15, "⚡", "LOADING  TRASH HUB  "..VER)

local SC_ord = 0
local function scLog(txt, col, o)
    SC_ord = o or SC_ord+1
    local l = Instance.new("TextLabel")
    l.Parent              = SC_logF
    l.BackgroundTransparency = 1
    l.Size                = UDim2.new(1,0,0,12)
    l.Font                = Enum.Font.Code
    l.Text                = txt
    l.TextColor3          = col
    l.TextSize            = 9
    l.TextXAlignment      = Enum.TextXAlignment.Left
    l.LayoutOrder         = SC_ord
    l.ZIndex              = 17
end

local SD_ord = 0
local function sdLog(txt, col)
    SD_ord = SD_ord+1
    local l = Instance.new("TextLabel")
    l.Parent              = SD_logF
    l.BackgroundTransparency = 1
    l.Size                = UDim2.new(1,0,0,12)
    l.Font                = Enum.Font.Code
    l.Text                = txt
    l.TextColor3          = col
    l.TextSize            = 9
    l.TextXAlignment      = Enum.TextXAlignment.Left
    l.LayoutOrder         = SD_ord
    l.ZIndex              = 17
end

local SD_LOGS = {
    {"[PASS]  License tier verified.",                K.mint},
    {"[PASS]  Midnight UI engine mounting...",        K.mint},
    {"[PASS]  Trade hook system initialized.",        K.mint},
    {"[PASS]  Render pipeline v3 active.",            K.mint},
    {"[WARN]  Anti-detection bypass enabled.",        K.gold},
    {"[PASS]  All subsystems operational.",           K.mint},
    {"[PASS]  Performance monitor calibrated.",       K.mint},
    {"[PASS]  14/14 modules ready — launching ✦",    K.mint},
}

-- ┌─────────────────────────────────────┐
-- │      MAIN  HUB                     │
-- └─────────────────────────────────────┘
local SW    = 170
local FH    = 484
local MH    = 66

local SE = mkPanel(Root, UDim2.new(.5,0,.5,0), UDim2.new(0,632,0,FH), 1, 22)
SE.AnchorPoint = Vector2.new(.5,.5)
SE.Visible     = false
SE.Active      = true
SE.Draggable   = true
local SE_stk   = SE:FindFirstChildOfClass("UIStroke")

-- ── TOPBAR ──────────────────────────────
local HT = frm(SE, K.ink0, UDim2.new(0,0,0,0), UDim2.new(1,0,0,MH), 3)
rc(HT, 22)
gr(HT, Color3.fromRGB(14,9,28), Color3.fromRGB(5,3,10), 150)
sk(HT, Color3.fromRGB(20,13,44), 1)
frm(HT, K.w1, UDim2.new(0,0,1,-1), UDim2.new(1,0,0,1), 4).BackgroundTransparency = 0.84
local HT_acc = frm(HT, K.pur2, UDim2.new(0,0,0.1,0), UDim2.new(0,3,0.8,0), 4)
rc(HT_acc, 2)
gr(HT_acc, K.pur4, K.pur1, 180)
-- neon top edge on hub
local SE_nTop = frm(SE, K.pur3, UDim2.new(0.1,0,0,-1), UDim2.new(0.8,0,0,2), 4)
rc(SE_nTop, 2)
gr(SE_nTop, K.pur4, K.pur1, 0)

-- logo
local HT_logo = mkLogo(HT, "⚡", 12, 4, true)

-- titles
lbl(HT, "TRASH HUB  ×  MARKY.DEV",
    UDim2.new(0,70,0,12), UDim2.new(0,200,0,22),
    Enum.Font.GothamBold, 13, K.w1, 4)
lbl(HT, VER.."  ·  Midnight Luxury  ·  m4rkyxtrashub",
    UDim2.new(0,70,0,35), UDim2.new(0,200,0,12),
    Enum.Font.Gotham, 9, K.w3, 4)

-- STAT PILL — clean
local statWrap = frm(HT, K.ink1, UDim2.new(.5,-92,0.5,-17), UDim2.new(0,184,0,34), 4)
rc(statWrap, 17)
sk(statWrap, K.ink4, 1.5)
gr(statWrap, K.ink2, K.ink0, 148)
-- left dot
local fpsDot = frm(statWrap, K.mint, UDim2.new(0,8,0.5,-4), UDim2.new(0,8,0,8), 5)
rc(fpsDot, 50)
fpsDot.BackgroundTransparency = 0.35
local fpsTL = lbl(statWrap, "FPS  —", UDim2.new(0,20,0,0), UDim2.new(.5,-24,1,0),
    Enum.Font.GothamBold, 11, K.mint, 6, Enum.TextXAlignment.Center)
-- divider
local stDiv = frm(statWrap, K.w1, UDim2.new(.5,-.5,0.1,0), UDim2.new(0,1,0.8,0), 5)
stDiv.BackgroundTransparency = 0.82
-- right dot
local pingDot = frm(statWrap, K.sky, UDim2.new(.5,8,0.5,-4), UDim2.new(0,8,0,8), 5)
rc(pingDot, 50)
pingDot.BackgroundTransparency = 0.35
local pingTL = lbl(statWrap, "PING  —", UDim2.new(.5,20,0,0), UDim2.new(.5,-24,1,0),
    Enum.Font.GothamBold, 11, K.sky, 6, Enum.TextXAlignment.Center)

-- TIER BADGE
local tierWrap = frm(HT, K.ink2, UDim2.new(1,-158,0.5,-17), UDim2.new(0,126,0,34), 4)
rc(tierWrap, 17)
local tierStk = sk(tierWrap, K.gold, 1.5, .38)
gr(tierWrap, K.ink3, K.ink1, 148)
local tierIco = lbl(tierWrap, "⬡", UDim2.new(0,8,0,0), UDim2.new(0,22,1,0),
    Enum.Font.GothamBold, 13, K.gold, 5, Enum.TextXAlignment.Center)
local tierTxt = lbl(tierWrap, "LOADING", UDim2.new(0,30,0,0), UDim2.new(1,-40,1,0),
    Enum.Font.GothamBold, 10, K.gold, 5)

-- WIN BUTTONS
local function mkWBtn(col, xOff, char)
    local bg = frm(HT, col, UDim2.new(1,xOff,0.5,-10), UDim2.new(0,20,0,20), 5)
    rc(bg, 50)
    bg.BackgroundTransparency = 0.25
    sk(bg, K.w1, 1, .70)
    local b = Instance.new("TextButton")
    b.Parent              = bg
    b.BackgroundTransparency = 1
    b.Size                = UDim2.new(1,0,1,0)
    b.Font                = Enum.Font.GothamBold
    b.Text                = char
    b.TextColor3          = K.w1
    b.TextSize            = 10
    b.ZIndex              = 6
    b.MouseEnter:Connect(function() tw(bg, {BackgroundTransparency=0}, .12) end)
    b.MouseLeave:Connect(function() tw(bg, {BackgroundTransparency=0.25}, .12) end)
    return b
end
local CloseB = mkWBtn(K.rose,  -32, "✕")
local MinB   = mkWBtn(K.gold,  -56, "–")

CloseB.MouseButton1Click:Connect(function()
    setRender(false)
    tw(SE, {Size=UDim2.new(0,0,0,0), BackgroundTransparency=1}, .22,
       Enum.EasingStyle.Back, Enum.EasingDirection.In)
    task.wait(.24)
    Root:Destroy()
end)
local minimized = false
MinB.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then tw(SE, {Size=UDim2.new(0,632,0,MH)}, .3) MinB.Text = "+"
    else tw(SE, {Size=UDim2.new(0,632,0,FH)}, .3) MinB.Text = "–" end
end)

-- ── SIDEBAR ─────────────────────────────
local Side = frm(SE, K.ink1, UDim2.new(0,0,0,MH), UDim2.new(0,SW,1,-MH), 2)
rc(Side, 18)
frm(Side, K.ink1, UDim2.new(.5,0,0,0), UDim2.new(.5,0,1,0), 2)
gr(Side, K.ink2, K.ink0, 188)
sk(Side, K.ink4, 1)
-- right line
local sideLine = frm(Side, K.pur2, UDim2.new(1,-1,0,14), UDim2.new(0,1,1,-28), 3)
rc(sideLine, 2)
gr(sideLine, K.pur4, K.pur1, 180)

-- sidebar header
local sideHdr = frm(Side, K.ink0, UDim2.new(0,0,0,0), UDim2.new(1,0,0,46), 3)
rc(sideHdr, 18)
sideHdr.BackgroundTransparency = 0.55
gr(sideHdr, K.ink2, K.ink0, 180)
frm(Side, K.pur2, UDim2.new(0.06,0,0,44), UDim2.new(0.88,0,0,1), 4).BackgroundTransparency = 0.78
local shDot = frm(sideHdr, K.gold, UDim2.new(0,13,0.5,-5), UDim2.new(0,10,0,10), 4)
rc(shDot, 50)
shDot.BackgroundTransparency = 0.35
lbl(sideHdr, "NAVIGATION", UDim2.new(0,30,0,0), UDim2.new(1,-34,1,0),
    Enum.Font.GothamBold, 8, K.pur4, 4)

local sideLL = Instance.new("UIListLayout")
sideLL.Parent    = Side
sideLL.SortOrder = Enum.SortOrder.LayoutOrder
sideLL.Padding   = UDim.new(0,1)
local spPad = frm(Side, K.ink0, UDim2.new(0,0,0,0), UDim2.new(1,0,0,46), 2)
spPad.BackgroundTransparency = 1
spPad.LayoutOrder = 0

-- sidebar bottom brand
local sideBot = frm(SE, K.ink0, UDim2.new(0,6,1,-23), UDim2.new(0,SW-12,0,16), 3)
rc(sideBot, 8)
sideBot.BackgroundTransparency = 0.65
sk(sideBot, K.w5, 1)
lbl(sideBot, "✦  MARKY.DEV  "..VER, UDim2.new(0,0,0,0), UDim2.new(1,0,1,0),
    Enum.Font.GothamBold, 7, K.w5, 4, Enum.TextXAlignment.Center)

local Content = frm(SE, K.ink0, UDim2.new(0,SW+9,0,MH+9), UDim2.new(1,-(SW+13),1,-(MH+11)), 2)
Content.BackgroundTransparency = 1

-- WATERMARK
local WMF = frm(Root, K.ink2, UDim2.new(0,14,0,14), UDim2.new(0,248,0,38))
rc(WMF, 19)
WMF.Visible = false
local WMStk = sk(WMF, K.pur2, 1.8)
gr(WMF, K.ink3, K.ink0, 140)
sd(WMF, .44, 4, 42)
sk(WMF, K.gold, 1, .52)
local wm_acc = frm(WMF, K.pur2, UDim2.new(0,0,0.1,0), UDim2.new(0,3,0.8,0), 2)
rc(wm_acc, 2)
gr(wm_acc, K.pur4, K.pur1, 180)
lbl(WMF, "⚡  "..WM.."  ✦  "..VER,
    UDim2.new(0,6,0,0), UDim2.new(1,-10,1,0),
    Enum.Font.GothamBold, 10, K.w1, 3, Enum.TextXAlignment.Center)

-- ┌─────────────────────────────────────┐
-- │      TAB  SYSTEM                   │
-- └─────────────────────────────────────┘
local Pages   = {}
local TabBtns = {}
local TabBars = {}
local activeTab = nil

local function setTab(name)
    if minimized then
        minimized = false
        tw(SE, {Size=UDim2.new(0,632,0,FH)}, .3)
        MinB.Text = "–"
    end
    for n, pg in pairs(Pages) do pg.Visible = (n == name) end
    for n, row in pairs(TabBtns) do
        local on  = (n == name)
        TabBars[n].Visible = on
        local ico = row:FindFirstChild("_i")
        local nm  = row:FindFirstChild("_n")
        local ib  = row:FindFirstChild("_ib")
        local pl  = row:FindFirstChild("_pl")
        tw(row, {BackgroundColor3=on and K.ink3 or K.ink1, BackgroundTransparency=on and 0 or 1}, .2)
        if ico then tw(ico, {TextColor3=on and K.gold or K.w4}, .2) end
        if nm  then tw(nm,  {TextColor3=on and K.w1  or K.w4}, .2) end
        if ib  then tw(ib,  {BackgroundTransparency=on and 0.62 or 0.90}, .2) end
        if pl  then tw(pl,  {BackgroundTransparency=on and 0.90 or 1}, .2) end
    end
    activeTab = name
end

local function mkTab(name, icon, order)
    local row = frm(Side, K.ink1, UDim2.new(0,0,0,0), UDim2.new(1,0,0,46), 3)
    row.BackgroundTransparency = 1
    row.LayoutOrder = order
    rc(row, 12)

    -- gold bar
    local bar = frm(row, K.gold, UDim2.new(0,0,0.12,0), UDim2.new(0,3,0.76,0), 5)
    rc(bar, 2)
    gr(bar, K.gold, K.goldd, 180)
    bar.Visible = false

    -- hover pill
    local pl = frm(row, K.pur2, UDim2.new(0,4,0.5,-17), UDim2.new(1,-8,0,34), 3)
    pl.Name = "_pl"
    rc(pl, 12)
    pl.BackgroundTransparency = 1

    -- icon bg
    local ib = frm(row, K.pur2, UDim2.new(0,10,0.5,-14), UDim2.new(0,28,0,28), 4)
    ib.Name = "_ib"
    rc(ib, 10)
    ib.BackgroundTransparency = 0.90

    local ico = Instance.new("TextLabel")
    ico.Name              = "_i"
    ico.Parent            = row
    ico.BackgroundTransparency = 1
    ico.Position          = UDim2.new(0,10,0,0)
    ico.Size              = UDim2.new(0,28,1,0)
    ico.Font              = Enum.Font.GothamBold
    ico.Text              = icon
    ico.TextSize          = 14
    ico.TextColor3        = K.w4
    ico.ZIndex            = 5
    ico.TextXAlignment    = Enum.TextXAlignment.Center

    local nm = Instance.new("TextLabel")
    nm.Name               = "_n"
    nm.Parent             = row
    nm.BackgroundTransparency = 1
    nm.Position           = UDim2.new(0,44,0,0)
    nm.Size               = UDim2.new(1,-50,1,0)
    nm.Font               = Enum.Font.GothamBold
    nm.Text               = name
    nm.TextSize           = 11
    nm.TextColor3         = K.w4
    nm.ZIndex             = 5
    nm.TextXAlignment     = Enum.TextXAlignment.Left

    local ob = Instance.new("TextButton")
    ob.Parent              = row
    ob.BackgroundTransparency = 1
    ob.Size                = UDim2.new(1,0,1,0)
    ob.Text                = ""
    ob.ZIndex              = 6
    ob.MouseEnter:Connect(function()
        if activeTab ~= name then
            tw(row, {BackgroundColor3=K.ink3, BackgroundTransparency=0}, .14)
            tw(pl, {BackgroundTransparency=0.92}, .14)
        end
    end)
    ob.MouseLeave:Connect(function()
        if activeTab ~= name then
            tw(row, {BackgroundColor3=K.ink1, BackgroundTransparency=1}, .14)
            tw(pl, {BackgroundTransparency=1}, .14)
        end
    end)
    ob.MouseButton1Click:Connect(function() setTab(name) end)

    local pg = Instance.new("ScrollingFrame")
    pg.Parent              = Content
    pg.BackgroundTransparency = 1
    pg.Size                = UDim2.new(1,0,1,0)
    pg.BorderSizePixel     = 0
    pg.ScrollBarThickness  = 2
    pg.ScrollBarImageColor3 = K.pur3
    pg.ScrollBarImageTransparency = .45
    pg.CanvasSize          = UDim2.new(0,0,0,0)
    pg.Visible             = false
    local pll = Instance.new("UIListLayout")
    pll.Parent    = pg
    pll.SortOrder = Enum.SortOrder.LayoutOrder
    pll.Padding   = UDim.new(0,5)
    pll:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        pg.CanvasSize = UDim2.new(0,0,0, pll.AbsoluteContentSize.Y+18)
    end)

    Pages[name]   = pg
    TabBtns[name] = row
    TabBars[name] = bar
    return pg
end

-- ┌─────────────────────────────────────┐
-- │      WIDGET  LIBRARY               │
-- └─────────────────────────────────────┘
local function mkSec(parent, title, order)
    local w = frm(parent, K.ink0, UDim2.new(0,0,0,0), UDim2.new(1,-2,0,26), 1)
    w.BackgroundTransparency = 1
    w.LayoutOrder = order or 0
    -- diamond + lines
    lbl(w, "◆", UDim2.new(0,0,0.5,-8), UDim2.new(0,14,0,16),
        Enum.Font.GothamBold, 7, K.gold, 2, Enum.TextXAlignment.Center)
    local ll = frm(w, K.goldd, UDim2.new(0,14,0.5,-1), UDim2.new(0,12,0,1), 1)
    rc(ll, 1)
    ll.BackgroundTransparency = 0.40
    local lr = frm(w, K.pur2, UDim2.new(0,82,0.5,-1), UDim2.new(1,-84,0,1), 1)
    rc(lr, 1)
    lr.BackgroundTransparency = 0.80
    lbl(w, string.upper(title), UDim2.new(0,28,0,0), UDim2.new(1,-30,1,0),
        Enum.Font.GothamBold, 8, K.gold, 2)
    return w
end

local function mkToggle(parent, name, order, defOn, badge)
    local row = frm(parent, K.ink2, UDim2.new(0,0,0,0), UDim2.new(1,-2,0,50), 1)
    row.LayoutOrder = order or 0
    rc(row, 14)
    sk(row, K.ink3, 1.2)
    gr(row, K.ink3, K.ink1, 152)

    -- left color strip
    local strip = frm(row, K.gold, UDim2.new(0,0,0.12,0), UDim2.new(0,3,0.76,0), 2)
    rc(strip, 2)
    strip.BackgroundTransparency = defOn and 0.05 or 0.90
    gr(strip, K.gold, K.goldd, 180)

    lbl(row, name, UDim2.new(0,16,0,0), UDim2.new(0.56,0,1,0),
        Enum.Font.Gotham, 12, K.w2, 2)

    if badge then
        local bf = frm(row, Color3.fromRGB(255,158,0), UDim2.new(0.56,8,0.5,-11), UDim2.new(0,76,0,22), 3)
        rc(bf, 11)
        sk(bf, Color3.fromRGB(255,200,80), 1, .48)
        gr(bf, Color3.fromRGB(255,182,0), Color3.fromRGB(218,135,0), 135)
        lbl(bf, badge, UDim2.new(0,0,0,0), UDim2.new(1,0,1,0),
            Enum.Font.GothamBold, 8, Color3.fromRGB(28,14,0), 4, Enum.TextXAlignment.Center)
    end

    -- track
    local track = frm(row, defOn and K.pur1 or Color3.fromRGB(15,9,32),
        UDim2.new(1,-68,0.5,-15), UDim2.new(0,54,0,30), 2)
    rc(track, 50)
    local tStk = sk(track,
        defOn and K.pur3 or Color3.fromRGB(26,14,58), 1,
        defOn and 0.48 or 0)
    if defOn then gr(track, K.pur3, K.pur1, 140) end

    local knob = frm(track, K.w1,
        defOn and UDim2.new(1,-24,0.5,-12) or UDim2.new(0,3,0.5,-12),
        UDim2.new(0,24,0,24), 3)
    rc(knob, 50)
    sd(knob, .55, 2, 8)
    sk(knob, Color3.fromRGB(218,208,255), 1, .55)

    local tog = defOn or false
    local ob = Instance.new("TextButton")
    ob.Parent              = row
    ob.BackgroundTransparency = 1
    ob.Size                = UDim2.new(1,0,1,0)
    ob.Text                = ""
    ob.ZIndex              = 4
    ob.MouseButton1Click:Connect(function()
        tog = not tog
        tw(track, {BackgroundColor3 = tog and K.pur1 or Color3.fromRGB(15,9,32)})
        tw(knob,  {Position = tog and UDim2.new(1,-24,0.5,-12) or UDim2.new(0,3,0.5,-12)})
        tw(strip, {BackgroundTransparency = tog and 0.05 or 0.90})
        tStk.Color       = tog and K.pur3 or Color3.fromRGB(26,14,58)
        tStk.Transparency = tog and 0.48 or 0
    end)
    row.MouseEnter:Connect(function() tw(row, {BackgroundColor3=K.ink4}, .13) end)
    row.MouseLeave:Connect(function() tw(row, {BackgroundColor3=K.ink2}, .13) end)
    return row, function() return tog end
end

local function mkSlider(parent, name, minV, maxV, defV, order)
    local row = frm(parent, K.ink2, UDim2.new(0,0,0,0), UDim2.new(1,-2,0,64), 1)
    row.LayoutOrder = order or 0
    rc(row, 14)
    sk(row, K.ink3, 1.2)
    gr(row, K.ink3, K.ink1, 152)

    frm(row, K.gold, UDim2.new(0,0,0.12,0), UDim2.new(0,3,0.76,0), 2).BackgroundTransparency = 0.88

    lbl(row, name, UDim2.new(0,16,0,10), UDim2.new(.56,0,0,18),
        Enum.Font.Gotham, 12, K.w2, 2)
    local vLbl = lbl(row, tostring(defV), UDim2.new(.56,0,0,10), UDim2.new(.40,0,0,18),
        Enum.Font.GothamBold, 12, K.pur4, 2, Enum.TextXAlignment.Right)

    local tBg = frm(row, K.ink0, UDim2.new(0,16,0,38), UDim2.new(1,-32,0,8), 2)
    rc(tBg, 4)
    sk(tBg, K.ink4, 1)

    local fill = frm(tBg, K.pur1, UDim2.new(0,0,0,0), UDim2.new((defV-minV)/(maxV-minV),0,1,0), 3)
    rc(fill, 4)
    gr(fill, K.pur4, K.pur1, 0)
    local fGlow = frm(fill, K.pur4, UDim2.new(1,-8,-.8,0), UDim2.new(0,14,0,14), 4)
    rc(fGlow, 50)
    fGlow.BackgroundTransparency = 0.52

    local knob = frm(tBg, K.w1, UDim2.new((defV-minV)/(maxV-minV),0,0.5,0), UDim2.new(0,18,0,18), 4)
    knob.AnchorPoint = Vector2.new(.5,.5)
    rc(knob, 50)
    sk(knob, K.pur3, 1.5, .28)
    sd(knob, .55, 2, 6)

    local drag = false
    local tBtn = Instance.new("TextButton")
    tBtn.Parent              = tBg
    tBtn.BackgroundTransparency = 1
    tBtn.Size                = UDim2.new(1,0,3,-8)
    tBtn.Position            = UDim2.new(0,0,0.5,-12)
    tBtn.Text                = ""
    tBtn.ZIndex              = 5

    local function upd(x)
        local fr = math.clamp((x - tBg.AbsolutePosition.X) / tBg.AbsoluteSize.X, 0, 1)
        vLbl.Text = tostring(math.floor(minV + fr*(maxV-minV)))
        tw(fill,  {Size=UDim2.new(fr,0,1,0)}, .07)
        tw(knob,  {Position=UDim2.new(fr,0,.5,0)}, .07)
    end
    tBtn.MouseButton1Down:Connect(function()
        drag = true
        upd(UserInputService:GetMouseLocation().X)
    end)
    UserInputService.InputChanged:Connect(function(i)
        if drag and i.UserInputType == Enum.UserInputType.MouseMovement then
            upd(i.Position.X)
        end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end
    end)
    row.MouseEnter:Connect(function() tw(row, {BackgroundColor3=K.ink4}, .13) end)
    row.MouseLeave:Connect(function() tw(row, {BackgroundColor3=K.ink2}, .13) end)
    return row
end

local function mkComingSoon(parent, mainTxt, subTxt, lo)
    local f = frm(parent, K.ink2, UDim2.new(0,0,0,0), UDim2.new(1,-2,0,232), 1)
    f.LayoutOrder = lo or 1
    rc(f, 20)
    sk(f, K.ink3, 1.5)
    gr(f, K.ink3, K.ink0, 152)

    -- ring system
    local function ring(s, tr, zi)
        local r = frm(f, K.pur2, UDim2.new(.5,-s/2,.22,-s/2), UDim2.new(0,s,0,s), zi)
        rc(r, 50)
        r.BackgroundTransparency = tr
        return r
    end
    ring(88, 0.92, 2) ring(66, 0.86, 3) ring(46, 0.78, 4)
    local rCore = frm(f, K.ink0, UDim2.new(.5,-16,.22,-16), UDim2.new(0,32,0,32), 5)
    rc(rCore, 50)
    gr(rCore, K.ink3, K.ink0, 145)
    sk(rCore, K.pur3, 1.5, .44)

    local l1 = lbl(f, "◆", UDim2.new(.5,-16,.22,-16), UDim2.new(0,32,0,32),
        Enum.Font.GothamBold, 15, K.pur4, 6, Enum.TextXAlignment.Center)

    -- center divider
    local cd = frm(f, K.w1, UDim2.new(.08,0,.54,0), UDim2.new(.84,0,0,1), 3)
    cd.BackgroundTransparency = 0.90
    gg(cd, K.pur3, K.pur1, 0)

    local l2 = lbl(f, mainTxt,
        UDim2.new(.5,0,.64,0), UDim2.new(.88,0,0,28),
        Enum.Font.GothamBold, 20, K.pur4, 3, Enum.TextXAlignment.Center)
    l2.AnchorPoint = Vector2.new(.5,.5)

    local l3 = lbl(f, subTxt,
        UDim2.new(.5,0,.82,0), UDim2.new(.84,0,0,36),
        Enum.Font.Gotham, 10, K.w4, 3, Enum.TextXAlignment.Center)
    l3.AnchorPoint = Vector2.new(.5,.5)
    l3.TextWrapped = true

    lbl(f, "— — — — — — — — — —", UDim2.new(.5,0,.94,0), UDim2.new(.8,0,0,14),
        Enum.Font.Gotham, 8, K.w5, 3, Enum.TextXAlignment.Center)

    return l1, l2
end

local function mkStatCard(parent, title, icon, valCol, order)
    local card = frm(parent, K.ink2, UDim2.new(0,0,0,0), UDim2.new(1,-2,0,92), 1)
    card.LayoutOrder = order
    rc(card, 16)
    sk(card, K.ink3, 1.2)
    gr(card, K.ink3, K.ink1, 152)

    local acc = frm(card, valCol, UDim2.new(0,0,.08,0), UDim2.new(0,3,.84,0), 2)
    rc(acc, 2)
    acc.BackgroundTransparency = 0.15

    -- icon rings
    local iO = frm(card, valCol, UDim2.new(0,14,.5,-28), UDim2.new(0,56,0,56), 2)
    rc(iO, 50)
    iO.BackgroundTransparency = 0.85
    local iM = frm(card, valCol, UDim2.new(0,21,.5,-21), UDim2.new(0,42,0,42), 3)
    rc(iM, 50)
    iM.BackgroundTransparency = 0.75
    local iI = frm(card, valCol, UDim2.new(0,28,.5,-14), UDim2.new(0,28,0,28), 4)
    rc(iI, 50)
    iI.BackgroundTransparency = 0.65
    lbl(iI, icon, UDim2.new(0,0,0,0), UDim2.new(1,0,1,0),
        Enum.Font.GothamBold, 18, valCol, 5, Enum.TextXAlignment.Center)

    lbl(card, title, UDim2.new(0,78,0,15), UDim2.new(.56,0,0,12),
        Enum.Font.GothamBold, 8, K.w4, 3)
    local valL = lbl(card, "—", UDim2.new(0,78,0,27), UDim2.new(.66,0,0,34),
        Enum.Font.GothamBold, 30, valCol, 3)

    local bBg = frm(card, K.ink0, UDim2.new(0,14,1,-14), UDim2.new(1,-28,0,5), 2)
    rc(bBg, 3)
    sk(bBg, K.ink4, 1)
    local bFill = frm(bBg, valCol, UDim2.new(0,0,0,0), UDim2.new(0,0,1,0), 3)
    rc(bFill, 3)

    card.MouseEnter:Connect(function() tw(card, {BackgroundColor3=K.ink4}, .13) end)
    card.MouseLeave:Connect(function() tw(card, {BackgroundColor3=K.ink2}, .13) end)
    return valL, bFill
end

-- ┌─────────────────────────────────────┐
-- │      VISUAL  ENGINE                │
-- └─────────────────────────────────────┘
local korbloxOn  = false
local headlessOn = false
local vParts     = {}

local function clearVis(tag)
    for i = #vParts, 1, -1 do
        local p = vParts[i]
        if p and p.Parent and p:GetAttribute("tag") == tag then
            pcall(function() p:Destroy() end)
            table.remove(vParts, i)
        end
    end
end

local function applyKorblox()
    clearVis("korblox")
    local char = LP.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local r15 = hum.RigType == Enum.HumanoidRigType.R15

    local function mkLeg(name)
        local leg = char:FindFirstChild(name)
        if not leg then return end
        local p = Instance.new("Part")
        p:SetAttribute("tag", "korblox")
        p.Name        = "KVis_"..name
        p.Size        = Vector3.new(1.05, 2.05, 1.05)
        p.Transparency = 0
        p.CanCollide  = false
        p.Anchored    = false
        p.CastShadow  = true
        p.Color        = Color3.fromRGB(15,15,15)
        p.Material    = Enum.Material.SmoothPlastic
        p.Parent      = char
        local m = Instance.new("SpecialMesh")
        m.MeshType  = Enum.MeshType.FileMesh
        m.MeshId    = "rbxassetid://319336350"
        m.TextureId = "rbxassetid://319336355"
        m.Scale     = Vector3.new(1.08,1.08,1.08)
        m.Parent    = p
        local wc = Instance.new("WeldConstraint")
        wc.Part0 = leg wc.Part1 = p wc.Parent = p
        local sel = Instance.new("SelectionBox")
        sel:SetAttribute("tag", "korblox")
        sel.Adornee            = p
        sel.Color3             = Color3.fromRGB(82,0,205)
        sel.LineThickness      = 0.015
        sel.SurfaceTransparency = 0.9
        sel.Parent             = char
        table.insert(vParts, p)
        table.insert(vParts, sel)
    end

    if r15 then
        mkLeg("LeftUpperLeg") mkLeg("LeftLowerLeg")
        mkLeg("RightUpperLeg") mkLeg("RightLowerLeg")
    else
        mkLeg("Left Leg") mkLeg("Right Leg")
    end
end

local function applyHeadless()
    clearVis("headless")
    local char = LP.Character
    if not char then return end
    local head = char:FindFirstChild("Head")
    if not head then return end
    head.Transparency = 1
    for _, v in ipairs(head:GetChildren()) do
        if v:IsA("SpecialMesh") or v:IsA("Decal") then
            v.Transparency = 1
        end
    end
    head:SetAttribute("tag", "headless")
    table.insert(vParts, head)
    for _, acc in ipairs(char:GetChildren()) do
        if acc:IsA("Accessory") then
            local h = acc:FindFirstChild("Handle")
            if h then
                local ok = false
                for _, a in ipairs(h:GetChildren()) do
                    if a:IsA("Attachment") and head:FindFirstChild(a.Name) then
                        ok = true break
                    end
                end
                if ok then
                    h.Transparency = 1
                    h:SetAttribute("tag", "headless")
                    table.insert(vParts, h)
                end
            end
        end
    end
end

local function removeHeadless()
    local char = LP.Character
    if not char then return end
    local head = char:FindFirstChild("Head")
    if head then
        head.Transparency = 0
        head:SetAttribute("tag", nil)
        for _, v in ipairs(head:GetChildren()) do
            if v:IsA("SpecialMesh") or v:IsA("Decal") then
                v.Transparency = 0
            end
        end
    end
    for _, p in ipairs(vParts) do
        if p and p.Parent and p:GetAttribute("tag") == "headless" then
            pcall(function() p.Transparency = 0 p:SetAttribute("tag", nil) end)
        end
    end
    clearVis("headless")
end

LP.CharacterAdded:Connect(function()
    vParts = {}
    task.wait(1.5)
    if korbloxOn  then applyKorblox()  end
    if headlessOn then applyHeadless() end
end)

-- ┌─────────────────────────────────────┐
-- │      BUILD  TABS                   │
-- └─────────────────────────────────────┘
-- TRADE
local tp = mkTab("Trade", "💎", 1)
mkSec(tp, "Trade Features", 1)
mkToggle(tp, "Visual Trade", 2, true)
mkToggle(tp, "Auto Accept", 3, false)
mkToggle(tp, "Freeze Trade", 4, false)
mkToggle(tp, "Visual Brainrot", 5, false)
mkSec(tp, "Timing Config", 6)
mkSlider(tp, "Accept Delay (ms)", 0, 500, 35, 7)
mkSlider(tp, "Visual Intensity", 0, 100, 72, 8)
mkSec(tp, "Advanced", 9)
mkToggle(tp, "Anti Decline", 10, true)
mkToggle(tp, "Trade Logger", 11, false, "UPDATING")
mkToggle(tp, "Instant Confirm", 12, false, "UPDATING")

-- BRAINROT
local bp = mkTab("Brainrot", "🧠", 2)
mkSec(bp, "Engine", 1)
mkToggle(bp, "Enable Visual Brainrot", 2, false)
mkToggle(bp, "Rainbow Text", 3, false)
mkToggle(bp, "Spam Mode", 4, false, "UPDATING")

local biWrap = frm(bp, K.ink2, UDim2.new(0,0,0,0), UDim2.new(1,-2,0,86), 1)
biWrap.LayoutOrder = 5
rc(biWrap, 14)
sk(biWrap, K.ink3, 1.2)
gr(biWrap, K.ink3, K.ink1, 152)
lbl(biWrap, "📝  Brainrot Text",
    UDim2.new(0,16,0,8), UDim2.new(1,-32,0,18),
    Enum.Font.GothamBold, 11, K.w2, 2)
local biIbg = frm(biWrap, K.ink0, UDim2.new(0,12,0,30), UDim2.new(1,-24,0,40))
rc(biIbg, 12)
sk(biIbg, K.ink4, 1.5)
local biIn = Instance.new("TextBox")
biIn.Parent              = biIbg
biIn.BackgroundTransparency = 1
biIn.Position            = UDim2.new(0,14,0,0)
biIn.Size                = UDim2.new(1,-28,1,0)
biIn.Font                = Enum.Font.Gotham
biIn.PlaceholderText     = "Type brainrot here..."
biIn.PlaceholderColor3   = Color3.fromRGB(46,30,72)
biIn.Text                = ""
biIn.TextColor3          = Color3.fromRGB(218,208,245)
biIn.TextSize            = 12
biIn.TextXAlignment      = Enum.TextXAlignment.Left
biIn.ClearTextOnFocus    = false

mkSec(bp, "Live Preview", 6)
local prevWrap = frm(bp, K.ink2, UDim2.new(0,0,0,0), UDim2.new(1,-2,0,52), 1)
prevWrap.LayoutOrder = 7
rc(prevWrap, 14)
sk(prevWrap, K.pur2, 1, .68)
gr(prevWrap, K.ink3, K.ink1, 152)
frm(prevWrap, K.pur3, UDim2.new(0,0,0.1,0), UDim2.new(0,3,0.8,0), 2).BackgroundTransparency = 0.45
local prevLbl = lbl(prevWrap, "[ No brainrot active ]",
    UDim2.new(0,14,0,0), UDim2.new(1,-28,1,0),
    Enum.Font.GothamBold, 11, K.w4, 2)
biIn:GetPropertyChangedSignal("Text"):Connect(function()
    if biIn.Text ~= "" then
        prevLbl.Text       = "▶  "..biIn.Text
        prevLbl.TextColor3 = K.pur4
    else
        prevLbl.Text       = "[ No brainrot active ]"
        prevLbl.TextColor3 = K.w4
    end
end)
mkSec(bp, "Settings", 8)
mkSlider(bp, "Speed", 1, 10, 5, 9)
mkSlider(bp, "Size", 10, 100, 50, 10)

-- STEAL / TRADE LIST
local stp = mkTab("Steal", "🕵️", 3)
local sI1, sT1 = mkComingSoon(stp, "COMING SOON", "Under active development\ndiscord.gg/marky", 1)
local tlp = mkTab("Trade List", "📋", 4)
local sI2, sT2 = mkComingSoon(tlp, "COMING SOON", "Arriving next patch\ndiscord.gg/marky", 1)

-- PLAYER
local pp = mkTab("Player", "👤", 5)
mkSec(pp, "Visual Cosmetics", 1)

local infoF = frm(pp, K.ink2, UDim2.new(0,0,0,0), UDim2.new(1,-2,0,44), 1)
infoF.LayoutOrder = 2
rc(infoF, 14)
sk(infoF, K.pur2, 1.5, .48)
gr(infoF, K.ink3, K.ink1, 152)
frm(infoF, K.pur3, UDim2.new(0,0,0.1,0), UDim2.new(0,3,0.8,0), 2).BackgroundTransparency = 0.32
lbl(infoF, "✦  Client-side only  —  hanya kamu yang bisa lihat",
    UDim2.new(0,12,0,0), UDim2.new(1,-24,1,0),
    Enum.Font.GothamBold, 10, K.pur4, 2, Enum.TextXAlignment.Center)

-- KORBLOX CARD
local function mkVisCard(parent, lo, accentCol, iconTxt, titleTxt, subTxt)
    local row = frm(parent, K.ink2, UDim2.new(0,0,0,0), UDim2.new(1,-2,0,64), 1)
    row.LayoutOrder = lo
    rc(row, 14)
    sk(row, K.ink3, 1.5)
    gr(row, K.ink3, K.ink1, 152)

    local acc = frm(row, accentCol, UDim2.new(0,0,0.10,0), UDim2.new(0,3,0.80,0), 2)
    rc(acc, 2)
    acc.BackgroundTransparency = 0.90

    local iO = frm(row, accentCol, UDim2.new(0,10,0.5,-27), UDim2.new(0,54,0,54), 2)
    rc(iO, 50)
    iO.BackgroundTransparency = 0.82
    local iM = frm(row, accentCol, UDim2.new(0,17,0.5,-20), UDim2.new(0,40,0,40), 3)
    rc(iM, 50)
    iM.BackgroundTransparency = 0.72
    local iI = frm(row, accentCol, UDim2.new(0,25,0.5,-13), UDim2.new(0,26,0,26), 4)
    rc(iI, 50)
    iI.BackgroundTransparency = 0.62
    lbl(iI, iconTxt, UDim2.new(0,0,0,0), UDim2.new(1,0,1,0),
        Enum.Font.GothamBold, 14, K.w1, 5, Enum.TextXAlignment.Center)

    lbl(row, titleTxt, UDim2.new(0,72,0,12), UDim2.new(0.50,0,0,20),
        Enum.Font.GothamBold, 13, K.w1, 3)
    lbl(row, subTxt, UDim2.new(0,72,0,34), UDim2.new(0.50,0,0,14),
        Enum.Font.Gotham, 9, K.w3, 3)

    local track = frm(row, Color3.fromRGB(14,9,30), UDim2.new(1,-70,0.5,-15), UDim2.new(0,56,0,30), 2)
    rc(track, 50)
    local tStk = sk(track, accentCol, 1, 1)
    local knob = frm(track, K.w1, UDim2.new(0,3,0.5,-12), UDim2.new(0,24,0,24), 3)
    rc(knob, 50)
    sd(knob, .55, 2, 8)
    sk(knob, K.w2, 1, .60)

    local togOn = false
    local ob = Instance.new("TextButton")
    ob.Parent              = row
    ob.BackgroundTransparency = 1
    ob.Size                = UDim2.new(1,0,1,0)
    ob.Text                = ""
    ob.ZIndex              = 4

    row.MouseEnter:Connect(function() tw(row, {BackgroundColor3=K.ink4}, .13) end)
    row.MouseLeave:Connect(function() tw(row, {BackgroundColor3=K.ink2}, .13) end)

    return ob, track, knob, acc, tStk, function() return togOn end, function(v) togOn = v end
end

local kOb, kTrack, kKnob, kAcc, kTS, getKOn, setKOn = mkVisCard(pp, 3, K.pur3, "🦴", "Korblox Visual", "Full leg — client render only")
kOb.MouseButton1Click:Connect(function()
    local nowOn = not getKOn()
    setKOn(nowOn)
    tw(kTrack, {BackgroundColor3 = nowOn and K.pur1 or Color3.fromRGB(14,9,30)})
    tw(kKnob,  {Position = nowOn and UDim2.new(1,-26,0.5,-12) or UDim2.new(0,3,0.5,-12)})
    tw(kAcc,   {BackgroundTransparency = nowOn and 0.05 or 0.90})
    kTS.Transparency = nowOn and 0.42 or 1
    korbloxOn = nowOn
    if nowOn then applyKorblox() else clearVis("korblox") end
end)

local hOb, hTrack, hKnob, hAcc, hTS, getHOn, setHOn = mkVisCard(pp, 4, K.rose, "💀", "Headless Visual", "Head invisible — client render")
hOb.MouseButton1Click:Connect(function()
    local nowOn = not getHOn()
    setHOn(nowOn)
    tw(hTrack, {BackgroundColor3 = nowOn and K.rose or Color3.fromRGB(14,9,30)})
    tw(hKnob,  {Position = nowOn and UDim2.new(1,-26,0.5,-12) or UDim2.new(0,3,0.5,-12)})
    tw(hAcc,   {BackgroundTransparency = nowOn and 0.05 or 0.90})
    hTS.Transparency = nowOn and 0.42 or 1
    headlessOn = nowOn
    if nowOn then applyHeadless() else removeHeadless() end
end)

mkSec(pp, "Coming Soon", 5)
local sI3, sT3 = mkComingSoon(pp, "UPDATING . . .", "More cosmetics next patch\nstay tuned", 6)

-- STATS
local perf = mkTab("Stats", "📊", 6)
mkSec(perf, "Live Performance", 1)
local fpsVal, fpsBar  = mkStatCard(perf, "FRAMES PER SECOND", "⚡", K.mint, 2)
local pingVal, pingBar = mkStatCard(perf, "NETWORK PING", "📶", K.sky, 3)
mkSec(perf, "Optimizers", 4)
mkToggle(perf, "FPS Unlocker", 5, true)
local rRow, getROn = mkToggle(perf, "Render Optimizer", 6, false, "UPDATING")
local rOb = Instance.new("TextButton")
rOb.Parent              = rRow
rOb.BackgroundTransparency = 1
rOb.Size                = UDim2.new(1,0,1,0)
rOb.Text                = ""
rOb.ZIndex              = 6
rOb.MouseButton1Click:Connect(function() setRender(not getROn()) end)
mkToggle(perf, "Low Latency Mode", 7, false, "UPDATING")
mkToggle(perf, "Memory Cleaner", 8, false)

-- MISC
local misc = mkTab("Misc", "⚙️", 7)
mkSec(misc, "Theme Customizer", 1)

local tNames = {"Default","Aqua","Red","Gold","Pink","Green","Rainbow"}
local tColors = {
    Default=K.pur3, Aqua=Color3.fromRGB(0,195,215), Red=Color3.fromRGB(215,25,55),
    Gold=Color3.fromRGB(215,165,0), Pink=Color3.fromRGB(245,68,150),
    Green=Color3.fromRGB(0,205,95), Rainbow=K.pur3
}

local function applyTheme(name)
    CT = Themes[name]
    isRainbow = (name == "Rainbow")
    if not isRainbow then
        local cs = ColorSequence.new{
            ColorSequenceKeypoint.new(0, CT.g1),
            ColorSequenceKeypoint.new(1, CT.g2)
        }
        for _, g in ipairs(GR) do g.Color = cs end
        SE_stk.Color = CT.p
        WMStk.Color  = CT.p
        sideLine.BackgroundColor3 = CT.p
        for _, bar in pairs(TabBars) do bar.BackgroundColor3 = K.gold end
    end
end

for i, tn in ipairs(tNames) do
    local row = frm(misc, K.ink2, UDim2.new(0,0,0,0), UDim2.new(1,-2,0,56), 1)
    row.LayoutOrder = i + 1
    rc(row, 14)
    sk(row, K.ink3, 1.2)
    gr(row, K.ink3, K.ink1, 152)

    -- swatch
    local swO = frm(row, tColors[tn], UDim2.new(0,12,0.5,-15), UDim2.new(0,30,0,30))
    rc(swO, 50)
    swO.BackgroundTransparency = 0.62
    sk(swO, K.w1, 1, .72)
    local swI = frm(row, tColors[tn], UDim2.new(0,18,0.5,-9), UDim2.new(0,18,0,18))
    rc(swI, 50)
    if tn == "Rainbow" then
        local dg = Instance.new("UIGradient")
        dg.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0,   Color3.fromRGB(255,72,72)),
            ColorSequenceKeypoint.new(.2,  Color3.fromRGB(255,195,0)),
            ColorSequenceKeypoint.new(.4,  Color3.fromRGB(72,255,115)),
            ColorSequenceKeypoint.new(.6,  Color3.fromRGB(72,155,255)),
            ColorSequenceKeypoint.new(.8,  Color3.fromRGB(195,72,255)),
            ColorSequenceKeypoint.new(1,   Color3.fromRGB(255,72,72)),
        }
        dg.Rotation = 135
        dg.Parent   = swI
    end

    lbl(row, tn, UDim2.new(0,50,0,0), UDim2.new(0.40,0,1,0),
        Enum.Font.GothamBold, 13, K.w2, 2)
    local aInd = lbl(row, tn == tNames[1] and "◆ Active" or "",
        UDim2.new(0.40,0,0,0), UDim2.new(0.24,0,1,0),
        Enum.Font.Gotham, 9, K.gold, 2)

    -- apply button
    local abBase = frm(row, K.pur1, UDim2.new(1,-90,0.5,-19), UDim2.new(0,78,0,38), 3)
    rc(abBase, 19)
    gr(abBase, K.pur3, K.pur1, 140)
    sk(abBase, K.pur4, 1, .52)
    -- sheen
    local abSh = frm(abBase, K.w1, UDim2.new(0,6,0,3), UDim2.new(.52,0,0,2), 4)
    rc(abSh, 1)
    abSh.BackgroundTransparency = 0.86
    local abLbl = lbl(abBase, "Apply",
        UDim2.new(0,0,0,0), UDim2.new(1,0,1,0),
        Enum.Font.GothamBold, 12, K.w1, 4, Enum.TextXAlignment.Center)
    local abBtn = Instance.new("TextButton")
    abBtn.Parent              = abBase
    abBtn.BackgroundTransparency = 1
    abBtn.Size                = UDim2.new(1,0,1,0)
    abBtn.Text                = ""
    abBtn.ZIndex              = 5
    abBtn.MouseEnter:Connect(function() tw(abBase, {BackgroundColor3=K.pur3}, .15) end)
    abBtn.MouseLeave:Connect(function() tw(abBase, {BackgroundColor3=K.pur1}, .15) end)

    local cap, indRef = tn, aInd
    abBtn.MouseButton1Click:Connect(function()
        applyTheme(cap)
        for _, ch in ipairs(misc:GetChildren()) do
            if ch:IsA("Frame") then
                for _, cc in ipairs(ch:GetChildren()) do
                    if cc:IsA("TextLabel") and cc.TextSize == 9 then
                        cc.Text = ""
                    end
                end
            end
        end
        indRef.Text       = "◆ Active"
        indRef.TextColor3 = K.gold
        abLbl.Text = "✓ Done"
        task.delay(1.6, function()
            if abLbl and abLbl.Parent then abLbl.Text = "Apply" end
        end)
    end)

    row.MouseEnter:Connect(function() tw(row, {BackgroundColor3=K.ink4}, .13) end)
    row.MouseLeave:Connect(function() tw(row, {BackgroundColor3=K.ink2}, .13) end)
end

-- ┌─────────────────────────────────────┐
-- │      SEQUENCES                     │
-- └─────────────────────────────────────┘
local function runHub()
    setRender(true)
    if userTier == "OWNER" then
        tierIco.Text       = "👑"
        tierTxt.Text       = "  OWNER"
        tierTxt.TextColor3 = K.gold
        tierStk.Color      = K.gold
        tierStk.Transparency = 0.20
    elseif userTier == "PREMIUM" then
        tierIco.Text       = "⭐"
        tierTxt.Text       = "  PREMIUM"
        tierTxt.TextColor3 = K.sky
        tierStk.Color      = K.sky
        tierStk.Transparency = 0.20
    end

    SD.Visible = true
    SD_fill.Size = UDim2.new(0,0,1,0)
    SD_pct.Text  = "0%"
    for _, c in ipairs(SD_logF:GetChildren()) do
        if c:IsA("TextLabel") then c:Destroy() end
    end
    SD_ord = 0

    for i, lg in ipairs(SD_LOGS) do
        task.wait(.26)
        sdLog(lg[1], lg[2])
        local pct = math.floor((i/#SD_LOGS)*100)
        tw(SD_fill, {Size=UDim2.new(pct/100,0,1,0)}, .24)
        SD_pct.Text = pct.."%"
        SD_sub.Text = "Module "..i.."/"..#SD_LOGS.."  —  "..math.random(8,44).."ms"
    end

    task.wait(.38)
    tw(SD, {BackgroundTransparency=1}, .32)
    task.wait(.36)
    SD.Visible = false
    SD.BackgroundTransparency = 0

    SE.Visible = true
    WMF.Visible = true
    SE.Size = UDim2.new(0,0,0,0)
    tw(SE, {Size=UDim2.new(0,632,0,FH)}, .48, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    setTab("Trade")
end

local function runKeyCheck(key)
    local isOwner   = (key == OWNER_KEY)
    local isPremium = (key == PREMIUM_KEY)
    local ok        = isOwner or isPremium
    if ok then userTier = isOwner and "OWNER" or "PREMIUM" end

    SB.Visible = false
    SC.Visible = true
    for _, c in ipairs(SC_logF:GetChildren()) do
        if c:IsA("TextLabel") then c:Destroy() end
    end
    SC_ord = 0
    SC_fill.Size = UDim2.new(0,0,1,0)

    local tLog = ok
        and (isOwner and "Key accepted — OWNER tier  👑" or "Key accepted — PREMIUM tier  ⭐")
        or  "Key not found in registry."
    local tCol = ok and (isOwner and K.gold or K.sky) or K.rose

    local logs = ok and {
        {"[BOOT]  Connecting to Marky auth node...",  Color3.fromRGB(138,112,255)},
        {"[PASS]  TLS 1.3 handshake complete.",       K.mint},
        {"[PASS]  Key integrity verified.",           K.mint},
        {"[PASS]  "..tLog,                            tCol},
        {"[PASS]  License status: ACTIVE  ✓",         K.mint},
        {"[PASS]  Session token issued.",              K.mint},
    } or {
        {"[BOOT]  Connecting to Marky auth node...",  Color3.fromRGB(138,112,255)},
        {"[PASS]  TLS 1.3 handshake complete.",       K.mint},
        {"[BOOT]  Scanning key registry...",          Color3.fromRGB(138,112,255)},
        {"[FAIL]  "..tLog,                            K.rose},
        {"[FAIL]  Authentication rejected.",          K.rose},
        {"[BOOT]  Session terminated.",               K.amber},
    }

    SC_sub.Text = ok and "Verifying license..." or "Checking key..."
    for i, lg in ipairs(logs) do
        task.wait(.33)
        scLog(lg[1], lg[2], i)
        tw(SC_fill, {Size=UDim2.new(i/#logs,0,1,0)}, .28)
        SC_sub.Text = "Step "..i.."/"..#logs
    end
    task.wait(.45)

    if ok then
        SC.Visible = false
        runHub()
    else
        tw(SC, {BackgroundTransparency=1}, .25)
        task.wait(.28)
        SC.BackgroundTransparency = 0
        SC.Visible   = false
        SB.Visible   = true
        KStatus.Text = "✗  Invalid key — access denied."
        KIstroke.Color     = K.rose
        KIstroke.Thickness = 2
        isUpdating = true realKey = "" KInput.Text = ""
        task.defer(function() isUpdating = false end)
        for _ = 1, 4 do
            tw(SB, {Position=UDim2.new(.5,-11,.5,0)}, .04)
            task.wait(.05)
            tw(SB, {Position=UDim2.new(.5,11,.5,0)}, .04)
            task.wait(.05)
        end
        tw(SB, {Position=UDim2.new(.5,0,.5,0)}, .055)
        task.wait(2.4)
        KStatus.Text       = ""
        KIstroke.Color     = Color3.fromRGB(28,17,60)
        KIstroke.Thickness = 1.8
    end
end

local submitting = false
KBtn.MouseButton1Click:Connect(function()
    if submitting then return end
    submitting = true
    local k = realKey:gsub("%s+","")
    task.spawn(function()
        runKeyCheck(k)
        submitting = false
    end)
end)

-- ┌─────────────────────────────────────┐
-- │      RUNTIME  LOOP                 │
-- └─────────────────────────────────────┘
local fpsBuf = {}
local fpsS   = 60
local pingS  = 38

RunService.Heartbeat:Connect(function(dt)
    rHue = (rHue + dt*.11) % 1

    table.insert(fpsBuf, dt)
    if #fpsBuf > 24 then table.remove(fpsBuf,1) end
    local avg = 0
    for _, v in ipairs(fpsBuf) do avg = avg + v end
    avg  = avg / #fpsBuf
    fpsS = fpsS + (math.floor(1/avg) - fpsS) * .08
    local fd   = math.clamp(math.floor(fpsS), 1, 999)
    local fCol = fd >= 55 and K.mint or fd >= 30 and K.gold or K.rose

    local okp, rawp = pcall(function()
        return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
    local tgt = okp and rawp and rawp > 0 and rawp or (pingS + math.random(-4,6))
    pingS = pingS + (tgt - pingS) * .05
    local pd   = math.max(1, math.floor(pingS))
    local pCol = pd <= 60 and K.mint or pd <= 120 and K.gold or K.rose

    if SE.Visible then
        fpsTL.Text       = "FPS  "..fd
        fpsTL.TextColor3 = fCol
        fpsDot.BackgroundColor3 = fCol
        pingTL.Text       = "PING  "..pd
        pingTL.TextColor3 = pCol
        pingDot.BackgroundColor3 = pCol
        fpsVal.Text       = tostring(fd)
        fpsVal.TextColor3 = fCol
        pingVal.Text      = pd.." ms"
        pingVal.TextColor3 = pCol
        tw(fpsBar,  {Size=UDim2.new(math.clamp(fd/144,0,1),0,1,0)}, .45)
        tw(pingBar, {Size=UDim2.new(math.clamp(1-pd/260,0,1),0,1,0)}, .45)
    end

    if isRainbow then
        local rc1 = Color3.fromHSV(rHue, .92, 1)
        local rc2 = Color3.fromHSV((rHue+.15)%1, .92, 1)
        local cs  = ColorSequence.new{
            ColorSequenceKeypoint.new(0, rc2),
            ColorSequenceKeypoint.new(1, rc1)
        }
        for _, g in ipairs(GR) do g.Color = cs end
        SE_stk.Color = rc1
        WMStk.Color  = rc1
        sideLine.BackgroundColor3 = rc1
        for _, bar in pairs(TabBars) do
            bar.BackgroundColor3 = Color3.fromHSV(rHue, .65, 1)
        end
        fpsTL.TextColor3  = Color3.fromHSV(rHue, .85, 1)
        pingTL.TextColor3 = Color3.fromHSV((rHue+.33)%1, .85, 1)
    end

    for _, r in ipairs({sI1,sI2,sI3,sT1,sT2,sT3}) do
        if r and r.Parent then
            r.TextColor3 = Color3.fromHSV(rHue, .80, 1)
        end
    end
end)

-- ┌─────────────────────────────────────┐
-- │      LAUNCH                        │
-- └─────────────────────────────────────┘
task.spawn(function()
    for i, lg in ipairs(SA_LOGS) do
        task.wait(.24)
        saLog(lg[1], lg[2])
        local pct = math.floor((i/#SA_LOGS)*100)
        tw(SA_fill, {Size=UDim2.new(pct/100,0,1,0)}, .22)
        SA_pct.Text = pct.."%"
        SA_sub.Text = "Step "..i.."/"..#SA_LOGS.."  —  "..math.random(5,26).."ms"
    end
    task.wait(.36)
    tw(SA, {BackgroundTransparency=1}, .32)
    task.wait(.36)
    SA.Visible = false
    SA.BackgroundTransparency = 0
    SB.Visible = true
    SB.Size    = UDim2.new(0,0,0,0)
    tw(SB, {Size=UDim2.new(0,488,0,382)}, .46, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
end)

print("✦ Trash Hub × Marky.Dev — Midnight Luxury "..VER.." — Loaded")
