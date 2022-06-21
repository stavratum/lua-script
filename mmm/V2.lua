--[[
Hi if you see this weird stuff like " -- { " its just simple embedding
              (since I code in Synapse)
]]

-- Varibles = {
local Discord = "https://discord.gg/QdaJDDvRHN"
local Notify = function(Title,Text,Duration)game:GetService'StarterGui':SetCore("SendNotification",{Title=Title,Text=Text,Duration=Duration or 1})end
-- }

-- {

local uwuware = loadstring(game:HttpGet'https://raw.githubusercontent.com/OPENCUP/random-texts/main/stolen_ui_lib.lua')()
local Window = uwuware:CreateWindow'CoolUI MMM AP'

-- Toggles = {
Window:AddToggle{text = "Toggle autoplayer", flag = "AP" }
-- }

-- Buttons = {
Window:AddButton{text = "Destroy Gui", callback = function()pcall(function()game:GetService'CoreGui'.ScreenGui:Destroy()end)end}
Window:AddButton{text = "Copy discord invite",
callback=function()
   if setclipboard then 
      Notify("Success","Discord invite is in your clipboard")
      setclipboard(Discord)
   else
      Notify("","Exploit doesn't support 'setclipboard', see invite in F9 menu")
      print("\n\n== DISCORD INVITE ==\n"..Discord.."\n====================")
   end
   (syn.request or http_request or function()end){
        Url = 'http://127.0.0.1:6463/rpc?v=1',
        Method = 'POST',
        Headers = {
            ['Content-Type'] = 'application/json',
            Origin = 'https://discord.com'
        },
        Body = game:GetService'HttpService':JSONEncode{
            cmd = 'INVITE_BROWSER',
            nonce = game:GetService'HttpService':GenerateGUID(false),
            args = {code = 'QdaJDDvRHN'}
        }
    }
end}
-- }

-- Labels = {
Window:AddLabel{text = "AP by stavratum#6591"}
Window:AddLabel{text = "UI and configs by cup#7282"}
-- }

uwuware:Init()  --<< initializing ip logger

-- }

-- AP Variables = {
local Client = game:GetService'Players'.LocalPlayer
local MainGui = Client.PlayerGui.ScreenGui.MainGui
-- }

-- AP Functions = {
local Background = function()
  for i,v in pairs(MainGui:GetDescendants())do
    if v.Name == "Background"then return v end
  end
  return nil
end
local Side = function()
    for _,v in next,Background():GetDescendants() do
        if v:FindFirstChild'Username' and v.Username.Text==Client.DisplayName then
            if v.AbsolutePosition.X < Client:GetMouse().ViewSizeX/2 then
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
    if FakeContainer(_):children()[1].AbsolutePosition.Y < Client:GetMouse().ViewSizeY/2 then 
        return "Upscroll"
    else 
        return "Downscroll"
    end
  return nil
end
local Init = function(Side)
    repeat wait()until ArrowGui()
    print"Waiting for arrow gui"
    repeat wait()until ArrowGui():FindFirstChild(Side)
    print("Waiting for "..Side.." side to load")
    local Arrows = ArrowGui()[Side]
    repeat wait()until #Arrows:WaitForChild'Notes':children()>0
    print"Waiting for notes folder"
    repeat wait()until FakeContainer(Side)and Arrows.Notes and #Arrows.Notes:children()>0
    print"Waiting until game starts"
    local Keys = _G.Controls[#Arrows.Notes:children()]
    print"added keys"
    local Y = FakeContainer(Side).Down.AbsolutePosition.Y
    print"loaded note Y position"
    for i,v in pairs(Arrows.Notes:children())do
    print'in pairs'
        if ScrollType(Side)=="Downscroll"then
        print'if'
            v.ChildAdded:Connect(function(_)
                print("Waiting until ".._.AbsolutePosition.Y.." >= "..Y,'uwuware.flags.ap: '..uwuware.flags.ap)
                repeat task.wait() until _.AbsolutePosition.Y>=Y
                if uwuware.flags.AP then
                    game:GetService'VirtualInputManager':SendKeyEvent(true,Enum.KeyCode[Keys[_.Parent.Name]],false,nil)
                    if #Arrows.LongNotes[_.Parent.Name]:children()==0 then 
                        game:GetService'VirtualInputManager':SendKeyEvent(false,Enum.KeyCode[Keys[_.Parent.Name]],false,nil)
                    end
                end
            end)
        else
          print'else'
            v.ChildAdded:Connect(function(_)
                print("Waiting until ".._.AbsolutePosition.Y.." <= "..Y,'uwuware.flags.ap: '..uwuware.flags.ap)
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
  print(#Arrows.Notes:children'')
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
end
-- }

-- End = {

if ArrowGui()and Background()then
  Init(Side()) --grabbing btc wallet
end

MainGui.ChildAdded:Connect(function(_)
    if _.Name == "ArrowGui" then
        repeat wait() until Background()
        Init(Side())
    end
end)

-- }
