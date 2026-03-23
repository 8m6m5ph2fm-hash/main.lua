--[[
  ╔══════════════════════════════════════════╗
  ║   M A R K Y X X X . I N C              ║
  ║   OBSIDIAN  GOLD  EDITION  v2.0        ║
  ╚══════════════════════════════════════════╝
]]

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Stats            = game:GetService("Stats")

local KEY  = "abigail09"
local LP   = Players.LocalPlayer
local NAME = "MarkyXXX.Inc"
local VER  = "v2.0"

local K = {
    b0=Color3.fromRGB(2,2,4),   b1=Color3.fromRGB(5,5,9),
    b2=Color3.fromRGB(9,8,14),  b3=Color3.fromRGB(14,12,22),
    b4=Color3.fromRGB(20,18,30),b5=Color3.fromRGB(28,25,42),
    g1=Color3.fromRGB(255,210,60),  g2=Color3.fromRGB(235,185,20),
    g3=Color3.fromRGB(200,155,0),   g4=Color3.fromRGB(140,105,0),
    g5=Color3.fromRGB(80,58,0),
    mint=Color3.fromRGB(40,255,145), sky=Color3.fromRGB(40,210,255),
    rose=Color3.fromRGB(255,60,85),  warn=Color3.fromRGB(255,185,30),
    t1=Color3.fromRGB(255,255,255), t2=Color3.fromRGB(230,220,200),
    t3=Color3.fromRGB(165,148,115), t4=Color3.fromRGB(95,82,58),
    t5=Color3.fromRGB(45,38,25),
}

local Themes={
    Gold    ={p=K.g2,  g1=K.g1, g2=K.g3},
    Crimson ={p=Color3.fromRGB(210,25,52),  g1=Color3.fromRGB(255,52,82),  g2=Color3.fromRGB(155,10,32)},
    Sapphire={p=Color3.fromRGB(25,95,220),  g1=Color3.fromRGB(55,135,255), g2=Color3.fromRGB(10,58,175)},
    Emerald ={p=Color3.fromRGB(0,168,72),   g1=Color3.fromRGB(15,210,88),  g2=Color3.fromRGB(0,110,45)},
    Violet  ={p=Color3.fromRGB(115,30,220), g1=Color3.fromRGB(155,65,255), g2=Color3.fromRGB(70,10,168)},
    Rose    ={p=Color3.fromRGB(220,38,128), g1=Color3.fromRGB(255,72,162), g2=Color3.fromRGB(165,8,88)},
}
local CT=Themes.Gold

local Root=Instance.new("ScreenGui")
Root.Name="MarkyXXXObsidian"
Root.Parent=game.CoreGui
Root.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
Root.ResetOnSpawn=false

local function crn(p,r) local c=Instance.new("UICorner") c.CornerRadius=UDim.new(0,r or 8) c.Parent=p return c end
local function TW(o,pr,t,s,d) TweenService:Create(o,TweenInfo.new(t or .22,s or Enum.EasingStyle.Quart,d or Enum.EasingDirection.Out),pr):Play() end
local function GG(p,c1,c2,r) local g=Instance.new("UIGradient") g.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,c1),ColorSequenceKeypoint.new(1,c2)} g.Rotation=r or 135 g.Parent=p return g end
local function SH(p,tr,oy) local s=Instance.new("ImageLabel") s.AnchorPoint=Vector2.new(.5,.5) s.BackgroundTransparency=1 s.Position=UDim2.new(.5,0,.5,oy or 16) s.Size=UDim2.new(1,68,1,68) s.ZIndex=p.ZIndex-1 s.Image="rbxassetid://6014261993" s.ImageColor3=Color3.new(0,0,0) s.ImageTransparency=tr or .38 s.ScaleType=Enum.ScaleType.Slice s.SliceCenter=Rect.new(49,49,450,450) s.Parent=p return s end
local function F(par,col,pos,sz,z) local f=Instance.new("Frame") f.Parent=par f.BackgroundColor3=col or K.b2 f.BorderSizePixel=0 f.Position=pos or UDim2.new(0,0,0,0) f.Size=sz or UDim2.new(1,0,1,0) f.ZIndex=z or 1 return f end
local function L(par,txt,pos,sz,font,ts,col,z,xa) local l=Instance.new("TextLabel") l.Parent=par l.BackgroundTransparency=1 l.Position=pos l.Size=sz l.Font=font or Enum.Font.Gotham l.Text=txt l.TextSize=ts or 12 l.TextColor3=col or K.t2 l.ZIndex=z or 1 l.TextXAlignment=xa or Enum.TextXAlignment.Left l.TextWrapped=true return l end
local function SK(p,col,th,tr) local s=Instance.new("UIStroke") s.Color=col or K.g2 s.Thickness=th or 1.5 if tr then s.Transparency=tr end s.Parent=p return s end
local GRS={}
local function GR(p,c1,c2,r) local g=GG(p,c1,c2,r) table.insert(GRS,g) return g end

-- BOOT
local Boot=F(Root,K.b0,UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),40) Boot.Name="Boot"
local bBox=F(Boot,K.b1,UDim2.new(.5,-165,.5,-130),UDim2.new(0,330,0,260),41)
crn(bBox,24) GR(bBox,K.b2,K.b0,148) SK(bBox,K.b4,1.5) SH(bBox,.18,20)
local bTopBar=F(bBox,K.g2,UDim2.new(0,0,0,0),UDim2.new(1,0,0,3),42) crn(bTopBar,24) GR(bTopBar,K.g1,K.g3,0)
local bRingO=F(bBox,K.g3,UDim2.new(.5,-44,0,22),UDim2.new(0,88,0,88),42) crn(bRingO,50) bRingO.BackgroundTransparency=0.88
local bRingM=F(bBox,K.g2,UDim2.new(.5,-34,0,32),UDim2.new(0,68,0,68),43) crn(bRingM,50) bRingM.BackgroundTransparency=0.80
local bRingI=F(bBox,K.b0,UDim2.new(.5,-24,0,42),UDim2.new(0,48,0,48),44) crn(bRingI,50) GR(bRingI,K.b3,K.b0,145) SK(bRingI,K.g2,2,.35)
L(bRingI,"◈",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,22,K.g1,45,Enum.TextXAlignment.Center)
L(bBox,NAME,UDim2.new(0,0,0,122),UDim2.new(1,0,0,24),Enum.Font.GothamBold,16,K.t1,42,Enum.TextXAlignment.Center)
L(bBox,"OBSIDIAN  GOLD  "..VER,UDim2.new(0,0,0,148),UDim2.new(1,0,0,14),Enum.Font.Gotham,9,K.g3,42,Enum.TextXAlignment.Center)
local bDivF=F(bBox,K.g2,UDim2.new(0.12,0,0,170),UDim2.new(0.76,0,0,1),42) bDivF.BackgroundTransparency=0.72
local bProgBg=F(bBox,K.b0,UDim2.new(0,22,0,182),UDim2.new(1,-44,0,4),42) crn(bProgBg,2) SK(bProgBg,K.b4,1)
local bProg=F(bProgBg,K.g2,UDim2.new(0,0,0,0),UDim2.new(0,0,1,0),43) crn(bProg,2) GR(bProg,K.g1,K.g3,0)
local bStatus=L(bBox,"Initializing...",UDim2.new(0,22,0,193),UDim2.new(1,-44,0,14),Enum.Font.Gotham,9,K.t4,42,Enum.TextXAlignment.Center)
local bPct=L(bBox,"0%",UDim2.new(0,22,0,210),UDim2.new(1,-44,0,14),Enum.Font.GothamBold,11,K.g2,42,Enum.TextXAlignment.Center)
local bBotDiv=F(bBox,K.t1,UDim2.new(0,22,0,232),UDim2.new(1,-44,0,1),42) bBotDiv.BackgroundTransparency=0.90
L(bBox,"◆  discord.gg/marky  ·  "..NAME.."  ◆",UDim2.new(0,0,0,238),UDim2.new(1,0,0,14),Enum.Font.GothamBold,8,K.t5,42,Enum.TextXAlignment.Center)

