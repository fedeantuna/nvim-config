local M = {}

function M.partial_return()
return {
    require("none-ls.formatting.ruff"),
    require("none-ls.formatting.ruff_format"),
}
end

return M
