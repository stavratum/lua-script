local a = game --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
if not a:IsLoaded() then --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
    a.Loaded:Wait() --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
end --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
local b = loadstring(a:HttpGet "https://raw.githubusercontent.com/stavratum/lua-script/main/fnb/uwuware_edit.lua")() --[[ hi  --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
local c = --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
    loadstring( --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
    a:HttpGet "https://raw.githubusercontent.com/Quenty/NevermoreEngine/version2/Modules/Shared/Events/Maid.lua" --[[ hi ]]
)().new() --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
local d = a:GetService "Players".LocalPlayer --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
local e = a:GetService "VirtualInputManager" --[[ hi ]]
local f = a:GetService "RunService" --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
local g = a:GetService "ReplicatedStorage" --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
local h --[[ hi  --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
local function i(j) --[[ hi ]]
    return j and require(j).Type == "OnHit" or false --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
end --[[ hi ]]
local function k(l, m) --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
    for n, o in pairs(l:GetDescendants()) do --[[ hi ]]
        if tostring(o) == m then --[[ hi ]]
            return o --[[ hi ]]
        end --[[ hi ]]
    end --[[ hi ]]
    return nil --[[ hi ]]
end --[[ hi ]]
local p = b:CreateWindow "Friday Night Bloxxin'" --[[ hi ]]
p:AddSlider {text = "Offset (ms)", flag = "ms", min = -75, max = 75, value = 0} --[[ hi ]]
p:AddToggle {text = "Toggle Autoplayer", flag = "yes", state = true} --[[ hi ]]
p:AddButton {text = "Instant Solo", callback = function() --[[ hi ]]
        d.PlayerGui:WaitForChild "SingleplayerUI".ButtonPressed:FireServer() --[[ hi ]]
    end} --[[ hi ]]
p:AddButton {text = "Unload Script", callback = function() --[[ hi ]]
        h:Disconnect() --[[ hi ]]
        c:DoCleaning() --[[ hi ]]
        b.base:Destroy() --[[ hi ]]
        script:Destroy() --[[ hi ]]
    end} --[[ hi ]]
p:AddBind {text = "Close GUI", key = Enum.KeyCode.Delete, callback = function() --[[ hi ]]
        b:Close() --[[ hi ]]
    end} --[[ hi ]]
b:Init() --[[ hi ]]
local q = function(r) --[[ hi ]]
    wait(1) --[[ hi ]]
    repeat --[[ hi ]]
        wait() --[[ hi ]]
    until r.Config.TimePast.Value >= -1 --[[ hi ]]
    local s = r.Game[r.PlayerSide.Value].Arrows --[[ hi ]]
    local t = s.IncomingNotes:children() --[[ hi ]]
    local u = k(g.Songs, r.LowerContainer.Credit.Text:split "\n"[1]:split " ("[1]) --[[ hi ]]
    local v --[[ hi ]]
    if u then --[[ hi ]]
        v = --[[ hi ]]
            u:FindFirstChild "MultiplieGimmickNotes" and u:FindFirstChild "MultiplieGimmickNotes".Value == "OnHit" or --[[ hi ]]
            u:FindFirstChildOfClass "ModuleScript" and --[[ hi ]]
                u:FindFirstChildOfClass "ModuleScript":FindFirstChild "GimmickNotes" or --[[ hi ]]
            u:FindFirstChild "GimmickNotes" --[[ hi ]]
    end --[[ hi ]]
    v = v and v.Value == "OnHit" or nil --[[ hi ]]
    local w, x = d.Input.Keybinds, Enum.KeyCode --[[ hi ]]
    local y = { --[[ hi ]]
        [4] = {Left = x[w.Left.Value], Down = x[w.Down.Value], Up = x[w.Up.Value], Right = x[w.Right.Value]}, --[[ hi ]]
        [6] = { --[[ hi ]]
            S = x[w.L3.Value], --[[ hi ]]
            D = x[w.L2.Value], --[[ hi ]]
            F = x[w.L1.Value], --[[ hi ]]
            J = x[w.R1.Value], --[[ hi ]]
            K = x[w.R2.Value], --[[ hi ]]
            L = x[w.R3.Value] --[[ hi ]]
        }, --[[ hi ]]
        [8] = { --[[ hi ]]
            A = x[w.L4.Value], --[[ hi ]]
            S = x[w.L3.Value], --[[ hi ]]
            D = x[w.L2.Value], --[[ hi ]]
            F = x[w.L1.Value], --[[ hi ]]
            H = x[w.R1.Value], --[[ hi ]]
            J = x[w.R2.Value], --[[ hi ]]
            K = x[w.R3.Value], --[[ hi ]]
            L = x[w.R4.Value ~= ";" and w.R4.Value or "Semicolon"] --[[ hi ]]
        } --[[ hi ]]
    } --[[ hi ]]
    y = y[#t] or y[#t - 1] --[[ hi ]]
    y.Space = x[w.Space.Value] --[[ hi ]]
    w, x = nil --[[ hi ]]
    for j, z in pairs(t) do --[[ hi ]]
        c:GiveTask( --[[ hi ]]
            z.ChildAdded:Connect( --[[ hi ]]
                function(A) --[[ hi ]]
                    if A.HellNote.Value or i(A:FindFirstChildOfClass "ModuleScript") and v then --[[ hi ]]
                        return --[[ hi ]]
                    end --[[ hi ]]
                    local B = y[z.name] --[[ hi ]]
                    task.wait(.4 + math.floor(b.flags.ms) / 1000) --[[ hi ]]
                    if not b.flags.yes then --[[ hi ]]
                        return --[[ hi ]]
                    end --[[ hi ]]
                    e:SendKeyEvent(true, B, false, nil) --[[ hi ]]
                    repeat --[[ hi ]]
                        task.wait() --[[ hi ]]
                    until not A or not A:FindFirstChild "Frame" or A.Frame.Bar.Size.Y.Scale <= .35 --[[ hi ]]
                    e:SendKeyEvent(false, B, false, nil) --[[ hi ]]
                end --[[ hi ]]
            ) --[[ hi ]]
        ) --[[ hi ]]
    end --[[ hi ]]
    r.Destroying:Wait() --[[ hi ]]
    c:DoCleaning() --[[ hi ]]
end --[[ hi ]]
h = --[[ hi ]]
    d.PlayerGui.ChildAdded:Connect( --[[ hi ]]
    function(r) --[[ hi ]] --[[ hi ]]
        if r.name ~= "FNFEngine" then --[[ hi ]]
            return --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
        end --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
        q(r) --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]] --[[ hi ]]
    end --[[ hi ]]
) --[[ hi ]]
for n, o in pairs(game:GetService "Workspace":GetDescendants()) do --[[ hi ]]
    if o:IsA "ProximityPrompt" then --[[ hi ]]
        o.HoldDuration = 0 --[[ hi ]]
    end --[[ hi ]]
end --[[ hi ]]
if d.PlayerGui:FindFirstChild "FNFEngine" then --[[ hi ]]
    q(d.PlayerGui.FNFEngine) --[[ hi ]]
end --[[ hi ]]