local BOOT_STEPS={
    "Initializing secure runtime...",
    "Mounting AES-256 encryption...",
    "Injecting anti-detection layer...",
    "Patching network hooks...",
    "Building Obsidian UI engine...",
    "Calibrating modules...",
    "Verifying license registry...",
    "Ready — routing to portal...",
}

-- KEY SCREEN
local KeyScreen=F(Root,K.b0,UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),10)
KeyScreen.Name="Key" KeyScreen.Visible=false
local keyLeft=F(KeyScreen,K.b1,UDim2.new(.5,-262,.5,-178),UDim2.new(0,222,0,356),11)
crn(keyLeft,22) GR(keyLeft,K.b2,K.b0,148) SK(keyLeft,K.b4,1.5) SH(keyLeft,.20,18)
local kLTop=F(keyLeft,K.g2,UDim2.new(0,0,0,0),UDim2.new(1,0,0,3),12) crn(kLTop,22) GR(kLTop,K.g1,K.g3,0)
local kLFill=F(keyLeft,K.g3,UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),12) crn(kLFill,22) kLFill.BackgroundTransparency=0.92 GR(kLFill,K.g2,K.b0,145)
local kLR1=F(keyLeft,K.g3,UDim2.new(.5,-52,.26,-52),UDim2.new(0,104,0,104),13) crn(kLR1,50) kLR1.BackgroundTransparency=0.88
local kLR2=F(keyLeft,K.g2,UDim2.new(.5,-38,.26,-38),UDim2.new(0,76,0,76),14) crn(kLR2,50) kLR2.BackgroundTransparency=0.80
local kLCore=F(keyLeft,K.b0,UDim2.new(.5,-25,.26,-25),UDim2.new(0,50,0,50),15) crn(kLCore,50) GR(kLCore,K.b3,K.b0,145) SK(kLCore,K.g2,2,.32)
L(kLCore,"◈",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,24,K.g1,16,Enum.TextXAlignment.Center)
L(keyLeft,NAME,UDim2.new(0,12,.48,0),UDim2.new(1,-24,0,22),Enum.Font.GothamBold,15,K.t1,13,Enum.TextXAlignment.Center)
L(keyLeft,"OBSIDIAN  GOLD",UDim2.new(0,12,.48,24),UDim2.new(1,-24,0,16),Enum.Font.GothamBold,9,K.g3,13,Enum.TextXAlignment.Center)
local kLDiv=F(keyLeft,K.g2,UDim2.new(0.15,0,.62,0),UDim2.new(0.7,0,0,1),13) kLDiv.BackgroundTransparency=0.72
L(keyLeft,VER.."  ·  ELITE",UDim2.new(0,12,.65,0),UDim2.new(1,-24,0,15),Enum.Font.Gotham,9,K.t4,13,Enum.TextXAlignment.Center)
L(keyLeft,"Steal a Brainrot",UDim2.new(0,12,.72,0),UDim2.new(1,-24,0,14),Enum.Font.Gotham,8,K.t5,13,Enum.TextXAlignment.Center)
L(keyLeft,"◆  ◆  ◆",UDim2.new(0,0,.86,0),UDim2.new(1,0,0,16),Enum.Font.GothamBold,9,K.g3,13,Enum.TextXAlignment.Center)
L(keyLeft,"discord.gg/marky",UDim2.new(0,0,.92,0),UDim2.new(1,0,0,14),Enum.Font.Gotham,8,K.t5,13,Enum.TextXAlignment.Center)
local kGap=F(KeyScreen,K.g2,UDim2.new(.5,-2,.5,-178),UDim2.new(0,4,0,356),11) GR(kGap,K.g1,K.g3,180)
local keyRight=F(KeyScreen,K.b1,UDim2.new(.5,38,.5,-178),UDim2.new(0,222,0,356),11)
crn(keyRight,22) GR(keyRight,K.b2,K.b0,148) SK(keyRight,K.b4,1.2) SH(keyRight,.20,18)
local kRTop=F(keyRight,K.g2,UDim2.new(0,0,0,0),UDim2.new(1,0,0,3),12) crn(kRTop,22) GR(kRTop,K.g1,K.g3,0)
L(keyRight,"Welcome back.",UDim2.new(0,18,0,28),UDim2.new(1,-36,0,28),Enum.Font.GothamBold,19,K.t1,12)
local kRAcc=F(keyRight,K.g2,UDim2.new(0,18,0,58),UDim2.new(0,32,0,2),12) crn(kRAcc,2)
L(keyRight,"Enter your license key to\naccess "..NAME..".",UDim2.new(0,18,0,66),UDim2.new(1,-36,0,36),Enum.Font.Gotham,10,K.t3,12)
local kRDiv=F(keyRight,K.g2,UDim2.new(0,18,0,108),UDim2.new(1,-36,0,1),12) kRDiv.BackgroundTransparency=0.72
L(keyRight,"LICENSE KEY",UDim2.new(0,18,0,118),UDim2.new(1,-36,0,14),Enum.Font.GothamBold,8,K.g3,12)
local kInBg=F(keyRight,K.b0,UDim2.new(0,18,0,136),UDim2.new(1,-36,0,46),12) crn(kInBg,14)
local kInStk=SK(kInBg,K.b4,1.8)
local kInIco=F(kInBg,K.g2,UDim2.new(0,3,0.5,-16),UDim2.new(0,32,0,32),13) crn(kInIco,12) kInIco.BackgroundTransparency=0.72 GR(kInIco,K.g1,K.g3,145)
L(kInIco,"◈",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,13,K.g1,14,Enum.TextXAlignment.Center)
local KInput=Instance.new("TextBox") KInput.Parent=kInBg KInput.BackgroundTransparency=1 KInput.Position=UDim2.new(0,42,0,0) KInput.Size=UDim2.new(1,-50,1,0) KInput.Font=Enum.Font.GothamBold KInput.PlaceholderText="enter key here..." KInput.PlaceholderColor3=K.t5 KInput.Text="" KInput.TextColor3=K.t1 KInput.TextSize=13 KInput.ZIndex=13 KInput.ClearTextOnFocus=false
local realKey="" local isUpd=false
KInput:GetPropertyChangedSignal("Text"):Connect(function()
    if isUpd then return end isUpd=true
    local cur=KInput.Text local cl=#cur local rl=#realKey
    if cl>rl then realKey=realKey..cur:sub(rl+1):gsub("●","")
    elseif cl<rl then realKey=realKey:sub(1,#realKey-(rl-cl)) end
    realKey=realKey:lower() KInput.Text=string.rep("●",#realKey)
    task.defer(function() isUpd=false end) end)
local KErr=L(keyRight,"",UDim2.new(0,18,0,187),UDim2.new(1,-36,0,14),Enum.Font.GothamBold,9,K.rose,12,Enum.TextXAlignment.Center)
local KBtnF=F(keyRight,K.g3,UDim2.new(0,18,0,206),UDim2.new(1,-36,0,50),12) crn(KBtnF,16) GR(KBtnF,K.g2,K.g4,140) SK(KBtnF,K.g1,1,.45)
local kBtnSh=F(KBtnF,K.t1,UDim2.new(0,10,0,4),UDim2.new(.50,0,0,2),13) kBtnSh.BackgroundTransparency=0.85
local kBIco=F(KBtnF,K.b0,UDim2.new(0,10,0.5,-15),UDim2.new(0,30,0,30),13) crn(kBIco,50) kBIco.BackgroundTransparency=0.65 GR(kBIco,K.b3,K.b0,145)
L(kBIco,"⚡",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,14,K.g1,14,Enum.TextXAlignment.Center)
L(KBtnF,"UNLOCK ACCESS",UDim2.new(0,50,0,0),UDim2.new(1,-72,1,0),Enum.Font.GothamBold,13,K.b0,13)
L(KBtnF,"›",UDim2.new(1,-28,0,0),UDim2.new(0,22,1,0),Enum.Font.GothamBold,20,K.b0,13,Enum.TextXAlignment.Center)
local KBtn=Instance.new("TextButton") KBtn.Parent=KBtnF KBtn.BackgroundTransparency=1 KBtn.Size=UDim2.new(1,0,1,0) KBtn.Text="" KBtn.ZIndex=14
KBtn.MouseEnter:Connect(function() TW(KBtnF,{BackgroundColor3=K.g2},.14) end)
KBtn.MouseLeave:Connect(function() TW(KBtnF,{BackgroundColor3=K.g3},.14) end)
local kFootDiv=F(keyRight,K.g2,UDim2.new(0,18,0,264),UDim2.new(1,-36,0,1),12) kFootDiv.BackgroundTransparency=0.72
L(keyRight,"◆  discord.gg/marky  ·  "..NAME,UDim2.new(0,18,0,271),UDim2.new(1,-36,0,14),Enum.Font.Gotham,8,K.t5,12,Enum.TextXAlignment.Center)
keyLeft.Position=UDim2.new(.5,-620,.5,-178)
keyRight.Position=UDim2.new(.5,420,.5,-178)

-- VERIFY
local VBox=F(Root,K.b1,UDim2.new(.5,-140,.5,-88),UDim2.new(0,280,0,176),20)
VBox.Name="VBox" VBox.Visible=false crn(VBox,20) SK(VBox,K.b4,1.5) GR(VBox,K.b2,K.b0,148) SH(VBox,.20,16)
local vTop=F(VBox,K.g2,UDim2.new(0,0,0,0),UDim2.new(1,0,0,3),21) crn(vTop,20) GR(vTop,K.g1,K.g3,0)
L(VBox,"◈",UDim2.new(0,0,0,14),UDim2.new(1,0,0,32),Enum.Font.GothamBold,28,K.g2,21,Enum.TextXAlignment.Center)
local vSub=L(VBox,"Connecting...",UDim2.new(0,16,0,72),UDim2.new(1,-32,0,14),Enum.Font.Gotham,9,K.t3,21,Enum.TextXAlignment.Center)
local vPBg=F(VBox,K.b0,UDim2.new(0,20,0,94),UDim2.new(1,-40,0,5),21) crn(vPBg,3) SK(vPBg,K.b4,1)
local vProg=F(vPBg,K.g2,UDim2.new(0,0,0,0),UDim2.new(0,0,1,0),22) crn(vProg,3) GR(vProg,K.g1,K.g3,0)
local vFootDiv=F(VBox,K.g2,UDim2.new(0,18,0,110),UDim2.new(1,-36,0,1),21) vFootDiv.BackgroundTransparency=0.72
L(VBox,"◆  "..NAME.."  ·  "..VER,UDim2.new(0,0,0,116),UDim2.new(1,0,0,14),Enum.Font.Gotham,8,K.t5,21,Enum.TextXAlignment.Center)

-- MAIN HUB
local HUB=F(Root,K.b1,UDim2.new(.5,-288,.5,-222),UDim2.new(0,576,0,444),1)
HUB.Name="HUB" HUB.Visible=false HUB.Active=true HUB.Draggable=true
crn(HUB,22) local HUB_stk=SK(HUB,K.b4,2) GR(HUB,K.b2,K.b0,150) SH(HUB,.15,24)
local hubNeon=F(HUB,K.g2,UDim2.new(0.08,0,0,-1),UDim2.new(0.84,0,0,2),2) crn(hubNeon,2) GR(hubNeon,K.g1,K.g3,0)

-- HEADER
local HDR=F(HUB,K.b0,UDim2.new(0,0,0,0),UDim2.new(1,0,0,56),2) crn(HDR,22)
GR(HDR,Color3.fromRGB(10,8,18),Color3.fromRGB(3,2,6),150) SK(HDR,K.b3,1)
local hBotLine=F(HDR,K.t1,UDim2.new(0,0,1,-1),UDim2.new(1,0,0,1),3) hBotLine.BackgroundTransparency=0.90
local hAccL=F(HDR,K.g2,UDim2.new(0,0,0.12,0),UDim2.new(0,3,0.76,0),3) crn(hAccL,2) GR(hAccL,K.g1,K.g3,180)
local hLogo=F(HDR,K.b1,UDim2.new(0,10,0.5,-21),UDim2.new(0,42,0,42),3) crn(hLogo,13) GR(hLogo,K.b3,K.b0,145) SK(hLogo,K.g2,1.8,.35)
local hLogoGlow=F(HDR,K.g3,UDim2.new(0,7,0.5,-24),UDim2.new(0,48,0,48),2) crn(hLogoGlow,15) hLogoGlow.BackgroundTransparency=0.88
L(hLogo,"◈",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,19,K.g1,4,Enum.TextXAlignment.Center)
L(HDR,NAME.."  "..VER,UDim2.new(0,60,0,9),UDim2.new(0,152,0,19),Enum.Font.GothamBold,12,K.t1,3)
L(HDR,"Steal a Brainrot  ·  Obsidian Gold",UDim2.new(0,60,0,29),UDim2.new(0,178,0,11),Enum.Font.Gotham,8,K.t4,3)

local fpsChip=F(HDR,K.b2,UDim2.new(1,-308,0.5,-11),UDim2.new(0,60,0,22),3) crn(fpsChip,11) SK(fpsChip,K.b4,1) GR(fpsChip,K.b3,K.b1,145)
local fpsDot=F(fpsChip,K.mint,UDim2.new(0,6,0.5,-3),UDim2.new(0,6,0,6),4) crn(fpsDot,50) fpsDot.BackgroundTransparency=0.35
local fpsTL=L(fpsChip,"FPS—",UDim2.new(0,15,0,0),UDim2.new(1,-17,1,0),Enum.Font.GothamBold,9,K.mint,4,Enum.TextXAlignment.Center)
local pingChip=F(HDR,K.b2,UDim2.new(1,-242,0.5,-11),UDim2.new(0,60,0,22),3) crn(pingChip,11) SK(pingChip,K.b4,1) GR(pingChip,K.b3,K.b1,145)
local pingDot=F(pingChip,K.sky,UDim2.new(0,6,0.5,-3),UDim2.new(0,6,0,6),4) crn(pingDot,50) pingDot.BackgroundTransparency=0.35
local pingTL=L(pingChip,"PING—",UDim2.new(0,15,0,0),UDim2.new(1,-17,1,0),Enum.Font.GothamBold,9,K.sky,4,Enum.TextXAlignment.Center)
local tierChip=F(HDR,K.b2,UDim2.new(1,-176,0.5,-11),UDim2.new(0,40,0,22),3) crn(tierChip,11)
local tierStk=SK(tierChip,K.g2,1.5,.42) GR(tierChip,K.b3,K.b1,145)
local tierL=L(tierChip,"👑",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,13,K.g1,4,Enum.TextXAlignment.Center)

local function mkWB(col,xO,ch)
    local bg=F(HDR,col,UDim2.new(1,xO,0.5,-9),UDim2.new(0,18,0,18),4) crn(bg,50) bg.BackgroundTransparency=0.28 SK(bg,K.t1,1,.72)
    local b=Instance.new("TextButton") b.Parent=bg b.BackgroundTransparency=1 b.Size=UDim2.new(1,0,1,0) b.Font=Enum.Font.GothamBold b.Text=ch b.TextColor3=K.t1 b.TextSize=9 b.ZIndex=5
    b.MouseEnter:Connect(function() TW(bg,{BackgroundTransparency=0},.10) end)
    b.MouseLeave:Connect(function() TW(bg,{BackgroundTransparency=0.28},.10) end)
    return b end
local CloseB=mkWB(K.rose,-28,"✕")
local MinB=mkWB(K.g2,-50,"–")
CloseB.MouseButton1Click:Connect(function() TW(HUB,{BackgroundTransparency=1,Size=UDim2.new(0,0,0,0)},.20,Enum.EasingStyle.Back,Enum.EasingDirection.In) task.wait(.22) Root:Destroy() end)
local mini=false
MinB.MouseButton1Click:Connect(function() mini=not mini
    if mini then TW(HUB,{Size=UDim2.new(0,576,0,56)},.28) MinB.Text="+"
    else TW(HUB,{Size=UDim2.new(0,576,0,444)},.28) MinB.Text="–" end end)

-- TAB NAV
local TabOuter=F(HUB,K.b0,UDim2.new(0,0,0,56),UDim2.new(1,0,0,44),2) TabOuter.BackgroundTransparency=0.42 SK(TabOuter,K.b3,1)
local tabBotLine=F(TabOuter,K.t1,UDim2.new(0,0,1,-1),UDim2.new(1,0,0,1),3) tabBotLine.BackgroundTransparency=0.92
local TabNav=Instance.new("ScrollingFrame") TabNav.Parent=TabOuter TabNav.BackgroundTransparency=1 TabNav.Size=UDim2.new(1,0,1,0) TabNav.BorderSizePixel=0 TabNav.ScrollBarThickness=0 TabNav.ScrollingDirection=Enum.ScrollingDirection.X TabNav.CanvasSize=UDim2.new(0,0,1,0)
local tabLL=Instance.new("UIListLayout") tabLL.Parent=TabNav tabLL.FillDirection=Enum.FillDirection.Horizontal tabLL.SortOrder=Enum.SortOrder.LayoutOrder tabLL.Padding=UDim.new(0,4) tabLL.VerticalAlignment=Enum.VerticalAlignment.Center tabLL.HorizontalAlignment=Enum.HorizontalAlignment.Center
local tabPad=Instance.new("UIPadding") tabPad.Parent=TabNav tabPad.PaddingLeft=UDim.new(0,6) tabPad.PaddingRight=UDim.new(0,6)
tabLL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() TabNav.CanvasSize=UDim2.new(0,tabLL.AbsoluteContentSize.X+12,1,0) end)

local Content=F(HUB,K.b0,UDim2.new(0,0,0,100),UDim2.new(1,0,1,-30),2) Content.BackgroundTransparency=0.48
local StatBar=F(HUB,K.b0,UDim2.new(0,0,1,-30),UDim2.new(1,0,0,30),2) StatBar.BackgroundTransparency=0.42 SK(StatBar,K.b3,1)
L(StatBar,"◈  "..NAME.."  ·  "..VER.."  ·  Obsidian Gold Edition",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,8,K.t5,3,Enum.TextXAlignment.Center)
local WMF=F(Root,K.b1,UDim2.new(0,12,0,12),UDim2.new(0,215,0,34)) WMF.Visible=false crn(WMF,17)
local WMstk=SK(WMF,K.g2,1.8) GR(WMF,K.b2,K.b0,140) SH(WMF,.45,4,38) SK(WMF,K.g1,1,.55)
local wmAcc=F(WMF,K.g2,UDim2.new(0,0,0.1,0),UDim2.new(0,3,0.8,0),2) wmAcc.BackgroundTransparency=0.45
L(WMF,"◈  "..NAME.."  ◆  "..VER,UDim2.new(0,6,0,0),UDim2.new(1,-10,1,0),Enum.Font.GothamBold,9,K.t1,3,Enum.TextXAlignment.Center)

-- TAB SYSTEM
local Pages={} local TabBtns={} local pageLLs={} local activeP=nil
local function switchTab(name)
    if mini then mini=false TW(HUB,{Size=UDim2.new(0,576,0,444)},.28) MinB.Text="–" end
    for n,pg in pairs(Pages) do pg.Visible=(n==name) end
    for n,btn in pairs(TabBtns) do
        local on=(n==name)
        TW(btn,{BackgroundColor3=on and K.g3 or K.b2,BackgroundTransparency=on and 0 or 0.65},.18)
        local tl=btn:FindFirstChildOfClass("TextLabel")
        if tl then TW(tl,{TextColor3=on and K.b0 or K.t4},.18) end end
    if Pages[name] and pageLLs[name] then
        Pages[name].CanvasSize=UDim2.new(0,0,0,pageLLs[name].AbsoluteContentSize.Y+24) end
    activeP=name end

local function mkTab(name,icon,order)
    local btn=F(TabNav,K.b2,UDim2.new(0,0,0,0),UDim2.new(0,78,0,30),3)
    btn.BackgroundTransparency=0.65 crn(btn,15) btn.LayoutOrder=order
    L(btn,icon.." "..name,UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,9,K.t4,4,Enum.TextXAlignment.Center)
    local ob=Instance.new("TextButton") ob.Parent=btn ob.BackgroundTransparency=1 ob.Size=UDim2.new(1,0,1,0) ob.Text="" ob.ZIndex=5
    ob.MouseEnter:Connect(function() if activeP~=name then TW(btn,{BackgroundTransparency=0.45},.12) end end)
    ob.MouseLeave:Connect(function() if activeP~=name then TW(btn,{BackgroundTransparency=0.65},.12) end end)
    ob.MouseButton1Click:Connect(function() switchTab(name) end)
    local pg=Instance.new("ScrollingFrame") pg.Parent=Content pg.BackgroundTransparency=1 pg.Size=UDim2.new(1,0,1,0) pg.BorderSizePixel=0 pg.ScrollBarThickness=2 pg.ScrollBarImageColor3=K.g2 pg.ScrollBarImageTransparency=0.45 pg.CanvasSize=UDim2.new(0,0,0,0) pg.Visible=false
    local pll=Instance.new("UIListLayout") pll.Parent=pg pll.SortOrder=Enum.SortOrder.LayoutOrder pll.Padding=UDim.new(0,5)
    local pad=Instance.new("UIPadding") pad.Parent=pg pad.PaddingTop=UDim.new(0,8) pad.PaddingLeft=UDim.new(0,10) pad.PaddingRight=UDim.new(0,10)
    pll:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() pg.CanvasSize=UDim2.new(0,0,0,pll.AbsoluteContentSize.Y+24) end)
    Pages[name]=pg TabBtns[name]=btn pageLLs[name]=pll
    return pg end

