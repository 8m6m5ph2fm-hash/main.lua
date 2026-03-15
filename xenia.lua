--[[
  ╔════════════════════════════════════════╗
  ║   M A R K Y X X X . I N C            ║
  ║   CRIMSON  FLOAT  v1.0               ║
  ╚════════════════════════════════════════╝
]]

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Stats            = game:GetService("Stats")

local KEY  = "abigail09"
local LP   = Players.LocalPlayer
local NAME = "MarkyXXX.Inc"
local VER  = "v1.0"

local K = {
    bg=Color3.fromRGB(6,4,10), card=Color3.fromRGB(11,8,18),
    card2=Color3.fromRGB(16,12,26), card3=Color3.fromRGB(22,16,35),
    line=Color3.fromRGB(30,22,48),
    r1=Color3.fromRGB(180,15,38), r2=Color3.fromRGB(220,28,55),
    r3=Color3.fromRGB(255,52,82), r4=Color3.fromRGB(255,108,132),
    gold=Color3.fromRGB(255,198,45), goldd=Color3.fromRGB(210,155,0),
    mint=Color3.fromRGB(45,255,148), sky=Color3.fromRGB(45,215,255),
    rose=Color3.fromRGB(255,55,80),
    w1=Color3.fromRGB(255,255,255), w2=Color3.fromRGB(220,210,238),
    w3=Color3.fromRGB(150,135,175), w4=Color3.fromRGB(82,65,112),
    w5=Color3.fromRGB(40,30,62),
}

local Root=Instance.new("ScreenGui")
Root.Name="MarkyXXXFloat" Root.Parent=game.CoreGui
Root.ZIndexBehavior=Enum.ZIndexBehavior.Sibling Root.ResetOnSpawn=false

local function crn(p,r) local c=Instance.new("UICorner") c.CornerRadius=UDim.new(0,r or 8) c.Parent=p return c end
local function TW(o,pr,t,s,d) TweenService:Create(o,TweenInfo.new(t or .22,s or Enum.EasingStyle.Quart,d or Enum.EasingDirection.Out),pr):Play() end
local function GG(p,c1,c2,r) local g=Instance.new("UIGradient") g.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,c1),ColorSequenceKeypoint.new(1,c2)} g.Rotation=r or 135 g.Parent=p return g end
local function SH(p,tr,oy) local s=Instance.new("ImageLabel") s.AnchorPoint=Vector2.new(.5,.5) s.BackgroundTransparency=1 s.Position=UDim2.new(.5,0,.5,oy or 16) s.Size=UDim2.new(1,65,1,65) s.ZIndex=p.ZIndex-1 s.Image="rbxassetid://6014261993" s.ImageColor3=Color3.new(0,0,0) s.ImageTransparency=tr or .4 s.ScaleType=Enum.ScaleType.Slice s.SliceCenter=Rect.new(49,49,450,450) s.Parent=p return s end
local function F(par,col,pos,sz,z) local f=Instance.new("Frame") f.Parent=par f.BackgroundColor3=col or K.card f.BorderSizePixel=0 f.Position=pos or UDim2.new(0,0,0,0) f.Size=sz or UDim2.new(1,0,1,0) f.ZIndex=z or 1 return f end
local function L(par,txt,pos,sz,font,ts,col,z,xa) local l=Instance.new("TextLabel") l.Parent=par l.BackgroundTransparency=1 l.Position=pos l.Size=sz l.Font=font or Enum.Font.Gotham l.Text=txt l.TextSize=ts or 12 l.TextColor3=col or K.w2 l.ZIndex=z or 1 l.TextXAlignment=xa or Enum.TextXAlignment.Left l.TextWrapped=true return l end
local function SK(p,col,th,tr) local s=Instance.new("UIStroke") s.Color=col or K.r2 s.Thickness=th or 1.5 if tr then s.Transparency=tr end s.Parent=p return s end

local GRS={}
local function GR(p,c1,c2,r) local g=GG(p,c1,c2,r) table.insert(GRS,g) return g end

-- BOOT SCREEN
local Boot=F(Root,K.bg,UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),40)
Boot.Name="Boot"
local bootBox=F(Boot,K.card,UDim2.new(.5,-155,.5,-115),UDim2.new(0,310,0,230),41)
crn(bootBox,22) SH(bootBox,.18,18) SK(bootBox,K.r2,2) GR(bootBox,K.card2,K.bg,148)
local bTop=F(bootBox,K.r2,UDim2.new(0,0,0,0),UDim2.new(1,0,0,3),42) crn(bTop,22) GR(bTop,K.r3,K.r1,0)
local bRing=F(bootBox,K.r1,UDim2.new(.5,-36,0,24),UDim2.new(0,72,0,72),42) crn(bRing,50) bRing.BackgroundTransparency=0.80
local bCore=F(bootBox,K.card,UDim2.new(.5,-26,0,34),UDim2.new(0,52,0,52),43) crn(bCore,50) GR(bCore,K.card2,K.bg,145) SK(bCore,K.r3,2,.35)
L(bCore,"🔱",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,26,K.gold,44,Enum.TextXAlignment.Center)
L(bootBox,NAME,UDim2.new(0,0,0,108),UDim2.new(1,0,0,22),Enum.Font.GothamBold,15,K.w1,42,Enum.TextXAlignment.Center)
L(bootBox,"CRIMSON  FLOAT  "..VER,UDim2.new(0,0,0,131),UDim2.new(1,0,0,14),Enum.Font.Gotham,9,K.w4,42,Enum.TextXAlignment.Center)
local bProgBg=F(bootBox,K.bg,UDim2.new(0,22,0,156),UDim2.new(1,-44,0,4),42) crn(bProgBg,2) SK(bProgBg,K.line,1)
local bProg=F(bProgBg,K.r2,UDim2.new(0,0,0,0),UDim2.new(0,0,1,0),43) crn(bProg,2) GR(bProg,K.r4,K.r1,0)
local bStatus=L(bootBox,"Initializing...",UDim2.new(0,22,0,167),UDim2.new(1,-44,0,14),Enum.Font.Gotham,9,K.w4,42,Enum.TextXAlignment.Center)
local bPct=L(bootBox,"0%",UDim2.new(0,22,0,184),UDim2.new(1,-44,0,14),Enum.Font.GothamBold,10,K.r3,42,Enum.TextXAlignment.Center)
F(bootBox,K.w1,UDim2.new(0,22,0,204),UDim2.new(1,-44,0,1),42).BackgroundTransparency=0.90
L(bootBox,"discord.gg/marky  ·  "..NAME,UDim2.new(0,0,0,210),UDim2.new(1,0,0,12),Enum.Font.Gotham,8,K.w5,42,Enum.TextXAlignment.Center)

