local null_ls = require("null-ls")

local M = {}

function M.partial_return()
    return {
    null_ls.builtins.diagnostics.selene,
    null_ls.builtins.formatting.stylua,
}
end

return M