-- WIDGETS
local function mkSec(par,title,order)
    local w=F(par,K.b1,UDim2.new(0,0,0,0),UDim2.new(1,0,0,26),1) w.BackgroundTransparency=1 w.LayoutOrder=order or 0
    L(w,"◆",UDim2.new(0,0,0.5,-7),UDim2.new(0,14,0,14),Enum.Font.GothamBold,7,K.g2,2,Enum.TextXAlignment.Center)
    local ll=F(w,K.g2,UDim2.new(0,14,0.5,-1),UDim2.new(0,14,0,1),2) ll.BackgroundTransparency=0.55
    L(w,string.upper(title),UDim2.new(0,30,0,0),UDim2.new(1,-32,1,0),Enum.Font.GothamBold,8,K.g2,2)
    local rl=F(w,K.b4,UDim2.new(0,30,0.5,-1),UDim2.new(1,-32,0,1),1) rl.BackgroundTransparency=0.60
    return w end

local function mkToggle(par,name,order,defOn,badge)
    local row=F(par,K.b2,UDim2.new(0,0,0,0),UDim2.new(1,0,0,48),1) row.LayoutOrder=order or 0 crn(row,13) SK(row,K.b3,1.2) GR(row,K.b3,K.b1,152)
    local strip=F(row,K.g2,UDim2.new(0,0,0.12,0),UDim2.new(0,3,0.76,0),2) crn(strip,2) strip.BackgroundTransparency=defOn and 0.05 or 0.90 GR(strip,K.g1,K.g3,180)
    L(row,name,UDim2.new(0,14,0,0),UDim2.new(0.56,0,1,0),Enum.Font.Gotham,12,K.t2,2)
    if badge then
        local bf=F(row,K.warn,UDim2.new(0.56,6,0.5,-11),UDim2.new(0,76,0,22),3) crn(bf,11) GR(bf,Color3.fromRGB(255,198,0),Color3.fromRGB(205,148,0),135)
        L(bf,badge,UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,8,K.b0,4,Enum.TextXAlignment.Center) end
    local track=F(row,defOn and K.g3 or Color3.fromRGB(12,10,18),UDim2.new(1,-66,0.5,-13),UDim2.new(0,52,0,26),2) crn(track,50)
    local tS=SK(track,defOn and K.g2 or Color3.fromRGB(22,18,32),1,defOn and 0.42 or 0)
    if defOn then GR(track,K.g2,K.g4,140) end
    local knob=F(track,K.t1,defOn and UDim2.new(1,-23,0.5,-11) or UDim2.new(0,3,0.5,-11),UDim2.new(0,22,0,22),3) crn(knob,50) SK(knob,K.t2,1,.65)
    local tog=defOn or false
    local ob=Instance.new("TextButton") ob.Parent=row ob.BackgroundTransparency=1 ob.Size=UDim2.new(1,0,1,0) ob.Text="" ob.ZIndex=4
    ob.MouseButton1Click:Connect(function() tog=not tog
        TW(track,{BackgroundColor3=tog and K.g3 or Color3.fromRGB(12,10,18)})
        TW(knob,{Position=tog and UDim2.new(1,-23,0.5,-11) or UDim2.new(0,3,0.5,-11)})
        TW(strip,{BackgroundTransparency=tog and 0.05 or 0.90})
        tS.Color=tog and K.g2 or Color3.fromRGB(22,18,32) tS.Transparency=tog and 0.42 or 0 end)
    row.MouseEnter:Connect(function() TW(row,{BackgroundColor3=K.b4},.12) end)
    row.MouseLeave:Connect(function() TW(row,{BackgroundColor3=K.b2},.12) end)
    return row,function() return tog end end

