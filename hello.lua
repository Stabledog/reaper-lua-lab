

package.path = package.path .. ";" .. reaper.GetResourcePath() .. '/Scripts/?.lua'
package.path = package.path .. ";" .. reaper.GetResourcePath() .. '/Scripts/lua-sockets/socket-module/?.lua'
package.cpath = package.cpath .. ";" .. reaper.GetResourcePath() .. '/Scripts/lua-sockets/socket-module/socket/core.dll'

local mob = require("mobdebug")
mob.start()

local track = reaper.GetTrack(0, 0)
reaper.ShowConsoleMsg('Hello world\n')

-- Function to print track properties
-- Function to print track properties
local function printTrackProperties(track)
    if track == nil then
        reaper.ShowConsoleMsg("Track is nil\n")
        return
    end

    local retval, trackName = reaper.GetSetMediaTrackInfo_String(track, "P_NAME", "", false)
    local trackVolume = reaper.GetMediaTrackInfo_Value(track, "D_VOL")
    local trackPan = reaper.GetMediaTrackInfo_Value(track, "D_PAN")
    local trackMute = reaper.GetMediaTrackInfo_Value(track, "B_MUTE")
    local trackSolo = reaper.GetMediaTrackInfo_Value(track, "I_SOLO")

    if not retval then
        trackName = "Unnamed Track"
    end

    reaper.ShowConsoleMsg("Track Name: " .. trackName .. "\n")
    reaper.ShowConsoleMsg("Track Volume: " .. trackVolume .. "\n")
    reaper.ShowConsoleMsg("Track Pan: " .. trackPan .. "\n")
    reaper.ShowConsoleMsg("Track Mute: " .. (trackMute == 1 and "Yes" or "No") .. "\n")
    reaper.ShowConsoleMsg("Track Solo: " .. (trackSolo == 1 and "Yes" or "No") .. "\n")
end

printTrackProperties(track)

local t = {track, track, 10, 20, 30, {50,60,70,{80,90,100}}}
reaper.ShowConsoleMsg('Finishing script\n')

