local _,fnb_devs = loadstring(game:HttpGet'https://raw.githubusercontent.com/stavratum/lua-script/main/fnb/_.lua')()

if not game:IsLoaded() then game.Loaded:Wait() end

local Client = game:GetService'Players'.LocalPlayer
local VirtualInputManager = game:GetService'VirtualInputManager'
local RunService = game:GetService'RunService'
local ReplicatedStorage = game:GetService'ReplicatedStorage'

_:_2('\65\110\116\105\99\104\101\97\116\80\111\112\85\112',_.disable_amazing_anticheat_pop_up)
_:_2('\77\111\100\99\104\97\114\116\67\104\101\99\107',_.disable_modcharts_loooool)
_:_2(tostring(math.random()),'EJQXX HACK IS REAL????')

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

local uwuware = loadstring(game:HttpGet'https://raw.githubusercontent.com/wally-rblx/uwuware-ui/main/main.lua')()
local Window = uwuware:CreateWindow"Friday Night Bloxxin'"
Window:AddToggle{text="Toggle Autoplayer",flag = "yes"}
Window:AddButton{text="Instant Solo",callback=function()Client.PlayerGui:WaitForChild'SingleplayerUI'.ButtonPressed:FireServer()end}

Window:AddButton{text="Unload Script",callback=function()
    for _,Function in pairs(Connected) do
        Function:Disconnect()
    end
    uwuware.base:Destroy()
    script:Destroy()
end}
Window:AddBind{text = "Hide GUI", key = Enum.KeyCode.Delete, callback = function() uwuware:Close() end}

local Autoplay = function(Child)
    repeat wait() until Child.Config.TimePast.Value >= -1
    
    local Arrows = Child.Game[Child.PlayerSide.Value].Arrows
    local IncomingNotes = Arrows.IncomingNotes:children()
    
    local Song = FindDescendant(ReplicatedStorage.Songs,Child.LowerContainer.Credit.Text:split'\n'[1])
    local GimmickNotes
    print('Song: ' .. tostring(Song))
    if Song then
        GimmickNotes = Song:FindFirstChild'MultiplieGimmickNotes' and Song:FindFirstChild'MultiplieGimmickNotes'.Value == 'OnHit'  or 
        Song:FindFirstChildOfClass'ModuleScript' and Song:FindFirstChildOfClass'ModuleScript':FindFirstChild'GimmickNotes'
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
                if not Arrow.HellNote.Value or Arrow.HellNote.Value and _require(ModuleScript).Type ~= 'OnHit' and not GimmickNotes then
                    local Y = Arrows[Holder.name].AbsolutePosition.Y
                    local Input = Keys[Holder.name]
                    
                    if Y > Client:GetMouse().ViewSizeY / 2 then
                        repeat RunService.Hearbeat:Wait() until Y >= Arrow.AbsolutePosition.Y
                    else
                        repeat RunService.Heartbeat:Wait() until Y <= Y <= Arrow.AbsolutePosition.Y
                    end
              
                    if uwuware.flags.yes then
                        VirtualInputManager:SendKeyEvent(true,Input,false,nil)
                        repeat RunService.RenderStepped:Wait() until not Arrow or not Arrow:FindFirstChild'Frame' or Arrow.Frame.Bar.Size.Y.Scale <= 0.3
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
            Autoplay(Child)
        end
    end
)

for i,v in pairs(game:GetService"Workspace":GetDescendants()) do
    if v:IsA'ProximityPrompt' then
        v.HoldDuration = 0
    end
end

if Client.PlayerGui:FindFirstChild'FNFEngine' then
    Autoplay(Client.PlayerGui.FNFEngine)
end

uwuware:Init()
uwuware.cursor.Visible = false
