local M = {}

function M.get_modules()
    local null_ls = require("null-ls")

    return {
        null_ls.builtins.diagnostics.selene,
        null_ls.builtins.formatting.stylua,
    }
end

function M.get_module_names()
    return {
        "selene",
        "stylua",
    }
end

return M
