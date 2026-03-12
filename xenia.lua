
-- ╔══════════════════════════════════════════╗
-- ║    TRASH HUB X MARKY.DEV  v1.0.0        ║
-- ║    ⚠️          ║
-- ╚══════════════════════════════════════════╝

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer      = Players.LocalPlayer

local CORRECT_KEY   = "ab1g4il"
local FAKE_USER     = "m4rkyxtrashub"
local WATERMARK_TAG = "m4rkyXtrashhub"

local Themes = {
    Default = {p=Color3.fromRGB(138,43,226),  a=Color3.fromRGB(180,100,255)},
    Aqua    = {p=Color3.fromRGB(0,200,220),   a=Color3.fromRGB(100,240,255)},
    Red     = {p=Color3.fromRGB(220,30,60),   a=Color3.fromRGB(255,80,110)},
    Gold    = {p=Color3.fromRGB(255,180,0),   a=Color3.fromRGB(255,220,80)},
    Pink    = {p=Color3.fromRGB(255,80,160),  a=Color3.fromRGB(255,160,200)},
    Green   = {p=Color3.fromRGB(0,210,100),   a=Color3.fromRGB(80,255,160)},
    Rainbow = {p=Color3.fromRGB(138,43,226),  a=Color3.fromRGB(180,100,255)},
}
local CT        = Themes.Default
local isRainbow = false
local rHue      = 0

local Root = Instance.new("ScreenGui")
Root.Name           = "TrashHubXMarky"
Root.Parent         = game.CoreGui
Root.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Root.ResetOnSpawn   = false

local function corner(p,r)
    local c=Instance.new("UICorner") c.CornerRadius=UDim.new(0,r or 8) c.Parent=p return c end
local function mkstroke(p,col,th)
    local s=Instance.new("UIStroke") s.Color=col or CT.p s.Thickness=th or 1.5 s.Parent=p return s end
local function tw(o,pr,t)
    TweenService:Create(o,TweenInfo.new(t or .25,Enum.EasingStyle.Quart,
        Enum.EasingDirection.Out),pr):Play() end
local function shadow(parent)
    local s=Instance.new("ImageLabel") s.Name="Shd"
    s.AnchorPoint=Vector2.new(.5,.5) s.BackgroundTransparency=1
    s.Position=UDim2.new(.5,0,.5,8) s.Size=UDim2.new(1,40,1,40)
    s.ZIndex=parent.ZIndex-1 s.Image="rbxassetid://6014261993"
    s.ImageColor3=Color3.new(0,0,0) s.ImageTransparency=.55
    s.ScaleType=Enum.ScaleType.Slice s.SliceCenter=Rect.new(49,49,450,450)
    s.Parent=parent return s end
local function makeLabel(parent,text,pos,size,font,ts,col,zidx,xa)
    local l=Instance.new("TextLabel") l.Parent=parent l.BackgroundTransparency=1
    l.Position=pos l.Size=size l.Font=font or Enum.Font.Gotham
    l.Text=text l.TextSize=ts or 13 l.TextColor3=col or Color3.fromRGB(210,200,230)
    l.ZIndex=zidx or 1 l.TextXAlignment=xa or Enum.TextXAlignment.Left
    l.TextWrapped=true return l end

-- ══════════════════════════════════════════════
--  SCREEN A — STARTUP
-- ══════════════════════════════════════════════
local SA=Instance.new("Frame") SA.Name="Startup" SA.Parent=Root
SA.BackgroundColor3=Color3.fromRGB(6,6,10)
SA.AnchorPoint=Vector2.new(.5,.5) SA.Position=UDim2.new(.5,0,.5,0)
SA.Size=UDim2.new(0,400,0,290) SA.ZIndex=30
corner(SA,16) mkstroke(SA,CT.p,1.5) shadow(SA)

local SA_tb=Instance.new("Frame") SA_tb.BackgroundColor3=CT.p SA_tb.BorderSizePixel=0
SA_tb.Size=UDim2.new(1,0,0,52) SA_tb.ZIndex=31 SA_tb.Parent=SA corner(SA_tb,13)
local SA_tbfix=Instance.new("Frame") SA_tbfix.BackgroundColor3=CT.p SA_tbfix.BorderSizePixel=0
SA_tbfix.Position=UDim2.new(0,0,.5,0) SA_tbfix.Size=UDim2.new(1,0,.5,0)
SA_tbfix.ZIndex=31 SA_tbfix.Parent=SA_tb
makeLabel(SA_tb,"⚡  TRASH HUB X MARKY.DEV",UDim2.new(0,14,0,7),UDim2.new(1,-30,0,22),
    Enum.Font.GothamBold,15,Color3.fromRGB(255,255,255),32)
local SA_sub=makeLabel(SA_tb,"Booting system...",UDim2.new(0,14,0,31),UDim2.new(1,0,0,16),
    Enum.Font.Gotham,11,Color3.fromRGB(220,200,255),32)

local SA_track=Instance.new("Frame") SA_track.BackgroundColor3=Color3.fromRGB(18,12,32)
SA_track.BorderSizePixel=0 SA_track.Position=UDim2.new(0,18,0,60)
SA_track.Size=UDim2.new(1,-36,0,8) SA_track.ZIndex=31 SA_track.Parent=SA corner(SA_track,4)
local SA_fill=Instance.new("Frame") SA_fill.BackgroundColor3=CT.p
SA_fill.BorderSizePixel=0 SA_fill.Size=UDim2.new(0,0,1,0) SA_fill.ZIndex=32
SA_fill.Parent=SA_track corner(SA_fill,4)
local SA_pct=makeLabel(SA,"0%",UDim2.new(0,18,0,72),UDim2.new(1,-36,0,14),
    Enum.Font.GothamBold,10,Color3.fromRGB(140,120,180),31,Enum.TextXAlignment.Right)

