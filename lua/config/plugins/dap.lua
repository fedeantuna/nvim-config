local loader = require("utils.loader")
local module_names = loader.get_plugin_module_names("dap")

require("mason-nvim-dap").setup({
    ensure_installed = module_names,
    automatic_installation = true,
})

loader.setup_plugin_modules("dap")

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

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
