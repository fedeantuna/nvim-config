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