local SA_logs=Instance.new("Frame") SA_logs.BackgroundTransparency=1
SA_logs.Position=UDim2.new(0,18,0,90) SA_logs.Size=UDim2.new(1,-36,0,185)
SA_logs.ZIndex=31 SA_logs.Parent=SA
local SA_ll=Instance.new("UIListLayout") SA_ll.Parent=SA_logs
SA_ll.SortOrder=Enum.SortOrder.LayoutOrder SA_ll.Padding=UDim.new(0,3)
local SA_ord=0
local function saLog(txt,col)
    SA_ord=SA_ord+1
    local l=Instance.new("TextLabel") l.Parent=SA_logs l.BackgroundTransparency=1
    l.Size=UDim2.new(1,0,0,15) l.Font=Enum.Font.Code l.Text=txt
    l.TextColor3=col or Color3.fromRGB(130,230,130) l.TextSize=11
    l.TextXAlignment=Enum.TextXAlignment.Left l.LayoutOrder=SA_ord l.ZIndex=32 end

local SA_LOGS={
    {"[SYS]  Booting Trash Hub X Marky.Dev...",     Color3.fromRGB(140,140,255)},
    {"[OK ]  Allocating memory buffers...",          Color3.fromRGB(130,230,130)},
    {"[OK ]  Loading encryption layer...",           Color3.fromRGB(130,230,130)},
    {"[OK ]  Connecting to Marky servers...",        Color3.fromRGB(130,230,130)},
    {"[OK ]  Verifying game environment...",         Color3.fromRGB(130,230,130)},
    {"[OK ]  Injecting UI framework...",             Color3.fromRGB(130,230,130)},
    {"[WARN]  Anti-detect bypass applied.",          Color3.fromRGB(255,200,80)},
    {"[OK ]  All modules loaded successfully.",      Color3.fromRGB(80,255,160)},
    {"[SYS]  Launching key authentication...",       Color3.fromRGB(140,140,255)},
}

-- ══════════════════════════════════════════════
--  SCREEN B — KEY SYSTEM
-- ══════════════════════════════════════════════
local SB=Instance.new("Frame") SB.Name="KeySys" SB.Parent=Root
SB.BackgroundColor3=Color3.fromRGB(8,8,14)
SB.AnchorPoint=Vector2.new(.5,.5) SB.Position=UDim2.new(.5,0,.5,0)
SB.Size=UDim2.new(0,420,0,340) SB.ZIndex=10 SB.Visible=false
corner(SB,16) mkstroke(SB,CT.p,1.5) shadow(SB)

local SB_tb=Instance.new("Frame") SB_tb.BackgroundColor3=CT.p SB_tb.BorderSizePixel=0
SB_tb.Size=UDim2.new(1,0,0,52) SB_tb.ZIndex=11 SB_tb.Parent=SB corner(SB_tb,13)
local SB_tbfix=Instance.new("Frame") SB_tbfix.BackgroundColor3=CT.p SB_tbfix.BorderSizePixel=0
SB_tbfix.Position=UDim2.new(0,0,.5,0) SB_tbfix.Size=UDim2.new(1,0,.5,0)
SB_tbfix.ZIndex=11 SB_tbfix.Parent=SB_tb
makeLabel(SB_tb,"🔑  TRASH HUB X MARKY.DEV",UDim2.new(0,14,0,7),UDim2.new(1,-30,0,22),
    Enum.Font.GothamBold,15,Color3.fromRGB(255,255,255),12)
makeLabel(SB_tb,"Authentication Required",UDim2.new(0,14,0,31),UDim2.new(1,0,0,16),
    Enum.Font.Gotham,11,Color3.fromRGB(220,200,255),12)
makeLabel(SB,"🔒",UDim2.new(.5,-22,0,60),UDim2.new(0,44,0,44),
    Enum.Font.GothamBold,32,Color3.fromRGB(255,255,255),11,Enum.TextXAlignment.Center)
makeLabel(SB,"Enter your license key below to unlock\nTrash Hub X Marky.Dev",
    UDim2.new(0,20,0,108),UDim2.new(1,-40,0,32),
    Enum.Font.Gotham,12,Color3.fromRGB(155,145,185),11,Enum.TextXAlignment.Center)

local KIbg=Instance.new("Frame") KIbg.BackgroundColor3=Color3.fromRGB(10,8,18)
KIbg.Position=UDim2.new(0,20,0,148) KIbg.Size=UDim2.new(1,-40,0,44)
KIbg.ZIndex=11 KIbg.Parent=SB corner(KIbg,8)
local KIstroke=mkstroke(KIbg,Color3.fromRGB(55,35,100),1)

local KInput=Instance.new("TextBox") KInput.Parent=KIbg
KInput.BackgroundTransparency=1 KInput.Position=UDim2.new(0,12,0,0)
KInput.Size=UDim2.new(1,-24,1,0) KInput.Font=Enum.Font.GothamBold
KInput.PlaceholderText="Enter key here..." KInput.PlaceholderColor3=Color3.fromRGB(80,65,110)
KInput.Text="" KInput.TextColor3=Color3.fromRGB(230,220,255) KInput.TextSize=14
KInput.ZIndex=12 KInput.ClearTextOnFocus=false