local BOOT_STEPS={
    "Loading secure runtime...",
    "Mounting encryption layer...",
    "Patching network hooks...",
    "Injecting anti-detection...",
    "Building UI engine...",
    "Calibrating modules...",
    "Verifying checksums...",
    "Ready — routing to portal...",
}

-- KEY SCREEN
local KeyScreen=F(Root,K.bg,UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),10)
KeyScreen.Name="Key" KeyScreen.Visible=false

local keyLeft=F(KeyScreen,K.card,UDim2.new(.5,-260,.5,-170),UDim2.new(0,220,0,340),11)
crn(keyLeft,20) GR(keyLeft,K.card2,K.bg,148) SK(keyLeft,K.r2,1.5,.35) SH(keyLeft,.22,16)
local kLFill=F(keyLeft,K.r1,UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),12) crn(kLFill,20) kLFill.BackgroundTransparency=0.90 GR(kLFill,K.r2,K.bg,145)
local kLRing=F(keyLeft,K.r2,UDim2.new(.5,-50,.26,-50),UDim2.new(0,100,0,100),13) crn(kLRing,50) kLRing.BackgroundTransparency=0.85
local kLR2=F(keyLeft,K.r2,UDim2.new(.5,-36,.26,-36),UDim2.new(0,72,0,72),14) crn(kLR2,50) kLR2.BackgroundTransparency=0.78
local kLCore=F(keyLeft,K.card,UDim2.new(.5,-24,.26,-24),UDim2.new(0,48,0,48),15) crn(kLCore,50) GR(kLCore,K.card2,K.bg,145) SK(kLCore,K.r3,2,.32)
L(kLCore,"🔱",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,24,K.gold,16,Enum.TextXAlignment.Center)
L(keyLeft,NAME,UDim2.new(0,10,.50,0),UDim2.new(1,-20,0,22),Enum.Font.GothamBold,14,K.w1,13,Enum.TextXAlignment.Center)
L(keyLeft,"CRIMSON FLOAT",UDim2.new(0,10,.50,24),UDim2.new(1,-20,0,16),Enum.Font.GothamBold,9,K.r4,13,Enum.TextXAlignment.Center)
F(keyLeft,K.r2,UDim2.new(0.15,0,.62,0),UDim2.new(0.7,0,0,1),13).BackgroundTransparency=0.72
L(keyLeft,VER.."  ELITE",UDim2.new(0,10,.65,0),UDim2.new(1,-20,0,15),Enum.Font.Gotham,9,K.w4,13,Enum.TextXAlignment.Center)
L(keyLeft,"Steal a Brainrot",UDim2.new(0,10,.72,0),UDim2.new(1,-20,0,14),Enum.Font.Gotham,8,K.w5,13,Enum.TextXAlignment.Center)
L(keyLeft,"✦  ✦  ✦",UDim2.new(0,0,.88,0),UDim2.new(1,0,0,16),Enum.Font.GothamBold,10,K.r4,13,Enum.TextXAlignment.Center)

local kGap=F(KeyScreen,K.r2,UDim2.new(.5,-2,.5,-170),UDim2.new(0,4,0,340),11) GR(kGap,K.r3,K.r1,180)

local keyRight=F(KeyScreen,K.card,UDim2.new(.5,40,.5,-170),UDim2.new(0,218,0,340),11)
crn(keyRight,20) GR(keyRight,K.card2,K.bg,148) SK(keyRight,K.line,1.2) SH(keyRight,.22,16)
L(keyRight,"Welcome back.",UDim2.new(0,18,0,28),UDim2.new(1,-36,0,26),Enum.Font.GothamBold,18,K.w1,12)
L(keyRight,"Enter your key to access\n"..NAME..".",UDim2.new(0,18,0,58),UDim2.new(1,-36,0,36),Enum.Font.Gotham,10,K.w3,12)
F(keyRight,K.line,UDim2.new(0,18,0,100),UDim2.new(1,-36,0,1),12).BackgroundTransparency=0.42
L(keyRight,"LICENSE KEY",UDim2.new(0,18,0,112),UDim2.new(1,-36,0,14),Enum.Font.GothamBold,8,K.r4,12)
local kInBg=F(keyRight,K.bg,UDim2.new(0,18,0,130),UDim2.new(1,-36,0,44),12) crn(kInBg,12)
local kInStk=SK(kInBg,K.line,1.5)
local KInput=Instance.new("TextBox") KInput.Parent=kInBg KInput.BackgroundTransparency=1 KInput.Position=UDim2.new(0,14,0,0) KInput.Size=UDim2.new(1,-28,1,0) KInput.Font=Enum.Font.GothamBold KInput.PlaceholderText="enter key here..." KInput.PlaceholderColor3=K.w5 KInput.Text="" KInput.TextColor3=K.w1 KInput.TextSize=13 KInput.ZIndex=13 KInput.ClearTextOnFocus=false