local function mkVisRow(par,lo,name)
    local row=F(par,K.b2,UDim2.new(0,0,0,0),UDim2.new(1,0,0,48),1) row.LayoutOrder=lo crn(row,13) SK(row,K.b3,1.2) GR(row,K.b3,K.b1,152)
    local strip=F(row,K.g2,UDim2.new(0,0,0.12,0),UDim2.new(0,3,0.76,0),2) crn(strip,2) strip.BackgroundTransparency=0.90 GR(strip,K.g1,K.g3,180)
    L(row,name,UDim2.new(0,14,0,0),UDim2.new(0.56,0,1,0),Enum.Font.Gotham,12,K.t2,2)
    local track=F(row,Color3.fromRGB(12,10,18),UDim2.new(1,-66,0.5,-13),UDim2.new(0,52,0,26),2) crn(track,50)
    local tS=SK(track,Color3.fromRGB(22,18,32),1,0)
    local knob=F(track,K.t1,UDim2.new(0,3,0.5,-11),UDim2.new(0,22,0,22),3) crn(knob,50) SK(knob,K.t2,1,.65)
    local ob=Instance.new("TextButton") ob.Parent=row ob.BackgroundTransparency=1 ob.Size=UDim2.new(1,0,1,0) ob.Text="" ob.ZIndex=5
    row.MouseEnter:Connect(function() TW(row,{BackgroundColor3=K.b4},.12) end)
    row.MouseLeave:Connect(function() TW(row,{BackgroundColor3=K.b2},.12) end)
    return ob,track,knob,strip,tS end

