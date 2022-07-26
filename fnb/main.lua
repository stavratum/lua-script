if not game:IsLoaded() then game.Loaded:Wait() end

local Client = game:GetService'Players'.LocalPlayer
local VirtualInputManager = game:GetService'VirtualInputManager'
local RunService = game:GetService'RunService'
local ReplicatedStorage = game:GetService'ReplicatedStorage'

local Connected = {}

local function _require(_)
    return _ and require(_) or {}
end

local function FindDescendant(Inst,Excepted)
    for i,v in pairs(Inst:GetDescendants()) do
        if tostring(v) == Excepted then
            return v
        end
    end
    return nil
end

local uwuware = loadstring(game:HttpGet'https://raw.githubusercontent.com/stavratum/lua-script/main/fnb/uwuware_edit.lua')()
local Window = uwuware:CreateWindow"Friday Night Bloxxin'"
Window:AddSlider{text="Offset (ms)",flag = "ms",min = -75, max = 75,value = 0}
Window:AddToggle{text="Toggle Autoplayer",flag = "yes",state = true}
Window:AddButton{text="Instant Solo",callback=function()Client.PlayerGui:WaitForChild'SingleplayerUI'.ButtonPressed:FireServer()end}

Window:AddButton{text="Unload Script",callback=function()
    for _,Function in pairs(Connected) do
        Function:Disconnect()
    end
    uwuware.base:Destroy()
    script:Destroy()
end}
Window:AddBind{text = "Hide GUI", key = Enum.KeyCode.Delete, callback = function()uwuware:Close()end}
local Init = function(Child)
    repeat wait() until Child.Config.TimePast.Value >= -1
    
    local Arrows = Child.Game[Child.PlayerSide.Value].Arrows
    local IncomingNotes = Arrows.IncomingNotes:children()
    
    local Song = FindDescendant(ReplicatedStorage.Songs,Child.LowerContainer.Credit.Text:split'\n'[1]:split' ('[1])
    local GimmickNotes
    print('Song: ' .. tostring(Song))
    if Song then
        GimmickNotes = Song:FindFirstChild'MultiplieGimmickNotes' and Song:FindFirstChild'MultiplieGimmickNotes'.Value == 'OnHit'  or 
        Song:FindFirstChildOfClass'ModuleScript' and Song:FindFirstChildOfClass'ModuleScript':FindFirstChild'GimmickNotes'
        or Song:FindFirstChild'GimmickNotes'
    end
    GimmickNotes = GimmickNotes and GimmickNotes.Value or nil
    
    local Keybinds,KeyCode = Client.Input.Keybinds,Enum.KeyCode
    local Keys = (
        {
            [4] = {
                Left = KeyCode[Keybinds.Left.Value],
                Down = KeyCode[Keybinds.Down.Value],
                Up = KeyCode[Keybinds.Up.Value],
                Right = KeyCode[Keybinds.Right.Value]
            },
            [5] = {
                Left = KeyCode[Keybinds.Left.Value],
                Down = KeyCode[Keybinds.Down.Value],
                Space = KeyCode[Keybinds.Space.Value],
                Up = KeyCode[Keybinds.Up.Value],
                Right = KeyCode[Keybinds.Right.Value]
            },
            [6] = {
                S = KeyCode[Keybinds.L3.Value],
                D = KeyCode[Keybinds.L2.Value],
                F = KeyCode[Keybinds.L1.Value],
                J = KeyCode[Keybinds.R1.Value],
                K = KeyCode[Keybinds.R2.Value],
                L = KeyCode[Keybinds.R3.Value],
            },
            [7] = {
                S = KeyCode[Keybinds.L3.Value],
                D = KeyCode[Keybinds.L2.Value],
                F = KeyCode[Keybinds.L1.Value],
                Space = KeyCode[Keybinds.Space.Value],
                J = KeyCode[Keybinds.R1.Value],
                K = KeyCode[Keybinds.R2.Value],
                L = KeyCode[Keybinds.R3.Value]
            },
            [8] = {
                A = KeyCode[Keybinds.L4.Value],
                S = KeyCode[Keybinds.L3.Value],
                D = KeyCode[Keybinds.L2.Value],
                F = KeyCode[Keybinds.L1.Value],
                H = KeyCode[Keybinds.R1.Value],
                J = KeyCode[Keybinds.R2.Value],
                K = KeyCode[Keybinds.R3.Value],
                L = KeyCode[Keybinds.R4.Value]
            },
            [9] = {
                A = KeyCode[Keybinds.L4.Value],
                S = KeyCode[Keybinds.L3.Value],
                D = KeyCode[Keybinds.L2.Value],
                F = KeyCode[Keybinds.L1.Value],
                Space = KeyCode[Keybinds.Space.Value],
                H = KeyCode[Keybinds.R1.Value],
                J = KeyCode[Keybinds.R2.Value],
                K = KeyCode[Keybinds.R3.Value],
                L = KeyCode[Keybinds.R4.Value]
            }
        }
    )[#IncomingNotes]
    
    Keybinds,KeyCode = nil
    
    for _,Holder in pairs(IncomingNotes) do
        Connected[#Connected + 1] = Holder.ChildAdded:Connect(
            function(Arrow)
                local ModuleScript = Arrow:FindFirstChildOfClass'ModuleScript'
                if not Arrow.HellNote.Value or Arrow.HellNote.Value and _require(ModuleScript).Type ~= 'OnHit' and GimmickNotes ~= 'OnHit' then
                    local Input = Keys[Holder.name]
                    --[[local Y = Arrows[Holder.name].AbsolutePosition.Y
                    
                    if Y > Client:GetMouse().ViewSizeY / 2 then
                        repeat RunService.Hearbeat:Wait() until Y >= Arrow.AbsolutePosition.Y
                    else
                        repeat RunService.Heartbeat:Wait() until Y <= Y <= Arrow.AbsolutePosition.Y
                    end]]
                    task.wait(.4 + math.floor(uwuware.flags.ms)/1000) --like this for now im lazy
              
                    if uwuware.flags.yes then
                        VirtualInputManager:SendKeyEvent(true,Input,false,nil)
                        repeat task.wait() until not Arrow or not Arrow:FindFirstChild'Frame' or Arrow.Frame.Bar.Size.Y.Scale <= 0.4
                        VirtualInputManager:SendKeyEvent(false,Input,false,nil)
                    end
                end
            end
        )
    end
end

Connected[#Connected + 1] =
Client.PlayerGui.ChildAdded:Connect(
    function(Child)
        if Child.name == 'FNFEngine' then 
            Init(Child)
        end
    end
)

for i,v in pairs(game:GetService"Workspace":GetDescendants()) do
    if v:IsA'ProximityPrompt' then
        v.HoldDuration = 0
    end
end

if Client.PlayerGui:FindFirstChild'FNFEngine' then
    Init(Client.PlayerGui.FNFEngine)
end

uwuware:Init()
uwuware.cursor.Visible = false
