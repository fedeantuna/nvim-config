return {
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = false,
        keys = {
            {
                "<leader>rt",
                "<cmd>lua vim.cmd('RustLsp testables')<cr>",
                desc = "Debug testables"
            },
        }
    },
}
