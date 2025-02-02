local loader = require("utils.loader")
local modules = loader.get_plugin_modules("laf")
local module_names = loader.get_plugin_module_names("laf")

require("mason-null-ls").setup({
    ensure_installed = module_names,
    automatic_installation = true,
})

local null_ls = require("null-ls")

null_ls.setup({
    sources = modules,
    on_attach = function(client, bufnr)
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})
