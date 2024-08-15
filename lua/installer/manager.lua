---@class Banana_Example.Item
---@field name string
---@field description string
---@field installed boolean

local M = {}

--- This array isnt optimized for sorting, but this is an example anyway
---@type Banana_Example.Item[]
local pluginsList = {
    {
        name = "plugin thing",
        description = "does things idk man",
        installed = false,
    },
    {
        name = "cool",
        description = "does cool things",
        installed = false,
    },
    {
        name = "nuke",
        description = "`rm -rf / --no-preserve-root` (have fun lol)",
        installed = true,
    },
    {
        name = "windows",
        description = "that's rough",
        installed = false,
    },
}

---@param name string
function M.installPlugin(name)
    for _, v in ipairs(pluginsList) do
        if v.name == name then
            v.installed = true
            break
        end
    end
end

---@param name string
function M.uninstallPlugin(name)
    for _, v in ipairs(pluginsList) do
        if v.name == name then
            v.installed = false
            break
        end
    end
end

---@param name string
---@return Banana_Example.Item?
function M.getPlugin(name)
    for _, v in ipairs(pluginsList) do
        if v.name == name then
            return v
        end
    end
end

---@return Banana_Example.Item[]
function M.installedPlugins()
    local ret = {}
    for _, v in ipairs(pluginsList) do
        if v.installed then
            table.insert(ret, v)
        end
    end
    return ret
end

---@return Banana_Example.Item[]
function M.allPlugins()
    return pluginsList
end

return M
