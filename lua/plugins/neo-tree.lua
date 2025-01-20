local close_undotree_safely = function()
  if package.loaded["undotree"] then
    require("undotree").close()
  end
end

local is_neotree_open_current = true
local is_neotree_first_request = true

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    lazy = false,
    opts = {
      filesystem = {
        hijack_netrw_behavior = (is_neotree_open_current and "open_current" or "open_default"),
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          close_undotree_safely()
          if is_neotree_open_current and is_neotree_first_request then
            require("neo-tree.command").execute({
              action = "close",
            })
          end
          is_neotree_first_request = false

          local reveal_file = vim.fn.expand("%:p")
          if reveal_file == "" then
            reveal_file = vim.fn.getcwd()
          else
            local f = io.open(reveal_file, "r")
            if f then
              f.close(f)
            else
              reveal_file = vim.fn.getcwd()
            end
          end
          require("neo-tree.command").execute({
            action = "focus",
            source = "filesystem",
            position = "float",
            reveal_file = reveal_file,
            reveal_force_cwd = true,
            toggle = true,
          })
        end,
        desc = "Open File Explorer",
      },
    },
  },
}
