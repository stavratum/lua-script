--[[

==Changelog
 : Multi-key support
 : Side detector
 : Keys config (ITS SO SHIT)
 : Better accuracy
==

==Credits
 : stavratum#6591 (me) = autoplayer
 : cup#7282 = UI and Config, Side detector and Debugging
 : Timjs#no = cares
==

==Description
 !! You are free to delete all these comments,
 !! BUT check our discord server -> https://discord.gg/QdaJDDvRHN

 : If your autoplayer pressed wrong keys,
 : you probably didn't set up keys config.
 : Open the "OPTIONS" menu.
 : Insert all controls from Options menu
 : to your Controls. Make
 : sure your inserted keys
 : look like this; (order doesnt matters)
 : {Left = "D", Down = "F", Space = "Space", Right = "J", Up = "K"}
 : {Left = "A", Down = "S", Space = "D", Up = "F", Right = "Semicolon"}
 : No skiddy pls xd
==
Controls = { --you have to edit this
    [4] = {Left = "D", Down = "F", Up = "J", Right = "K"},
    [5] = {Left = "D", Down = "F", Up = "J", Right = "K", Space = "Space"},
    [6] = {Left = "S", Up = "D", Right = "F", Left2 = "J", Down = "K", Right2 = "L"},
    [7] = {Left = "S", Up = "D", Right = "F", Left2 = "J", Down = "K", Right2 = "L", Space = "Space"},
    [8] = {Left = "A", Down = "S", Up = "D", Right = "F", Left2 = "J", Down2 = "K", Up2 = "L", Right2 = "Semicolon"},
    [9] = {Left = "A", Down = "S", Up = "D", Right = "F", Space = "Space", Left2 = "J", Down2 = "K", Up2 = "L", Right2 = "Semicolon"}
}
]]

local g = "https://discord.gg/QdaJDDvRHN"
local Notify=function(Title,Text,Duration)game.StarterGui:SetCore("SendNotification",{Title=Title,Text=Text,Duration=Duration or 1})end
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/OPENCUP/random-texts/main/stolen_ui_lib.lua"))()
local Window = library:CreateWindow("CoolUI MMM AP")
Window:AddToggle({text = "Toggle autoplayer", flag = "AP" })
Window:AddButton({text = "Destroy Gui", callback = function()pcall(function()game:GetService("CoreGui").ScreenGui:Destroy()end)end})
Window:AddButton({text = "Copy discord invite",callback=function()
if setclipboard then
    Notify("Success","Discord invite is in your clipboard")
    setclipboard(g)
else
    Notify("","Exploit doesn't support 'setclipboard', see invite in F9 menu")
    print("\n\n== DISCORD INVITE ==\n" .. g .. "\n====================")
end
end})
Window:AddLabel({text = "AP by stavratum#6591"})
Window:AddLabel({text = "UI and configs by cup#7282"})

library:Init()

local Client = game:GetService'Players'.LocalPlayer
local MainGui = Client.PlayerGui.ScreenGui.MainGui
local Background = function()
  local BG
  for i,v in pairs(MainGui:GetDescendants())do
    if v.Name == "Background"then BG=v end
  end
  return BG
end
local Side = function()
    for _,v in next,Background():GetDescendants() do
        if v:FindFirstChild'Username' and v.Username.Text==Client.DisplayName then
            if v.AbsolutePosition.X < game:GetService'Players'.LocalPlayer.PlayerGui.ScreenGui.AbsoluteSize.X/2 then
              return "Left"
            else
              return "Right"
            end
        end
    end
end
local ArrowGui= function()
  local AG
  for _,v in pairs(MainGui:GetDescendants())do
    if v.Name == "ArrowGui"then AG=v end
  end
  return AG
end
local FakeContainer=function(sd)
  if ArrowGui()~=nil and ArrowGui():FindFirstChild(sd) then
    for i,v in next,ArrowGui()[sd]:GetDescendants()do
      if v.Name=='FakeContainer'then return v end
    end
  else
    return nil
  end
end
local ScrollType = function(Side)
  repeat wait() until FakeContainer(Side)and #FakeContainer(Side):children()>0
    if FakeContainer(Side):children()[1].AbsolutePosition.Y < 250 then
        return "Upscroll"
    else
        return "Downscroll"
    end
end
local Initialize = function(Side)
    local Arrows = ArrowGui()[Side]
    repeat wait()until ArrowGui()[Side]
    repeat wait()until #Arrows:WaitForChild'Notes':children()>0
    repeat wait()until FakeContainer(Side) and Arrows.Notes and #Arrows.Notes:children()>0
    local Keys = Controls[#Arrows.Notes:children()]
    for i,v in pairs(Arrows.Notes:children())do
        local Y = FakeContainer(Side).Down.AbsolutePosition.Y
        if ScrollType(Side)=="Downscroll"then
            v.ChildAdded:Connect(function(_)
                repeat task.wait() until _.AbsolutePosition.Y >= Y
                if library.flags.AP then
                    game:GetService'VirtualInputManager':SendKeyEvent(true,Enum.KeyCode[Keys[_.Parent.Name]],false,nil)
                    --game:GetService'VirtualInputManager':SendKeyEvent(false,Enum.KeyCode[Keys[_.Parent.Name]],false,nil)
                end
            end)
        elseif ScrollType(Side)=="Upscroll"then
            v.ChildAdded:Connect(function(_)
                repeat task.wait() until _.AbsolutePosition.Y <= Y
                if library.flags.AP then
                    game:GetService'VirtualInputManager':SendKeyEvent(true,Enum.KeyCode[Keys[_.Parent.Name]],false,nil)
                    --game:GetService'VirtualInputManager':SendKeyEvent(false,Enum.KeyCode[Keys[_.Parent.Name]],false,nil)
                end
            end)
        end
    end
    task.spawn(function()
        repeat wait() until ArrowGui()
            and ArrowGui():FindFirstChild'Title'
        and ArrowGui().Title.Text:find'0:01'
        for i,v in next,Keys do
            game:GetService'VirtualInputManager':SendKeyEvent(false,Enum.KeyCode[v],false,nil)
        end
    end)
end
MainGui.ChildAdded:Connect(function(_)
    if _.Name == "ArrowGui" then
        repeat wait() until ArrowGui()and Background()
        Initialize(Side())
    end
    --[[task.spawn(function()
        local Object
        Object = MainGui.Bop.ChildAdded:Wait()
        if Object.Name=="ArrowGui"or"Background" then
            Initialize(Side())
        end
    end)]]
end)
if ArrowGui()and Background()then
  Initialize(Side())
end
