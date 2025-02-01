local close_undotree_safely = function()
    if package.loaded["undotree"] then
        require("undotree").close()
    end
end

return {
    {
        "nvim-tree/nvim-tree.lua",
        keys = {
            {
                "<leader>e",
                function()
                    close_undotree_safely()
                    require("nvim-tree.api").tree.toggle()
                end,
            },
        },
    },
}
