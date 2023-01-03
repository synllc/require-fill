# Require polyfill
This script reimplements the vanilla behavior of the Lua function `require` for Synapse X 3.0. Note that this _only_ works on 3.0 and above as older versions do not support filesystem-contextual execution. This _doesn't_ break the functionality of the normal behavior (so you can still require instances from the game tree), it only adds to it.

### Usage
1. Enable `Contextual execution` in Hollywood settings. This is not required if you don't care about executing files outside of `autoexec` and the sidebar.
    ![Alt text that I need to add or else I get sued](https://i.imgur.com/ZldQ6DZ.png)
2. Move `require-polyfill.lua` to your `autoexec` folder.
3. Scripts will now be able to `require` files from their workspace. Files ran from `autoexec` and the sidebar will assume `/workspace` as their workspace, whereas files ran from `Execute file`, `Open file` and such will assume their working directory as their workspace.

### Example code
```lua
-- Old, decrepit way of loading in code. Don't do this.
local y = loadstring(game:HttpGet("https://path/to/my/module.lua"))()

-- NOW, this is better.
local library = require("module.lua")

-- You can even pass arguments and retrieve multiple return values!
-- (unlike 100% vanilla Lua)
local foo, bar = require("foobar.lua", 1, "Hello!")

-- Yes, the old stuff still works, don't worry about it.
local information = require(workspace.SomeModuleSomewhere)
```
