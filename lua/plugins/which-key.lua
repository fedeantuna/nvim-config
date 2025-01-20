return {
  {
    "folke/which-key.nvim",
    dependencies = {
      { "nvim-mini/mini.nvim" },
      { "nvim-tree/nvim-web-devicons" },
    },
    event = "VeryLazy",
    opts = {
      icons = {
        mappings = false,
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
