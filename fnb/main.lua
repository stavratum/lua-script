if not game:IsLoaded() then game.Loaded:Wait() end

local uwuware = loadstring(game:HttpGet'https://raw.githubusercontent.com/stavratum/lua-script/main/fnb/uwuware_edit.lua')()
local Maid = loadstring(game:HttpGet'https://raw.githubusercontent.com/Quenty/NevermoreEngine/version2/Modules/Shared/Events/Maid.lua')().new()

local Client = game:GetService'Players'.LocalPlayer
local VirtualInputManager = game:GetService'VirtualInputManager'
local RunService = game:GetService'RunService'
local ReplicatedStorage = game:GetService'ReplicatedStorage'

local ChildAdded

local function IsOnHit(_)
    return _ and require(_).Type == 'OnHit' or false
end

local function FindDescendant(Inst,Excepted)
    for i,v in pairs(Inst:GetDescendants()) do
        if tostring(v) == Excepted then
            return v
        end
    end
    return nil
end

local Window = uwuware:CreateWindow"Friday Night Bloxxin'"
Window:AddSlider{text="Offset (ms)",flag = "ms",min = -75, max = 75,value = 0}
Window:AddToggle{text="Toggle Autoplayer",flag = "yes",state = true}
Window:AddButton{text="Instant Solo",callback=function()Client.PlayerGui:WaitForChild'SingleplayerUI'.ButtonPressed:FireServer()end}

Window:AddButton{text="Unload Script",callback=function()
    ChildAdded:Disconnect()
    Maid:DoCleaning()
        
    uwuware.base:Destroy()
    script:Destroy()
end}
Window:AddBind{text = "Close GUI", key = Enum.KeyCode.Delete, callback = function()uwuware:Close()end}
uwuware:Init()

local Init = function(Child)
    wait(1)
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
    GimmickNotes = GimmickNotes and GimmickNotes.Value == 'OnHit' or nil
    
    local Keybinds,KeyCode = Client.Input.Keybinds,Enum.KeyCode
    local Keys = {
        [5] = {
            Left = KeyCode[Keybinds.Left.Value],
            Down = KeyCode[Keybinds.Down.Value],
            Up = KeyCode[Keybinds.Up.Value],
            Right = KeyCode[Keybinds.Right.Value]
        },
        [7] = {
            S = KeyCode[Keybinds.L3.Value],
            D = KeyCode[Keybinds.L2.Value],
            F = KeyCode[Keybinds.L1.Value],
            J = KeyCode[Keybinds.R1.Value],
            K = KeyCode[Keybinds.R2.Value],
            L = KeyCode[Keybinds.R3.Value]
        },
        [9] = {
            A = KeyCode[Keybinds.L4.Value],
            S = KeyCode[Keybinds.L3.Value],
            D = KeyCode[Keybinds.L2.Value],
            F = KeyCode[Keybinds.L1.Value],
            H = KeyCode[Keybinds.R1.Value],
            J = KeyCode[Keybinds.R2.Value],
            K = KeyCode[Keybinds.R3.Value],
            L = KeyCode[Keybinds.R4.Value ~= ';' and Keybinds.R4.Value or 'Semicolon'] -- I am so amazing at hardcode
        }
    }
    Keys = Keys[#IncomingNotes] or Keys[#IncomingNotes + 1]
    Keys.Space = KeyCode[Keybinds.Space.Value]
    
    Keybinds,KeyCode = nil
    
    for _,Holder in pairs(IncomingNotes) do
        Maid:GiveTask(
            Holder.ChildAdded:Connect(
                function(Arrow)
                    if Arrow.HellNote.Value
                    or IsOnHit(Arrow:FindFirstChildOfClass'ModuleScript')
                    and GimmickNotes then return end
                    
                    local Input = Keys[Holder.name]
                    task.wait(.4 + math.floor(uwuware.flags.ms)/1000) --like this for now im lazy
                    
                    if not uwuware.flags.yes then return end
                        
                    VirtualInputManager:SendKeyEvent(true,Input,false,nil)
                    repeat task.wait() until not Arrow or not Arrow:FindFirstChild'Frame' or Arrow.Frame.Bar.Size.Y.Scale <= .35
                    VirtualInputManager:SendKeyEvent(false,Input,false,nil)
                end
            )
        )
    end
    Child.Destroying:Wait()
    Maid:DoCleaning()
end

ChildAdded = Client.PlayerGui.ChildAdded:Connect(
    function(Child)
        if Child.name ~= 'FNFEngine' then return end 
        Init(Child)
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
