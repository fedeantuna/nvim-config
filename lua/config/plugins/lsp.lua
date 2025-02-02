local loader = require("utils.loader")
local module_names = loader.get_plugin_module_names("lsp")

require("mason-lspconfig").setup({
    ensure_installed = module_names,
    automatic_installation = true,
})

loader.setup_plugin_modules("lsp")

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        local buffer_opts = { buffer = event.buf }

        vim.keymap.set("n", "<leader>gk", vim.lsp.buf.hover, buffer_opts)
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, buffer_opts)
        vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, buffer_opts)
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, buffer_opts)
        vim.keymap.set("n", "<leader>go", vim.lsp.buf.type_definition, buffer_opts)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, buffer_opts)
        vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, buffer_opts)
        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, buffer_opts)
        vim.keymap.set({ "n", "x" }, "<leader>gf", vim.lsp.buf.format, buffer_opts)
        vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, buffer_opts)

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
                end,
            })
        end
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            vim.keymap.set("n", "<leader>gt", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, buffer_opts)
        end

        if client == nil then
            return
        end
        if client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
        end
    end,
})
