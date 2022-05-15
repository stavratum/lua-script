--[[
probably people will skid this shit code but my target is to destroy this game anyways its so ass damn
I hope someone will make it better than me
]]
local Notify=function(Title,Text,Duration)game.StarterGui:SetCore("SendNotification",{Title=Title,Text=Text,Duration=Duration or 1})end
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/uwuware-ui/main/main.lua"))()
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
Window:AddLabel({text = "Autoplayer by lucit#6896"})
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
            if v.AbsolutePosition.X < 600 then
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
    repeat wait()until Arrows:FindFirstChild'Notes'and #Arrows.Notes:children()>=1
    repeat wait()until FakeContainer(Side)
    local Keys = Controls[#Arrows.Notes:children()]
    for i,v in pairs(Arrows.Notes:children())do
        v.ChildAdded:Connect(function(_)
            task.spawn(function()
            if ScrollType(Side)=="Downscroll"then
                repeat task.wait() until _.AbsolutePosition.Y >= FakeContainer(Side).Down.AbsolutePosition.Y
            elseif ScrollType(Side)=="Upscroll"then
                repeat task.wait() until _.AbsolutePosition.Y <= FakeContainer(Side).Down.AbsolutePosition.Y
            end
            if library.flags.AP then
                game:GetService'VirtualInputManager':SendKeyEvent(true,Enum.KeyCode[Keys[_.Parent.Name]],false,nil)
            end
            end)
        end)
    end
    task.spawn(function()
        repeat wait() until ArrowGui():FindFirstChild'Title'
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
    task.spawn(function()
        local Object
        Object = MainGui.Bop.ChildAdded:Wait()
        if Object.Name=="ArrowGui"or"Background" then
            Initialize(Side())
        end
    end)
end)
if ArrowGui()and Background()then
  Initialize(Side())
end
