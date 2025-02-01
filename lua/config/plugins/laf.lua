local null_ls = require("null-ls")

local returns = require("utils.loader").return_concatenated_table_from("config/plugins/laf")

null_ls.setup({
    sources = returns,
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
