---@param params Banana.RouteParams
return function(_, params)
    local name = params.params.name
    local thing = require('installer.manager').getPlugin(name)
    if thing == nil then
        print("not found")
        return
    end
    params.selfNode:setAttribute("data-name", ' ' .. thing.name)
    params.selfNode:setAttribute("data-desc", ' ' .. thing.description)
    if not thing.installed then
        params.selfNode:setAttribute("data-installstate", "not")
    else
        params.selfNode:setAttribute("data-installstate", "is")
    end
end
