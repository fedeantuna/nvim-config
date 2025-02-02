require("config.keymaps")
require("config.options")
require("config.lazy")

local loader = require("utils.loader")
loader.load_from("config/plugins")
