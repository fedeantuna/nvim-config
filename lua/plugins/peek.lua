return {
    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        opts = {
            app = "browser",
        },
        keys = {
            {
                "<leader>mo",
                function()
                    require("peek").open()
                end,
            },
            {
                "<leader>mc",
                function()
                    require("peek").close()
                end,
            },
        },
    },
}
