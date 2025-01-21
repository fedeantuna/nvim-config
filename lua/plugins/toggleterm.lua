return {
    {
        "akinsho/toggleterm.nvim",
        version = "v2.*",
        opts = {
            open_mapping = [[<leader>tt]],
            direction = "float",
            float_opts = {
                border = "curved",
                winblend = 3,
                title_pos = "left",
            },
        },
        config = true,
    },
}