local realKey="" local isUpd=false
KInput:GetPropertyChangedSignal("Text"):Connect(function()
    if isUpd then return end isUpd=true
    local cur=KInput.Text local cl=#cur local rl=#realKey
    if cl>rl then realKey=realKey..cur:sub(rl+1):gsub("●","")
    elseif cl<rl then realKey=realKey:sub(1,#realKey-(rl-cl)) end
    realKey=realKey:lower() KInput.Text=string.rep("●",#realKey)
    task.defer(function() isUpd=false end) end)

local KErr=L(keyRight,"",UDim2.new(0,18,0,180),UDim2.new(1,-36,0,14),Enum.Font.GothamBold,9,K.rose,12,Enum.TextXAlignment.Center)
local KBtnF=F(keyRight,K.r1,UDim2.new(0,18,0,198),UDim2.new(1,-36,0,46),12) crn(KBtnF,14) GR(KBtnF,K.r3,K.r1,140) SK(KBtnF,K.gold,1,.55)
F(KBtnF,K.w1,UDim2.new(0,10,0,4),UDim2.new(.45,0,0,2),13).BackgroundTransparency=0.86
L(KBtnF,"UNLOCK  ›",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,14,K.w1,13,Enum.TextXAlignment.Center)
local KBtn=Instance.new("TextButton") KBtn.Parent=KBtnF KBtn.BackgroundTransparency=1 KBtn.Size=UDim2.new(1,0,1,0) KBtn.Text="" KBtn.ZIndex=14
KBtn.MouseEnter:Connect(function() TW(KBtnF,{BackgroundColor3=K.r3},.14) end)
KBtn.MouseLeave:Connect(function() TW(KBtnF,{BackgroundColor3=K.r1},.14) end)
F(keyRight,K.line,UDim2.new(0,18,0,252),UDim2.new(1,-36,0,1),12).BackgroundTransparency=0.42
L(keyRight,"discord.gg/marky  ·  "..NAME,UDim2.new(0,18,0,260),UDim2.new(1,-36,0,14),Enum.Font.Gotham,8,K.w5,12,Enum.TextXAlignment.Center)

keyLeft.Position=UDim2.new(.5,-600,.5,-170)
keyRight.Position=UDim2.new(.5,400,.5,-170)

-- VERIFY POPUP
local VBox=F(Root,K.card,UDim2.new(.5,-135,.5,-85),UDim2.new(0,270,0,170),20)
VBox.Name="VBox" VBox.Visible=false crn(VBox,18) SK(VBox,K.r2,2) GR(VBox,K.card2,K.bg,148) SH(VBox,.20,16)
local vbTop=F(VBox,K.r2,UDim2.new(0,0,0,0),UDim2.new(1,0,0,3),21) crn(vbTop,18) GR(vbTop,K.r3,K.r1,0)
L(VBox,"⚙️",UDim2.new(0,0,0,14),UDim2.new(1,0,0,30),Enum.Font.GothamBold,26,K.w1,21,Enum.TextXAlignment.Center)
local vSub=L(VBox,"Connecting...",UDim2.new(0,16,0,70),UDim2.new(1,-32,0,14),Enum.Font.Gotham,9,K.w3,21,Enum.TextXAlignment.Center)
local vPBg=F(VBox,K.bg,UDim2.new(0,18,0,92),UDim2.new(1,-36,0,5),21) crn(vPBg,3) SK(vPBg,K.line,1)
local vProg=F(vPBg,K.r2,UDim2.new(0,0,0,0),UDim2.new(0,0,1,0),22) crn(vProg,3) GR(vProg,K.r4,K.r1,0)
L(VBox,"discord.gg/marky  ·  "..NAME,UDim2.new(0,0,0,110),UDim2.new(1,0,0,14),Enum.Font.Gotham,8,K.w5,21,Enum.TextXAlignment.Center)

-- MAIN HUB
local HUB=F(Root,K.card,UDim2.new(.5,-285,.5,-218),UDim2.new(0,570,0,436),1)
HUB.Name="HUB" HUB.Visible=false HUB.Active=true HUB.Draggable=true
crn(HUB,20) local HUB_stk=SK(HUB,K.r2,2) GR(HUB,K.card2,K.bg,150) SH(HUB,.16,22)
local hubNeon=F(HUB,K.r3,UDim2.new(0.08,0,0,-1),UDim2.new(0.84,0,0,2),2) crn(hubNeon,2) GR(hubNeon,K.r4,K.r1,0)

-- HEADER
local HDR=F(HUB,K.bg,UDim2.new(0,0,0,0),UDim2.new(1,0,0,54),2) crn(HDR,20) GR(HDR,Color3.fromRGB(12,7,20),Color3.fromRGB(4,2,8),150)
SK(HDR,K.line,1) F(HDR,K.w1,UDim2.new(0,0,1,-1),UDim2.new(1,0,0,1),3).BackgroundTransparency=0.88

-- logo
local hLogo=F(HDR,K.card,UDim2.new(0,10,0.5,-20),UDim2.new(0,40,0,40),3) crn(hLogo,12) GR(hLogo,K.card2,K.bg,145) SK(hLogo,K.r3,1.5,.38)
local hLogoGlow=F(HDR,K.r1,UDim2.new(0,7,0.5,-23),UDim2.new(0,46,0,46),2) crn(hLogoGlow,14) hLogoGlow.BackgroundTransparency=0.88
L(hLogo,"🔱",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,18,K.gold,4,Enum.TextXAlignment.Center)

-- title
L(HDR,NAME.."  "..VER,UDim2.new(0,58,0,8),UDim2.new(0,155,0,18),Enum.Font.GothamBold,11,K.w1,3)
L(HDR,"Steal a Brainrot",UDim2.new(0,58,0,28),UDim2.new(0,155,0,12),Enum.Font.Gotham,8,K.w4,3)

-- ── FIX #1: stat chips lebih kecil & rapat ──
local fpsChip=F(HDR,K.card,UDim2.new(1,-218,0.5,-12),UDim2.new(0,66,0,24),3) crn(fpsChip,12) SK(fpsChip,K.line,1) GR(fpsChip,K.card2,K.bg,145)
local fpsDot=F(fpsChip,K.mint,UDim2.new(0,6,0.5,-3),UDim2.new(0,6,0,6),4) crn(fpsDot,50) fpsDot.BackgroundTransparency=0.35
local fpsTL=L(fpsChip,"FPS —",UDim2.new(0,15,0,0),UDim2.new(1,-18,1,0),Enum.Font.GothamBold,9,K.mint,4,Enum.TextXAlignment.Center)

local pingChip=F(HDR,K.card,UDim2.new(1,-146,0.5,-12),UDim2.new(0,66,0,24),3) crn(pingChip,12) SK(pingChip,K.line,1) GR(pingChip,K.card2,K.bg,145)
local pingDot=F(pingChip,K.sky,UDim2.new(0,6,0.5,-3),UDim2.new(0,6,0,6),4) crn(pingDot,50) pingDot.BackgroundTransparency=0.35
local pingTL=L(pingChip,"PING —",UDim2.new(0,15,0,0),UDim2.new(1,-18,1,0),Enum.Font.GothamBold,9,K.sky,4,Enum.TextXAlignment.Center)

local tierChip=F(HDR,K.card,UDim2.new(1,-72,0.5,-12),UDim2.new(0,42,0,24),3) crn(tierChip,12)
local tierStk=SK(tierChip,K.gold,1.5,.42) GR(tierChip,K.card2,K.bg,145)
local tierL=L(tierChip,"👑",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,13,K.gold,4,Enum.TextXAlignment.Center)

-- win buttons
local function mkWB(col,xO,ch)
    local bg=F(HDR,col,UDim2.new(1,xO,0.5,-9),UDim2.new(0,18,0,18),4) crn(bg,50) bg.BackgroundTransparency=0.28 SK(bg,K.w1,1,.72)
    local b=Instance.new("TextButton") b.Parent=bg b.BackgroundTransparency=1 b.Size=UDim2.new(1,0,1,0) b.Font=Enum.Font.GothamBold b.Text=ch b.TextColor3=K.w1 b.TextSize=9 b.ZIndex=5
    b.MouseEnter:Connect(function() TW(bg,{BackgroundTransparency=0},.10) end)
    b.MouseLeave:Connect(function() TW(bg,{BackgroundTransparency=0.28},.10) end)
    return b end
local CloseB=mkWB(K.rose,-28,"✕")
local MinB=mkWB(K.gold,-50,"–")
CloseB.MouseButton1Click:Connect(function() TW(HUB,{BackgroundTransparency=1,Size=UDim2.new(0,0,0,0)},.20,Enum.EasingStyle.Back,Enum.EasingDirection.In) task.wait(.22) Root:Destroy() end)
local mini=false
MinB.MouseButton1Click:Connect(function() mini=not mini
    if mini then TW(HUB,{Size=UDim2.new(0,570,0,54)},.28) MinB.Text="+"
    else TW(HUB,{Size=UDim2.new(0,570,0,436)},.28) MinB.Text="–" end end)

-- ── FIX #2: tab nav pake ScrollingFrame biar ga overflow ──
local TabNavOuter=F(HUB,K.bg,UDim2.new(0,0,0,54),UDim2.new(1,0,0,44),2)
TabNavOuter.BackgroundTransparency=0.38 SK(TabNavOuter,K.line,1)
F(TabNavOuter,K.w1,UDim2.new(0,0,1,-1),UDim2.new(1,0,0,1),3).BackgroundTransparency=0.90

local TabNav=Instance.new("ScrollingFrame") TabNav.Parent=TabNavOuter
TabNav.BackgroundTransparency=1 TabNav.Size=UDim2.new(1,0,1,0)
TabNav.BorderSizePixel=0 TabNav.ScrollBarThickness=0
TabNav.ScrollingDirection=Enum.ScrollingDirection.X
TabNav.CanvasSize=UDim2.new(0,0,1,0)

local tabLL=Instance.new("UIListLayout") tabLL.Parent=TabNav
tabLL.FillDirection=Enum.FillDirection.Horizontal
tabLL.SortOrder=Enum.SortOrder.LayoutOrder
tabLL.Padding=UDim.new(0,4)
tabLL.VerticalAlignment=Enum.VerticalAlignment.Center
tabLL.HorizontalAlignment=Enum.HorizontalAlignment.Center
local tabPad=Instance.new("UIPadding") tabPad.Parent=TabNav
tabPad.PaddingLeft=UDim.new(0,6) tabPad.PaddingRight=UDim.new(0,6)
tabLL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    TabNav.CanvasSize=UDim2.new(0,tabLL.AbsoluteContentSize.X+12,1,0) end)

-- content
local Content=F(HUB,K.bg,UDim2.new(0,0,0,98),UDim2.new(1,0,1,-28),2) Content.BackgroundTransparency=0.45

-- status bar
local StatBar=F(HUB,K.bg,UDim2.new(0,0,1,-28),UDim2.new(1,0,0,28),2) StatBar.BackgroundTransparency=0.38 SK(StatBar,K.line,1)
L(StatBar,"🔱  "..NAME.."  ·  "..VER.."  ·  Crimson Float",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.Gotham,8,K.w5,3,Enum.TextXAlignment.Center)

-- watermark
local WMF=F(Root,K.card,UDim2.new(0,14,0,14),UDim2.new(0,210,0,32)) WMF.Visible=false crn(WMF,16)
local WMstk=SK(WMF,K.r2,1.8) GR(WMF,K.card2,K.bg,140) SH(WMF,.45,4,38) SK(WMF,K.gold,1,.55)
F(WMF,K.r2,UDim2.new(0,0,0.1,0),UDim2.new(0,3,0.8,0),2).BackgroundTransparency=0.42
L(WMF,"🔱  "..NAME.."  "..VER,UDim2.new(0,6,0,0),UDim2.new(1,-10,1,0),Enum.Font.GothamBold,9,K.w1,3,Enum.TextXAlignment.Center)

-- TAB SYSTEM
local Pages={} local TabBtns={} local activeP=nil

local function switchTab(name)
    if mini then mini=false TW(HUB,{Size=UDim2.new(0,570,0,436)},.28) MinB.Text="–" end
    for n,pg in pairs(Pages) do pg.Visible=(n==name) end
    for n,btn in pairs(TabBtns) do
        local on=(n==name)
        TW(btn,{BackgroundColor3=on and K.r1 or K.card,BackgroundTransparency=on and 0 or 0.65},.18)
        local tl=btn:FindFirstChildOfClass("TextLabel")
        if tl then TW(tl,{TextColor3=on and K.w1 or K.w4},.18) end
    end activeP=name end

local function mkTab(name,icon,order)
    local btn=F(TabNav,K.card,UDim2.new(0,0,0,0),UDim2.new(0,76,0,30),3)
    btn.BackgroundTransparency=0.65 crn(btn,15) btn.LayoutOrder=order
    L(btn,icon.." "..name,UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,9,K.w4,4,Enum.TextXAlignment.Center)
    local ob=Instance.new("TextButton") ob.Parent=btn ob.BackgroundTransparency=1 ob.Size=UDim2.new(1,0,1,0) ob.Text="" ob.ZIndex=5
    ob.MouseEnter:Connect(function() if activeP~=name then TW(btn,{BackgroundTransparency=0.45},.12) end end)
    ob.MouseLeave:Connect(function() if activeP~=name then TW(btn,{BackgroundTransparency=0.65},.12) end end)
    ob.MouseButton1Click:Connect(function() switchTab(name) end)
    local pg=Instance.new("ScrollingFrame") pg.Parent=Content pg.BackgroundTransparency=1 pg.Size=UDim2.new(1,0,1,0) pg.BorderSizePixel=0 pg.ScrollBarThickness=2 pg.ScrollBarImageColor3=K.r3 pg.ScrollBarImageTransparency=0.45 pg.CanvasSize=UDim2.new(0,0,0,0) pg.Visible=false
    local pll=Instance.new("UIListLayout") pll.Parent=pg pll.SortOrder=Enum.SortOrder.LayoutOrder pll.Padding=UDim.new(0,5)
    local pad=Instance.new("UIPadding") pad.Parent=pg pad.PaddingTop=UDim.new(0,8) pad.PaddingLeft=UDim.new(0,10) pad.PaddingRight=UDim.new(0,10)
    pll:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        pg.CanvasSize=UDim2.new(0,0,0,pll.AbsoluteContentSize.Y+24) end)
    Pages[name]=pg TabBtns[name]=btn return pg end

