return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-macchiato")
      require("catppuccin").setup({
        auto_integrations = true,
      })
    end,
  },
}
