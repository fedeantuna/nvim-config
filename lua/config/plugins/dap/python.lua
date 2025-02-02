local M = {}

function M.setup()
    require("dap-python").setup("uv")
end

function M.get_module_names()
    return {
        "", -- first will be ignored TODO: find out why
        "python", -- debugpy
    }
end

return M
