<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# 

---

# With regard to the mobdebug setup for reaper, what is the essential piece?  Is it a single lua script or a packaged directory?  What would be the most reliable path to resolving that dependency?

The essential piece for setting up MobDebug in Reaper involves ensuring that both **MobDebug** and **Lua Sockets** are accessible to your script. Here's what you need:

1. **MobDebug**:
    - **MobDebug** itself is a single Lua script (`mobdebug.lua`). You need to place this file in a location where Reaper can find it, typically within your Reaper scripts directory.
2. **Lua Sockets**:
    - **Lua Sockets** is a package that includes both Lua scripts and a binary component (`core.dll` or `core.so`). For Reaper, you need a custom build of Lua Sockets that includes the necessary binary components pre-built, as Reaper's embedded Lua doesn't support loading external binaries in the standard way.
3. **Reliable Path to Resolving Dependencies**:
    - **Place `mobdebug.lua`** in your Reaper scripts directory or a subdirectory within it.
    - **Use a custom Lua Sockets build** that includes the necessary binary components. Ensure that both the Lua scripts and the binary (`core.dll` or `core.so`) are in the correct locations.
    - **Modify `package.path` and `package.cpath`** in your script to include the paths to `mobdebug.lua` and the Lua Sockets binary, respectively.

Here's an example of how you might set up these paths in your script:

```lua
-- Assuming mobdebug.lua is in Scripts/mobdebug and Lua Sockets is in Scripts/Lua Sockets
package.path = package.path .. ";" .. reaper.GetResourcePath() .. '/Scripts/mobdebug/?.lua'
package.cpath = package.cpath .. ";" .. reaper.GetResourcePath() .. '/Scripts/Lua Sockets/?.dll' -- For Windows
-- package.cpath = package.cpath .. ";" .. reaper.GetResourcePath() .. '/Scripts/Lua Sockets/?.so' -- For Linux/macOS

require("mobdebug").start()
```

This setup ensures that both MobDebug and Lua Sockets are accessible to your script, allowing you to use MobDebug for remote debugging in Reaper.

<div style="text-align: center">⁂</div>

[^1]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/8835650/273ee602-69ca-4e62-bfc1-d48604c286d7/hello.lua

[^2]: https://studio.zerobrane.com/doc-remote-debugging

[^3]: https://forum.cockos.com/showthread.php?p=2734185

[^4]: https://github.com/pkulchenko/MobDebug

[^5]: https://www.youtube.com/watch?v=dAMQXGMHl2M

[^6]: https://robertgpatterson.com/-fininfo/-rgplua/docs/rgp-lua/development-environment.html

[^7]: https://forum.cockos.com/showthread.php?p=2851567

[^8]: https://luarocks.org/modules/paulclinger/mobdebug

[^9]: https://forums.cockos.com/showthread.php?p=2851567

[^10]: https://github.com/pkulchenko/MobDebug/blob/master/examples/README

[^11]: https://github.com/pkulchenko/MobDebug/issues/63

[^12]: https://discuss.konghq.com/t/kong-lua-debugging/4144

[^13]: https://www.reddit.com/r/Reaper/comments/1gin496/issue_with_lua_script_for_file_naming_in_reaper/

[^14]: https://stackoverflow.com/questions/8419141/lua-debugger-that-can-attach-to-process

[^15]: https://www.reaper.fm/sdk/reascript/reascript.php

[^16]: https://forum.cockos.com/showthread.php?t=298937

[^17]: https://forum.defold.com/t/has-anyone-tried-to-create-a-mobdebug-extension-for-vscode/67824

[^18]: https://discuss.cocos2d-x.org/t/which-lua-ide-debugger-is-the-best-for-cocos-2dx/5916

[^19]: https://github.com/pkulchenko/MobDebug/blob/master/src/mobdebug.lua

[^20]: https://50.17.184.175/showthread.php?t=290071

[^21]: https://www.youtube.com/watch?v=chGmCKMP04s

[^22]: https://forum.hise.audio/topic/2826/debugging-with-reaper/40

[^23]: https://www.youtube.com/watch?v=aPMTYlMpbj0

[^24]: https://docs.emergetools.com/docs/reaper-setup-android

[^25]: https://marketplace.visualstudio.com/items?itemName=AntoineBalaine.reascript-docs

[^26]: https://stackoverflow.com/questions/52973507/zerobrane-breakpoint-not-hit

[^27]: https://stackoverflow.com/questions/58380442/messed-up-lua-paths-after-trying-to-set-up-debugging

[^28]: https://github.com/LuaDist/mobdebug

[^29]: https://stackoverflow.com/questions/18679759/debugging-embedded-lua-5-2-2-code

[^30]: https://www.reddit.com/r/Reaper/comments/4z4evv/trouble_debugging_plugins_with_reaper_using/