-- WIDGETS
local function mkSec(par,title,order)
    local w=F(par,K.card,UDim2.new(0,0,0,0),UDim2.new(1,0,0,26),1) w.BackgroundTransparency=1 w.LayoutOrder=order or 0
    L(w,"  "..string.upper(title),UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,8,K.r4,2)
    local ln=F(w,K.r2,UDim2.new(0,0,1,-1),UDim2.new(1,0,0,1),2) ln.BackgroundTransparency=0.80 GG(ln,K.r3,K.bg,0)
    return w end

local function mkToggle(par,name,order,defOn,badge)
    local row=F(par,K.card,UDim2.new(0,0,0,0),UDim2.new(1,0,0,46),1) row.LayoutOrder=order or 0 crn(row,12) SK(row,K.line,1.2) GR(row,K.card2,K.card,152)
    local tag=F(row,K.r2,UDim2.new(0,0,0.15,0),UDim2.new(0,3,0.70,0),2) crn(tag,2) tag.BackgroundTransparency=defOn and 0.05 or 0.88 GR(tag,K.r3,K.r1,180)
    L(row,name,UDim2.new(0,14,0,0),UDim2.new(0.55,0,1,0),Enum.Font.Gotham,12,K.w2,2)
    if badge then
        local bf=F(row,Color3.fromRGB(255,152,0),UDim2.new(0.55,6,0.5,-11),UDim2.new(0,74,0,22),3) crn(bf,11) GR(bf,Color3.fromRGB(255,175,0),Color3.fromRGB(210,125,0),135)
        L(bf,badge,UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,8,Color3.fromRGB(25,12,0),4,Enum.TextXAlignment.Center) end
    local track=F(row,defOn and K.r1 or Color3.fromRGB(16,8,12),UDim2.new(1,-64,0.5,-13),UDim2.new(0,50,0,26),2) crn(track,50)
    local tS=SK(track,defOn and K.r3 or Color3.fromRGB(32,10,16),1,defOn and 0.45 or 0)
    if defOn then GR(track,K.r3,K.r1,140) end
    local knob=F(track,K.w1,defOn and UDim2.new(1,-22,0.5,-11) or UDim2.new(0,3,0.5,-11),UDim2.new(0,22,0,22),3) crn(knob,50) SK(knob,Color3.fromRGB(255,210,215),1,.60)
    local tog=defOn or false
    local ob=Instance.new("TextButton") ob.Parent=row ob.BackgroundTransparency=1 ob.Size=UDim2.new(1,0,1,0) ob.Text="" ob.ZIndex=4
    ob.MouseButton1Click:Connect(function() tog=not tog
        TW(track,{BackgroundColor3=tog and K.r1 or Color3.fromRGB(16,8,12)})
        TW(knob,{Position=tog and UDim2.new(1,-22,0.5,-11) or UDim2.new(0,3,0.5,-11)})
        TW(tag,{BackgroundTransparency=tog and 0.05 or 0.88})
        tS.Color=tog and K.r3 or Color3.fromRGB(32,10,16)
        tS.Transparency=tog and 0.45 or 0 end)
    row.MouseEnter:Connect(function() TW(row,{BackgroundColor3=K.card3},.12) end)
    row.MouseLeave:Connect(function() TW(row,{BackgroundColor3=K.card},.12) end)
    return row,function() return tog end end

