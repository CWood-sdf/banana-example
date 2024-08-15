local M = {}

M.instance = nil

function M.setup()
    vim.api.nvim_create_user_command("InstallThings", function()
        if M.instance == nil then
            M.instance = require('banana.instance').newInstance("installer", "installer")
        end
        M.instance:open()
    end, {})
end

local hasRemaps = false

---@param el string
function M.selectTopNav(el)
    local others = M.instance:querySelectorAll(".selected")
    for _, v in ipairs(others) do
        v:removeClass("selected")
    end
    M.instance:getElementById(el):addClass("selected")
end

function M.navigateTo(route, topNavId)
    local document = M.instance
    local container = document:getElementById("container")

    M.selectTopNav(topNavId)
    document:loadNmlTo(route, container)
end

---@param document Banana.Instance
function M.__banana_run(document)
    local container = document:getElementById("container")
    if #container:children() == 0 then
        document:loadNmlTo("installer/list", container)
        M.selectTopNav("list-tb")
    end
    if not hasRemaps then
        -- this isnt the most efficent way (you can loop through the child elements of #topnav and control remaps in that loop)
        document:body():attachRemap('n', 'L', {}, function()
            M.navigateTo("installer/list", "list-tb")
        end, {})
        document:body():attachRemap('n', 'I', {}, function()
            M.navigateTo("installer/installed", "installed-tb")
        end, {})
        hasRemaps = true
    end
end

return M
