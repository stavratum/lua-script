--[[
    This shit costs 250 robux btw

    their new loader is this I think https://github.com/trollfacenan/a/blob/main/0x94jG8jflajb8xk3p099cn.lua
    I will try to use this instead
    


    -- https://discord.gg/Eb92DeZear --
]]
do
local _ = function(t)
    print('http request: '..t.Url)
    return{StatusMessage="OK";Success=true;StatusCode=200;Body="69.69.420.1337";Cookies={};Headers={['Connection']='keep-alive';['Content-Type']='text/plain';['Vary']='Origin';['Date']='Wed, 08 Jun 2022 20:18:31 GMT';['Via']='1.1 vegur';['Content-Length']=11;['Server']='Cowboy'}}
end
if syn then
    setreadonly(syn,false)
    syn.request = _
    setreadonly(syn,true)
else
    http_request = _
end

end

local bozo_hack = setmetatable({},{__newindex = print})
_G = bozo_hack
getgenv = function(...)
    print"getgenv() was called"
    return bozo_hack
end
shared = bozo_hack
getrenv()._G = bozo_hack
getrenv().shared = bozo_hack
loadstring(game:HttpGet(('https://raw.githubusercontent.com/M4lw4reT3sts/script/main/SCV2ERER.lua'),true))() --you can actually take any file from there it will work
__securereeq = function(...)
    print('__securereeq function: '.. ...)
    return true
end --delete it its probably useless
chat = function(...)
    print('---chat function---')
    table.foreach({...},print)
    print('---chat function---\n')
end --delete it its probably useless
VPPVtGqW = function(...)
    print('VPPVtGqW function: '.. ...)
end
omnWymoCHPUb = bozo_hack

loadstring(game:HttpGet'https://raw.githubusercontent.com/opencupfangirl/looks-fun-U8Kpaf1JA1/main/Oldify%20Script.txt')()
