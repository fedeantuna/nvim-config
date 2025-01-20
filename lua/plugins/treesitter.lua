return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "arduino",
          "bash",
          "c",
          "c_sharp",
          "cmake",
          "cpp",
          "css",
          "csv",
          "dart",
          "dockerfile",
          "editorconfig",
          "git_config",
          "gitignore",
          "gpg",
          "helm",
          "html",
          "java",
          "javascript",
          "json",
          "kotlin",
          "latex",
          "lua",
          "make",
          "markdown",
          "nginx",
          "powershell",
          "proto",
          "python",
          "rust",
          "scss",
          "sql",
          "ssh_config",
          "svelte",
          "terraform",
          "typescript",
          "vim",
          "vimdoc",
        },
        sync_install = false,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
}
