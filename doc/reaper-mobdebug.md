
# reaper mobdebug

MobDebug is a remote debugger for Lua that can be used with REAPER for debugging Lua scripts. It allows you to control the execution of Lua programs remotely, set breakpoints, and inspect the current state of the program[^1_1][^1_4].

To use MobDebug with REAPER:

1. Install MobDebug and LuaSocket:
    - You can install MobDebug using LuaRocks: `luarocks install mobdebug`[^1_2]
    - Make sure LuaSocket is available in your REAPER script folder[^1_3]
2. Set up your development environment:
    - Use an IDE like VSCode or ZeroBrane Studio that supports MobDebug[^1_3][^1_5]
    - Configure your IDE to listen for debug connections
3. Modify your REAPER script:
    - Add the following line at the beginning of your script:

```lua
require("mobdebug").start()
```

    - If debugging remotely, specify the IDE's IP address:

```lua
require("mobdebug").start("12.345.67.89")
```

4. Start debugging:
    - Launch the debugger server in your IDE
    - Run your script in REAPER

When using MobDebug, REAPER will freeze while the debugger is active, allowing you to interact with the code in your IDE[^1_3]. This enables you to set breakpoints, inspect variables, and step through your code.

To improve performance, you can use the on/off commands to toggle debugging as needed[^1_1]. Additionally, for convenience, you can create a separate file with the MobDebug initialization code and use the `dofile` function to include it in your scripts[^1_3].

Remember that REAPER version 6.8 or later is required for some advanced debugging features[^1_3].

<div style="text-align: center">⁂</div>

[^1_1]: https://github.com/LuaDist/mobdebug

[^1_2]: https://luarocks.org/modules/paulclinger/mobdebug

[^1_3]: https://www.youtube.com/watch?v=dAMQXGMHl2M

[^1_4]: https://github.com/pkulchenko/MobDebug

[^1_5]: https://studio.zerobrane.com/doc-remote-debugging

[^1_6]: https://forums.cockos.com/showthread.php?p=2851567

[^1_7]: https://www.youtube.com/watch?v=chGmCKMP04s

[^1_8]: https://forum-amz.cockos.com/showthread.php?t=261955

---
# Q2
### I'm on windows with vscode.  `luarocks install mobdebug` sounds like a command line thing, but there's no context: what command line?  How did luarocks get installed? Does it depend on an already-installed lua interpreter?  If so, how would we install that?

Let's break this down step-by-step for Windows and VSCode setup:

## Prerequisites Installation

1. **Install Lua for Windows**
Download the latest Windows binaries from [LuaBinaries](https://luabinaries.sourceforge.net/):
    - Choose either 32-bit or 64-bit (match your REAPER install)
    - Extract to `C:\lua53` (for Lua 5.3) or similar path
    - Add Lua to system PATH:

```powershell
[Environment]::SetEnvironmentVariable("Path", "$env:Path;C:\lua53", "User")
```

2. **Install LuaRocks**
Get the Windows installer from [LuaRocks.org](https://luarocks.org/):
    - Run installer
    - Select "Install for the current user only"
    - Point to your Lua installation directory when prompted

## Install Dependencies

```powershell
# In PowerShell or Command Prompt:
luarocks install mobdebug
luarocks install luasocket
```


## REAPER Integration

1. **Locate REAPER's Lua environment**
REAPER uses its own Lua interpreter. Find your resource folder:
    - In REAPER: Options > "Show REAPER resource path..."
    - Create `UserPlugins/lua_modules` directory here
2. **Copy required files**
From your system's Lua installation (`C:\lua53`):
    - `lua5.3.dll` → `REAPER/UserPlugins/`
    - From `C:\Users\<YOU>\AppData\Roaming\luarocks\share\lua\5.3`:
        - `mobdebug.lua`
        - `socket` folder (from luasocket)

## VSCode Setup

1. Install [Lua Extension](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
2. Configure `.vscode/launch.json`:
```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "MobDebug",
            "type": "lua",
            "request": "attach",
            "host": "127.0.0.1",
            "port": 8172
        }
    ]
}
```


## Usage Example

In your REAPER script:

```lua
package.path = package.path .. ';C:\\Users\\<YOU>\\AppData\\Roaming\\REAPER\\UserPlugins\\lua_modules\\?.lua'
require("mobdebug").start("127.0.0.1")
```

**Debug workflow:**

1. Press F5 in VSCode to start debug server
2. Run script in REAPER
3. REAPER will pause execution - control now in VSCode
4. Set breakpoints/inspect variables in VSCode

## Troubleshooting

- If `luarocks` commands fail:

```powershell
luarocks --lua-dir=C:\lua53 install mobdebug
```

- If REAPER can't find modules:
Verify file paths match in both `package.path` and actual directory structure
- Firewall issues: Temporarily disable Windows Defender Firewall during initial setup

---

