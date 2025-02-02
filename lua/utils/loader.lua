local nvim_config_lua_path = vim.fn.stdpath("config") .. "/lua/"

---@param plugin string
function setup_for_plugin(plugin)
    local relative_path = "config/plugins/" .. plugin

    for filename in io.popen('ls -pUqAL "' .. nvim_config_lua_path .. relative_path .. '"'):lines() do
        filename = filename:match("^(.*)%.lua$")
        if filename then
            require(relative_path:gsub("/", ".") .. "." .. filename).setup()
        end
    end
end

---@param fn function
---@param plugin string
function get_for_plugin(fn, plugin)
    local modules = {}
    local index = 0
    local relative_path = "config/plugins/" .. plugin

    for filename in io.popen('ls -pUqAL "' .. nvim_config_lua_path .. relative_path .. '"'):lines() do
        filename = filename:match("^(.*)%.lua$")
        if filename then
            local partial_module_list = fn(relative_path, filename)
            for i = 0, #partial_module_list do
                if partial_module_list[i] ~= nil then
                    modules[index] = partial_module_list[i]
                    index = index + 1
                end
            end
        end
    end

    return modules
end

---@param path string
---@param filename string
function get_modules_from_path(path, filename)
    return require(path:gsub("/", ".") .. "." .. filename).get_modules()
end

---@param path string
---@param filename string
function get_module_names_from_path(path, filename)
    return require(path:gsub("/", ".") .. "." .. filename).get_module_names()
end

local M = {}

---@param path string
function M.load_from(path)
    for filename in io.popen('ls -pUqAL "' .. nvim_config_lua_path .. path .. '"'):lines() do
        filename = filename:match("^(.*)%.lua$")
        if filename then
            require(path:gsub("/", ".") .. "." .. filename)
        end
    end
end

---@param plugin string
function M.get_plugin_modules(plugin)
    return get_for_plugin(get_modules_from_path, plugin)
end

---@param plugin string
function M.get_plugin_module_names(plugin)
    return get_for_plugin(get_module_names_from_path, plugin)
end

---@param plugin string
function M.setup_plugin_modules(plugin)
    setup_for_plugin(plugin)
end

return M
