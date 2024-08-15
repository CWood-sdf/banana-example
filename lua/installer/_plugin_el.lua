---@param params Banana.RouteParams
return function(_, params)
    local name = params.params.name
    params.selfNode:setAttribute("data-name", name)
    params.selfNode:attachRemap('n', "V", { "line-hover" }, function()
        require('installer').navigateTo("installer/view?name=" .. name, "view-tb")
    end, {})
    params.selfNode:attachRemap('n', 'i', { "line-hover" }, function()
        require('installer.manager').installPlugin(name)
    end, {})
    params.selfNode:attachRemap('n', 'u', { "line-hover" }, function()
        -- NOTE: there is currently no way to easily resource page scripts, this is part of a larger issue that will probably be solved in banana 0.2.0. so for now, reactivity isn't great
        require('installer.manager').uninstallPlugin(name)
    end, {})
end
