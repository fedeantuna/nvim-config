local M = {}

function M.get_modules()
    return {
        require("none-ls.formatting.ruff"),
        require("none-ls.formatting.ruff_format"),
    }
end

function M.get_module_names()
    return {
        "ruff",
    }
end

return M