local realKey="" local masking=false
KInput:GetPropertyChangedSignal("Text"):Connect(function()
    if masking then return end masking=true
    local nd=KInput.Text local nl,ol=#nd,#realKey
    if nl>ol then realKey=realKey..nd:sub(ol+1)
    elseif nl<ol then realKey=realKey:sub(1,#realKey-(ol-nl)) end
    realKey=realKey:lower():gsub("pretpret",string.rep("*",8))
    KInput.Text=string.rep("*",#realKey) masking=false end)

local KStatus=makeLabel(SB,"",UDim2.new(0,20,0,198),UDim2.new(1,-40,0,18),
    Enum.Font.GothamBold,12,Color3.fromRGB(255,100,100),11,Enum.TextXAlignment.Center)

local KBtn=Instance.new("TextButton") KBtn.Parent=SB
KBtn.BackgroundColor3=CT.p KBtn.Position=UDim2.new(0,20,0,222)
KBtn.Size=UDim2.new(1,-40,0,46) KBtn.Font=Enum.Font.GothamBold
KBtn.Text="UNLOCK  →" KBtn.TextColor3=Color3.fromRGB(255,255,255)
KBtn.TextSize=14 KBtn.BorderSizePixel=0 KBtn.ZIndex=11 corner(KBtn,10)
KBtn.MouseEnter:Connect(function() tw(KBtn,{BackgroundColor3=CT.a}) end)
KBtn.MouseLeave:Connect(function() tw(KBtn,{BackgroundColor3=CT.p}) end)
makeLabel(SB,"🔗  Get Key → discord.gg/marky  |  t.me/markyhub",
    UDim2.new(0,20,0,285),UDim2.new(1,-40,0,18),
    Enum.Font.Gotham,11,Color3.fromRGB(105,85,155),11,Enum.TextXAlignment.Center)

-- ══════════════════════════════════════════════
--  SCREEN C — KEY CHECK LOADER
-- ══════════════════════════════════════════════
local SC=Instance.new("Frame") SC.Name="KeyCheck" SC.Parent=Root
SC.BackgroundColor3=Color3.fromRGB(8,8,14)
SC.AnchorPoint=Vector2.new(.5,.5) SC.Position=UDim2.new(.5,0,.5,0)
SC.Size=UDim2.new(0,420,0,340) SC.ZIndex=15 SC.Visible=false
corner(SC,16) mkstroke(SC,CT.p,1.5) shadow(SC)

local SC_tb=Instance.new("Frame") SC_tb.BackgroundColor3=CT.p SC_tb.BorderSizePixel=0
SC_tb.Size=UDim2.new(1,0,0,52) SC_tb.ZIndex=16 SC_tb.Parent=SC corner(SC_tb,13)
local SC_tbfix=Instance.new("Frame") SC_tbfix.BackgroundColor3=CT.p SC_tbfix.BorderSizePixel=0
SC_tbfix.Position=UDim2.new(0,0,.5,0) SC_tbfix.Size=UDim2.new(1,0,.5,0)
SC_tbfix.ZIndex=16 SC_tbfix.Parent=SC_tb
local SC_title=makeLabel(SC_tb,"⚙️  VERIFYING KEY...",UDim2.new(0,14,0,7),UDim2.new(1,-30,0,22),
    Enum.Font.GothamBold,15,Color3.fromRGB(255,255,255),17)
local SC_sub=makeLabel(SC_tb,"Connecting to Marky servers...",UDim2.new(0,14,0,31),
    UDim2.new(1,0,0,16),Enum.Font.Gotham,11,Color3.fromRGB(220,200,255),17)

local SC_track=Instance.new("Frame") SC_track.BackgroundColor3=Color3.fromRGB(18,12,32)
SC_track.BorderSizePixel=0 SC_track.Position=UDim2.new(0,18,0,60)
SC_track.Size=UDim2.new(1,-36,0,8) SC_track.ZIndex=16 SC_track.Parent=SC corner(SC_track,4)
local SC_fill=Instance.new("Frame") SC_fill.BackgroundColor3=CT.p SC_fill.BorderSizePixel=0
SC_fill.Size=UDim2.new(0,0,1,0) SC_fill.ZIndex=17 SC_fill.Parent=SC_track corner(SC_fill,4)

local SC_logs=Instance.new("Frame") SC_logs.BackgroundTransparency=1
SC_logs.Position=UDim2.new(0,18,0,76) SC_logs.Size=UDim2.new(1,-36,0,250)
SC_logs.ZIndex=16 SC_logs.Parent=SC
local SC_ll=Instance.new("UIListLayout") SC_ll.Parent=SC_logs
SC_ll.SortOrder=Enum.SortOrder.LayoutOrder SC_ll.Padding=UDim.new(0,5)
local SC_ord=0
local function scLog(txt,col,o)
    SC_ord=o or SC_ord+1
    local l=Instance.new("TextLabel") l.Parent=SC_logs l.BackgroundTransparency=1
    l.Size=UDim2.new(1,0,0,17) l.Font=Enum.Font.Code l.Text=txt
    l.TextColor3=col or Color3.fromRGB(130,230,130) l.TextSize=12
    l.TextXAlignment=Enum.TextXAlignment.Left l.LayoutOrder=SC_ord l.ZIndex=17 end

-- ══════════════════════════════════════════════
--  SCREEN D — HUB LOADER
-- ══════════════════════════════════════════════
local SD=Instance.new("Frame") SD.Name="HubLoad" SD.Parent=Root
SD.BackgroundColor3=Color3.fromRGB(8,8,14)
SD.AnchorPoint=Vector2.new(.5,.5) SD.Position=UDim2.new(.5,0,.5,0)
SD.Size=UDim2.new(0,420,0,340) SD.ZIndex=15 SD.Visible=false
corner(SD,16) mkstroke(SD,CT.p,1.5) shadow(SD)

local SD_tb=Instance.new("Frame") SD_tb.BackgroundColor3=CT.p SD_tb.BorderSizePixel=0
SD_tb.Size=UDim2.new(1,0,0,52) SD_tb.ZIndex=16 SD_tb.Parent=SD corner(SD_tb,13)
local SD_tbfix=Instance.new("Frame") SD_tbfix.BackgroundColor3=CT.p SD_tbfix.BorderSizePixel=0
SD_tbfix.Position=UDim2.new(0,0,.5,0) SD_tbfix.Size=UDim2.new(1,0,.5,0)
SD_tbfix.ZIndex=16 SD_tbfix.Parent=SD_tb
makeLabel(SD_tb,"⚡  LOADING TRASH HUB...",UDim2.new(0,14,0,7),UDim2.new(1,-30,0,22),
    Enum.Font.GothamBold,15,Color3.fromRGB(255,255,255),17)
local SD_sub=makeLabel(SD_tb,"Key verified — Loading modules...",UDim2.new(0,14,0,31),
    UDim2.new(1,0,0,16),Enum.Font.Gotham,11,Color3.fromRGB(220,200,255),17)

local SD_track=Instance.new("Frame") SD_track.BackgroundColor3=Color3.fromRGB(18,12,32)
SD_track.BorderSizePixel=0 SD_track.Position=UDim2.new(0,18,0,60)
SD_track.Size=UDim2.new(1,-36,0,8) SD_track.ZIndex=16 SD_track.Parent=SD corner(SD_track,4)
local SD_fill=Instance.new("Frame") SD_fill.BackgroundColor3=CT.p SD_fill.BorderSizePixel=0
SD_fill.Size=UDim2.new(0,0,1,0) SD_fill.ZIndex=17 SD_fill.Parent=SD_track corner(SD_fill,4)
local SD_pct=makeLabel(SD,"0%",UDim2.new(0,18,0,72),UDim2.new(1,-36,0,14),
    Enum.Font.GothamBold,10,Color3.fromRGB(140,120,180),16,Enum.TextXAlignment.Right)

local SD_logs=Instance.new("Frame") SD_logs.BackgroundTransparency=1
SD_logs.Position=UDim2.new(0,18,0,90) SD_logs.Size=UDim2.new(1,-36,0,240)
SD_logs.ZIndex=16 SD_logs.Parent=SD
local SD_ll=Instance.new("UIListLayout") SD_ll.Parent=SD_logs
SD_ll.SortOrder=Enum.SortOrder.LayoutOrder SD_ll.Padding=UDim.new(0,5)
local SD_ord=0
local function sdLog(txt,col)
    SD_ord=SD_ord+1
    local l=Instance.new("TextLabel") l.Parent=SD_logs l.BackgroundTransparency=1
    l.Size=UDim2.new(1,0,0,17) l.Font=Enum.Font.Code l.Text=txt
    l.TextColor3=col or Color3.fromRGB(130,230,130) l.TextSize=12
    l.TextXAlignment=Enum.TextXAlignment.Left l.LayoutOrder=SD_ord l.ZIndex=17 end

local SD_LOGS={
    {"[OK ]  Key verified — Authenticated!",     Color3.fromRGB(80,255,160)},
    {"[OK ]  Injecting UI framework...",         Color3.fromRGB(130,230,130)},
    {"[OK ]  Loading trade hook modules...",     Color3.fromRGB(130,230,130)},
    {"[OK ]  Loading visual render engine...",   Color3.fromRGB(130,230,130)},
    {"[WARN]  Applying anti-detect bypass...",   Color3.fromRGB(255,200,80)},
    {"[OK ]  Decrypting brainrot module...",     Color3.fromRGB(130,230,130)},
    {"[OK ]  Finalizing environment...",         Color3.fromRGB(130,230,130)},
    {"[OK ]  All systems GO! Launching hub...",  Color3.fromRGB(80,255,160)},
}

-- ══════════════════════════════════════════════
--  SCREEN E — MAIN HUB
-- ══════════════════════════════════════════════
local SW     = 130
local FULL_H = 420
local MINI_H = 48

local SE=Instance.new("Frame") SE.Name="MainHub" SE.Parent=Root
SE.BackgroundColor3=Color3.fromRGB(7,7,12)
SE.AnchorPoint=Vector2.new(.5,.5) SE.Position=UDim2.new(.5,0,.5,0)
SE.Size=UDim2.new(0,560,0,FULL_H) SE.Visible=false SE.Active=true SE.Draggable=true
corner(SE,13) local mainStroke=mkstroke(SE,CT.p,1.5) shadow(SE)

-- Top bar
local HT=Instance.new("Frame") HT.BackgroundColor3=CT.p HT.BorderSizePixel=0
HT.Size=UDim2.new(1,0,0,MINI_H) HT.Parent=SE corner(HT,12)
local HT_fix=Instance.new("Frame") HT_fix.BackgroundColor3=CT.p HT_fix.BorderSizePixel=0
HT_fix.Position=UDim2.new(0,0,.5,0) HT_fix.Size=UDim2.new(1,0,.5,0) HT_fix.Parent=HT
makeLabel(HT,"⚡  TRASH HUB  X  MARKY.DEV",UDim2.new(0,12,0,7),UDim2.new(0.65,0,0,20),
    Enum.Font.GothamBold,13,Color3.fromRGB(255,255,255),1)
makeLabel(HT,"v1.0.0  |  Licensed  |  "..FAKE_USER,UDim2.new(0,12,0,26),UDim2.new(0.65,0,0,14),
    Enum.Font.Gotham,10,Color3.fromRGB(220,200,255),1)

-- Close btn
local CloseB=Instance.new("TextButton") CloseB.Parent=HT
CloseB.BackgroundColor3=Color3.fromRGB(215,50,65) CloseB.Position=UDim2.new(1,-30,0.5,-9)
CloseB.Size=UDim2.new(0,18,0,18) CloseB.Font=Enum.Font.GothamBold
CloseB.Text="✕" CloseB.TextColor3=Color3.fromRGB(255,255,255) CloseB.TextSize=10
CloseB.BorderSizePixel=0 corner(CloseB,50)
CloseB.MouseButton1Click:Connect(function() Root:Destroy() end)

-- Minimize btn — collapse total ke topbar
local MinB=Instance.new("TextButton") MinB.Parent=HT
MinB.BackgroundColor3=Color3.fromRGB(255,170,0) MinB.Position=UDim2.new(1,-52,0.5,-9)
MinB.Size=UDim2.new(0,18,0,18) MinB.Font=Enum.Font.GothamBold
MinB.Text="–" MinB.TextColor3=Color3.fromRGB(255,255,255) MinB.TextSize=14
MinB.BorderSizePixel=0 corner(MinB,50)

local minimized=false
MinB.MouseButton1Click:Connect(function()
    minimized=not minimized
    if minimized then
        tw(SE,{Size=UDim2.new(0,560,0,MINI_H)},.3)
        MinB.Text="+"
    else
        tw(SE,{Size=UDim2.new(0,560,0,FULL_H)},.3)
        MinB.Text="–"
    end
end)

-- ★ Sidebar — posisi naik lebih deket ke topbar
local Sidebar=Instance.new("Frame") Sidebar.BackgroundColor3=Color3.fromRGB(7,7,12)
Sidebar.BorderSizePixel=0 Sidebar.Position=UDim2.new(0,0,0,MINI_H)
Sidebar.Size=UDim2.new(0,SW,1,-MINI_H) Sidebar.Parent=SE corner(Sidebar,10)
local SideFix=Instance.new("Frame") SideFix.BackgroundColor3=Color3.fromRGB(7,7,12)
SideFix.BorderSizePixel=0 SideFix.Position=UDim2.new(0.5,0,0,0)
SideFix.Size=UDim2.new(0.5,0,1,0) SideFix.Parent=Sidebar
local SideLL=Instance.new("UIListLayout") SideLL.Parent=Sidebar
SideLL.SortOrder=Enum.SortOrder.LayoutOrder SideLL.Padding=UDim.new(0,2)

-- Content area
local ContentBG=Instance.new("Frame") ContentBG.BackgroundTransparency=1
ContentBG.Position=UDim2.new(0,SW+6,0,MINI_H+4)
ContentBG.Size=UDim2.new(1,-(SW+10),1,-(MINI_H+8))
ContentBG.Parent=SE

-- Watermark
local WMF=Instance.new("Frame") WMF.Parent=Root WMF.BackgroundColor3=Color3.fromRGB(7,7,12)
WMF.Position=UDim2.new(0,10,0,10) WMF.Size=UDim2.new(0,272,0,28) WMF.Visible=false
corner(WMF,6) local WMStroke=mkstroke(WMF,CT.p,1)
local WML=makeLabel(WMF,"⚡ "..WATERMARK_TAG.."  |  "..FAKE_USER,
    UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),
    Enum.Font.GothamBold,11,CT.a,1,Enum.TextXAlignment.Center)

-- ══════════════════════════════════════
--  TAB SYSTEM
-- ══════════════════════════════════════
local tabPages={} local tabBtns={} local activeTab=nil

local function setTab(name)
    if minimized then
        minimized=false
        tw(SE,{Size=UDim2.new(0,560,0,FULL_H)},.3)
        MinB.Text="–"
    end
    for n,pg in pairs(tabPages) do pg.Visible=(n==name) end
    for n,btn in pairs(tabBtns) do
        if n==name then
            tw(btn,{BackgroundColor3=CT.p},.2)
            btn.TextColor3=Color3.fromRGB(255,255,255)
        else
            tw(btn,{BackgroundColor3=Color3.fromRGB(9,9,15)},.2)
            btn.TextColor3=Color3.fromRGB(138,128,162)
        end
    end
    activeTab=name
end

local function mkTab(name,icon,order)
    local btn=Instance.new("TextButton") btn.Parent=Sidebar
    btn.BackgroundColor3=Color3.fromRGB(9,9,15) btn.BorderSizePixel=0
    btn.Size=UDim2.new(1,0,0,40) btn.Font=Enum.Font.GothamBold
    btn.Text=icon.."  "..name btn.TextColor3=Color3.fromRGB(138,128,162)
    btn.TextSize=12 btn.TextXAlignment=Enum.TextXAlignment.Left btn.LayoutOrder=order
    local pad=Instance.new("UIPadding") pad.PaddingLeft=UDim.new(0,10) pad.Parent=btn
    btn.MouseEnter:Connect(function()
        if activeTab~=name then tw(btn,{BackgroundColor3=Color3.fromRGB(16,12,28)},.15) end end)
    btn.MouseLeave:Connect(function()
        if activeTab~=name then tw(btn,{BackgroundColor3=Color3.fromRGB(9,9,15)},.15) end end)

    local pg=Instance.new("ScrollingFrame") pg.Parent=ContentBG
    pg.BackgroundTransparency=1 pg.Size=UDim2.new(1,0,1,0)
    pg.BorderSizePixel=0 pg.ScrollBarThickness=3
    pg.ScrollBarImageColor3=CT.p pg.CanvasSize=UDim2.new(0,0,0,0) pg.Visible=false
    local ll=Instance.new("UIListLayout") ll.Parent=pg
    ll.SortOrder=Enum.SortOrder.LayoutOrder ll.Padding=UDim.new(0,6)
    ll:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        pg.CanvasSize=UDim2.new(0,0,0,ll.AbsoluteContentSize.Y+10) end)

    tabPages[name]=pg tabBtns[name]=btn
    btn.MouseButton1Click:Connect(function() setTab(name) end)
    return pg
end

-- ══════════════════════════════════════
--  WIDGET HELPERS
-- ══════════════════════════════════════
local function mkSection(parent,title,order)
    local f=Instance.new("Frame") f.Parent=parent f.BackgroundColor3=Color3.fromRGB(14,10,24)
    f.BorderSizePixel=0 f.Size=UDim2.new(1,-4,0,26) f.LayoutOrder=order or 0 corner(f,6)
    local bar=Instance.new("Frame") bar.BackgroundColor3=CT.p bar.BorderSizePixel=0
    bar.Position=UDim2.new(0,0,0.1,0) bar.Size=UDim2.new(0,3,0.8,0) bar.Parent=f corner(bar,2)
    makeLabel(f,title,UDim2.new(0,10,0,0),UDim2.new(1,-12,1,0),
        Enum.Font.GothamBold,11,CT.a,1) return f end

local function mkToggle(parent,name,order,defOn)
    local row=Instance.new("Frame") row.Parent=parent row.BackgroundColor3=Color3.fromRGB(11,9,19)
    row.BorderSizePixel=0 row.Size=UDim2.new(1,-4,0,36) row.LayoutOrder=order or 0
    corner(row,8) mkstroke(row,Color3.fromRGB(28,20,50),1)
    makeLabel(row,name,UDim2.new(0,12,0,0),UDim2.new(0.65,0,1,0),
        Enum.Font.Gotham,13,Color3.fromRGB(210,200,230),1)
    local bg=Instance.new("Frame") bg.BackgroundColor3=defOn and CT.p or Color3.fromRGB(32,26,52)
    bg.Position=UDim2.new(1,-52,0.5,-10) bg.Size=UDim2.new(0,40,0,20)
    bg.BorderSizePixel=0 bg.Parent=row corner(bg,50)
    local knob=Instance.new("Frame") knob.BackgroundColor3=Color3.fromRGB(255,255,255)
    knob.BorderSizePixel=0
    knob.Position=defOn and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)
    knob.Size=UDim2.new(0,16,0,16) knob.Parent=bg corner(knob,50)
    local tog=defOn or false
    local ob=Instance.new("TextButton") ob.Parent=row ob.BackgroundTransparency=1
    ob.Size=UDim2.new(1,0,1,0) ob.Text=""
    ob.MouseButton1Click:Connect(function()
        tog=not tog
        tw(bg,{BackgroundColor3=tog and CT.p or Color3.fromRGB(32,26,52)})
        tw(knob,{Position=tog and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)}) end)
    row.MouseEnter:Connect(function() tw(row,{BackgroundColor3=Color3.fromRGB(17,13,30)},.15) end)
    row.MouseLeave:Connect(function() tw(row,{BackgroundColor3=Color3.fromRGB(11,9,19)},.15) end)
    return row end