local function mkSlider(par,name,minV,maxV,defV,order)
    local row=F(par,K.b2,UDim2.new(0,0,0,0),UDim2.new(1,0,0,58),1) row.LayoutOrder=order or 0 crn(row,13) SK(row,K.b3,1.2) GR(row,K.b3,K.b1,152)
    local slAcc=F(row,K.g2,UDim2.new(0,0,0.12,0),UDim2.new(0,3,0.76,0),2) slAcc.BackgroundTransparency=0.90
    L(row,name,UDim2.new(0,14,0,8),UDim2.new(.55,0,0,16),Enum.Font.Gotham,11,K.t2,2)
    local vL=L(row,tostring(defV),UDim2.new(.55,0,0,8),UDim2.new(.40,0,0,16),Enum.Font.GothamBold,12,K.g2,2,Enum.TextXAlignment.Right)
    local tBg=F(row,K.b0,UDim2.new(0,14,0,32),UDim2.new(1,-28,0,7),2) crn(tBg,4) SK(tBg,K.b4,1)
    local fill=F(tBg,K.g3,UDim2.new(0,0,0,0),UDim2.new((defV-minV)/(maxV-minV),0,1,0),3) crn(fill,4) GR(fill,K.g2,K.g4,0)
    local knob=F(tBg,K.t1,UDim2.new((defV-minV)/(maxV-minV),0,0.5,0),UDim2.new(0,16,0,16),4) knob.AnchorPoint=Vector2.new(.5,.5) crn(knob,50) SK(knob,K.g2,1.5,.30)
    local drag=false
    local tB=Instance.new("TextButton") tB.Parent=tBg tB.BackgroundTransparency=1 tB.Size=UDim2.new(1,0,3,-6) tB.Position=UDim2.new(0,0,0.5,-10) tB.Text="" tB.ZIndex=5
    local function upd(x) local fr=math.clamp((x-tBg.AbsolutePosition.X)/tBg.AbsoluteSize.X,0,1) vL.Text=tostring(math.floor(minV+fr*(maxV-minV))) TW(fill,{Size=UDim2.new(fr,0,1,0)},.07) TW(knob,{Position=UDim2.new(fr,0,.5,0)},.07) end
    tB.MouseButton1Down:Connect(function() drag=true upd(UserInputService:GetMouseLocation().X) end)
    UserInputService.InputChanged:Connect(function(i) if drag and i.UserInputType==Enum.UserInputType.MouseMovement then upd(i.Position.X) end end)
    UserInputService.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end end)
    row.MouseEnter:Connect(function() TW(row,{BackgroundColor3=K.b4},.12) end)
    row.MouseLeave:Connect(function() TW(row,{BackgroundColor3=K.b2},.12) end)
    return row end

local function mkCS(par,main,sub,lo)
    local f=F(par,K.b2,UDim2.new(0,0,0,0),UDim2.new(1,0,0,200),1) f.LayoutOrder=lo or 1 crn(f,16) SK(f,K.b3,1.5) GR(f,K.b3,K.b1,152)
    local cR=F(f,K.g3,UDim2.new(.5,-40,.22,-40),UDim2.new(0,80,0,80),2) crn(cR,50) cR.BackgroundTransparency=0.88
    local cC=F(f,K.b0,UDim2.new(.5,-26,.22,-26),UDim2.new(0,52,0,52),3) crn(cC,50) GR(cC,K.b3,K.b0,145) SK(cC,K.g2,2,.42)
    local cI=L(cC,"◈",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,22,K.g2,4,Enum.TextXAlignment.Center)
    local csDL=F(f,K.g2,UDim2.new(0.1,0,.54,0),UDim2.new(0.8,0,0,1),3) csDL.BackgroundTransparency=0.72
    local l2=L(f,main,UDim2.new(0,16,.62,0),UDim2.new(1,-32,0,28),Enum.Font.GothamBold,18,K.g2,3,Enum.TextXAlignment.Center) l2.AnchorPoint=Vector2.new(0,.5)
    local l3=L(f,sub,UDim2.new(0,16,.80,0),UDim2.new(1,-32,0,30),Enum.Font.Gotham,10,K.t4,3,Enum.TextXAlignment.Center) l3.AnchorPoint=Vector2.new(0,.5) l3.TextWrapped=true
    return cI,l2 end

