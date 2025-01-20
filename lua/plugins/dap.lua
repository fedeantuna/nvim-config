return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
        },
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
        end,
    },
}
