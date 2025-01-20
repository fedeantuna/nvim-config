return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      vim.keymap.set("n", "<leader>n", ":bn<cr>", { desc = "Move to Next Buffer" })
      vim.keymap.set("n", "<leader>p", ":bp<cr>", { desc = "Move to Previous Buffer" })
      vim.keymap.set("n", "<leader>x", ":bd<cr>", { desc = "Close Current Buffer" })
      -- vim.keymap.set("n", "<leader>ml", ":b#<cr>", { desc = "Move to the Last Buffer" })

      require("bufferline").setup({
        highlights = require("catppuccin.groups.integrations.bufferline").get_theme(),
      })
    end,
  },
}
