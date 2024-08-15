---@param document Banana.Instance
---@param params Banana.RouteParams
return function(document, params)
    local things = require('installer.manager').installedPlugins()
    local list = document:getElementById("list")
    for _, v in ipairs(things) do
        document:loadNmlTo("installer/_plugin_el?name=" .. v.name, list, false)
    end
end
