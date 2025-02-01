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

---@param path string
function M.return_concatenated_table_from(path)
    local returns = {}
    for filename in io.popen('ls -pUqAL "' .. "lua/" .. path .. '"'):lines() do
        filename = filename:match("^(.*)%.lua$")
        if filename then
            local partial_returns = require(path:gsub("/", ".") .. "." .. filename).partial_return()
            for k,v in pairs(partial_returns) do
                sources[k] = v
            end
        end
    end
    return returns
end

return M
