local function getCharLen(s, pos)
    local byte = string.byte(s, pos)
    if not byte then
        return nil
    end
    return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
end

return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
    },
    opts = function()
        local dashboard = require("alpha.themes.dashboard")

        local logo = {
            [[  ███       ███  ]],
            [[  ████      ████ ]],
            [[  ████     █████ ]],
            [[ █ ████    █████ ]],
            [[ ██ ████   █████ ]],
            [[ ███ ████  █████ ]],
            [[ ████ ████ ████ ]],
            [[ █████  ████████ ]],
            [[ █████   ███████ ]],
            [[ █████    ██████ ]],
            [[ █████     █████ ]],
            [[ ████      ████ ]],
            [[  ███       ███  ]],
            [[                    ]],
            [[  N  E  O  V  I  M  ]],
        }
        local color_table = {
            ["a"] = { fg = "#53C670", ctermfg = 35 },
            ["b"] = { fg = "#3399ff", ctermfg = 33 },
            ["g"] = { fg = "#39ac56", ctermfg = 29 },
            ["h"] = { fg = "#33994d", ctermfg = 23 },
            ["i"] = { fg = "#33994d", bg = "#39ac56", ctermfg = 23, ctermbg = 29 },
            ["j"] = { fg = "#53C670", bg = "#33994d", ctermfg = 35, ctermbg = 23 },
            ["k"] = { fg = "#30A572", ctermfg = 36 },
        }
        local logo_color_map = {
            [[  kkkka       gggg  ]],
            [[  kkkkaa      ggggg ]],
            [[ b kkkaaa     ggggg ]],
            [[ bb kkaaaa    ggggg ]],
            [[ bbb kaaaaa   ggggg ]],
            [[ bbbb aaaaaa  ggggg ]],
            [[ bbbbb aaaaaa igggg ]],
            [[ bbbbb  aaaaaahiggg ]],
            [[ bbbbb   aaaaajhigg ]],
            [[ bbbbb    aaaaajhig ]],
            [[ bbbbb     aaaaajhi ]],
            [[ bbbbb      aaaaajh ]],
            [[  bbbb       aaaaa  ]],
            [[                    ]],
            [[  a  a  a  b  b  b  ]],
        }

        dashboard.section.header.val = logo

        local colors = {}
        for key, color in pairs(color_table) do
            local name = "Alpha" .. key
            vim.api.nvim_set_hl(0, name, color)
            colors[key] = name
        end

        dashboard.section.header.opts.hl = {}
        for i, line in ipairs(logo_color_map) do
            local highlights = {}
            local pos = 0

            for j = 1, #line do
                local opos = pos
                pos = pos + getCharLen(logo[i], opos + 1)

                local color_name = colors[line:sub(j, j)]
                if color_name then
                    table.insert(highlights, { color_name, opos, pos })
                end
            end

            table.insert(dashboard.section.header.opts.hl, highlights)
        end

        dashboard.section.buttons.val = {
            dashboard.button("e", " New file", "<cmd>ene<CR>"),
            dashboard.button("f", " Find files", "<cmd>Telescope find_files<CR>"),
            dashboard.button("o", " Recent files", "<cmd>Telescope oldfiles<CR>"),
            dashboard.button("z", " Find text", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("x", " Explore", "<cmd>Neotree float<CR>"),
            dashboard.button("q", " Quit", "<cmd>qa<CR>"),
        }

        vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = "Neovim loaded "
                    .. stats.loaded
                    .. "/"
                    .. stats.count
                    .. " plugins in "
                    .. ms
                    .. "ms"
                pcall(vim.cmd.AlphaRedraw)
            end,
        })

        return dashboard.opts
    end,
    config = true,
}