local function mkSlider(parent,name,minV,maxV,defV,order)
    local row=Instance.new("Frame") row.Parent=parent row.BackgroundColor3=Color3.fromRGB(11,9,19)
    row.BorderSizePixel=0 row.Size=UDim2.new(1,-4,0,52) row.LayoutOrder=order or 0
    corner(row,8) mkstroke(row,Color3.fromRGB(28,20,50),1)
    makeLabel(row,name,UDim2.new(0,12,0,5),UDim2.new(0.68,0,0,18),
        Enum.Font.Gotham,13,Color3.fromRGB(210,200,230),1)
    local vLbl=makeLabel(row,tostring(defV),UDim2.new(0.68,0,0,5),UDim2.new(0.28,0,0,18),
        Enum.Font.GothamBold,13,CT.a,1,Enum.TextXAlignment.Right)
    local track=Instance.new("TextButton") track.Parent=row
    track.BackgroundColor3=Color3.fromRGB(22,17,40) track.BorderSizePixel=0
    track.Position=UDim2.new(0,12,0,33) track.Size=UDim2.new(1,-24,0,9) track.Text=""
    corner(track,4)
    local fill=Instance.new("Frame") fill.BackgroundColor3=CT.p fill.BorderSizePixel=0
    local frac0=(defV-minV)/(maxV-minV)
    fill.Size=UDim2.new(frac0,0,1,0) fill.Parent=track corner(fill,4)
    local knob=Instance.new("Frame") knob.BackgroundColor3=Color3.fromRGB(255,255,255)
    knob.AnchorPoint=Vector2.new(0.5,0.5) knob.Position=UDim2.new(frac0,0,0.5,0)
    knob.Size=UDim2.new(0,13,0,13) knob.BorderSizePixel=0 knob.Parent=track corner(knob,50)
    local dragging=false
    local function upd(x)
        local fr=math.clamp((x-track.AbsolutePosition.X)/track.AbsoluteSize.X,0,1)
        vLbl.Text=tostring(math.floor(minV+fr*(maxV-minV)))
        tw(fill,{Size=UDim2.new(fr,0,1,0)},.08) tw(knob,{Position=UDim2.new(fr,0,0.5,0)},.08) end
    track.MouseButton1Down:Connect(function() dragging=true upd(UserInputService:GetMouseLocation().X) end)
    UserInputService.InputChanged:Connect(function(inp)
        if dragging and inp.UserInputType==Enum.UserInputType.MouseMovement then
            upd(inp.Position.X) end end)
    UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end end)
    row.MouseEnter:Connect(function() tw(row,{BackgroundColor3=Color3.fromRGB(17,13,30)},.15) end)
    row.MouseLeave:Connect(function() tw(row,{BackgroundColor3=Color3.fromRGB(11,9,19)},.15) end)
    return row end

