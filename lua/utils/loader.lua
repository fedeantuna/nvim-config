---@param plugin string
function setup_for_plugin(plugin)
    local path = "lua/config/plugins/" .. plugin

    for filename in io.popen('ls -pUqAL "' .. path .. '"'):lines() do
        filename = filename:match("^(.*)%.lua$")
        if filename then
            require(path:gsub("/", ".") .. "." .. filename).setup()
        end
    end
end

---@param fn function
---@param plugin string
function get_for_plugin(fn, plugin)
    local modules = {}
    local index = 0
    local path = "lua/config/plugins/" .. plugin

    for filename in io.popen('ls -pUqAL "' .. path .. '"'):lines() do
        filename = filename:match("^(.*)%.lua$")
        if filename then
            local partial_module_list = fn(path, filename)
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
    local test = require(path:gsub("/", ".") .. "." .. filename).get_module_names()
    return test
end

local M = {}

---@param path string
function M.load_from(path)
    for filename in io.popen('ls -pUqAL "' .. "lua/" .. path .. '"'):lines() do
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
