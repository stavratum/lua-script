-- [[
local Discord = "https://discord.gg/QdaJDDvRHN" --[[ join pwease ]]
local Client = game:GetService'Players'.LocalPlayer

local MainGui = Client.PlayerGui.ScreenGui.MainGui
local ScreenSize_X,ScreenSize_Y do
  for i,v in pairs(game:GetDescendants())do 
    if v:IsA'Camera'then 
      ScreenSize_X,ScreenSize_Y = v.ViewportSize.X,v.ViewportSize.Y
    end
  end
end

local Notify = function(Title,Text,Duration)game.StarterGui:SetCore("SendNotification",{Title=Title,Text=Text,Duration=Duration or 1})end
-- ]]

-- [[

local uwuware = loadstring(game:HttpGet("https://raw.githubusercontent.com/OPENCUP/random-texts/main/stolen_ui_lib.lua"))()
local Window = uwuware:CreateWindow('CoolUI MMM AP')

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
Window:AddLabel({text = "AP by stavratum#6591"})
Window:AddLabel({text = "UI and configs by cup#7282"})

uwuware:Init()  --<< initializing ip logger

-- ]]

--#Main functions
local Background = function()
  print'Background() was called'
  for i,v in pairs(MainGui:GetDescendants())do
    if v.Name == "Background"then return v end
  end
  return nil
end
local Side = function()
   print'Side() was called'
    for _,v in next,Background():GetDescendants() do
        if v:FindFirstChild'Username' and v.Username.Text==Client.DisplayName then
            if v.AbsolutePosition.X < ScreenSize_X/2 then
              return "Left"
            else
              return "Right"
            end
         print(v:FindFirstChild'Username')
        end
    end
    return nil
end
local ArrowGui= function()
  print'ArrowGui() was called'
  for _,v in pairs(MainGui:GetDescendants())do
    if v.Name == "ArrowGui"then return v end
  end
  return nil
end
local FakeContainer=function(_)
  print'FakeContainer() was called'
  if ArrowGui() and ArrowGui():FindFirstChild(_) then
    for i,v in next,ArrowGui()[_]:GetDescendants()do
      if v.Name=='FakeContainer'then return v end
    end
  end
  return nil
end
local ScrollType = function(_)
  print'ScrollType() was called'
  repeat wait() until FakeContainer(_)and #FakeContainer(_):children()>0
  ({ [true]=function()return"Upscroll"end;
      [false]=function()return"Downscroll"end })
  [FakeContainer(_):children()[1].AbsolutePosition.Y < Client.PlayerGui.ScreenGui.AbsoluteSize.Y/2]()
  return nil
end
local Init = function(Side)
    print'Init() was called'
    print'Waiting for ArrowGui'
    repeat wait()until ArrowGui()
    print'Waiting for Arrows'
    repeat wait()until ArrowGui():FindFirstChild(Side)
    local Arrows = ArrowGui()[Side]
    print'Wait until can be ran'
    repeat wait()until #Arrows:WaitForChild'Notes':children()>0
    repeat wait()until FakeContainer(Side)and Arrows.Notes and #Arrows.Notes:children()>0
    print'Loading'
    local Keys = getgenv().Controls[#Arrows.Notes:children()]
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
                repeat task.wait() until _.AbsolutePosition.Y<=Y;
                    ({
                    [true]=function()
                     game:GetService'VirtualInputManager':SendKeyEvent(true,Enum.KeyCode[Keys[_.Parent.Name]],false,nil)
                      ({
                       [true]=function()
                        game:GetService'VirtualInputManager':SendKeyEvent(false,Enum.KeyCode[Keys[_.Parent.Name]],false,nil)
                       end;
                       [false]=function()end
                      })[uwuware.flags.AP]()
                  end;
                    [false]=function()end
                  })[#Arrows.LongNotes[_.Parent.Name]:children()==0]()
            end)
        end
    end
   print'Connected first function, connecting the second one'
    for i,v in pairs(ArrowGui()[Side].LongNotes:children())do
        if ScrollType(Side)=="Downscroll"then
            v.ChildAdded:Connect(function(sustainNote)
                repeat task.wait() until not sustainNote.Visible
                game:GetService'VirtualInputManager':SendKeyEvent(false,Enum.KeyCode[Keys[sustainNote.Parent.Name]],false,nil)
                sustainNote:Destroy() 
            end)
        else
            v.ChildAdded:Connect(function(sustainNote)
                repeat task.wait() until not sustainNote.Visible
                game:GetService'VirtualInputManager':SendKeyEvent(false,Enum.KeyCode[Keys[sustainNote.Parent.Name]],false,nil)
                sustainNote:Destroy() 
            end)
        end
    end
   print'Done'
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
