local M = {}

function M.setup()
    if not vim.env.is_mason_loaded then
        require("mason").setup()
        vim.env.is_mason_loaded = true
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lspconfig = require("lspconfig")
    lspconfig.ruff.setup({
        capabilities = capabilities,
    })
    lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
            pyright = {
                disableOrganizeImports = true,
            },
            python = {
                analysis = {
                    ignore = { "*" },
                },
            },
        },
    })
end

function M.get_module_names()
    return {
        "pyright",
        "ruff",
    }
end

return M
