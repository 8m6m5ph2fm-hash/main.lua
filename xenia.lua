-- ╔══════════════════════════════════════════════════╗
-- ║   TRASH HUB  ×  MARKY.DEV  —  v2.0 PREMIUM     ║
-- ║   ⚡  ELITE EDITION  |  DISPLAY ONLY            ║
-- ╚══════════════════════════════════════════════════╝

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Stats            = game:GetService("Stats")

local CORRECT_KEY   = "ab1g4il"
local FAKE_USER     = "m4rkyxtrashub"
local WATERMARK_TAG = "m4rkyXtrashhub"

local Themes = {
    Default = {p=Color3.fromRGB(138,43,226), a=Color3.fromRGB(200,130,255), g1=Color3.fromRGB(175,75,255), g2=Color3.fromRGB(85,10,175)},
    Aqua    = {p=Color3.fromRGB(0,200,220),  a=Color3.fromRGB(120,245,255), g1=Color3.fromRGB(40,225,245), g2=Color3.fromRGB(0,140,165)},
    Red     = {p=Color3.fromRGB(220,30,60),  a=Color3.fromRGB(255,90,120),  g1=Color3.fromRGB(245,55,85),  g2=Color3.fromRGB(148,8,30)},
    Gold    = {p=Color3.fromRGB(255,175,0),  a=Color3.fromRGB(255,225,90),  g1=Color3.fromRGB(255,200,25), g2=Color3.fromRGB(190,120,0)},
    Pink    = {p=Color3.fromRGB(255,75,155), a=Color3.fromRGB(255,165,210), g1=Color3.fromRGB(255,100,170),g2=Color3.fromRGB(190,30,110)},
    Green   = {p=Color3.fromRGB(0,210,100),  a=Color3.fromRGB(85,255,165),  g1=Color3.fromRGB(30,235,115), g2=Color3.fromRGB(0,148,62)},
    Rainbow = {p=Color3.fromRGB(138,43,226), a=Color3.fromRGB(200,130,255), g1=Color3.fromRGB(175,75,255), g2=Color3.fromRGB(85,10,175)},
}
local CT        = Themes.Default
local isRainbow = false
local rHue      = 0

local Root = Instance.new("ScreenGui")
Root.Name           = "TrashHubXMarkyV2"
Root.Parent         = game.CoreGui
Root.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Root.ResetOnSpawn   = false

-- ══ HELPERS ══════════════════════════════════════════
local function corner(p,r) local c=Instance.new("UICorner") c.CornerRadius=UDim.new(0,r or 8) c.Parent=p return c end
local function mkstroke(p,col,th) local s=Instance.new("UIStroke") s.Color=col or CT.p s.Thickness=th or 1.5 s.Parent=p return s end
local function tw(o,pr,t,es) TweenService:Create(o,TweenInfo.new(t or .25,es or Enum.EasingStyle.Quart,Enum.EasingDirection.Out),pr):Play() end
local function pad(p,l,r,t,b) local u=Instance.new("UIPadding") u.PaddingLeft=UDim.new(0,l or 0) u.PaddingRight=UDim.new(0,r or 0) u.PaddingTop=UDim.new(0,t or 0) u.PaddingBottom=UDim.new(0,b or 0) u.Parent=p return u end
local function shadow(parent,tr,off)
    local s=Instance.new("ImageLabel") s.Name="Shd" s.AnchorPoint=Vector2.new(.5,.5)
    s.BackgroundTransparency=1 s.Position=UDim2.new(.5,0,.5,off or 14) s.Size=UDim2.new(1,60,1,60)
    s.ZIndex=parent.ZIndex-1 s.Image="rbxassetid://6014261993" s.ImageColor3=Color3.new(0,0,0)
    s.ImageTransparency=tr or .38 s.ScaleType=Enum.ScaleType.Slice s.SliceCenter=Rect.new(49,49,450,450)
    s.Parent=parent return s end
local function lbl(parent,text,pos,size,font,ts,col,zidx,xa)
    local l=Instance.new("TextLabel") l.Parent=parent l.BackgroundTransparency=1
    l.Position=pos l.Size=size l.Font=font or Enum.Font.Gotham l.Text=text
    l.TextSize=ts or 13 l.TextColor3=col or Color3.fromRGB(210,200,230)
    l.ZIndex=zidx or 1 l.TextXAlignment=xa or Enum.TextXAlignment.Left
    l.TextWrapped=true return l end
local function grad(parent,c1,c2,rot)
    local g=Instance.new("UIGradient")
    g.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,c1),ColorSequenceKeypoint.new(1,c2)})
    g.Rotation=rot or 135 g.Parent=parent return g end

local allGrads = {}
local function trackGrad(g) table.insert(allGrads,g) return g end

-- ══ LOADING SCREENS FACTORY ═════════════════════════
local function makeLoader(name,w,h,zi)
    local fr=Instance.new("Frame") fr.Name=name fr.Parent=Root
    fr.BackgroundColor3=Color3.fromRGB(7,6,12) fr.AnchorPoint=Vector2.new(.5,.5)
    fr.Position=UDim2.new(.5,0,.5,0) fr.Size=UDim2.new(0,w,0,h)
    fr.ZIndex=zi fr.Visible=(name=="Startup")
    corner(fr,20) mkstroke(fr,CT.p,2) shadow(fr)
    grad(fr,Color3.fromRGB(11,9,20),Color3.fromRGB(5,4,9),145)

    local tb=Instance.new("Frame") tb.BackgroundColor3=CT.p tb.BorderSizePixel=0
    tb.Size=UDim2.new(1,0,0,56) tb.ZIndex=zi+1 tb.Parent=fr corner(tb,18)
    local tbG=trackGrad(grad(tb,CT.g1,CT.g2,135))
    local tbFix=Instance.new("Frame") tbFix.BackgroundColor3=CT.p tbFix.BorderSizePixel=0
    tbFix.Position=UDim2.new(0,0,.5,0) tbFix.Size=UDim2.new(1,0,.5,0) tbFix.ZIndex=zi+1 tbFix.Parent=tb
    local tbFixG=trackGrad(grad(tbFix,CT.g1,CT.g2,135))

    local trackBG=Instance.new("Frame") trackBG.BackgroundColor3=Color3.fromRGB(14,11,26)
    trackBG.BorderSizePixel=0 trackBG.Position=UDim2.new(0,18,0,64)
    trackBG.Size=UDim2.new(1,-36,0,5) trackBG.ZIndex=zi+1 trackBG.Parent=fr corner(trackBG,3)
    local fill=Instance.new("Frame") fill.BackgroundColor3=CT.p fill.BorderSizePixel=0
    fill.Size=UDim2.new(0,0,1,0) fill.ZIndex=zi+2 fill.Parent=trackBG corner(fill,3)
    local fillG=trackGrad(grad(fill,CT.g1,CT.g2,0))

    local logFrame=Instance.new("Frame") logFrame.BackgroundTransparency=1
    logFrame.Position=UDim2.new(0,18,0,76) logFrame.Size=UDim2.new(1,-36,1,-82)
    logFrame.ZIndex=zi+1 logFrame.Parent=fr
    local ll=Instance.new("UIListLayout") ll.Parent=logFrame
    ll.SortOrder=Enum.SortOrder.LayoutOrder ll.Padding=UDim.new(0,4)

    return fr,tb,tbFix,tbG,tbFixG,fill,fillG,logFrame
end