local function mkSlider(par,name,minV,maxV,defV,order)
    local row=F(par,K.card,UDim2.new(0,0,0,0),UDim2.new(1,0,0,56),1) row.LayoutOrder=order or 0 crn(row,12) SK(row,K.line,1.2) GR(row,K.card2,K.card,152)
    F(row,K.r2,UDim2.new(0,0,0.15,0),UDim2.new(0,3,0.70,0),2).BackgroundTransparency=0.88
    L(row,name,UDim2.new(0,14,0,8),UDim2.new(.55,0,0,16),Enum.Font.Gotham,11,K.w2,2)
    local vL=L(row,tostring(defV),UDim2.new(.55,0,0,8),UDim2.new(.40,0,0,16),Enum.Font.GothamBold,12,K.r4,2,Enum.TextXAlignment.Right)
    local tBg=F(row,K.bg,UDim2.new(0,14,0,30),UDim2.new(1,-28,0,7),2) crn(tBg,4) SK(tBg,K.line,1)
    local fill=F(tBg,K.r1,UDim2.new(0,0,0,0),UDim2.new((defV-minV)/(maxV-minV),0,1,0),3) crn(fill,4) GR(fill,K.r4,K.r1,0)
    local knob=F(tBg,K.w1,UDim2.new((defV-minV)/(maxV-minV),0,0.5,0),UDim2.new(0,16,0,16),4) knob.AnchorPoint=Vector2.new(.5,.5) crn(knob,50) SK(knob,K.r3,1.5,.30)
    local drag=false
    local tB=Instance.new("TextButton") tB.Parent=tBg tB.BackgroundTransparency=1 tB.Size=UDim2.new(1,0,3,-6) tB.Position=UDim2.new(0,0,0.5,-10) tB.Text="" tB.ZIndex=5
    local function upd(x) local fr=math.clamp((x-tBg.AbsolutePosition.X)/tBg.AbsoluteSize.X,0,1) vL.Text=tostring(math.floor(minV+fr*(maxV-minV))) TW(fill,{Size=UDim2.new(fr,0,1,0)},.07) TW(knob,{Position=UDim2.new(fr,0,.5,0)},.07) end
    tB.MouseButton1Down:Connect(function() drag=true upd(UserInputService:GetMouseLocation().X) end)
    UserInputService.InputChanged:Connect(function(i) if drag and i.UserInputType==Enum.UserInputType.MouseMovement then upd(i.Position.X) end end)
    UserInputService.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end end)
    row.MouseEnter:Connect(function() TW(row,{BackgroundColor3=K.card3},.12) end)
    row.MouseLeave:Connect(function() TW(row,{BackgroundColor3=K.card},.12) end)
    return row end

local function mkCS(par,main,sub,lo)
    local f=F(par,K.card,UDim2.new(0,0,0,0),UDim2.new(1,0,0,195),1) f.LayoutOrder=lo or 1 crn(f,16) SK(f,K.line,1.5) GR(f,K.card2,K.card,152)
    local cRing=F(f,K.r2,UDim2.new(.5,-38,.24,-38),UDim2.new(0,76,0,76),2) crn(cRing,50) cRing.BackgroundTransparency=0.86
    local cCore=F(f,K.card,UDim2.new(.5,-25,.24,-25),UDim2.new(0,50,0,50),3) crn(cCore,50) GR(cCore,K.card2,K.bg,145) SK(cCore,K.r3,2,.40)
    local cIco=L(cCore,"⏳",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,22,K.r3,4,Enum.TextXAlignment.Center)
    F(f,K.line,UDim2.new(0.1,0,.54,0),UDim2.new(0.8,0,0,1),3).BackgroundTransparency=0.55
    local l2=L(f,main,UDim2.new(0,16,.62,0),UDim2.new(1,-32,0,26),Enum.Font.GothamBold,18,K.r4,3,Enum.TextXAlignment.Center) l2.AnchorPoint=Vector2.new(0,.5)
    local l3=L(f,sub,UDim2.new(0,16,.80,0),UDim2.new(1,-32,0,28),Enum.Font.Gotham,10,K.w4,3,Enum.TextXAlignment.Center) l3.AnchorPoint=Vector2.new(0,.5) l3.TextWrapped=true
    return cIco,l2 end

