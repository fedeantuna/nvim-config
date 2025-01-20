return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        keys = {
          {
            "<leader>db",
            function()
              require("dap").toggle_breakpoint()
            end,
            desc = "Toggle Debug Breakpoint",
          },
          {
            "<leader>dc",
            function()
              require("dap").continue()
            end,
            desc = "Continue",
          },
          {
            "<leader>dp",
            function()
              require("dap").pause()
            end,
            desc = "Pause",
          },
          {
            "<leader>do",
            function()
              require("dap").step_over()
            end,
            desc = "Step Over",
          },
          {
            "<leader>di",
            function()
              require("dap").step_into()
            end,
            desc = "Step Into",
          },
          {
            "<leader>du",
            function()
              require("dap").step_out()
            end,
            desc = "Step Out",
          },
          {
            "<leader>dl",
            function()
              require("dap").list_breakpoints()
            end,
            desc = "List Breakpoints",
          },
          {
            "<leader>ds",
            function()
              require("dap").disconnect()
            end,
            desc = "Stop",
          },
          {
            "<F5>",
            function()
              require("dap").continue()
            end,
            desc = "Continue",
          },
          {
            "<F10>",
            function()
              require("dap").step_over()
            end,
            desc = "Step Over",
          },
          {
            "<F11>",
            function()
              require("dap").step_into()
            end,
            desc = "Step Into",
          },
          {
            "<F12>",
            function()
              require("dap").step_out()
            end,
            desc = "Step Out",
          },
        },
      },
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
    end,
  },
  -- python
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("uv")
    end,
  },
}
