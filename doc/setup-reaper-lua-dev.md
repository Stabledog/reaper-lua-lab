
#  Setup LUA+modebug for Reaper / windows / vscode

---

# https://luarocks.github.io/luarocks/releases/ shows the latest releases for LuaRocks -- it looks like they have some packages which bundle lua 5.1, implying that if you pick a different package you should install lua first separately?  What version of lua should I be using to work with reaper 7.34?  Should I install lua first?

To work with REAPER 7.34, you don't necessarily need to install Lua separately if you're using LuaRocks. However, understanding the options is important:

1. **LuaRocks Standalone Packages**
These packages (`luarocks-3.11.1-windows-32.zip`, `luarocks-3.11.1-windows-64.zip`) include only the LuaRocks tool itself. You would need to install Lua separately if you choose these.
2. **Legacy Packages with Lua 5.1**
These packages (`luarocks-3.11.1-win32.zip`) include Lua 5.1, which is outdated for most modern use cases. It's generally recommended to avoid these unless you have a specific requirement for Lua 5.1.
3. **Recommended Approach**
For working with REAPER, you typically want to use a more recent version of Lua. REAPER itself uses Lua 5.3 or later internally, depending on the version. For REAPER 7.34, using Lua 5.3 or Lua 5.4 is suitable.
    - **Install Lua**
You can download the latest Lua binaries from the official Lua website or use a package manager like LuaRocks. However, since LuaRocks standalone packages don't include Lua, you might want to install Lua separately for clarity.
    - **Lua Version for REAPER**
REAPER 7.34 likely uses Lua 5.3 internally. You can use either Lua 5.3 or Lua 5.4 for your scripts, as both are compatible with REAPER's Lua environment.
4. **Setup Steps**
Here’s a concise setup guide:

### Step 1: Install Lua

    - Download the latest Lua binaries (e.g., Lua 5.3 or Lua 5.4) from https://joedf.github.io/LuaBuilds/, because the stuff on the official site is 4 years old!
    - 
    - Extract them to `C:\lua54`. (or version...xx)


### Step 2: Install LuaRocks

    - Download the LuaRocks standalone package (e.g., `luarocks-3.11.1-windows-64.zip`) from [LuaRocks releases](https://luarocks.github.io/luarocks/releases/).
    - Extract `luarocks.exe` to your c:\luaXX dir created previously.


### Step 3: Add Lua and LuaRocks to PATH

    - Add the directories containing `lua.exe` and `luarocks.exe` to your system PATH:

```powershell
# Use an admin console
$newPath = "$currentPath;C:\lua54"
[Environment]::SetEnvironmentVariable('Path', $newPath, [EnvironmentVariableTarget]::Machine)
```

### Step 4: Install MobDebug and LuaSocket

```powershell
luarocks install luasocket
luarocks install mobdebug
```


### Step 5: Configure REAPER

    - Copy `mobdebug.lua` and the `socket` folder to REAPER's `UserPlugins/lua_modules` directory.
    - Modify your REAPER script to use MobDebug.


### Step 6: Configure VSCode

    - Install the Lua Extension.
    - Configure `.vscode/launch.json` for MobDebug.

This approach ensures you're using a compatible version of Lua with REAPER and have the necessary tools for debugging.

<div style="text-align: center">⁂</div>

[^1]: https://luarocks.github.io/luarocks/releases/