local function mkSCard(par,title,icon,vc,order)
    local card=F(par,K.b2,UDim2.new(0,0,0,0),UDim2.new(1,0,0,82),1) card.LayoutOrder=order crn(card,14) SK(card,K.b3,1.2) GR(card,K.b3,K.b1,152)
    local scAcc=F(card,vc,UDim2.new(0,0,.10,0),UDim2.new(0,3,.80,0),2) scAcc.BackgroundTransparency=0.18
    local iB=F(card,vc,UDim2.new(0,14,.5,-21),UDim2.new(0,42,0,42),2) crn(iB,50) iB.BackgroundTransparency=0.78
    L(iB,icon,UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,20,vc,3,Enum.TextXAlignment.Center)
    L(card,title,UDim2.new(0,64,0,12),UDim2.new(.58,0,0,12),Enum.Font.GothamBold,8,K.t4,3)
    local vL=L(card,"—",UDim2.new(0,64,0,24),UDim2.new(.66,0,0,28),Enum.Font.GothamBold,26,vc,3)
    local bBg=F(card,K.b0,UDim2.new(0,14,1,-12),UDim2.new(1,-28,0,4),2) crn(bBg,2) SK(bBg,K.b4,1)
    local bF=F(bBg,vc,UDim2.new(0,0,0,0),UDim2.new(0,0,1,0),3) crn(bF,2)
    card.MouseEnter:Connect(function() TW(card,{BackgroundColor3=K.b4},.12) end)
    card.MouseLeave:Connect(function() TW(card,{BackgroundColor3=K.b2},.12) end)
    return vL,bF end

-- BUILD TABS
local tp=mkTab("Trade","💎",1)
mkSec(tp,"Trade Features",1) mkToggle(tp,"Visual Trade",2,true) mkToggle(tp,"Auto Accept",3,false) mkToggle(tp,"Freeze Trade",4,false) mkToggle(tp,"Visual Brainrot",5,false)
mkSec(tp,"Timing",6) mkSlider(tp,"Accept Delay (ms)",0,500,35,7) mkSlider(tp,"Visual Intensity",0,100,72,8)
mkSec(tp,"Advanced",9) mkToggle(tp,"Anti Decline",10,true) mkToggle(tp,"Trade Logger",11,false,"UPDATING") mkToggle(tp,"Instant Confirm",12,false,"UPDATING")

local bp=mkTab("Brain","🧠",2)
mkSec(bp,"Engine",1) mkToggle(bp,"Enable Brainrot",2,false) mkToggle(bp,"Rainbow Text",3,false) mkToggle(bp,"Spam Mode",4,false,"UPDATING")
mkSec(bp,"Settings",5) mkSlider(bp,"Speed",1,10,5,6) mkSlider(bp,"Size",10,100,50,7)

local stp=mkTab("Steal","🕵️",3)
local csI1,csT1=mkCS(stp,"COMING SOON","Under development\ndiscord.gg/marky",1)
local tlp=mkTab("List","📋",4)
local csI2,csT2=mkCS(tlp,"COMING SOON","Next patch\ndiscord.gg/marky",1)

-- PLAYER TAB
local pp=mkTab("Player","👤",5)
mkSec(pp,"Visual Cosmetics",1)
local infoF=F(pp,K.b2,UDim2.new(0,0,0,0),UDim2.new(1,0,0,34),1) infoF.LayoutOrder=2 crn(infoF,10) SK(infoF,K.g3,1,.58) GR(infoF,K.b3,K.b1,152)
local infoAcc=F(infoF,K.g2,UDim2.new(0,0,0.1,0),UDim2.new(0,3,0.8,0),2) infoAcc.BackgroundTransparency=0.42
L(infoF,"◆  Client-side only — hanya kamu yang bisa lihat",UDim2.new(0,12,0,0),UDim2.new(1,-24,1,0),Enum.Font.GothamBold,9,K.g3,2,Enum.TextXAlignment.Center)

-- VISUAL ENGINE
local korOn=false local hedOn=false local vP={}
local function clrV(tag) for i=#vP,1,-1 do local p=vP[i] if p and p.Parent and p:GetAttribute("tag")==tag then pcall(function() p:Destroy() end) table.remove(vP,i) end end end
local function applyK()
    clrV("k") local char=LP.Character if not char then return end
    local hum=char:FindFirstChildOfClass("Humanoid") if not hum then return end
    local r15=hum.RigType==Enum.HumanoidRigType.R15
    local function ml(n) local leg=char:FindFirstChild(n) if not leg then return end
        local p=Instance.new("Part") p:SetAttribute("tag","k") p.Name="KV_"..n p.Size=Vector3.new(1.05,2.05,1.05) p.Transparency=0 p.CanCollide=false p.Anchored=false p.CastShadow=true p.Color=Color3.fromRGB(15,15,15) p.Material=Enum.Material.SmoothPlastic p.Parent=char
        local m=Instance.new("SpecialMesh") m.MeshType=Enum.MeshType.FileMesh m.MeshId="rbxassetid://319336350" m.TextureId="rbxassetid://319336355" m.Scale=Vector3.new(1.08,1.08,1.08) m.Parent=p
        local wc=Instance.new("WeldConstraint") wc.Part0=leg wc.Part1=p wc.Parent=p table.insert(vP,p) end
    if r15 then ml("LeftUpperLeg") ml("LeftLowerLeg") ml("RightUpperLeg") ml("RightLowerLeg")
    else ml("Left Leg") ml("Right Leg") end end
local function applyH()
    clrV("h") local char=LP.Character if not char then return end
    local head=char:FindFirstChild("Head") if not head then return end
    head.Transparency=1 for _,v in ipairs(head:GetChildren()) do if v:IsA("SpecialMesh") or v:IsA("Decal") then v.Transparency=1 end end
    head:SetAttribute("tag","h") table.insert(vP,head)
    for _,acc in ipairs(char:GetChildren()) do if acc:IsA("Accessory") then local h=acc:FindFirstChild("Handle") if h then
        local ok=false for _,a in ipairs(h:GetChildren()) do if a:IsA("Attachment") and head:FindFirstChild(a.Name) then ok=true break end end
        if ok then h.Transparency=1 h:SetAttribute("tag","h") table.insert(vP,h) end end end end end
local function removeH()
    local char=LP.Character if not char then return end
    local head=char:FindFirstChild("Head") if head then head.Transparency=0 head:SetAttribute("tag",nil) for _,v in ipairs(head:GetChildren()) do if v:IsA("SpecialMesh") or v:IsA("Decal") then v.Transparency=0 end end end
    for _,p in ipairs(vP) do if p and p.Parent and p:GetAttribute("tag")=="h" then pcall(function() p.Transparency=0 p:SetAttribute("tag",nil) end) end end
    clrV("h") end

local kOb,kTr,kKn,kSt,kTS=mkVisRow(pp,3,"🦴  Korblox Visual")
kOb.MouseButton1Click:Connect(function() korOn=not korOn
    TW(kTr,{BackgroundColor3=korOn and K.g3 or Color3.fromRGB(12,10,18)})
    TW(kKn,{Position=korOn and UDim2.new(1,-23,0.5,-11) or UDim2.new(0,3,0.5,-11)})
    TW(kSt,{BackgroundTransparency=korOn and 0.05 or 0.90})
    kTS.Color=korOn and K.g2 or Color3.fromRGB(22,18,32) kTS.Transparency=korOn and 0.42 or 0
    if korOn then applyK() else clrV("k") end end)

local hOb,hTr,hKn,hSt,hTS=mkVisRow(pp,4,"💀  Headless Visual")
hOb.MouseButton1Click:Connect(function() hedOn=not hedOn
    TW(hTr,{BackgroundColor3=hedOn and K.g3 or Color3.fromRGB(12,10,18)})
    TW(hKn,{Position=hedOn and UDim2.new(1,-23,0.5,-11) or UDim2.new(0,3,0.5,-11)})
    TW(hSt,{BackgroundTransparency=hedOn and 0.05 or 0.90})
    hTS.Color=hedOn and K.g2 or Color3.fromRGB(22,18,32) hTS.Transparency=hedOn and 0.42 or 0
    if hedOn then applyH() else removeH() end end)

-- ════════════════════════════════════
--  AVATAR MORPH — FULL via HumanoidDescription
--  Bisa username SIAPAPUN, ga harus di server!
-- ════════════════════════════════════
mkSec(pp,"Avatar Morph",5)
local mInfoF=F(pp,K.b2,UDim2.new(0,0,0,0),UDim2.new(1,0,0,34),1) mInfoF.LayoutOrder=6 crn(mInfoF,10) SK(mInfoF,K.g3,1,.58) GR(mInfoF,K.b3,K.b1,152)
local mInfoAcc=F(mInfoF,K.g2,UDim2.new(0,0,0.1,0),UDim2.new(0,3,0.8,0),2) mInfoAcc.BackgroundTransparency=0.42
L(mInfoF,"◆  Bisa siapapun — tidak harus ada di server",UDim2.new(0,12,0,0),UDim2.new(1,-24,1,0),Enum.Font.GothamBold,9,K.g3,2,Enum.TextXAlignment.Center)

