return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            {
                "mfussenegger/nvim-dap",
                keys = {
                    {
                        "<leader>b",
                        function()
                            require("dap").toggle_breakpoint()
                        end,
                    },
                    {
                        "<F5>",
                        function()
                            require("dap").continue()
                        end,
                    },
                    {
                        "<F10>",
                        function()
                            require("dap").step_over()
                        end,
                    },
                    {
                        "<F11>",
                        function()
                            require("dap").step_into()
                        end,
                    },
                    {
                        "<F12>",
                        function()
                            require("dap").step_out()
                        end,
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
