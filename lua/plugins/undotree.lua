local close_nvim_tree_if_exists_and_open = function()
    if package.loaded["nvim-tree.api"] then
        require("nvim-tree.api").tree.close()
    end

    if package.loaded["neo-tree.command"] then
        require("neo-tree.command").execute({
            action = "close",
        })
    end
end

return {
    {
        "jiaoshijie/undotree",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        keys = {
            {
                "<leader>u",
                function()
                    close_nvim_tree_if_exists_and_open()
                    require("undotree").toggle()
                end,
            },
        },
    },
}