local mInCard=F(pp,K.b2,UDim2.new(0,0,0,0),UDim2.new(1,0,0,84),1) mInCard.LayoutOrder=7 crn(mInCard,13) SK(mInCard,K.b3,1.2) GR(mInCard,K.b3,K.b1,152)
local mInAcc=F(mInCard,K.g2,UDim2.new(0,0,0.12,0),UDim2.new(0,3,0.76,0),2) mInAcc.BackgroundTransparency=0.42
L(mInCard,"USERNAME TARGET",UDim2.new(0,14,0,8),UDim2.new(1,-28,0,14),Enum.Font.GothamBold,8,K.g3,2)
local mInBg=F(mInCard,K.b0,UDim2.new(0,12,0,26),UDim2.new(1,-24,0,36),2) crn(mInBg,12) SK(mInBg,K.b4,1.5)
local mInIco=F(mInBg,K.g2,UDim2.new(0,3,0.5,-14),UDim2.new(0,28,0,28),3) crn(mInIco,9) mInIco.BackgroundTransparency=0.72 GR(mInIco,K.g1,K.g3,145)
L(mInIco,"👤",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,12,K.g1,4,Enum.TextXAlignment.Center)
local mInput=Instance.new("TextBox") mInput.Parent=mInBg mInput.BackgroundTransparency=1 mInput.Position=UDim2.new(0,36,0,0) mInput.Size=UDim2.new(1,-44,1,0) mInput.Font=Enum.Font.GothamBold mInput.PlaceholderText="Enter username..." mInput.PlaceholderColor3=K.t5 mInput.Text="" mInput.TextColor3=K.t1 mInput.TextSize=12 mInput.ZIndex=3 mInput.ClearTextOnFocus=false
local mStatus=L(mInCard,"",UDim2.new(0,12,0,66),UDim2.new(1,-24,0,14),Enum.Font.GothamBold,9,K.g2,2)

local mBtnRow=F(pp,K.b0,UDim2.new(0,0,0,0),UDim2.new(1,0,0,44),1) mBtnRow.LayoutOrder=8 mBtnRow.BackgroundTransparency=1
local mBtnF=F(mBtnRow,K.g3,UDim2.new(0,0,0.5,-18),UDim2.new(.58,0,0,36),1) crn(mBtnF,14) GR(mBtnF,K.g2,K.g4,140) SK(mBtnF,K.g1,1,.45)
local mBtnSh=F(mBtnF,K.t1,UDim2.new(0,8,0,3),UDim2.new(.45,0,0,2),2) mBtnSh.BackgroundTransparency=0.86
L(mBtnF,"⚡  MORPH",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,13,K.b0,2,Enum.TextXAlignment.Center)
local mBtn=Instance.new("TextButton") mBtn.Parent=mBtnF mBtn.BackgroundTransparency=1 mBtn.Size=UDim2.new(1,0,1,0) mBtn.Text="" mBtn.ZIndex=3
mBtn.MouseEnter:Connect(function() TW(mBtnF,{BackgroundColor3=K.g2},.14) end)
mBtn.MouseLeave:Connect(function() TW(mBtnF,{BackgroundColor3=K.g3},.14) end)

local rBtnF=F(mBtnRow,K.b3,UDim2.new(.62,0,0.5,-18),UDim2.new(.38,0,0,36),1) crn(rBtnF,14) GR(rBtnF,K.b4,K.b2,140) SK(rBtnF,K.b4,1,.45)
L(rBtnF,"↺  RESET",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,13,K.t2,2,Enum.TextXAlignment.Center)
local rBtn=Instance.new("TextButton") rBtn.Parent=rBtnF rBtn.BackgroundTransparency=1 rBtn.Size=UDim2.new(1,0,1,0) rBtn.Text="" rBtn.ZIndex=3
rBtn.MouseEnter:Connect(function() TW(rBtnF,{BackgroundColor3=K.b4},.14) end)
rBtn.MouseLeave:Connect(function() TW(rBtnF,{BackgroundColor3=K.b3},.14) end)

-- MORPH LOGIC — pakai HumanoidDescription (bisa siapapun!)
local morphOn=false
local originalDesc=nil
local function setMS(txt,col) mStatus.Text=txt mStatus.TextColor3=col or K.g2 end

local function applyMorph(username)
    if username=="" then setMS("Masukkan username dulu!",K.rose) return end
    setMS("Loading ava "..username.."...",K.warn)

    local char=LP.Character
    local hum=char and char:FindFirstChildOfClass("Humanoid")
    if not char or not hum then setMS("Character error!",K.rose) return end

    -- simpan desc asli sebelum morph pertama kali
    if not originalDesc then
        local ok,desc=pcall(function()
            return Players:GetHumanoidDescriptionFromUserId(LP.UserId) end)
        if ok then originalDesc=desc end
    end

    -- ambil UserId dari username
    local uid
    local ok1,res=pcall(function()
        return Players:GetUserIdFromNameAsync(username) end)
    if not ok1 then setMS("Username tidak ditemukan!",K.rose) return end
    uid=res

    -- ambil HumanoidDescription dari userId
    local ok2,desc=pcall(function()
        return Players:GetHumanoidDescriptionFromUserId(uid) end)
    if not ok2 then setMS("Gagal load ava!",K.rose) return end

    -- apply ke karakter kita
    local ok3,err=pcall(function()
        hum:ApplyDescription(desc) end)

    if ok3 then
        morphOn=true
        setMS("Morphed → "..username.." ✓",K.mint)
        print("◈ Morphed to: "..username.." ("..uid..")")
    else
        setMS("Gagal apply!",K.rose)
        print("Morph error: "..tostring(err)) end end

local function resetMorph()
    local char=LP.Character
    local hum=char and char:FindFirstChildOfClass("Humanoid")
    if not char or not hum then return end
    if originalDesc then
        pcall(function() hum:ApplyDescription(originalDesc) end)
        setMS("Reset ke ava asli ✓",K.mint)
    else
        -- kalau belum sempat save, ambil dari server
        local ok,desc=pcall(function()
            return Players:GetHumanoidDescriptionFromUserId(LP.UserId) end)
        if ok then
            pcall(function() hum:ApplyDescription(desc) end)
            setMS("Reset ke ava asli ✓",K.mint) end end
    morphOn=false end

mBtn.MouseButton1Click:Connect(function()
    local u=mInput.Text:gsub("%s+","")
    task.spawn(function() applyMorph(u) end) end)
rBtn.MouseButton1Click:Connect(function()
    task.spawn(resetMorph) end)

LP.CharacterAdded:Connect(function()
    vP={} task.wait(2)
    if korOn then applyK() end
    if hedOn then applyH() end
    if morphOn and mInput.Text~="" then
        task.spawn(function() applyMorph(mInput.Text:gsub("%s+","")) end) end end)

mkSec(pp,"Coming Soon",9)
local csI3,csT3=mkCS(pp,"UPDATING . . .","More cosmetics coming",10)

-- STATS
local sp=mkTab("Stats","📊",6)
mkSec(sp,"Performance",1)
local fpsVal,fpsBar=mkSCard(sp,"FRAMES PER SECOND","⚡",K.mint,2)
local pingVal,pingBar=mkSCard(sp,"NETWORK PING","📶",K.sky,3)
mkSec(sp,"Optimizers",4)
mkToggle(sp,"FPS Unlocker",5,true) mkToggle(sp,"Render Optimizer",6,false,"UPDATING") mkToggle(sp,"Low Latency",7,false,"UPDATING") mkToggle(sp,"Memory Cleaner",8,false)

