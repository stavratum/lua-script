--// Select version: (string); Possible args: "v1","v2"
local AP_VERSION = "v1"

--// Config your keybinds (table)

Controls = {
    [4] = {Left = "D", Down = "F", Up = "J", Right = "K"}, --//4K
    [5] = {Left = "D", Down = "F", Up = "J", Right = "K", Space = "Space"}, --//5K
    [6] = {Left = "S", Up = "D", Right = "F", Left2 = "J", Down = "K", Right2 = "L"}, --//6K
    [7] = {Left = "S", Up = "D", Right = "F", Left2 = "J", Down = "K", Right2 = "L", Space = "Space"}, --//7K
    [8] = {Left = "A", Down = "S", Up = "D", Right = "F", Left2 = "J", Down2 = "K", Up2 = "L", Right2 = "Semicolon"}, --//8K
    [9] = {Left = "A", Down = "S", Up = "D", Right = "F", Space = "Space", Left2 = "J", Down2 = "K", Up2 = "L", Right2 = "Semicolon"} --//9K
}

-- Script loader
if string.lower(AP_VERSION) == "v1" then
  loadstring(game:HttpGet('https://raw.githubusercontent.com/stavratum/lua-script/main/mmm/V1.lua'))()
elseif string.lower(AP_VERSION) == "v2" then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/stavratum/lua-script/main/mmm/V2.lua"))()
else  
  game:GetService("Players").LocalPlayer:Kick("\nPlease, choose correct version of autoplayer.")
end
