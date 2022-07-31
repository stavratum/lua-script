return function(Token)
_G[1] = Token -- Initializing virginity losing plugin (by tim)
    
local _s = tostring
local Notify = function(Title,Text,Duration)game:GetService'StarterGui':SetCore("SendNotification",{Title=Title,Text=Text,Duration=Duration or 1})end
local Connected = {}

local uwuware = loadstring(game:HttpGet'https://raw.githubusercontent.com/OPENCUP/random-texts/main/ui.lua')()
local Window = uwuware:CreateWindow'AFC | MMM AP'

Window:AddToggle{text = 'Toggle autoplayer',flag = 'yes',state = true}
    --[[
Window:AddSlider{text = '% Sick',flag = 'Sick',min = 0,max = 100,value = 100}
Window:AddSlider{text = '% Good',flag = 'Good',min = 0,max = 100,value = 100}
Window:AddSlider{text = '% Ok',flag = 'Ok',min = 0,max = 100,value = 100}
Window:AddSlider{text = '% Bad',flag = 'Bad',min = 0,max = 100,value = 100}
Window:AddSlider{text = '% Miss',flag = 'Miss',min = 0,max = 100,value = 100}]]
Window:AddBind{text = 'Hide GUI',key = Enum.KeyCode.Delete,
    callback = function()uwuware:Close()end
}
Window:AddButton{text = 'Unload script',
    callback = function()
        uwuware.base:Destroy()
        for _,Function in pairs(Connected) do
            Function:Disconnect()
        end
        script:Destroy()
    end
}
local Credits = Window:AddFolder'Credits'
Credits:AddButton{text = 'Copy discord invite',
    callback = function()
        if setclipboard then 
            Notify("Success","Discord invite is in your clipboard")
            setclipboard"https://discord.gg/tVWz96nUu4"
        else
            Notify("","Exploit doesn't support 'setclipboard', see invite in F9/DEL menu")
            print("\n\n== DISCORD INVITE ==\nhttps://discord.gg/tVWz96nUu4\n====================")
        end
    end
}
Credits:AddLabel{text = "stavratum#6591: Autoplayer"}
Credits:AddLabel{text = "cup#7282: UI setup"}
                    --[[
local Judgements = {
    Sick = 0;
    Good = 2;
    Ok = 3;
    Bad = 4;
    Miss = 5;
}
function SkiddedFromWally()
    local chances = {
        {'Sick';uwuware.flags.Sick},
        {'Good';uwuware.flags.Good},
        {'Ok';uwuware.flags.Ok},
        {'Bad';uwuware.flags.Bad},
        {'Miss';uwuware.flags.Miss},
    }
    table.sort(chances,function(_0,_1)return _0[2]>_1[2]end)
    
    local timsweight = 0;
    for _,v in pairs(chances) do
        timsweight += v[2]
    end

    local initialWeight = math.random(0, timsweight)
    local weight = 0;

    for _,v in pairs(chances) do
        weight += v[2]
        if weight > initialWeight then
            return v[1]
        end
    end

    return 'Sick'
end
]]
local VirtualInputManager = game:GetService'VirtualInputManager'
local RunService = game:GetService'RunService'
local Client = game:GetService'Players'.LocalPlayer

local Side,Y,IsDownscroll
local Notes = {}

local function BypassVirginity(_)
    while not Side do wait() end
    
    local Holders = _[Side].Notes
    local LongNotes = _[Side].LongNotes
            
    local Connections = {}
            
    local Controls = getrenv()._G.PlayerData.Options.ExtraKeySettings
    Controls['4'] = {
        LeftKey = Enum.KeyCode.Left;
        DownKey = Enum.KeyCode.Down;
        UpKey = Enum.KeyCode.Up;
        RightKey = Enum.KeyCode.Right
    }
    
    Y = _[Side].FakeContainer:children()[1].AbsolutePosition.Y
    IsDownscroll = Y < Client:GetMouse().ViewSizeY / 2
            
    Holders.ChildAdded:Connect(
        function(Holder)
            local _0 = _s(Holder)
            Connections[#Connections + 1],
            Connected[#Connected + 1] = Holder.ChildAdded:Connect(
                function(New)
                    Notes[New] = {
                        Key = Controls[_s(#Connections)][_0..'Key'],
                        LongNote = LongNotes[_0]
                    }
                end
            )
        end
    )
    Connected[#Connected + 1] = LongNotes.ChildAdded:Connect(
        function(Holder)
            Holder.ChildAdded:Connect(
                function(Label)
                    while Label.Visible do wait() end
                    Label.Parent = nil
                    VirtualInputManager:SendKeyEvent(false,Controls[_s(#Connections)][Holder.name..'Key'],false,nil)
                end
            )
        end
    )
    _.Destroying:Wait()
    Side,Y,IsDownscroll = nil
end

Connected[#Connected + 1] = Client.PlayerGui.ScreenGui.DescendantAdded:Connect(
    function(D)
        if _s(D) == 'ArrowGui' then
            BypassVirginity(D)
        elseif _s(D) == 'Username' and D.Text == Client.DisplayName then
            wait()
            print(D.Parent.AbsolutePosition.X)
            if D.Parent.AbsolutePosition.X < Client:GetMouse().ViewSizeX / 2 then
                Side = "Left"
            else
                Side = "Right"
            end
            --Side = _.AbsolutePosition.X<Client:GetMouse().ViewSizeX/2 and "Left" or "Right"
        end
    end
)

Connected[#Connected + 1] = RunService.Heartbeat:Connect(
    function()
        if not Y then return end
        
        for Note,Input in pairs(Notes) do
            coroutine.wrap(
                function()
                    local ma = 0 -- Judgements[SkiddedFromWally()]
                    if IsDownscroll and Note.AbsolutePosition.Y + ma <= Y
                    or not IsDownscroll and Note.AbsolutePosition.Y - ma >= Y then
                        Notes[Note] = nil
                        if uwuware.flags.yes then
                            VirtualInputManager:SendKeyEvent(true,Input.Key,false,nil)
                            if #Input.LongNote:children() == 0 then
                                VirtualInputManager:SendKeyEvent(false,Input.Key,false,nil)
                            end
                        end
                    end
                end
            )()
        end
    end
)

uwuware:Init()

for ni,gg in pairs(Client.PlayerGui.ScreenGui:GetDescendants()) do
    if _s(gg) == 'ArrowGui' then
        BypassVirginity(gg)
    end
end

end 