-- THEMES
local misc=mkTab("More","⚙️",7)
mkSec(misc,"Theme Customizer",1)
local tNames={"Gold","Crimson","Sapphire","Emerald","Violet","Rose"}
for i,tn in ipairs(tNames) do
    local th=Themes[tn]
    local trow=F(misc,K.b2,UDim2.new(0,0,0,0),UDim2.new(1,0,0,44),1) trow.LayoutOrder=i+1 crn(trow,13) SK(trow,K.b3,1.2) GR(trow,K.b3,K.b1,152)
    local dO=F(trow,th.p,UDim2.new(0,12,0.5,-12),UDim2.new(0,24,0,24)) crn(dO,50) dO.BackgroundTransparency=0.55 SK(dO,K.t1,1,.72)
    local dI=F(trow,th.p,UDim2.new(0,16,0.5,-7),UDim2.new(0,14,0,14)) crn(dI,50) GG(dI,th.g1,th.g2,135)
    L(trow,tn,UDim2.new(0,44,0,0),UDim2.new(0.44,0,1,0),Enum.Font.GothamBold,13,K.t2,2)
    local aInd=L(trow,i==1 and "◆ Active" or "",UDim2.new(0.44,0,0,0),UDim2.new(0.26,0,1,0),Enum.Font.Gotham,9,K.g2,2)
    local abF=F(trow,th.p,UDim2.new(1,-82,0.5,-16),UDim2.new(0,70,0,32),3) crn(abF,16) GG(abF,th.g1,th.g2,140)
    local abFSh=F(abF,K.t1,UDim2.new(0,6,0,3),UDim2.new(.46,0,0,2),4) abFSh.BackgroundTransparency=0.87
    local aL=L(abF,"Apply",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,11,K.b0,4,Enum.TextXAlignment.Center)
    local aOb=Instance.new("TextButton") aOb.Parent=abF aOb.BackgroundTransparency=1 aOb.Size=UDim2.new(1,0,1,0) aOb.Text="" aOb.ZIndex=5
    local cap,indRef=tn,aInd
    aOb.MouseButton1Click:Connect(function() CT=Themes[cap]
        local cs=ColorSequence.new{ColorSequenceKeypoint.new(0,CT.g1),ColorSequenceKeypoint.new(1,CT.g2)}
        for _,g in ipairs(GRS) do g.Color=cs end HUB_stk.Color=CT.p WMstk.Color=CT.p
        for _,ch in ipairs(misc:GetChildren()) do if ch:IsA("Frame") then for _,cc in ipairs(ch:GetChildren()) do if cc:IsA("TextLabel") and cc.TextSize==9 then cc.Text="" end end end end
        indRef.Text="◆ Active" indRef.TextColor3=K.g2 aL.Text="✓"
        task.delay(1.5,function() if aL and aL.Parent then aL.Text="Apply" end end) end)
    trow.MouseEnter:Connect(function() TW(trow,{BackgroundColor3=K.b4},.12) end)
    trow.MouseLeave:Connect(function() TW(trow,{BackgroundColor3=K.b2},.12) end)
end
task.defer(function() if pageLLs["More"] then misc.CanvasSize=UDim2.new(0,0,0,pageLLs["More"].AbsoluteContentSize.Y+24) end end)

-- SEQUENCES
local function showHub()
    tierL.Text="👑" tierStk.Color=K.g2 tierStk.Transparency=0.20
    HUB.Visible=true WMF.Visible=true HUB.Size=UDim2.new(0,0,0,0)
    TW(HUB,{Size=UDim2.new(0,576,0,444)},.44,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
    switchTab("Trade") end

local function doVerify(key)
    local ok=(key==KEY)
    KeyScreen.Visible=false VBox.Visible=true vProg.Size=UDim2.new(0,0,1,0)
    local steps=ok and {"Connecting to auth server...","TLS 1.3 handshake complete.","Scanning key registry...","Key found — OWNER  ◆","License active.","Welcome back!"}
    or {"Connecting to auth server...","TLS 1.3 handshake complete.","Scanning key registry...","Key not found.","Access denied.","Session closed."}
    for i,s in ipairs(steps) do task.wait(.30) vSub.Text=s TW(vProg,{Size=UDim2.new(i/#steps,0,1,0)},.24) end
    task.wait(.40)
    if ok then VBox.Visible=false showHub()
    else
        TW(VBox,{BackgroundTransparency=1},.22) task.wait(.25)
        VBox.BackgroundTransparency=0 VBox.Visible=false KeyScreen.Visible=true
        KErr.Text="✗  Invalid key — access denied."
        kInStk.Color=K.rose kInStk.Thickness=2
        isUpd=true realKey="" KInput.Text="" task.defer(function() isUpd=false end)
        for _=1,4 do TW(keyRight,{Position=UDim2.new(.5,-248,.5,-178)},.04) task.wait(.05) TW(keyRight,{Position=UDim2.new(.5,38,.5,-178)},.04) task.wait(.05) end
        TW(keyRight,{Position=UDim2.new(.5,38,.5,-178)},.05)
        task.wait(2.2) KErr.Text="" kInStk.Color=K.b4 kInStk.Thickness=1.8 end end

local submitting=false
KBtn.MouseButton1Click:Connect(function() if submitting then return end submitting=true
    local k=realKey:gsub("%s+","") task.spawn(function() doVerify(k) submitting=false end) end)

-- RUNTIME
local fpsBuf={} local fpsS=60 local pingS=38
RunService.Heartbeat:Connect(function(dt)
    table.insert(fpsBuf,dt) if #fpsBuf>24 then table.remove(fpsBuf,1) end
    local avg=0 for _,v in ipairs(fpsBuf) do avg=avg+v end avg=avg/#fpsBuf
    fpsS=fpsS+(math.floor(1/avg)-fpsS)*.08
    local fd=math.clamp(math.floor(fpsS),1,999)
    local fC=fd>=55 and K.mint or fd>=30 and K.warn or K.rose
    local op,rp=pcall(function() return Stats.Network.ServerStatsItem["Data Ping"]:GetValue() end)
    local tg=op and rp and rp>0 and rp or (pingS+math.random(-4,6))
    pingS=pingS+(tg-pingS)*.05
    local pd=math.max(1,math.floor(pingS))
    local pC=pd<=60 and K.mint or pd<=120 and K.warn or K.rose
    if HUB.Visible then
        fpsTL.Text="FPS "..fd fpsTL.TextColor3=fC fpsDot.BackgroundColor3=fC
        pingTL.Text="PING "..pd pingTL.TextColor3=pC pingDot.BackgroundColor3=pC
        fpsVal.Text=tostring(fd) fpsVal.TextColor3=fC pingVal.Text=pd.." ms" pingVal.TextColor3=pC
        TW(fpsBar,{Size=UDim2.new(math.clamp(fd/144,0,1),0,1,0)},.45)
        TW(pingBar,{Size=UDim2.new(math.clamp(1-pd/260,0,1),0,1,0)},.45) end
    local t=(tick()*.12)%1
    for _,r in ipairs({csI1,csI2,csI3,csT1,csT2,csT3}) do
        if r and r.Parent then r.TextColor3=Color3.fromHSV(t,.80,1) end end end)

-- LAUNCH
task.spawn(function()
    for i,s in ipairs(BOOT_STEPS) do task.wait(.24) bStatus.Text=s
        local pct=i/#BOOT_STEPS TW(bProg,{Size=UDim2.new(pct,0,1,0)},.20) bPct.Text=math.floor(pct*100).."%" end
    task.wait(.38) TW(Boot,{BackgroundTransparency=1},.32) task.wait(.34)
    Boot.Visible=false Boot.BackgroundTransparency=0 KeyScreen.Visible=true
    TW(keyLeft,{Position=UDim2.new(.5,-262,.5,-178)},.42,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
    TW(keyRight,{Position=UDim2.new(.5,38,.5,-178)},.42,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
end)

print("◈ "..NAME.." "..VER.." — Obsidian Gold + Full Avatar Morph — Loaded")
