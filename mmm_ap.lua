--[[

==Changelog
 : Multi-key support
 : Side detector
 : Keys config (ITS SO SHIT)
 : Better accuracy
==

==Credits
 : lucit#6896 (me) = autoplayer
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
==

]]
Controls = { --you have to edit this
    [4] = {Left = "D", Down = "F", Up = "J", Right = "K"},
    [5] = {Left = "D", Down = "F", Up = "J", Right = "K", Space = "Space"},
    [6] = {Left = "S", Up = "D", Right = "F", Left2 = "J", Down = "K", Right2 = "L"},
    [7] = {Left = "S", Up = "D", Right = "F", Left2 = "J", Down = "K", Right2 = "L", Space = "Space"},
    [8] = {Left = "A", Down = "S", Up = "D", Right = "F", Left2 = "J", Down2 = "K", Up2 = "L", Right2 = "Semicolon"},
    [9] = {
        Left = "A",
        Down = "S",
        Up = "D",
        Right = "F",
        Space = "Space",
        Left2 = "J",
        Down2 = "K",
        Up2 = "L",
        Right2 = "Semicolon"
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/stavratum/lua-script/main/ap.lua"))()
