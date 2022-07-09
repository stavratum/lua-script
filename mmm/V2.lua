local Discord = "https://discord.gg/tVWz96nUu4"
local VirtualInputManager = game:GetService'VirtualInputManager'
local RunService = game:GetService'RunService'
local Notify = function(Title,Text,Duration)game:GetService'StarterGui':SetCore("SendNotification",{Title=Title,Text=Text,Duration=Duration or 1})end

local uwuware = loadstring(game:HttpGet'https://raw.githubusercontent.com/OPENCUP/random-texts/main/stolen_ui_lib.lua')()
local Window = uwuware:CreateWindow'CoolUI MMM AP'

Window:AddToggle{text = "Toggle autoplayer", flag = "AP" }

Window:AddButton{text = "Destroy Gui", callback = function()pcall(function()game:GetService'CoreGui'.ScreenGui:Destroy()end)end}
Window:AddButton{text = "Copy discord invite",callback =
    function()
        if setclipboard then 
            Notify("Success","Discord invite is in your clipboard")
            setclipboard(Discord)
        else
            Notify("","Exploit doesn't support 'setclipboard', see invite in F9/DEL menu")
            print("\n\n== DISCORD INVITE ==\n"..Discord.."\n====================")
        end
    end
}

Window:AddLabel{text = "stavratum#6591 - Autoplayer"}
Window:AddLabel{text = "cup#7282 - UI setup"}
Window:AddLabel{text = "Jan – UI library"}

uwuware:Init()  --<< initializing ip logger

local Client = game:GetService'Players'.LocalPlayer
local MainGui = Client.PlayerGui.ScreenGui.MainGui

local Background = function()
    for i,v in pairs(MainGui:GetDescendants'')do
        if v.Name == "Background"then 
            return v 
        end
    end
    return nil
end

local Side = function()
    for _,v in next,Background():GetDescendants() do
        if v:FindFirstChild'Username' and v.Username.Text==Client.DisplayName then
            return v.AbsolutePosition.X < Client:GetMouse().ViewSizeX/2 and "Left" or "Right"
        end
    end
    return nil
end

local ArrowGui= function()
    for _,v in pairs(MainGui:GetDescendants'') do
        if v.Name == "ArrowGui"then
            return v
        end
    end
    return nil
end
local FakeContainer=function(_)
    if ArrowGui() and ArrowGui():FindFirstChild(_) then
        for i,v in next,ArrowGui()[_]:GetDescendants()do
            if v.Name=='FakeContainer'then
                return v
            end
        end
    end
    return nil
end

local ScrollType = function(_)
    repeat wait() until FakeContainer(_)and #FakeContainer(_):children()>0
    return FakeContainer(_):children()[1].AbsolutePosition.Y < Client:GetMouse().ViewSizeY/2 and "Upscroll" or "Downscroll"
end

local Init = function(Side)
    repeat wait() until ArrowGui()
    local ArrowGui = ArrowGui()
    repeat wait()until ArrowGui:FindFirstChild(Side)
    local Arrows = ArrowGui[Side]
    repeat wait()until #Arrows:WaitForChild'Notes':children()>0
    repeat wait()until FakeContainer(Side)and Arrows.Notes and #Arrows.Notes:children()>0
    
    local KeyBinds
    for i,v in pairs(getgc()) do
        if type(v)=='function' and getinfo(v).name == "_GetKeyBindFor" then
            KeyBinds = getupvalues(v)[1].ExtraKeySettings
            break
        end
    end 
    KeyBinds['4'] = {UpKey=Enum.KeyCode.Up;DownKey=Enum.KeyCode.Down;LeftKey=Enum.KeyCode.Left;RightKey=Enum.KeyCode.Right}
    local Keys = KeyBinds[tostring(#Arrows.Notes:children'')]
    
    local Y = FakeContainer(Side).Down.AbsolutePosition.Y
    for i,v in pairs(Arrows.Notes:children'')do
        if ScrollType(Side)=="Downscroll"then
            v.ChildAdded:Connect(function(_)
                local Key = _.Parent.Name
                repeat task.wait() until _.AbsolutePosition.Y>=Y
                if uwuware.flags.AP then
                    game:GetService'VirtualInputManager':SendKeyEvent(true,Keys[Key..'Key'],false,nil)
                    if #Arrows.LongNotes[Key]:children()==0 then 
                        game:GetService'VirtualInputManager':SendKeyEvent(false,Keys[Key..'Key'],false,nil)
                    end
                end
            end)
        else
            v.ChildAdded:Connect(function(_)
                local Key = _.Parent.Name
                repeat task.wait() until _.AbsolutePosition.Y<=Y
                if uwuware.flags.AP then
                    game:GetService'VirtualInputManager':SendKeyEvent(true,Keys[Key..'Key'],false,nil)
                    if #Arrows.LongNotes[Key]:children()==0 then 
                        game:GetService'VirtualInputManager':SendKeyEvent(false,Keys[Key..'Key'],false,nil)
                    end
                end
            end)
        end
    end
    for i,v in pairs(Arrows.LongNotes:children())do
        table.foreach(v:children'',game.Destroy)
        v.ChildAdded:Connect(function(sustainNote)
            local Key = sustainNote.Parent.Name
            repeat RunService.RenderStepped:wait()until not sustainNote.Visible
            VirtualInputManager:SendKeyEvent(false,Keys[Key..'Key'],false,nil)
            sustainNote:Destroy() 
        end)
    end
end

if ArrowGui()and Background()then
    Init(Side()) -- Grabbing btc wallet
end

MainGui.ChildAdded:Connect(function(_)
    if _.Name == "ArrowGui" then
        repeat wait() until Background()
        Init(Side())
    end
end)
