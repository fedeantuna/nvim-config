vim.g.vscode_style = "dark"
vim.g.vscode_transparent = 1
vim.g.vscode_italic_comment = 1

local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
    return
end

nightfox.setup({
    fox = "nordfox",
    styles = {
        comments = "italic",
        keywords = "bold",
        functions = "italic,bold",
    },
    transparent = true
})

nightfox.load("nordfox")
