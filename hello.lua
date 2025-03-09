
package.cpath = package.cpath .. ";" .. reaper.GetResourcePath() .. '/Scripts/Daniel Lumertz Scripts/LUA Sockets/socket module/socket/?.dll'

require("mobdebug").start()

local track = reaper.GetTrack(0, 0)
reaper.ShowConsoleMsg('Hello world')
local t = {track, track, 10, 20, 30, {50,60,70,{80,90,100}}}
reaper.ShowConsoleMsg('Finishing script')


