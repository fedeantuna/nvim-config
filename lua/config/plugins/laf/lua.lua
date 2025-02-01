local null_ls = require("null-ls")

return {
    null_ls.builtins.diagnostics.selene,
    null_ls.builtins.formatting.stylua,
}

