
-- package.cpath = package.cpath .. ";" .. reaper.GetResourcePath() .. '/Scripts/lua-sockets/socket-module/?.lua'
package.path = package.path .. ";" .. reaper.GetResourcePath() .. '/Scripts/?.lua'
package.path = package.path .. ";" .. reaper.GetResourcePath() .. '/Scripts/lua-sockets/socket-module/?.lua'
package.cpath = package.cpath .. ";" .. reaper.GetResourcePath() .. '/Scripts/lua-sockets/socket-module/socket/core.dll'

require("mobdebug").start()

local track = reaper.GetTrack(0, 0)
reaper.ShowConsoleMsg('Hello world')
local t = {track, track, 10, 20, 30, {50,60,70,{80,90,100}}}
reaper.ShowConsoleMsg('Finishing script')

