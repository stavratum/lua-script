-- [[
local Discord = "https://discord.gg/QdaJDDvRHN" --[[ join pwease ]]
local Client = game:GetService'Players'.LocalPlayer
local MainGui = Client.PlayerGui.ScreenGui.MainGui

local Notify = function(Title,Text,Duration)game.StarterGui:SetCore("SendNotification",{Title=Title,Text=Text,Duration=Duration or 1})end
-- ]]

-- [[

local uwuware = loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/uwuware-ui/main/main.lua"))() --[[ ip logger ]]
local Window = uwuware:CreateWindow("CoolUI MMM AP")

--#Toggles
Window:AddToggle({text = "Toggle autoplayer", flag = "AP" })

--#Buttons
Window:AddButton({text = "Destroy Gui", callback = function()pcall(function()game:GetService("CoreGui").ScreenGui:Destroy()end)end})
Window:AddButton({text = "Copy discord invite",
callback=function()
   if setclipboard then 
      Notify("Success","Discord invite is in your clipboard")
      setclipboard(Discord)
   else
      Notify("","Exploit doesn't support 'setclipboard', see invite in F9 menu")
      print("\n\n== DISCORD INVITE ==\n"..Discord.."\n====================")
   end
end})

--#Labels
Window:AddLabel({text = "Autoplayer by stavratum#6591"})
Window:AddLabel({text = "UI and configs by cup#7282"})

uwuware:Init()  --<< initializing ip logger

-- ]]

--#Main functions
local Background = function()
  for i,v in pairs(MainGui:GetDescendants())do
    if v.Name == "Background"then return v end
  end
  return nil
end
local Side = function()
    for _,v in next,Background():GetDescendants() do
        if v:FindFirstChild'Username' and v.Username.Text==Client.DisplayName then
            if v.AbsolutePosition.X < Client.PlayerGui.ScreenGui.AbsoluteSize.X/2 then
              return "Left"
            else
              return "Right"
            end
        end
    end
    return nil
end
local ArrowGui= function()
  for _,v in pairs(MainGui:GetDescendants())do
    if v.Name == "ArrowGui"then return v end
  end
  return nil
end
local FakeContainer=function(_)
  if ArrowGui() and ArrowGui():FindFirstChild(_) then
    for i,v in next,ArrowGui()[_]:GetDescendants()do
      if v.Name=='FakeContainer'then return v end
    end
  end
  return nil
end
local ScrollType = function(_)
  repeat wait() until FakeContainer(_)and #FakeContainer(_):children()>0
  if FakeContainer(_):children()[1].AbsolutePosition.Y < Client.PlayerGui.ScreenGui.AbsoluteSize.Y/2 then
      return "Upscroll"
  else
      return "Downscroll"
  end
  return nil
end
local Init = function(Side)
    repeat wait()until ArrowGui()
    local Arrows = ArrowGui():WaitForChild(Side)
    repeat wait()until #Arrows:WaitForChild'Notes':children()>0
    repeat wait()until FakeContainer(Side)and Arrows.Notes and #Arrows.Notes:children()>0
    --wait until can be ran
    local Keys = Controls[#Arrows.Notes:children()]
    local Y = FakeContainer(Side).Down.AbsolutePosition.Y
    for i,v in pairs(Arrows.Notes:children())do
        if ScrollType(Side)=="Downscroll"then
            v.ChildAdded:Connect(function(_)
                repeat task.wait() until _.AbsolutePosition.Y>=Y
                if uwuware.flags.AP then
                    game:GetService'VirtualInputManager':SendKeyEvent(true,Enum.KeyCode[Keys[_.Parent.Name]],false,nil)
                    if #Arrows.LongNotes[_.Parent.Name]:children()==0 then 
                        game:GetService'VirtualInputManager':SendKeyEvent(false,Enum.KeyCode[Keys[_.Parent.Name]],false,nil)
                    end
                end
            end)
        else
            v.ChildAdded:Connect(function(_)
                repeat task.wait() until _.AbsolutePosition.Y<=Y
                if uwuware.flags.AP then
                    game:GetService'VirtualInputManager':SendKeyEvent(true,Enum.KeyCode[Keys[_.Parent.Name]],false,nil)
                    if #Arrows.LongNotes[_.Parent.Name]:children()==0 then 
                        game:GetService'VirtualInputManager':SendKeyEvent(false,Enum.KeyCode[Keys[_.Parent.Name]],false,nil)
                    end
                end
            end)
        end
    end
    for i,v in pairs(ArrowGui()[Side].LongNotes:children())do
        if ScrollType(Side)=="Downscroll"then
            v.ChildAdded:Connect(function(sustainNote)
                repeat task.wait() until sustainNote.Visible==false
                game:GetService'VirtualInputManager':SendKeyEvent(false,Enum.KeyCode[Keys[sustainNote.Parent.Name]],false,nil)
                sustainNote:Destroy() 
            end)
        else
            v.ChildAdded:Connect(function(sustainNote)
                repeat task.wait() until sustainNote.Visible==false
                game:GetService'VirtualInputManager':SendKeyEvent(false,Enum.KeyCode[Keys[sustainNote.Parent.Name]],false,nil)
                sustainNote:Destroy() 
            end)
        end
    end
end

--

if ArrowGui()and Background()then
  Init(Side()) --grabbing btc wallet
end

MainGui.ChildAdded:Connect(function(_)
    if _.Name == "ArrowGui" then
        repeat wait() until Background()
        Init(Side())
    end
end)