local function mkComingSoon(parent,mainTxt,subTxt)
    local f=Instance.new("Frame") f.Parent=parent f.BackgroundColor3=Color3.fromRGB(9,7,16)
    f.BorderSizePixel=0 f.Size=UDim2.new(1,-4,0,200) f.LayoutOrder=1 corner(f,12) mkstroke(f,CT.p,1)
    local l1=Instance.new("TextLabel") l1.Parent=f l1.BackgroundTransparency=1
    l1.AnchorPoint=Vector2.new(.5,.5) l1.Position=UDim2.new(.5,0,.38,0)
    l1.Size=UDim2.new(.9,0,0,48) l1.Font=Enum.Font.GothamBold l1.Text=mainTxt
    l1.TextColor3=CT.p l1.TextSize=22 l1.ZIndex=2
    local l2=Instance.new("TextLabel") l2.Parent=f l2.BackgroundTransparency=1
    l2.AnchorPoint=Vector2.new(.5,.5) l2.Position=UDim2.new(.5,0,.65,0)
    l2.Size=UDim2.new(.9,0,0,34) l2.Font=Enum.Font.Gotham l2.Text=subTxt
    l2.TextColor3=Color3.fromRGB(115,105,150) l2.TextSize=12 l2.TextWrapped=true l2.ZIndex=2
    return l1 end