-- ── STARTUP ──────────────────────────────────
local SA,SA_tb,SA_tbFix,SA_tbG,SA_tbFixG,SA_fill,SA_fillG,SA_logFrame = makeLoader("Startup",410,305,30)
lbl(SA_tb,"⚡  TRASH HUB  ×  MARKY.DEV",UDim2.new(0,16,0,9),UDim2.new(.85,0,0,21),Enum.Font.GothamBold,14,Color3.fromRGB(255,255,255),32)
local SA_sub=lbl(SA_tb,"Booting system...",UDim2.new(0,16,0,31),UDim2.new(.85,0,0,14),Enum.Font.Gotham,10,Color3.fromRGB(220,205,255),32)
local SA_pct=lbl(SA,"0%",UDim2.new(1,-54,0,62),UDim2.new(0,36,0,12),Enum.Font.GothamBold,10,Color3.fromRGB(150,130,190),31,Enum.TextXAlignment.Right)
local SA_ord=0
local function saLog(txt,col)
    SA_ord=SA_ord+1 local l=Instance.new("TextLabel") l.Parent=SA_logFrame l.BackgroundTransparency=1
    l.Size=UDim2.new(1,0,0,14) l.Font=Enum.Font.Code l.Text=txt
    l.TextColor3=col or Color3.fromRGB(130,230,130) l.TextSize=11
    l.TextXAlignment=Enum.TextXAlignment.Left l.LayoutOrder=SA_ord l.ZIndex=32 end
local SA_LOGS={
    {"[SYS]  Booting Trash Hub X Marky.Dev v2.0...", Color3.fromRGB(140,140,255)},
    {"[OK ]  Allocating memory buffers...",           Color3.fromRGB(100,220,120)},
    {"[OK ]  Loading AES-256 encryption layer...",    Color3.fromRGB(100,220,120)},
    {"[OK ]  Establishing server handshake...",       Color3.fromRGB(100,220,120)},
    {"[OK ]  Verifying game environment...",          Color3.fromRGB(100,220,120)},
    {"[OK ]  Injecting premium UI v2 framework...",   Color3.fromRGB(100,220,120)},
    {"[WARN]  Anti-detect fingerprint applied.",      Color3.fromRGB(255,200,80)},
    {"[OK ]  All modules loaded — 0 errors.",         Color3.fromRGB(80,255,160)},
    {"[SYS]  Redirecting to key authentication...",   Color3.fromRGB(140,140,255)},
}

-- ── KEY SYSTEM ────────────────────────────────
local SB=Instance.new("Frame") SB.Name="KeySys" SB.Parent=Root
SB.BackgroundColor3=Color3.fromRGB(7,6,12) SB.AnchorPoint=Vector2.new(.5,.5)
SB.Position=UDim2.new(.5,0,.5,0) SB.Size=UDim2.new(0,440,0,365) SB.ZIndex=10 SB.Visible=false
corner(SB,20) mkstroke(SB,CT.p,2) shadow(SB)
grad(SB,Color3.fromRGB(11,9,20),Color3.fromRGB(5,4,9),145)

local SB_tb=Instance.new("Frame") SB_tb.BackgroundColor3=CT.p SB_tb.BorderSizePixel=0
SB_tb.Size=UDim2.new(1,0,0,56) SB_tb.ZIndex=11 SB_tb.Parent=SB corner(SB_tb,18)
local SB_tbG=trackGrad(grad(SB_tb,CT.g1,CT.g2,135))
local SB_tbFix=Instance.new("Frame") SB_tbFix.BackgroundColor3=CT.p SB_tbFix.BorderSizePixel=0
SB_tbFix.Position=UDim2.new(0,0,.5,0) SB_tbFix.Size=UDim2.new(1,0,.5,0) SB_tbFix.ZIndex=11 SB_tbFix.Parent=SB_tb
local SB_tbFixG=trackGrad(grad(SB_tbFix,CT.g1,CT.g2,135))
lbl(SB_tb,"🔑  TRASH HUB  ×  MARKY.DEV",UDim2.new(0,16,0,9),UDim2.new(.85,0,0,21),Enum.Font.GothamBold,14,Color3.fromRGB(255,255,255),12)
lbl(SB_tb,"Authentication Portal",UDim2.new(0,16,0,31),UDim2.new(.85,0,0,14),Enum.Font.Gotham,10,Color3.fromRGB(220,205,255),12)

-- center icon card
local iconCard=Instance.new("Frame") iconCard.BackgroundColor3=Color3.fromRGB(14,11,24)
iconCard.BorderSizePixel=0 iconCard.AnchorPoint=Vector2.new(.5,0)
iconCard.Position=UDim2.new(.5,0,0,70) iconCard.Size=UDim2.new(0,58,0,58) iconCard.ZIndex=11 iconCard.Parent=SB
corner(iconCard,16) mkstroke(iconCard,CT.p,1.5)
grad(iconCard,Color3.fromRGB(20,14,36),Color3.fromRGB(10,7,18),145)
lbl(iconCard,"🔒",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,28,Color3.fromRGB(255,255,255),12,Enum.TextXAlignment.Center)

lbl(SB,"Enter your license key to access\nTrash Hub  ×  Marky.Dev v2.0",
    UDim2.new(0,24,0,138),UDim2.new(1,-48,0,36),Enum.Font.Gotham,12,Color3.fromRGB(135,120,168),11,Enum.TextXAlignment.Center)

-- input
local KIbg=Instance.new("Frame") KIbg.BackgroundColor3=Color3.fromRGB(10,8,18)
KIbg.Position=UDim2.new(0,22,0,178) KIbg.Size=UDim2.new(1,-44,0,46) KIbg.ZIndex=11 KIbg.Parent=SB corner(KIbg,12)
local KIstroke=mkstroke(KIbg,Color3.fromRGB(44,28,82),1.5)
grad(KIbg,Color3.fromRGB(13,10,22),Color3.fromRGB(8,6,15),145)
local KInput=Instance.new("TextBox") KInput.Parent=KIbg KInput.BackgroundTransparency=1
KInput.Position=UDim2.new(0,16,0,0) KInput.Size=UDim2.new(1,-32,1,0) KInput.Font=Enum.Font.GothamBold
KInput.PlaceholderText="Enter license key..." KInput.PlaceholderColor3=Color3.fromRGB(60,46,85)
KInput.Text="" KInput.TextColor3=Color3.fromRGB(230,220,255) KInput.TextSize=14 KInput.ZIndex=12 KInput.ClearTextOnFocus=false

