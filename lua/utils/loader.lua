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
    local returns_index = 0
    for filename in io.popen('ls -pUqAL "' .. "lua/" .. path .. '"'):lines() do
        filename = filename:match("^(.*)%.lua$")
        if filename then
            local partial_returns = require(path:gsub("/", ".") .. "." .. filename)
            for i = 0, #partial_returns do
                if partial_returns[i] ~= nil then
                    returns[returns_index] = partial_returns[i]
                    returns_index = returns_index + 1
                end
            end
        end
    end
    return returns
end

return M
