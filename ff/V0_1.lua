-- // v0.1
-- // Discord: https://discord.gg/tVWz96nUu4

local Connected = {}

local uwu = loadstring(game:HttpGet'https://raw.githubusercontent.com/OPENCUP/random-texts/main/stolen_ui_lib.lua')()
local owo = uwu:CreateWindow'Funky Friday'
owo:AddToggle{text = "Toggle autoplayer", flag = 'IsTim'}
owo:AddButton{text = "Unload script",callback = function()
    for i,v in pairs(Connected) do
        v:Disconnect()
    end
    local ma = game:GetService'CoreGui':FindFirstChild'ScreenGui'
    if ma then
        ma:Destroy()
    end
end}

local Client = game:GetService'Players'.LocalPlayer
local Mouse = Client:GetMouse()
local VirtualInputManager = game:GetService'VirtualInputManager'
local RunService = game:GetService'RunService'
local GameUI = Client.PlayerGui.GameUI

local Y,ScrollDown,_
local Controls = {}

for i,v in pairs(getgc(true)) do
    if type(v)==type{} and rawget(v,'GameUI') then
        _ = v
        break
    end
end

Connected[#Connected + 1] = GameUI.Arrows.DescendantAdded:Connect(function(Descendant)
    if Descendant:IsDescendantOf(GameUI.Arrows[tostring(_.UI.CurrentSide)]) then
        if not Controls.Arrow0 then
            repeat wait(1) until _.UI.Keybinds[Enum.UserInputType.Keyboard]
            for i,v in pairs(_.UI.Keybinds[Enum.UserInputType.Keyboard]) do
                Controls['Arrow' .. tostring(v)] = i
            end
        end
        if Controls[Descendant.name] then
            Connected[#Connected + 1] = Descendant.InnerFrame.Column.ChildAdded:Connect(function(_0)
                if _0.name == 'Frame' then
                    local Inst = _0.Parent
                    _0.Destroying:Wait()
                    task.wait()
                    if not Inst:FindFirstChild'Frame' then
                        VirtualInputManager:SendKeyEvent(false,Controls[Descendant.name],false,nil)
                    end
                elseif _0.name == 'Note' then
                    local Parent = _0.Parent
                    if ScrollDown then
                        repeat RunService.RenderStepped:Wait() until _0.AbsolutePosition.Y >= Y
                    else
                        repeat RunService.RenderStepped:Wait() until _0.AbsolutePosition.Y <= Y
                    end
                    if uwu.flags.IsTim then
                        VirtualInputManager:SendKeyEvent(true,Controls[Descendant.name],false,nil)
                        if not Parent:FindFirstChild'Frame' then
                            VirtualInputManager:SendKeyEvent(false,Controls[Descendant.name],false,nil)
                        end
                    end
                end
            end)
            Descendant.Destroying:Wait()
            table.clear(Controls)
            Y = nil
        elseif Descendant:IsA'ImageLabel' and Descendant.name == '0' and not Y then
            wait(1.5)
            Y = Descendant.AbsolutePosition.Y
            ScrollDown = Y > Mouse.ViewSizeY/2
        end
    end
end)

uwu:Init()