local realKey="" local masking=false
KInput:GetPropertyChangedSignal("Text"):Connect(function()
    if masking then return end masking=true
    local nd=KInput.Text local nl,ol=#nd,#realKey
    if nl>ol then realKey=realKey..nd:sub(ol+1) elseif nl<ol then realKey=realKey:sub(1,#realKey-(ol-nl)) end
    realKey=realKey:lower():gsub("pretpret",string.rep("*",8))
    KInput.Text=string.rep("*",#realKey) masking=false end)

local KStatus=lbl(SB,"",UDim2.new(0,22,0,230),UDim2.new(1,-44,0,18),Enum.Font.GothamBold,12,Color3.fromRGB(255,85,100),11,Enum.TextXAlignment.Center)

local KBtn=Instance.new("TextButton") KBtn.Parent=SB KBtn.BackgroundColor3=CT.p
KBtn.Position=UDim2.new(0,22,0,252) KBtn.Size=UDim2.new(1,-44,0,48)
KBtn.Font=Enum.Font.GothamBold KBtn.Text="UNLOCK ACCESS  ⟶"
KBtn.TextColor3=Color3.fromRGB(255,255,255) KBtn.TextSize=13 KBtn.BorderSizePixel=0 KBtn.ZIndex=11
corner(KBtn,14)
local KBtnG=trackGrad(grad(KBtn,CT.g1,CT.g2,135))
KBtn.MouseEnter:Connect(function() tw(KBtn,{BackgroundColor3=CT.a},.18) end)
KBtn.MouseLeave:Connect(function() tw(KBtn,{BackgroundColor3=CT.p},.18) end)

local divL=Instance.new("Frame") divL.BackgroundColor3=Color3.fromRGB(32,22,56) divL.BorderSizePixel=0
divL.Position=UDim2.new(0,22,0,314) divL.Size=UDim2.new(1,-44,0,1) divL.ZIndex=11 divL.Parent=SB
lbl(SB,"discord.gg/marky   ·   t.me/markyhub",UDim2.new(0,22,0,320),UDim2.new(1,-44,0,18),Enum.Font.Gotham,10,Color3.fromRGB(80,60,115),11,Enum.TextXAlignment.Center)

-- ── KEY CHECK LOADER ──────────────────────────
local SC,SC_tb,SC_tbFix,SC_tbG,SC_tbFixG,SC_fill,SC_fillG,SC_logFrame = makeLoader("KeyCheck",440,365,15)
SC.Visible=false
local SC_title=lbl(SC_tb,"⚙️  VERIFYING KEY...",UDim2.new(0,16,0,9),UDim2.new(.85,0,0,21),Enum.Font.GothamBold,14,Color3.fromRGB(255,255,255),17)
local SC_sub=lbl(SC_tb,"Connecting to Marky servers...",UDim2.new(0,16,0,31),UDim2.new(.85,0,0,14),Enum.Font.Gotham,10,Color3.fromRGB(220,205,255),17)
local SC_ord=0
local function scLog(txt,col,o)
    SC_ord=o or SC_ord+1 local l=Instance.new("TextLabel") l.Parent=SC_logFrame l.BackgroundTransparency=1
    l.Size=UDim2.new(1,0,0,16) l.Font=Enum.Font.Code l.Text=txt
    l.TextColor3=col or Color3.fromRGB(100,220,120) l.TextSize=12
    l.TextXAlignment=Enum.TextXAlignment.Left l.LayoutOrder=SC_ord l.ZIndex=17 end

-- ── HUB LOADER ────────────────────────────────
local SD,SD_tb,SD_tbFix,SD_tbG,SD_tbFixG,SD_fill,SD_fillG,SD_logFrame = makeLoader("HubLoad",440,365,15)
SD.Visible=false
lbl(SD_tb,"⚡  LOADING TRASH HUB v2.0...",UDim2.new(0,16,0,9),UDim2.new(.85,0,0,21),Enum.Font.GothamBold,14,Color3.fromRGB(255,255,255),17)
local SD_sub=lbl(SD_tb,"Key verified — Preparing modules...",UDim2.new(0,16,0,31),UDim2.new(.85,0,0,14),Enum.Font.Gotham,10,Color3.fromRGB(220,205,255),17)
local SD_pct=lbl(SD,"0%",UDim2.new(1,-54,0,62),UDim2.new(0,36,0,12),Enum.Font.GothamBold,10,Color3.fromRGB(150,130,190),16,Enum.TextXAlignment.Right)
local SD_ord=0
local function sdLog(txt,col)
    SD_ord=SD_ord+1 local l=Instance.new("TextLabel") l.Parent=SD_logFrame l.BackgroundTransparency=1
    l.Size=UDim2.new(1,0,0,16) l.Font=Enum.Font.Code l.Text=txt
    l.TextColor3=col or Color3.fromRGB(100,220,120) l.TextSize=12
    l.TextXAlignment=Enum.TextXAlignment.Left l.LayoutOrder=SD_ord l.ZIndex=17 end
local SD_LOGS={
    {"[OK ]  Key verified — Elite License!",         Color3.fromRGB(80,255,160)},
    {"[OK ]  Injecting premium UI v2 framework...",  Color3.fromRGB(100,220,120)},
    {"[OK ]  Loading trade hook modules...",         Color3.fromRGB(100,220,120)},
    {"[OK ]  Loading visual render engine...",       Color3.fromRGB(100,220,120)},
    {"[WARN]  Anti-detect fingerprint injected.",    Color3.fromRGB(255,200,80)},
    {"[OK ]  Decrypting brainrot module...",         Color3.fromRGB(100,220,120)},
    {"[OK ]  Patching anti-cheat bypass...",         Color3.fromRGB(100,220,120)},
    {"[OK ]  All systems nominal — Launching hub...",Color3.fromRGB(80,255,160)},
}

-- ═══════════════════════════════════════════════════════════
--  SCREEN E — MAIN HUB  ★ v2.0 ULTRA PREMIUM
-- ═══════════════════════════════════════════════════════════
local SW     = 148
local FULL_H = 450
local MINI_H = 54

local SE=Instance.new("Frame") SE.Name="MainHub" SE.Parent=Root
SE.BackgroundColor3=Color3.fromRGB(8,7,14) SE.AnchorPoint=Vector2.new(.5,.5)
SE.Position=UDim2.new(.5,0,.5,0) SE.Size=UDim2.new(0,590,0,FULL_H)
SE.Visible=false SE.Active=true SE.Draggable=true
corner(SE,18)
local mainStroke=mkstroke(SE,CT.p,2.2)
shadow(SE,.34,16)
grad(SE,Color3.fromRGB(12,10,20),Color3.fromRGB(6,5,10),145)

-- ── TOP BAR ──────────────────────────────────────────────
local HT=Instance.new("Frame") HT.BackgroundColor3=CT.p HT.BorderSizePixel=0
HT.Size=UDim2.new(1,0,0,MINI_H) HT.Parent=SE corner(HT,16)
local topGrad=trackGrad(grad(HT,CT.g1,CT.g2,135))
local HT_fix=Instance.new("Frame") HT_fix.BackgroundColor3=CT.p HT_fix.BorderSizePixel=0
HT_fix.Position=UDim2.new(0,0,.5,0) HT_fix.Size=UDim2.new(1,0,.5,0) HT_fix.Parent=HT
local HT_fixG=trackGrad(grad(HT_fix,CT.g1,CT.g2,135))

-- logo pill
local logoPill=Instance.new("Frame") logoPill.BackgroundColor3=Color3.fromRGB(255,255,255)
logoPill.BackgroundTransparency=0.88 logoPill.BorderSizePixel=0
logoPill.Position=UDim2.new(0,12,0.5,-15) logoPill.Size=UDim2.new(0,30,0,30)
logoPill.ZIndex=3 logoPill.Parent=HT corner(logoPill,50)
lbl(logoPill,"⚡",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,15,Color3.fromRGB(255,255,255),4,Enum.TextXAlignment.Center)

lbl(HT,"TRASH HUB  ×  MARKY.DEV",UDim2.new(0,50,0,8),UDim2.new(0,220,0,21),Enum.Font.GothamBold,13,Color3.fromRGB(255,255,255),3)
lbl(HT,"v2.0  ·  Elite Edition  ·  "..FAKE_USER,UDim2.new(0,50,0,30),UDim2.new(0,220,0,14),Enum.Font.Gotham,10,Color3.fromRGB(225,210,255),3)

-- ★ FPS + PING display in topbar
local statsPill=Instance.new("Frame") statsPill.BackgroundColor3=Color3.fromRGB(0,0,0)
statsPill.BackgroundTransparency=0.5 statsPill.BorderSizePixel=0
statsPill.Position=UDim2.new(0.5,-65,0.5,-13) statsPill.Size=UDim2.new(0,130,0,26)
statsPill.ZIndex=3 statsPill.Parent=HT corner(statsPill,13)
mkstroke(statsPill,Color3.fromRGB(255,255,255),0.6).Transparency=0.7

local fpsTxt=lbl(statsPill,"FPS  —",UDim2.new(0,8,0,0),UDim2.new(0.5,-4,1,0),Enum.Font.GothamBold,11,Color3.fromRGB(120,255,180),4,Enum.TextXAlignment.Center)
local divPipe=lbl(statsPill,"│",UDim2.new(0.5,-4,0,0),UDim2.new(0,8,1,0),Enum.Font.Gotham,12,Color3.fromRGB(255,255,255),4,Enum.TextXAlignment.Center)
divPipe.TextTransparency=0.65
local pingTxt=lbl(statsPill,"PING  —",UDim2.new(0.5,4,0,0),UDim2.new(0.5,-8,1,0),Enum.Font.GothamBold,11,Color3.fromRGB(120,200,255),4,Enum.TextXAlignment.Center)

-- LICENSED badge
local licBadge=Instance.new("Frame") licBadge.BackgroundColor3=Color3.fromRGB(255,255,255)
licBadge.BackgroundTransparency=0.85 licBadge.BorderSizePixel=0
licBadge.Position=UDim2.new(1,-128,0.5,-12) licBadge.Size=UDim2.new(0,68,0,24)
licBadge.ZIndex=3 licBadge.Parent=HT corner(licBadge,12)
mkstroke(licBadge,Color3.fromRGB(255,255,255),0.7).Transparency=0.55
lbl(licBadge,"✓  ELITE",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,9,Color3.fromRGB(210,255,215),3,Enum.TextXAlignment.Center)

-- Close & Minimize
local function makeTopBtn(col,xPos,txt)
    local b=Instance.new("TextButton") b.Parent=HT b.BackgroundColor3=col
    b.BackgroundTransparency=0.2 b.Position=UDim2.new(1,xPos,0.5,-9)
    b.Size=UDim2.new(0,18,0,18) b.Font=Enum.Font.GothamBold b.Text=txt
    b.TextColor3=Color3.fromRGB(255,255,255) b.TextSize=10 b.BorderSizePixel=0
    corner(b,50) return b end
local CloseB=makeTopBtn(Color3.fromRGB(255,65,75),-28,"✕")
local MinB=makeTopBtn(Color3.fromRGB(255,185,0),-50,"–")
CloseB.MouseButton1Click:Connect(function() Root:Destroy() end)

local minimized=false
MinB.MouseButton1Click:Connect(function()
    minimized=not minimized
    if minimized then tw(SE,{Size=UDim2.new(0,590,0,MINI_H)},.32) MinB.Text="+"
    else tw(SE,{Size=UDim2.new(0,590,0,FULL_H)},.32) MinB.Text="–" end end)

-- ── SIDEBAR ──────────────────────────────────────────────
local SidePanel=Instance.new("Frame") SidePanel.BackgroundColor3=Color3.fromRGB(10,9,17)
SidePanel.BorderSizePixel=0 SidePanel.Position=UDim2.new(0,0,0,MINI_H)
SidePanel.Size=UDim2.new(0,SW,1,-MINI_H) SidePanel.Parent=SE corner(SidePanel,12)
local SideFix=Instance.new("Frame") SideFix.BackgroundColor3=Color3.fromRGB(10,9,17)
SideFix.BorderSizePixel=0 SideFix.Position=UDim2.new(.5,0,0,0) SideFix.Size=UDim2.new(.5,0,1,0) SideFix.Parent=SidePanel
grad(SidePanel,Color3.fromRGB(12,11,20),Color3.fromRGB(8,7,14),180)

-- separator line right side
local sideSep=Instance.new("Frame") sideSep.BorderSizePixel=0
sideSep.BackgroundColor3=CT.p sideSep.BackgroundTransparency=0.65
sideSep.Position=UDim2.new(1,-1,0,10) sideSep.Size=UDim2.new(0,1,1,-20)
sideSep.ZIndex=2 sideSep.Parent=SidePanel

-- MENU label header
local menuHeader=Instance.new("Frame") menuHeader.BackgroundTransparency=1
menuHeader.BorderSizePixel=0 menuHeader.Size=UDim2.new(1,0,0,28) menuHeader.LayoutOrder=0 menuHeader.Parent=SidePanel
pad(menuHeader,12,0,0,0)
lbl(menuHeader,"M E N U",UDim2.new(0,12,0,0),UDim2.new(1,-12,1,0),Enum.Font.GothamBold,9,CT.p,2)

local SideLL=Instance.new("UIListLayout") SideLL.Parent=SidePanel
SideLL.SortOrder=Enum.SortOrder.LayoutOrder SideLL.Padding=UDim.new(0,1)

-- bottom brand
lbl(SE,"© 2024  MARKY.DEV",UDim2.new(0,0,1,-20),UDim2.new(0,SW,0,16),
    Enum.Font.Gotham,8,Color3.fromRGB(44,34,68),3,Enum.TextXAlignment.Center)

-- ── CONTENT ──────────────────────────────────────────────
local ContentBG=Instance.new("Frame") ContentBG.BackgroundTransparency=1
ContentBG.Position=UDim2.new(0,SW+7,0,MINI_H+7)
ContentBG.Size=UDim2.new(1,-(SW+11),1,-(MINI_H+9)) ContentBG.Parent=SE

-- ── WATERMARK ────────────────────────────────────────────
local WMF=Instance.new("Frame") WMF.Parent=Root WMF.BackgroundColor3=Color3.fromRGB(9,8,16)
WMF.Position=UDim2.new(0,12,0,12) WMF.Size=UDim2.new(0,200,0,32) WMF.Visible=false
corner(WMF,16) local WMStroke=mkstroke(WMF,CT.p,1.8)
local WMG=trackGrad(grad(WMF,CT.g1,CT.g2,135))
shadow(WMF,.55,6)
lbl(WMF,"⚡  "..WATERMARK_TAG,UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,11,Color3.fromRGB(255,255,255),1,Enum.TextXAlignment.Center)

-- ══ TAB SYSTEM ════════════════════════════════════════════
local tabPages={} local tabBtns={} local tabBars={} local activeTab=nil

-- spacer for menu header
local spacer=Instance.new("Frame") spacer.BackgroundTransparency=1 spacer.BorderSizePixel=0
spacer.Size=UDim2.new(1,0,0,28) spacer.LayoutOrder=0 spacer.Parent=SidePanel

local function setTab(name)
    if minimized then minimized=false tw(SE,{Size=UDim2.new(0,590,0,FULL_H)},.3) MinB.Text="–" end
    for n,pg in pairs(tabPages) do pg.Visible=(n==name) end
    for n,row in pairs(tabBtns) do
        local isActive=(n==name)
        tabBars[n].Visible=isActive
        tw(row,{BackgroundColor3=isActive and Color3.fromRGB(18,14,32) or Color3.fromRGB(10,9,17),BackgroundTransparency=isActive and 0 or 1},.2)
        local icoLbl=row:FindFirstChild("ico") local nameLbl=row:FindFirstChild("nm")
        if icoLbl then icoLbl.TextColor3=isActive and CT.a or Color3.fromRGB(80,68,110) end
        if nameLbl then nameLbl.TextColor3=isActive and Color3.fromRGB(255,255,255) or Color3.fromRGB(88,74,120) end
    end
    activeTab=name end

local function mkTab(name,icon,order)
    local row=Instance.new("Frame") row.Parent=SidePanel row.BackgroundColor3=Color3.fromRGB(10,9,17)
    row.BackgroundTransparency=1 row.BorderSizePixel=0 row.Size=UDim2.new(1,0,0,42) row.LayoutOrder=order

    -- left accent bar
    local bar=Instance.new("Frame") bar.Name="bar" bar.BackgroundColor3=CT.p bar.BorderSizePixel=0
    bar.Position=UDim2.new(0,0,.15,0) bar.Size=UDim2.new(0,3,.7,0) bar.Visible=false bar.ZIndex=4 bar.Parent=row corner(bar,2)
    -- subtle bg pill when active
    local activeBG=Instance.new("Frame") activeBG.Name="activeBG" activeBG.BackgroundColor3=CT.p
    activeBG.BackgroundTransparency=0.88 activeBG.BorderSizePixel=0
    activeBG.Position=UDim2.new(0,6,0.5,-14) activeBG.Size=UDim2.new(1,-12,0,28)
    activeBG.Visible=false activeBG.ZIndex=2 activeBG.Parent=row corner(activeBG,8)

    local ico=Instance.new("TextLabel") ico.Name="ico" ico.Parent=row ico.BackgroundTransparency=1
    ico.Position=UDim2.new(0,14,0,0) ico.Size=UDim2.new(0,20,1,0)
    ico.Font=Enum.Font.GothamBold ico.Text=icon ico.TextSize=14
    ico.TextColor3=Color3.fromRGB(80,68,110) ico.ZIndex=3 ico.TextXAlignment=Enum.TextXAlignment.Center
    local nm=Instance.new("TextLabel") nm.Name="nm" nm.Parent=row nm.BackgroundTransparency=1
    nm.Position=UDim2.new(0,38,0,0) nm.Size=UDim2.new(1,-44,1,0)
    nm.Font=Enum.Font.GothamBold nm.Text=name nm.TextSize=12
    nm.TextColor3=Color3.fromRGB(88,74,120) nm.ZIndex=3 nm.TextXAlignment=Enum.TextXAlignment.Left

    local ob=Instance.new("TextButton") ob.Parent=row ob.BackgroundTransparency=1 ob.Size=UDim2.new(1,0,1,0) ob.Text="" ob.ZIndex=5
    ob.MouseEnter:Connect(function() if activeTab~=name then tw(row,{BackgroundColor3=Color3.fromRGB(15,12,25),BackgroundTransparency=0},.15) end end)
    ob.MouseLeave:Connect(function() if activeTab~=name then tw(row,{BackgroundColor3=Color3.fromRGB(10,9,17),BackgroundTransparency=1},.15) end end)

    local pg=Instance.new("ScrollingFrame") pg.Parent=ContentBG pg.BackgroundTransparency=1
    pg.Size=UDim2.new(1,0,1,0) pg.BorderSizePixel=0 pg.ScrollBarThickness=2
    pg.ScrollBarImageColor3=CT.p pg.CanvasSize=UDim2.new(0,0,0,0) pg.Visible=false
    local ll=Instance.new("UIListLayout") ll.Parent=pg ll.SortOrder=Enum.SortOrder.LayoutOrder ll.Padding=UDim.new(0,5)
    ll:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        pg.CanvasSize=UDim2.new(0,0,0,ll.AbsoluteContentSize.Y+12) end)

    tabPages[name]=pg tabBtns[name]=row tabBars[name]=bar
    ob.MouseButton1Click:Connect(function() setTab(name) end)
    return pg end

-- ══ WIDGETS ═══════════════════════════════════════════════
local function mkSection(parent,title,order)
    local f=Instance.new("Frame") f.Parent=parent f.BackgroundTransparency=1
    f.BorderSizePixel=0 f.Size=UDim2.new(1,-2,0,24) f.LayoutOrder=order or 0
    local lLine=Instance.new("Frame") lLine.BackgroundColor3=CT.p lLine.BackgroundTransparency=0.25
    lLine.BorderSizePixel=0 lLine.Position=UDim2.new(0,2,0.5,-1) lLine.Size=UDim2.new(0,14,0,2) lLine.Parent=f corner(lLine,1)
    local rLine=Instance.new("Frame") rLine.BackgroundColor3=CT.p rLine.BackgroundTransparency=0.78
    rLine.BorderSizePixel=0 rLine.Position=UDim2.new(0,76,0.5,-1) rLine.Size=UDim2.new(1,-78,0,1) rLine.Parent=f corner(rLine,1)
    lbl(f,title,UDim2.new(0,20,0,0),UDim2.new(1,-22,1,0),Enum.Font.GothamBold,9,CT.a,1)
    return f end

local function mkToggle(parent,name,order,defOn)
    local row=Instance.new("Frame") row.Parent=parent row.BackgroundColor3=Color3.fromRGB(13,11,22)
    row.BorderSizePixel=0 row.Size=UDim2.new(1,-2,0,40) row.LayoutOrder=order or 0
    corner(row,12) mkstroke(row,Color3.fromRGB(22,16,42),1)
    grad(row,Color3.fromRGB(16,13,26),Color3.fromRGB(11,9,19),145)
    lbl(row,name,UDim2.new(0,14,0,0),UDim2.new(0.66,0,1,0),Enum.Font.Gotham,12,Color3.fromRGB(195,184,218),1)
    local bg=Instance.new("Frame") bg.BackgroundColor3=defOn and CT.p or Color3.fromRGB(26,20,46)
    bg.Position=UDim2.new(1,-56,0.5,-11) bg.Size=UDim2.new(0,44,0,22) bg.BorderSizePixel=0 bg.Parent=row corner(bg,50)
    if defOn then trackGrad(grad(bg,CT.g1,CT.g2,135)) end
    local knob=Instance.new("Frame") knob.BackgroundColor3=Color3.fromRGB(255,255,255)
    knob.BorderSizePixel=0 knob.Position=defOn and UDim2.new(1,-20,0.5,-9) or UDim2.new(0,2,0.5,-9)
    knob.Size=UDim2.new(0,18,0,18) knob.Parent=bg corner(knob,50)
    local tog=defOn or false
    local ob=Instance.new("TextButton") ob.Parent=row ob.BackgroundTransparency=1 ob.Size=UDim2.new(1,0,1,0) ob.Text=""
    ob.MouseButton1Click:Connect(function()
        tog=not tog
        tw(bg,{BackgroundColor3=tog and CT.p or Color3.fromRGB(26,20,46)})
        tw(knob,{Position=tog and UDim2.new(1,-20,0.5,-9) or UDim2.new(0,2,0.5,-9)}) end)
    row.MouseEnter:Connect(function() tw(row,{BackgroundColor3=Color3.fromRGB(18,15,30)},.14) end)
    row.MouseLeave:Connect(function() tw(row,{BackgroundColor3=Color3.fromRGB(13,11,22)},.14) end)
    return row end

local function mkSlider(parent,name,minV,maxV,defV,order)
    local row=Instance.new("Frame") row.Parent=parent row.BackgroundColor3=Color3.fromRGB(13,11,22)
    row.BorderSizePixel=0 row.Size=UDim2.new(1,-2,0,54) row.LayoutOrder=order or 0
    corner(row,12) mkstroke(row,Color3.fromRGB(22,16,42),1)
    grad(row,Color3.fromRGB(16,13,26),Color3.fromRGB(11,9,19),145)
    lbl(row,name,UDim2.new(0,14,0,7),UDim2.new(.64,0,0,18),Enum.Font.Gotham,12,Color3.fromRGB(195,184,218),1)
    local vLbl=lbl(row,tostring(defV),UDim2.new(.64,0,0,7),UDim2.new(.32,0,0,18),Enum.Font.GothamBold,12,CT.a,1,Enum.TextXAlignment.Right)
    local track=Instance.new("TextButton") track.Parent=row track.BackgroundColor3=Color3.fromRGB(18,14,32)
    track.BorderSizePixel=0 track.Position=UDim2.new(0,14,0,34) track.Size=UDim2.new(1,-28,0,7) track.Text="" corner(track,4)
    local fill=Instance.new("Frame") fill.BackgroundColor3=CT.p fill.BorderSizePixel=0
    local frac0=(defV-minV)/(maxV-minV) fill.Size=UDim2.new(frac0,0,1,0) fill.Parent=track corner(fill,4)
    trackGrad(grad(fill,CT.g1,CT.g2,0))
    local knob=Instance.new("Frame") knob.BackgroundColor3=Color3.fromRGB(255,255,255)
    knob.AnchorPoint=Vector2.new(0.5,0.5) knob.Position=UDim2.new(frac0,0,0.5,0)
    knob.Size=UDim2.new(0,15,0,15) knob.BorderSizePixel=0 knob.Parent=track corner(knob,50)
    mkstroke(knob,CT.p,1.8)
    local dragging=false
    local function upd(x)
        local fr=math.clamp((x-track.AbsolutePosition.X)/track.AbsoluteSize.X,0,1)
        vLbl.Text=tostring(math.floor(minV+fr*(maxV-minV)))
        tw(fill,{Size=UDim2.new(fr,0,1,0)},.07) tw(knob,{Position=UDim2.new(fr,0,0.5,0)},.07) end
    track.MouseButton1Down:Connect(function() dragging=true upd(UserInputService:GetMouseLocation().X) end)
    UserInputService.InputChanged:Connect(function(i)
        if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then upd(i.Position.X) end end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end end)
    row.MouseEnter:Connect(function() tw(row,{BackgroundColor3=Color3.fromRGB(18,15,30)},.14) end)
    row.MouseLeave:Connect(function() tw(row,{BackgroundColor3=Color3.fromRGB(13,11,22)},.14) end)
    return row end

local function mkComingSoon(parent,mainTxt,subTxt)
    local f=Instance.new("Frame") f.Parent=parent f.BackgroundColor3=Color3.fromRGB(11,9,18)
    f.BorderSizePixel=0 f.Size=UDim2.new(1,-2,0,210) f.LayoutOrder=1 corner(f,16)
    mkstroke(f,CT.p,1.5) grad(f,Color3.fromRGB(15,11,26),Color3.fromRGB(7,6,13),145)
    -- glow ring
    local ring=Instance.new("Frame") ring.BackgroundColor3=CT.p ring.BackgroundTransparency=0.72
    ring.AnchorPoint=Vector2.new(.5,.5) ring.Position=UDim2.new(.5,0,.3,0)
    ring.Size=UDim2.new(0,48,0,48) ring.BorderSizePixel=0 ring.ZIndex=2 ring.Parent=f corner(ring,50)
    local ringInner=Instance.new("Frame") ringInner.BackgroundColor3=Color3.fromRGB(11,9,18)
    ringInner.AnchorPoint=Vector2.new(.5,.5) ringInner.Position=UDim2.new(.5,0,.5,0)
    ringInner.Size=UDim2.new(0.62,0,.62,0) ringInner.BorderSizePixel=0 ringInner.ZIndex=3 ringInner.Parent=ring corner(ringInner,50)
    lbl(ring,"✦",UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),Enum.Font.GothamBold,18,CT.p,4,Enum.TextXAlignment.Center)
    local l1=Instance.new("TextLabel") l1.Parent=f l1.BackgroundTransparency=1
    l1.AnchorPoint=Vector2.new(.5,.5) l1.Position=UDim2.new(.5,0,.62,0)
    l1.Size=UDim2.new(.9,0,0,28) l1.Font=Enum.Font.GothamBold l1.Text=mainTxt
    l1.TextColor3=CT.p l1.TextSize=16 l1.ZIndex=2
    local l2=Instance.new("TextLabel") l2.Parent=f l2.BackgroundTransparency=1
    l2.AnchorPoint=Vector2.new(.5,.5) l2.Position=UDim2.new(.5,0,.82,0)
    l2.Size=UDim2.new(.85,0,0,36) l2.Font=Enum.Font.Gotham l2.Text=subTxt
    l2.TextColor3=Color3.fromRGB(88,72,122) l2.TextSize=11 l2.TextWrapped=true l2.ZIndex=2
    return l1 end

-- ══ POPULATE TABS ════════════════════════════════════════
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
local biRow=Instance.new("Frame") biRow.Parent=bp biRow.BackgroundColor3=Color3.fromRGB(13,11,22)
biRow.BorderSizePixel=0 biRow.Size=UDim2.new(1,-2,0,78) biRow.LayoutOrder=5
corner(biRow,12) mkstroke(biRow,Color3.fromRGB(22,16,42),1) grad(biRow,Color3.fromRGB(16,13,26),Color3.fromRGB(11,9,19),145)
lbl(biRow,"📝  Brainrot Text:",UDim2.new(0,14,0,7),UDim2.new(1,-28,0,16),Enum.Font.GothamBold,11,Color3.fromRGB(175,160,210),1)
local biIbg=Instance.new("Frame") biIbg.Parent=biRow biIbg.BackgroundColor3=Color3.fromRGB(8,6,16)
biIbg.Position=UDim2.new(0,10,0,26) biIbg.Size=UDim2.new(1,-20,0,36) corner(biIbg,9) mkstroke(biIbg,Color3.fromRGB(38,24,68),1.5)
local biIn=Instance.new("TextBox") biIn.Parent=biIbg biIn.BackgroundTransparency=1
biIn.Position=UDim2.new(0,12,0,0) biIn.Size=UDim2.new(1,-24,1,0) biIn.Font=Enum.Font.Gotham
biIn.PlaceholderText="Type brainrot here..." biIn.PlaceholderColor3=Color3.fromRGB(56,42,80)
biIn.Text="" biIn.TextColor3=Color3.fromRGB(220,210,240) biIn.TextSize=12
biIn.TextXAlignment=Enum.TextXAlignment.Left biIn.ClearTextOnFocus=false
mkSection(bp,"Preview",6)
local prevRow=Instance.new("Frame") prevRow.Parent=bp prevRow.BackgroundColor3=Color3.fromRGB(13,11,22)
prevRow.BorderSizePixel=0 prevRow.Size=UDim2.new(1,-2,0,48) prevRow.LayoutOrder=7
corner(prevRow,12) mkstroke(prevRow,Color3.fromRGB(22,16,42),1) grad(prevRow,Color3.fromRGB(16,13,26),Color3.fromRGB(11,9,19),145)
local prevLbl=lbl(prevRow,"[ No brainrot active ]",UDim2.new(0,14,0,0),UDim2.new(1,-28,1,0),Enum.Font.GothamBold,11,Color3.fromRGB(100,85,135),1)
biIn:GetPropertyChangedSignal("Text"):Connect(function()
    if biIn.Text~="" then prevLbl.Text="▶  "..biIn.Text prevLbl.TextColor3=CT.a
    else prevLbl.Text="[ No brainrot active ]" prevLbl.TextColor3=Color3.fromRGB(100,85,135) end end)
mkSection(bp,"Brainrot Settings",8)
mkSlider(bp,"Brainrot Speed",1,10,5,9)
mkSlider(bp,"Brainrot Size",10,100,50,10)

local sp=mkTab("Steal","🕵️",3)
local stealLbl=mkComingSoon(sp,"COMING SOON","Feature under development\nStay tuned → discord.gg/marky")

local tlp=mkTab("Trade List","📋",4)
local tlLbl=mkComingSoon(tlp,"COMING SOON","Trade list coming soon\nStay tuned → discord.gg/marky")

local pp=mkTab("Player","👤",5)
local upLbl=mkComingSoon(pp,"UPDATING . . .","Player module is being rewritten\nETA unknown — stay tuned")

-- ★ PERFORMANCE TAB — FPS & PING
local perf=mkTab("Performance","📊",6)
mkSection(perf,"Live Stats",1)

local function makeStatCard(parent,title,icon,col,order)
    local card=Instance.new("Frame") card.Parent=parent card.BackgroundColor3=Color3.fromRGB(13,11,22)
    card.BorderSizePixel=0 card.Size=UDim2.new(1,-2,0,72) card.LayoutOrder=order corner(card,14)
    mkstroke(card,Color3.fromRGB(22,16,42),1) grad(card,Color3.fromRGB(17,13,28),Color3.fromRGB(10,8,17),145)
    lbl(card,icon,UDim2.new(0,16,0,10),UDim2.new(0,32,0,32),Enum.Font.GothamBold,22,col,2,Enum.TextXAlignment.Center)
    lbl(card,title,UDim2.new(0,52,0,10),UDim2.new(0.5,0,0,18),Enum.Font.GothamBold,11,Color3.fromRGB(155,140,185),2)
    local val=lbl(card,"—",UDim2.new(0,52,0,28),UDim2.new(0.55,0,0,26),Enum.Font.GothamBold,22,col,2)
    -- bar bg
    local barBG=Instance.new("Frame") barBG.BackgroundColor3=Color3.fromRGB(18,14,32)
    barBG.BorderSizePixel=0 barBG.Position=UDim2.new(0,16,1,-14) barBG.Size=UDim2.new(1,-32,0,5) barBG.Parent=card corner(barBG,3)
    local barFill=Instance.new("Frame") barFill.BackgroundColor3=col barFill.BorderSizePixel=0
    barFill.Size=UDim2.new(0,0,1,0) barFill.Parent=barBG corner(barFill,3)
    card.MouseEnter:Connect(function() tw(card,{BackgroundColor3=Color3.fromRGB(18,15,30)},.14) end)
    card.MouseLeave:Connect(function() tw(card,{BackgroundColor3=Color3.fromRGB(13,11,22)},.14) end)
    return val,barFill end

local fpsVal,fpsBar=makeStatCard(perf,"FPS","⚡",Color3.fromRGB(100,255,175),2)
local pingVal,pingBar=makeStatCard(perf,"PING (ms)","📶",Color3.fromRGB(100,195,255),3)
mkSection(perf,"Performance",4)
mkToggle(perf,"FPS Unlocker",5,true)
mkToggle(perf,"Low Latency Mode",6,false)
mkToggle(perf,"Render Optimizer",7,false)

local mp=mkTab("Misc","⚙️",7)
mkSection(mp,"Theme Customizer",1)
local tNames={"Default","Aqua","Red","Gold","Pink","Green","Rainbow"}
local tCols={Default=Color3.fromRGB(138,43,226),Aqua=Color3.fromRGB(0,200,220),Red=Color3.fromRGB(220,30,60),
    Gold=Color3.fromRGB(255,175,0),Pink=Color3.fromRGB(255,75,155),Green=Color3.fromRGB(0,210,100),Rainbow=Color3.fromRGB(138,43,226)}

local function applyTheme(name)
    CT=Themes[name] isRainbow=(name=="Rainbow")
    if not isRainbow then
        local cs=ColorSequence.new({ColorSequenceKeypoint.new(0,CT.g1),ColorSequenceKeypoint.new(1,CT.g2)})
        for _,g in ipairs(allGrads) do g.Color=cs end
        mainStroke.Color=CT.p WMStroke.Color=CT.p sideSep.BackgroundColor3=CT.p
        for _,bar in pairs(tabBars) do bar.BackgroundColor3=CT.p end
        fpsVal.TextColor3=Color3.fromRGB(100,255,175) pingVal.TextColor3=Color3.fromRGB(100,195,255)
    end end

for i,tn in ipairs(tNames) do
    local row=Instance.new("Frame") row.Parent=mp row.BackgroundColor3=Color3.fromRGB(13,11,22)
    row.BorderSizePixel=0 row.Size=UDim2.new(1,-2,0,46) row.LayoutOrder=i+1
    corner(row,12) mkstroke(row,Color3.fromRGB(22,16,42),1) grad(row,Color3.fromRGB(16,13,26),Color3.fromRGB(11,9,19),145)
    local dot=Instance.new("Frame") dot.BackgroundColor3=tCols[tn]
    dot.Position=UDim2.new(0,12,0.5,-10) dot.Size=UDim2.new(0,20,0,20) dot.BorderSizePixel=0 dot.Parent=row corner(dot,50)
    mkstroke(dot,Color3.fromRGB(255,255,255),0.5).Transparency=0.6
    lbl(row,tn..(tn=="Rainbow" and "  🌈" or ""),UDim2.new(0,40,0,0),UDim2.new(0.5,0,1,0),Enum.Font.GothamBold,13,Color3.fromRGB(195,184,218),1)
    local ab=Instance.new("TextButton") ab.Parent=row ab.BackgroundColor3=CT.p
    ab.Position=UDim2.new(1,-76,0.5,-14) ab.Size=UDim2.new(0,64,0,28)
    ab.Font=Enum.Font.GothamBold ab.Text="Apply" ab.TextColor3=Color3.fromRGB(255,255,255)
    ab.TextSize=11 ab.BorderSizePixel=0 corner(ab,14)
    trackGrad(grad(ab,CT.g1,CT.g2,135))
    local cap=tn
    ab.MouseButton1Click:Connect(function()
        applyTheme(cap) ab.Text="✓  Done"
        task.delay(1.5,function() if ab.Parent then ab.Text="Apply" end end) end)
    row.MouseEnter:Connect(function() tw(row,{BackgroundColor3=Color3.fromRGB(18,15,30)},.14) end)
    row.MouseLeave:Connect(function() tw(row,{BackgroundColor3=Color3.fromRGB(13,11,22)},.14) end) end

-- ══ SEQUENCE FUNCTIONS ═══════════════════════════════════
local function runHubLoader()
    SD.Visible=true SD_fill.Size=UDim2.new(0,0,1,0) SD_pct.Text="0%"
    for _,c in ipairs(SD_logFrame:GetChildren()) do if c:IsA("TextLabel") then c:Destroy() end end
    SD_ord=0
    for i,lg in ipairs(SD_LOGS) do
        task.wait(.30) sdLog(lg[1],lg[2])
        local pct=math.floor((i/#SD_LOGS)*100)
        tw(SD_fill,{Size=UDim2.new(pct/100,0,1,0)},.26) SD_pct.Text=pct.."%"
        SD_sub.Text="Module "..i.." of "..#SD_LOGS.."..." end
    task.wait(.4) tw(SD,{BackgroundTransparency=1},.38) task.wait(.42)
    SD.Visible=false SD.BackgroundTransparency=0
    SE.Visible=true WMF.Visible=true
    SE.Size=UDim2.new(0,0,0,0) tw(SE,{Size=UDim2.new(0,590,0,FULL_H)},.42,Enum.EasingStyle.Back)
    setTab("Trade") end

local function runKeyCheck(isCorrect)
    SB.Visible=false SC.Visible=true
    for _,c in ipairs(SC_logFrame:GetChildren()) do if c:IsA("TextLabel") then c:Destroy() end end
    SC_ord=0 SC_fill.Size=UDim2.new(0,0,1,0)
    local logs
    if isCorrect then
        SC_title.Text="⚙️  VERIFYING KEY..."
        logs={{"[SYS]  Sending key to Marky server...", Color3.fromRGB(140,140,255)},
              {"[OK ]  Server connection established.",  Color3.fromRGB(100,220,120)},
              {"[OK ]  Validating license format...",    Color3.fromRGB(100,220,120)},
              {"[OK ]  Key found in database.",          Color3.fromRGB(100,220,120)},
              {"[OK ]  License tier: ELITE ✓",          Color3.fromRGB(80,255,160)},
              {"[OK ]  User authenticated — Welcome!",  Color3.fromRGB(80,255,160)},}
    else
        SC_title.Text="⚙️  CHECKING KEY..."
        logs={{"[SYS]  Sending key to Marky server...", Color3.fromRGB(140,140,255)},
              {"[OK ]  Server connection established.",  Color3.fromRGB(100,220,120)},
              {"[OK ]  Scanning license database...",   Color3.fromRGB(100,220,120)},
              {"[ERR]  Key not found in records.",      Color3.fromRGB(255,90,105)},
              {"[ERR]  Authentication failed.",         Color3.fromRGB(255,90,105)},
              {"[SYS]  Access denied — returning...",  Color3.fromRGB(255,155,55)},}
    end
    for i,lg in ipairs(logs) do
        task.wait(.36) scLog(lg[1],lg[2],i)
        tw(SC_fill,{Size=UDim2.new(i/#logs,0,1,0)},.30)
        SC_sub.Text="Step "..i.." of "..#logs.."..." end
    task.wait(.5)
    if isCorrect then SC.Visible=false runHubLoader()
    else
        tw(SC,{BackgroundTransparency=1},.28) task.wait(.32)
        SC.BackgroundTransparency=0 SC.Visible=false SB.Visible=true
        KStatus.Text="✗  Invalid key — Access denied."
        KIstroke.Color=Color3.fromRGB(215,45,65) KIstroke.Thickness=2
        for _=1,4 do
            tw(SB,{Position=UDim2.new(.5,-8,.5,0)},.045) task.wait(.055)
            tw(SB,{Position=UDim2.new(.5,8,.5,0)},.045)  task.wait(.055) end
        tw(SB,{Position=UDim2.new(.5,0,.5,0)},.06)
        task.wait(2.2) KStatus.Text="" KIstroke.Color=Color3.fromRGB(44,28,82) KIstroke.Thickness=1.5 end end

local submitting=false
KBtn.MouseButton1Click:Connect(function()
    if submitting then return end submitting=true
    local k=realKey:lower():gsub("%s+","")
    task.spawn(function() runKeyCheck(k==CORRECT_KEY) submitting=false end) end)

-- ══ RUNTIME ═══════════════════════════════════════════════
local fpsBuffer={} local fpsSmooth=60
local pingSmooth=42

RunService.Heartbeat:Connect(function(dt)
    rHue=(rHue+dt*.12)%1

    -- ★ FPS calc (smoothed)
    table.insert(fpsBuffer,dt)
    if #fpsBuffer>20 then table.remove(fpsBuffer,1) end
    local avg=0 for _,v in ipairs(fpsBuffer) do avg=avg+v end avg=avg/#fpsBuffer
    local rawFps=math.floor(1/avg)
    fpsSmooth=fpsSmooth+( rawFps-fpsSmooth)*0.08
    local fpsDisp=math.clamp(math.floor(fpsSmooth),1,999)
    local fpsCol=fpsDisp>=55 and Color3.fromRGB(80,255,160) or fpsDisp>=35 and Color3.fromRGB(255,210,80) or Color3.fromRGB(255,80,100)
    if SE.Visible then
        fpsTxt.Text="FPS  "..fpsDisp
        fpsVal.Text=tostring(fpsDisp) fpsVal.TextColor3=fpsCol
        tw(fpsBar,{Size=UDim2.new(math.clamp(fpsDisp/144,0,1),0,1,0)},.5)
        -- topbar FPS update
        fpsTxt.TextColor3=fpsCol end

    -- ★ PING (smoothed from Stats + fake variance for flex)
    local ok,rawPing=pcall(function() return Stats.Network.ServerStatsItem["Data Ping"]:GetValue() end)
    if ok and rawPing and rawPing>0 then
        pingSmooth=pingSmooth+(rawPing-pingSmooth)*0.06
    else
        -- fake ping drift for display-only environments
        pingSmooth=pingSmooth+(math.random(28,68)-pingSmooth)*0.04
    end
    local pingDisp=math.max(1,math.floor(pingSmooth))
    local pingCol=pingDisp<=60 and Color3.fromRGB(80,255,160) or pingDisp<=120 and Color3.fromRGB(255,210,80) or Color3.fromRGB(255,80,100)
    if SE.Visible then
        pingTxt.Text="PING  "..pingDisp
        pingVal.Text=tostring(pingDisp).." ms" pingVal.TextColor3=pingCol
        tw(pingBar,{Size=UDim2.new(math.clamp(1-(pingDisp/250),0,1),0,1,0)},.5)
        pingTxt.TextColor3=pingCol end

    -- Rainbow theme
    if isRainbow then
        local rc=Color3.fromHSV(rHue,.92,1) local rc2=Color3.fromHSV((rHue+.15)%1,.92,1)
        local cs=ColorSequence.new({ColorSequenceKeypoint.new(0,rc2),ColorSequenceKeypoint.new(1,rc)})
        for _,g in ipairs(allGrads) do g.Color=cs end
        mainStroke.Color=rc WMStroke.Color=rc sideSep.BackgroundColor3=rc
        for _,bar in pairs(tabBars) do bar.BackgroundColor3=rc end end

    -- Coming soon rainbow
    for _,l in ipairs({stealLbl,tlLbl,upLbl}) do
        if l and l.Parent then l.TextColor3=Color3.fromHSV(rHue,.88,1) end end end)

-- ══ LAUNCH ════════════════════════════════════════════════
task.spawn(function()
    for i,lg in ipairs(SA_LOGS) do
        task.wait(.28) saLog(lg[1],lg[2])
        local pct=math.floor((i/#SA_LOGS)*100)
        tw(SA_fill,{Size=UDim2.new(pct/100,0,1,0)},.26)
        SA_pct.Text=pct.."%" SA_sub.Text="Step "..i.." of "..#SA_LOGS.."..." end
    task.wait(.4) tw(SA,{BackgroundTransparency=1},.38) task.wait(.42)
    SA.Visible=false SA.BackgroundTransparency=0
    SB.Visible=true SB.Size=UDim2.new(0,0,0,0)
    tw(SB,{Size=UDim2.new(0,440,0,365)},.38,Enum.EasingStyle.Back) end)

print("⚡ Trash Hub X Marky.Dev v2.0 — Elite Edition Loaded")