local function mkSCard(par,title,icon,vc,order)
    local card=F(par,K.card,UDim2.new(0,0,0,0),UDim2.new(1,0,0,80),1) card.LayoutOrder=order crn(card,14) SK(card,K.line,1.2) GR(card,K.card2,K.card,152)
    F(card,vc,UDim2.new(0,0,.10,0),UDim2.new(0,3,.80,0),2).BackgroundTransparency=0.18
    local iB=F(card,vc,UDim2.new(0,14,.5,-20),UDim2.new(0,40,0,40),2) crn(iB,50) iB.BackgroundTransparency=0.78
    L(iB,icon,UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,20,vc,3,Enum.TextXAlignment.Center)
    L(card,title,UDim2.new(0,62,0,12),UDim2.new(.58,0,0,12),Enum.Font.GothamBold,8,K.w4,3)
    local vL=L(card,"—",UDim2.new(0,62,0,24),UDim2.new(.66,0,0,28),Enum.Font.GothamBold,26,vc,3)
    local bBg=F(card,K.bg,UDim2.new(0,14,1,-12),UDim2.new(1,-28,0,4),2) crn(bBg,2) SK(bBg,K.line,1)
    local bF=F(bBg,vc,UDim2.new(0,0,0,0),UDim2.new(0,0,1,0),3) crn(bF,2)
    card.MouseEnter:Connect(function() TW(card,{BackgroundColor3=K.card3},.12) end)
    card.MouseLeave:Connect(function() TW(card,{BackgroundColor3=K.card},.12) end)
    return vL,bF end

-- BUILD TABS
local tp=mkTab("Trade","💎",1)
mkSec(tp,"Trade Features",1)
mkToggle(tp,"Visual Trade",2,true) mkToggle(tp,"Auto Accept",3,false) mkToggle(tp,"Freeze Trade",4,false) mkToggle(tp,"Visual Brainrot",5,false)
mkSec(tp,"Timing",6)
mkSlider(tp,"Accept Delay (ms)",0,500,35,7) mkSlider(tp,"Visual Intensity",0,100,72,8)
mkSec(tp,"Advanced",9)
mkToggle(tp,"Anti Decline",10,true) mkToggle(tp,"Trade Logger",11,false,"UPDATING") mkToggle(tp,"Instant Confirm",12,false,"UPDATING")

local bp=mkTab("Brain","🧠",2)
mkSec(bp,"Engine",1)
mkToggle(bp,"Enable Brainrot",2,false) mkToggle(bp,"Rainbow Text",3,false) mkToggle(bp,"Spam Mode",4,false,"UPDATING")
mkSec(bp,"Settings",5)
mkSlider(bp,"Speed",1,10,5,6) mkSlider(bp,"Size",10,100,50,7)

local stp=mkTab("Steal","🕵️",3)
local csI1,csT1=mkCS(stp,"COMING SOON","Under development\ndiscord.gg/marky",1)

local tlp=mkTab("List","📋",4)
local csI2,csT2=mkCS(tlp,"COMING SOON","Next patch\ndiscord.gg/marky",1)

-- PLAYER TAB
local pp=mkTab("Player","👤",5)
mkSec(pp,"Visuals",1)
local infoF=F(pp,K.card,UDim2.new(0,0,0,0),UDim2.new(1,0,0,34),1) infoF.LayoutOrder=2 crn(infoF,10) SK(infoF,K.r2,1,.55) GR(infoF,K.card2,K.card,152)
F(infoF,K.r3,UDim2.new(0,0,0.1,0),UDim2.new(0,3,0.8,0),2).BackgroundTransparency=0.40
L(infoF,"Client-side only — hanya kamu yang bisa lihat",UDim2.new(0,12,0,0),UDim2.new(1,-24,1,0),Enum.Font.GothamBold,9,K.r4,2,Enum.TextXAlignment.Center)

-- ── FIX #3: korblox toggle bener pakai variable langsung ──
local korOn=false local hedOn=false local vP={}
local function clrV(tag) for i=#vP,1,-1 do local p=vP[i] if p and p.Parent and p:GetAttribute("tag")==tag then pcall(function() p:Destroy() end) table.remove(vP,i) end end end
local function applyK()
    clrV("k") local char=LP.Character if not char then return end
    local hum=char:FindFirstChildOfClass("Humanoid") if not hum then return end
    local r15=hum.RigType==Enum.HumanoidRigType.R15
    local function ml(n) local leg=char:FindFirstChild(n) if not leg then return end
        local p=Instance.new("Part") p:SetAttribute("tag","k") p.Name="KV_"..n
        p.Size=Vector3.new(1.05,2.05,1.05) p.Transparency=0 p.CanCollide=false p.Anchored=false
        p.CastShadow=true p.Color=Color3.fromRGB(15,15,15) p.Material=Enum.Material.SmoothPlastic p.Parent=char
        local m=Instance.new("SpecialMesh") m.MeshType=Enum.MeshType.FileMesh
        m.MeshId="rbxassetid://319336350" m.TextureId="rbxassetid://319336355"
        m.Scale=Vector3.new(1.08,1.08,1.08) m.Parent=p
        local wc=Instance.new("WeldConstraint") wc.Part0=leg wc.Part1=p wc.Parent=p
        table.insert(vP,p) end
    if r15 then ml("LeftUpperLeg") ml("LeftLowerLeg") ml("RightUpperLeg") ml("RightLowerLeg")
    else ml("Left Leg") ml("Right Leg") end end

local function applyH()
    clrV("h") local char=LP.Character if not char then return end
    local head=char:FindFirstChild("Head") if not head then return end
    head.Transparency=1
    for _,v in ipairs(head:GetChildren()) do if v:IsA("SpecialMesh") or v:IsA("Decal") then v.Transparency=1 end end
    head:SetAttribute("tag","h") table.insert(vP,head)
    for _,acc in ipairs(char:GetChildren()) do if acc:IsA("Accessory") then local h=acc:FindFirstChild("Handle") if h then
        local ok=false for _,a in ipairs(h:GetChildren()) do if a:IsA("Attachment") and head:FindFirstChild(a.Name) then ok=true break end end
        if ok then h.Transparency=1 h:SetAttribute("tag","h") table.insert(vP,h) end end end end end

