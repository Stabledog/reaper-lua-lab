
Here are the rewritten instructions for setting up Lua, LuaRocks, LuaSocket, and MobDebug, including the setup for Visual Studio Build Tools, tailored for competent Windows C programmers using VS Code:

### Step 1: Install Visual Studio Build Tools

1. **Download Build Tools**:
   - Go to the [Visual Studio Build Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022) page and download the latest version.
2. **Run Installer**:
   - Run the downloaded installer and select the **Desktop development with C++** workload.
3. **Customize Installation**:
   - Under **Installation details**, ensure that **C++ build tools** are selected. You may also need to select the Windows SDK depending on your Windows version.
4. **Install and Reboot**:
   - Complete the installation and reboot your computer.

### Step 2: Install Lua

1. **Download Lua Binaries**:
   - Download the latest Lua binaries (e.g., Lua 5.3 or Lua 5.4) from [LuaBuilds](https://joedf.github.io/LuaBuilds/).
2. **Extract Lua**:
   - Extract the Lua binaries to a directory like `C:\lua54`.

### Step 3: Install LuaRocks

1. **Download LuaRocks**:
   - Download the LuaRocks standalone package (e.g., `luarocks-3.11.1-windows-64.zip`) from [LuaRocks releases](https://luarocks.github.io/luarocks/releases/).
2. **Extract LuaRocks**:
   - Extract `luarocks.exe` to your Lua directory (e.g., `C:\lua54`).

### Step 4: Add Lua and LuaRocks to PATH

1. **Update System PATH**:
   - Open PowerShell as an administrator and run:
     ```powershell
     $currentPath = [Environment]::GetEnvironmentVariable('Path', [EnvironmentVariableTarget]::Machine)
     $newPath = "$currentPath;C:\lua54"
     [Environment]::SetEnvironmentVariable('Path', $newPath, [EnvironmentVariableTarget]::Machine)
     ```

### Step 5: Install LuaSocket and MobDebug

1. **Install Dependencies**:
   - Open a new Command Prompt or PowerShell window and run:
     ```bash
     luarocks install luasocket
     luarocks install mobdebug
     ```

### Step 6: Configure VS Code for Lua

1. **Install Lua Extension**:
   - Open VS Code and install the Lua extension from the Extensions marketplace.
2. **Configure `.vscode/launch.json` for MobDebug**:
   - Create a new file in `.vscode/launch.json` with the following content:
     ```json
     {
       "version": "0.2.0",
       "configurations": [
         {
           "type": "lua",
           "request": "launch",
           "name": "MobDebug",
           "program": "${file}",
           "args": [],
           "stopOnEntry": false,
           "preLaunchTask": null,
           "env": {
             "LUA_PATH": "${workspaceFolder}/?.lua",
             "LUA_CPATH": "${workspaceFolder}/?.so"
           },
           "mobdebug": {
             "host": "localhost",
             "port": 8172
           }
         }
       ]
     }
     ```

### Step 7: Configure REAPER for MobDebug

1. **Copy MobDebug Files**:
   - Copy `mobdebug.lua` and the `socket` folder to REAPER's `UserPlugins/lua_modules` directory.
2. **Modify REAPER Script**:
   - Add the following line at the beginning of your REAPER script to use MobDebug:
     ```lua
     require("mobdebug").start()
     ```

These steps should help you set up Lua, LuaRocks, LuaSocket, and MobDebug with Visual Studio Build Tools for C/C++ compilation, all while using VS Code for development.

Citations:
[1] https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/8835650/36fd9ef6-d7da-421a-9804-c2faed8c2bcf/setup-reaper-lua-dev.md
[2] https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/8835650/36fd9ef6-d7da-421a-9804-c2faed8c2bcf/setup-reaper-lua-dev.md
[3] https://stackoverflow.com/questions/40504552/how-to-install-visual-c-build-tools
[4] https://github.com/bycloudai/InstallVSBuildToolsWindows
[5] https://learn.microsoft.com/en-us/cpp/build/building-on-the-command-line?view=msvc-170
[6] https://code.visualstudio.com/docs/cpp/config-msvc
[7] https://www.pythondiscord.com/pages/tags/microsoft-build-tools/
[8] https://learn.microsoft.com/en-us/cpp/build/vscpp-step-0-installation?view=msvc-170
[9] https://learn.microsoft.com/en-us/answers/questions/1398254/installed-visual-studio-build-tools-but-cannot-fin
[10] https://superuser.com/questions/1369402/where-can-i-download-visual-c-2015-build-tools
[11] https://developercommunity.visualstudio.com/content/problem/966640/visual-studio-build-tools-2019-installation-hangs.html
[12] https://developercommunity.visualstudio.com/t/Microsoft-C-Build-Tools-for-Windows-11/10511755?space=41&sort=newest
[13] https://visualstudio.microsoft.com/vs/features/cplusplus/
[14] https://user-images.githubusercontent.com/29135514/151630503-d238175e-ea50-4a3b-963d-8c31c465da28.png?sa=X&ved=2ahUKEwj2r6H_zvqLAxXVSjABHbthBNoQ_B16BAgEEAI
[15] https://visualstudio.microsoft.com/downloads/?q=build+tools
[16] https://visualstudio.microsoft.com/downloads/
[17] https://learn.microsoft.com/en-us/answers/questions/365971/unable-to-install-visual-c-build-tools
[18] https://www.reddit.com/r/rust/comments/mk70mb/visual_studio_build_tools_license/
[19] https://user-images.githubusercontent.com/29135514/151630503-d238175e-ea50-4a3b-963d-8c31c465da28.png?sa=X&ved=2ahUKEwifsKD_zvqLAxVSF1kFHSWKJF4Q_B16BAgCEAI
[20] https://users.rust-lang.org/t/how-to-install-rust-microsoft-c-build-tools-on-windows-without-msdn-license/65896
[21] https://www.youtube.com/watch?v=x6OBMfLTLhA
#  Setup LUA+modebug for Reaper / windows / vscode