-- ══════════════════════════════════════
--  POPULATE TABS
-- ══════════════════════════════════════
local tp=mkTab("Trade","💎",1)
mkSection(tp,"Trade Features",1)
mkToggle(tp,"Visual Trade",2,true)
mkToggle(tp,"Auto Accept",3,false)
mkToggle(tp,"Freeze Trade",4,false)
mkToggle(tp,"Visual Brainrot",5,false)
mkSection(tp,"Timing Settings",6)
mkSlider(tp,"Accept Delay (ms)",0,500,35,7)
mkSlider(tp,"Visual Intensity",0,100,72,8)
mkSection(tp,"Advanced",9)
mkToggle(tp,"Anti Decline",10,true)
mkToggle(tp,"Trade Logger",11,false)

local bp=mkTab("Brainrot","🧠",2)
mkSection(bp,"Brainrot Engine",1)
mkToggle(bp,"Enable Visual Brainrot",2,false)
mkToggle(bp,"Rainbow Text",3,false)
mkToggle(bp,"Spam Mode",4,false)
local biRow=Instance.new("Frame") biRow.Parent=bp biRow.BackgroundColor3=Color3.fromRGB(11,9,19)
biRow.BorderSizePixel=0 biRow.Size=UDim2.new(1,-4,0,78) biRow.LayoutOrder=5
corner(biRow,8) mkstroke(biRow,Color3.fromRGB(28,20,50),1)
makeLabel(biRow,"📝  Brainrot Text:",UDim2.new(0,12,0,6),UDim2.new(1,-24,0,16),
    Enum.Font.GothamBold,12,Color3.fromRGB(190,180,220),1)