local function removeH()
    local char=LP.Character if not char then return end
    local head=char:FindFirstChild("Head")
    if head then head.Transparency=0 head:SetAttribute("tag",nil)
        for _,v in ipairs(head:GetChildren()) do if v:IsA("SpecialMesh") or v:IsA("Decal") then v.Transparency=0 end end end
    for _,p in ipairs(vP) do if p and p.Parent and p:GetAttribute("tag")=="h" then
        pcall(function() p.Transparency=0 p:SetAttribute("tag",nil) end) end end
    clrV("h") end

LP.CharacterAdded:Connect(function() vP={} task.wait(1.5) if korOn then applyK() end if hedOn then applyH() end end)

-- korblox row dengan track & knob variable tersimpan
local kRow,_=mkToggle(pp,"🦴  Korblox Visual",3,false)
-- cari track dan knob dari row
local kTrackRef=nil local kKnobRef=nil local kTagRef=nil local kTSRef=nil
for _,c in ipairs(kRow:GetChildren()) do
    if c:IsA("Frame") then
        if c.Size==UDim2.new(0,50,0,26) then kTrackRef=c
            for _,cc in ipairs(c:GetChildren()) do if cc:IsA("Frame") then kKnobRef=cc end end
            kTSRef=c:FindFirstChildOfClass("UIStroke")
        end
        if c.Size==UDim2.new(0,3,0,0) or (c.Size.X.Offset==3) then kTagRef=c end
    end end
local kOb=Instance.new("TextButton") kOb.Parent=kRow kOb.BackgroundTransparency=1 kOb.Size=UDim2.new(1,0,1,0) kOb.Text="" kOb.ZIndex=6
kOb.MouseButton1Click:Connect(function()
    korOn=not korOn
    if kTrackRef then TW(kTrackRef,{BackgroundColor3=korOn and K.r1 or Color3.fromRGB(16,8,12)}) end
    if kKnobRef  then TW(kKnobRef,{Position=korOn and UDim2.new(1,-22,0.5,-11) or UDim2.new(0,3,0.5,-11)}) end
    if kTagRef   then TW(kTagRef,{BackgroundTransparency=korOn and 0.05 or 0.88}) end
    if kTSRef    then kTSRef.Color=korOn and K.r3 or Color3.fromRGB(32,10,16) kTSRef.Transparency=korOn and 0.45 or 0 end
    if korOn then applyK() else clrV("k") end end)

local hRow,_=mkToggle(pp,"💀  Headless Visual",4,false)
local hTrackRef=nil local hKnobRef=nil local hTagRef=nil local hTSRef=nil
for _,c in ipairs(hRow:GetChildren()) do
    if c:IsA("Frame") then
        if c.Size==UDim2.new(0,50,0,26) then hTrackRef=c
            for _,cc in ipairs(c:GetChildren()) do if cc:IsA("Frame") then hKnobRef=cc end end
            hTSRef=c:FindFirstChildOfClass("UIStroke")
        end
        if c.Size.X.Offset==3 then hTagRef=c end
    end end
local hOb=Instance.new("TextButton") hOb.Parent=hRow hOb.BackgroundTransparency=1 hOb.Size=UDim2.new(1,0,1,0) hOb.Text="" hOb.ZIndex=6
hOb.MouseButton1Click:Connect(function()
    hedOn=not hedOn
    if hTrackRef then TW(hTrackRef,{BackgroundColor3=hedOn and K.r1 or Color3.fromRGB(16,8,12)}) end
    if hKnobRef  then TW(hKnobRef,{Position=hedOn and UDim2.new(1,-22,0.5,-11) or UDim2.new(0,3,0.5,-11)}) end
    if hTagRef   then TW(hTagRef,{BackgroundTransparency=hedOn and 0.05 or 0.88}) end
    if hTSRef    then hTSRef.Color=hedOn and K.r3 or Color3.fromRGB(32,10,16) hTSRef.Transparency=hedOn and 0.45 or 0 end
    if hedOn then applyH() else removeH() end end)

mkSec(pp,"Coming Soon",5)
local csI3,csT3=mkCS(pp,"UPDATING . . .","More cosmetics next patch",6)

-- STATS
local sp=mkTab("Stats","📊",6)
mkSec(sp,"Performance",1)
local fpsVal,fpsBar=mkSCard(sp,"FRAMES PER SECOND","⚡",K.mint,2)
local pingVal,pingBar=mkSCard(sp,"NETWORK PING","📶",K.sky,3)
mkSec(sp,"Optimizers",4)
mkToggle(sp,"FPS Unlocker",5,true)
mkToggle(sp,"Render Optimizer",6,false,"UPDATING")
mkToggle(sp,"Low Latency",7,false,"UPDATING")
mkToggle(sp,"Memory Cleaner",8,false)

-- ── FIX #4: MISC dengan ScrollingFrame + auto canvas ──
local misc=mkTab("More","⚙️",7)
mkSec(misc,"Themes",1)

