local cache = {}
local unpack = table.unpack or unpack
local old_require = require
local new_require = function(module, ...)
  if type(module) == "string" then
    local result = cache[module]
    if result then
      return unpack(result)
    end

    local scriptContents = readfile(module)
    local f, err = loadstring(scriptContents)
    if not f then
      error(err)
    end

    -- Vanilla require doesn't support arguments, nor
    -- multiple return results. I'm adding it in anyway
    -- because it's actually useful.
    result = { f(...) }
    return unpack(result)
  else
    return old_require(module, ...)
  end
end

getgenv().require = new_require
return new_require