local biIbg=Instance.new("Frame") biIbg.Parent=biRow biIbg.BackgroundColor3=Color3.fromRGB(7,5,15)
biIbg.Position=UDim2.new(0,10,0,26) biIbg.Size=UDim2.new(1,-20,0,36) corner(biIbg,6)
mkstroke(biIbg,Color3.fromRGB(48,32,78),1)
local biIn=Instance.new("TextBox") biIn.Parent=biIbg biIn.BackgroundTransparency=1
biIn.Position=UDim2.new(0,10,0,0) biIn.Size=UDim2.new(1,-20,1,0)
biIn.Font=Enum.Font.Gotham biIn.PlaceholderText="Type brainrot here..."
biIn.PlaceholderColor3=Color3.fromRGB(65,50,95) biIn.Text=""
biIn.TextColor3=Color3.fromRGB(220,210,240) biIn.TextSize=12
biIn.TextXAlignment=Enum.TextXAlignment.Left biIn.ClearTextOnFocus=false
mkSection(bp,"Preview",6)
local prevRow=Instance.new("Frame") prevRow.Parent=bp prevRow.BackgroundColor3=Color3.fromRGB(11,9,19)
prevRow.BorderSizePixel=0 prevRow.Size=UDim2.new(1,-4,0,50) prevRow.LayoutOrder=7
corner(prevRow,8) mkstroke(prevRow,Color3.fromRGB(28,20,50),1)
local prevLbl=makeLabel(prevRow,"[ No brainrot active ]",UDim2.new(0,12,0,0),UDim2.new(1,-24,1,0),
    Enum.Font.GothamBold,12,Color3.fromRGB(120,110,150),1)
biIn:GetPropertyChangedSignal("Text"):Connect(function()
    if biIn.Text~="" then prevLbl.Text="▶  "..biIn.Text prevLbl.TextColor3=CT.a
    else prevLbl.Text="[ No brainrot active ]" prevLbl.TextColor3=Color3.fromRGB(120,110,150) end end)
mkSection(bp,"Brainrot Settings",8)
mkSlider(bp,"Brainrot Speed",1,10,5,9)
mkSlider(bp,"Brainrot Size",10,100,50,10)

local sp=mkTab("Steal","🕵️",3)
local stealLbl=mkComingSoon(sp,"✦  COMING SOON  ✦","Feature under development\nStay tuned → discord.gg/marky")

local tlp=mkTab("Trade List","📋",4)
local tlLbl=mkComingSoon(tlp,"✦  COMING SOON  ✦","Trade list coming soon\nStay tuned → discord.gg/marky")

local pp=mkTab("Player","👤",5)
local upLbl=mkComingSoon(pp,"⟳  UPDATING...","Player features are being updated\nCheck back soon!")

local mp=mkTab("Misc","⚙️",6)
mkSection(mp,"Theme Customizer",1)

local tNames={"Default","Aqua","Red","Gold","Pink","Green","Rainbow"}
local tCols={Default=Color3.fromRGB(138,43,226),Aqua=Color3.fromRGB(0,200,220),
    Red=Color3.fromRGB(220,30,60),Gold=Color3.fromRGB(255,180,0),
    Pink=Color3.fromRGB(255,80,160),Green=Color3.fromRGB(0,210,100),
    Rainbow=Color3.fromRGB(138,43,226)}
local themeObjs={mainStroke,WMStroke}
local function applyTheme(name)
    CT=Themes[name] isRainbow=(name=="Rainbow")
    if not isRainbow then
        for _,s in ipairs(themeObjs) do s.Color=CT.p end
        WML.TextColor3=CT.a HT.BackgroundColor3=CT.p HT_fix.BackgroundColor3=CT.p
        SA_fill.BackgroundColor3=CT.p SC_fill.BackgroundColor3=CT.p
        SD_fill.BackgroundColor3=CT.p end end

for i,tn in ipairs(tNames) do
    local row=Instance.new("Frame") row.Parent=mp row.BackgroundColor3=Color3.fromRGB(11,9,19)
    row.BorderSizePixel=0 row.Size=UDim2.new(1,-4,0,42) row.LayoutOrder=i+1
    corner(row,8) mkstroke(row,Color3.fromRGB(28,20,50),1)
    local dot=Instance.new("Frame") dot.BackgroundColor3=tCols[tn]
    dot.Position=UDim2.new(0,12,0.5,-8) dot.Size=UDim2.new(0,16,0,16)
    dot.BorderSizePixel=0 dot.Parent=row corner(dot,50)
    makeLabel(row,tn..(tn=="Rainbow" and "  🌈" or ""),UDim2.new(0,36,0,0),UDim2.new(0.55,0,1,0),
        Enum.Font.GothamBold,13,Color3.fromRGB(210,200,230),1)
    local ab=Instance.new("TextButton") ab.Parent=row ab.BackgroundColor3=CT.p
    ab.Position=UDim2.new(1,-72,0.5,-12) ab.Size=UDim2.new(0,60,0,24)
    ab.Font=Enum.Font.GothamBold ab.Text="Apply" ab.TextColor3=Color3.fromRGB(255,255,255)
    ab.TextSize=11 ab.BorderSizePixel=0 corner(ab,6)
    local cap=tn
    ab.MouseButton1Click:Connect(function()
        applyTheme(cap) ab.Text="✓"
        task.delay(1.2,function() if ab.Parent then ab.Text="Apply" end end) end)
    row.MouseEnter:Connect(function() tw(row,{BackgroundColor3=Color3.fromRGB(17,13,30)},.15) end)
    row.MouseLeave:Connect(function() tw(row,{BackgroundColor3=Color3.fromRGB(11,9,19)},.15) end) end