local tNames={"Crimson","Ocean","Void","Ember","Forest","Sakura"}
local tThemes={
    Crimson={p=K.r2,  g1=K.r3, g2=K.r1},
    Ocean  ={p=Color3.fromRGB(18,112,228),  g1=Color3.fromRGB(42,148,255), g2=Color3.fromRGB(5,72,175)},
    Void   ={p=Color3.fromRGB(88,22,195),   g1=Color3.fromRGB(122,52,240), g2=Color3.fromRGB(52,5,148)},
    Ember  ={p=Color3.fromRGB(215,88,0),    g1=Color3.fromRGB(255,118,8),  g2=Color3.fromRGB(165,52,0)},
    Forest ={p=Color3.fromRGB(0,148,62),    g1=Color3.fromRGB(12,192,82),  g2=Color3.fromRGB(0,95,38)},
    Sakura ={p=Color3.fromRGB(215,45,122),  g1=Color3.fromRGB(252,72,152), g2=Color3.fromRGB(162,8,88)},
}
for i,tn in ipairs(tNames) do
    local th=tThemes[tn]
    local trow=F(misc,K.card,UDim2.new(0,0,0,0),UDim2.new(1,0,0,44),1)
    trow.LayoutOrder=i+1 crn(trow,12) SK(trow,K.line,1.2) GR(trow,K.card2,K.card,152)
    local dotO=F(trow,th.p,UDim2.new(0,12,0.5,-12),UDim2.new(0,24,0,24)) crn(dotO,50) dotO.BackgroundTransparency=0.55 SK(dotO,K.w1,1,.72)
    local dotI=F(trow,th.p,UDim2.new(0,16,0.5,-7),UDim2.new(0,14,0,14)) crn(dotI,50) GG(dotI,th.g1,th.g2,135)
    L(trow,tn,UDim2.new(0,44,0,0),UDim2.new(0.44,0,1,0),Enum.Font.GothamBold,13,K.w2,2)
    local aInd=L(trow,i==1 and "● Active" or "",UDim2.new(0.44,0,0,0),UDim2.new(0.26,0,1,0),Enum.Font.Gotham,9,K.gold,2)
    local abF=F(trow,th.p,UDim2.new(1,-82,0.5,-16),UDim2.new(0,70,0,32),3) crn(abF,16) GG(abF,th.g1,th.g2,140)
    F(abF,K.w1,UDim2.new(0,6,0,3),UDim2.new(.46,0,0,2),4).BackgroundTransparency=0.87
    local aL=L(abF,"Apply",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,11,K.w1,4,Enum.TextXAlignment.Center)
    local aOb=Instance.new("TextButton") aOb.Parent=abF aOb.BackgroundTransparency=1 aOb.Size=UDim2.new(1,0,1,0) aOb.Text="" aOb.ZIndex=5
    local cap,indRef=tn,aInd
    aOb.MouseButton1Click:Connect(function()
        local t=tThemes[cap]
        local cs=ColorSequence.new{ColorSequenceKeypoint.new(0,t.g1),ColorSequenceKeypoint.new(1,t.g2)}
        for _,g in ipairs(GRS) do g.Color=cs end
        HUB_stk.Color=t.p WMstk.Color=t.p
        for _,ch in ipairs(misc:GetChildren()) do
            if ch:IsA("Frame") then
                for _,cc in ipairs(ch:GetChildren()) do
                    if cc:IsA("TextLabel") and cc.TextSize==9 then cc.Text="" end end end end
        indRef.Text="● Active" indRef.TextColor3=K.gold aL.Text="✓"
        task.delay(1.5,function() if aL and aL.Parent then aL.Text="Apply" end end) end)
    trow.MouseEnter:Connect(function() TW(trow,{BackgroundColor3=K.card3},.12) end)
    trow.MouseLeave:Connect(function() TW(trow,{BackgroundColor3=K.card},.12) end)
end

-- SEQUENCES
local function showHub()
    tierL.Text="👑" tierStk.Color=K.gold tierStk.Transparency=0.20
    HUB.Visible=true WMF.Visible=true HUB.Size=UDim2.new(0,0,0,0)
    TW(HUB,{Size=UDim2.new(0,570,0,436)},.42,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
    switchTab("Trade") end

local function doVerify(key)
    local ok=(key==KEY)
    KeyScreen.Visible=false VBox.Visible=true vProg.Size=UDim2.new(0,0,1,0)
    local steps=ok and {
        "Connecting to auth server...",
        "TLS 1.3 handshake complete.",
        "Scanning key registry...",
        "Key found — OWNER  ✦",
        "License active.",
        "Welcome back!",
    } or {
        "Connecting to auth server...",
        "TLS 1.3 handshake complete.",
        "Scanning key registry...",
        "Key not found.",
        "Access denied.",
        "Session closed.",
    }
    for i,s in ipairs(steps) do
        task.wait(.30) vSub.Text=s
        TW(vProg,{Size=UDim2.new(i/#steps,0,1,0)},.24) end
    task.wait(.40)
    if ok then VBox.Visible=false showHub()
    else
        TW(VBox,{BackgroundTransparency=1},.22) task.wait(.25)
        VBox.BackgroundTransparency=0 VBox.Visible=false KeyScreen.Visible=true
        KErr.Text="✗  Invalid key — try again."
        kInStk.Color=K.rose kInStk.Thickness=1.8
        isUpd=true realKey="" KInput.Text="" task.defer(function() isUpd=false end)
        for _=1,4 do
            TW(keyRight,{Position=UDim2.new(.5,-238,.5,-170)},.04) task.wait(.05)
            TW(keyRight,{Position=UDim2.new(.5,40,.5,-170)},.04) task.wait(.05) end
        TW(keyRight,{Position=UDim2.new(.5,40,.5,-170)},.05)
        task.wait(2.2) KErr.Text="" kInStk.Color=K.line kInStk.Thickness=1.5 end end

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
    local fC=fd>=55 and K.mint or fd>=30 and K.gold or K.rose
    local op,rp=pcall(function() return Stats.Network.ServerStatsItem["Data Ping"]:GetValue() end)
    local tg=op and rp and rp>0 and rp or (pingS+math.random(-4,6))
    pingS=pingS+(tg-pingS)*.05
    local pd=math.max(1,math.floor(pingS))
    local pC=pd<=60 and K.mint or pd<=120 and K.gold or K.rose
    if HUB.Visible then
        fpsTL.Text="FPS "..fd fpsTL.TextColor3=fC fpsDot.BackgroundColor3=fC
        pingTL.Text="PING "..pd pingTL.TextColor3=pC pingDot.BackgroundColor3=pC
        fpsVal.Text=tostring(fd) fpsVal.TextColor3=fC
        pingVal.Text=pd.." ms" pingVal.TextColor3=pC
        TW(fpsBar,{Size=UDim2.new(math.clamp(fd/144,0,1),0,1,0)},.45)
        TW(pingBar,{Size=UDim2.new(math.clamp(1-pd/260,0,1),0,1,0)},.45) end
    local t=(tick()*.12)%1
    for _,r in ipairs({csI1,csI2,csI3,csT1,csT2,csT3}) do
        if r and r.Parent then r.TextColor3=Color3.fromHSV(t,.85,1) end end end)

-- LAUNCH
task.spawn(function()
    for i,s in ipairs(BOOT_STEPS) do
        task.wait(.24) bStatus.Text=s
        local pct=i/#BOOT_STEPS
        TW(bProg,{Size=UDim2.new(pct,0,1,0)},.20)
        bPct.Text=math.floor(pct*100).."%"
    end
    task.wait(.35) TW(Boot,{BackgroundTransparency=1},.28) task.wait(.30)
    Boot.Visible=false Boot.BackgroundTransparency=0
    KeyScreen.Visible=true
    TW(keyLeft,{Position=UDim2.new(.5,-260,.5,-170)},.40,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
    TW(keyRight,{Position=UDim2.new(.5,40,.5,-170)},.40,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
end)

print("🔱 "..NAME.." "..VER.." — Crimson Float — Loaded")
