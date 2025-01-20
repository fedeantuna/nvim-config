return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = true,
        keys = {
            {
                "<leader>tf",
                function()
                    require("telescope.builtin").find_files()
                end,
            },
            {
                "<leader>tg",
                function()
                    require("telescope.builtin").git_files()
                end,
            },
            {
                "<leader>tz",
                function()
                    require("telescope.builtin").live_grep()
                end,
            },
            {
                "<leader>to",
                function()
                    require("telescope.builtin").oldfiles()
                end,
            },
            {
                "<leader>tb",
                function()
                    require("telescope.builtin").buffers()
                end,
            },
            {
                "<leader>th",
                function()
                    require("telescope.builtin").help_tags()
                end,
            },
        },
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