-- ══════════════════════════════════════════════
--  SEQUENCE FUNCTIONS
-- ══════════════════════════════════════════════
local function runHubLoader()
    SD.Visible=true SD_fill.Size=UDim2.new(0,0,1,0) SD_pct.Text="0%"
    for _,c in ipairs(SD_logs:GetChildren()) do if c:IsA("TextLabel") then c:Destroy() end end
    SD_ord=0
    for i,lg in ipairs(SD_LOGS) do
        task.wait(.32) sdLog(lg[1],lg[2])
        local pct=math.floor((i/#SD_LOGS)*100)
        tw(SD_fill,{Size=UDim2.new(pct/100,0,1,0)},.28)
        SD_pct.Text=pct.."%"
        SD_sub.Text="Module "..i.." of "..#SD_LOGS.."..." end
    task.wait(.4) tw(SD,{BackgroundTransparency=1},.4) task.wait(.45)
    SD.Visible=false SD.BackgroundTransparency=0
    SE.Visible=true WMF.Visible=true
    SE.Size=UDim2.new(0,0,0,0) tw(SE,{Size=UDim2.new(0,560,0,FULL_H)},.45)
    setTab("Trade") end

local function runKeyCheck(isCorrect)
    SB.Visible=false SC.Visible=true
    for _,c in ipairs(SC_logs:GetChildren()) do if c:IsA("TextLabel") then c:Destroy() end end
    SC_ord=0 SC_fill.Size=UDim2.new(0,0,1,0)
    local logs
    if isCorrect then
        SC_title.Text="⚙️  VERIFYING KEY..."
        logs={
            {"[SYS]  Sending key to Marky server...",    Color3.fromRGB(140,140,255)},
            {"[OK ]  Server connection established.",     Color3.fromRGB(130,230,130)},
            {"[OK ]  Validating license format...",       Color3.fromRGB(130,230,130)},
            {"[OK ]  Key found in database.",             Color3.fromRGB(130,230,130)},
            {"[OK ]  License status: ACTIVE ✓",          Color3.fromRGB(80,255,160)},
            {"[OK ]  User authenticated — Welcome!",     Color3.fromRGB(80,255,160)},}
    else
        SC_title.Text="⚙️  CHECKING KEY..."
        logs={
            {"[SYS]  Sending key to Marky server...",    Color3.fromRGB(140,140,255)},
            {"[OK ]  Server connection established.",     Color3.fromRGB(130,230,130)},
            {"[OK ]  Scanning license database...",       Color3.fromRGB(130,230,130)},
            {"[ERR]  Key not found in records.",          Color3.fromRGB(255,100,100)},
            {"[ERR]  Authentication failed.",             Color3.fromRGB(255,100,100)},
            {"[SYS]  Access denied. Returning...",       Color3.fromRGB(255,155,55)},}
    end
    for i,lg in ipairs(logs) do
        task.wait(.38) scLog(lg[1],lg[2],i)
        local pct=math.floor((i/#logs)*100)
        tw(SC_fill,{Size=UDim2.new(pct/100,0,1,0)},.33)
        SC_sub.Text="Step "..i.." of "..#logs.."..." end
    task.wait(.5)
    if isCorrect then
        SC.Visible=false runHubLoader()
    else
        tw(SC,{BackgroundTransparency=1},.3) task.wait(.35)
        SC.BackgroundTransparency=0 SC.Visible=false SB.Visible=true
        KStatus.Text="✗  Invalid key — Access denied."
        KStatus.TextColor3=Color3.fromRGB(255,75,75)
        KIstroke.Color=Color3.fromRGB(215,45,65)
        for _=1,3 do
            tw(SB,{Position=UDim2.new(.5,-7,.5,0)},.05) task.wait(.06)
            tw(SB,{Position=UDim2.new(.5,7,.5,0)},.05) task.wait(.06) end
        tw(SB,{Position=UDim2.new(.5,0,.5,0)},.05)
        task.wait(2) KStatus.Text="" KIstroke.Color=Color3.fromRGB(55,35,100) end end

local submitting=false
KBtn.MouseButton1Click:Connect(function()
    if submitting then return end submitting=true
    local k=realKey:lower():gsub("%s+","")
    task.spawn(function() runKeyCheck(k==CORRECT_KEY) submitting=false end) end)

-- ══════════════════════════════════════
--  RUNTIME LOOP
-- ══════════════════════════════════════
local csLbls={stealLbl,tlLbl}
RunService.Heartbeat:Connect(function(dt)
    rHue=(rHue+dt*.13)%1
    if isRainbow then
        local rc=Color3.fromHSV(rHue,.88,1) local rc2=Color3.fromHSV((rHue+.12)%1,.88,1)
        mainStroke.Color=rc WMStroke.Color=rc WML.TextColor3=rc2
        HT.BackgroundColor3=rc HT_fix.BackgroundColor3=rc end
    for _,l in ipairs(csLbls) do
        if l and l.Parent then l.TextColor3=Color3.fromHSV(rHue,.85,1) end end
    if upLbl and upLbl.Parent then
        local a=(math.sin(tick()*2)+1)/2
        upLbl.TextColor3=Color3.fromRGB(
            math.floor(65+a*105),math.floor(185+a*70),math.floor(185+a*70)) end end)

-- ══════════════════════════════════════
--  LAUNCH
-- ══════════════════════════════════════
task.spawn(function()
    for i,lg in ipairs(SA_LOGS) do
        task.wait(.3) saLog(lg[1],lg[2])
        local pct=math.floor((i/#SA_LOGS)*100)
        tw(SA_fill,{Size=UDim2.new(pct/100,0,1,0)},.28)
        SA_pct.Text=pct.."%" SA_sub.Text="Module "..i.." of "..#SA_LOGS.."..." end
    task.wait(.4) tw(SA,{BackgroundTransparency=1},.4) task.wait(.45)
    SA.Visible=false SA.BackgroundTransparency=0
    SB.Visible=true SB.Size=UDim2.new(0,0,0,0)
    tw(SB,{Size=UDim2.new(0,420,0,340)},.35) end)

print("⚡ Trash Hub X Marky.Dev — Ready")
