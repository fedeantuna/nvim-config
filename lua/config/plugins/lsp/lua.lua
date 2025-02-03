local M = {}

function M.setup()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    enable = false,
                },
            },
        },
    })
end

function M.get_module_names()
    return {
        "lua_ls",
    }
end

return M
