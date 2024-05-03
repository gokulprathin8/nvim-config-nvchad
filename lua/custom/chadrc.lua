---@type ChadrcConfig
local M = {}

vim.opt.relativenumber = true

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
M.ui = {
  theme = "chocolate",
  theme_toggle = { "chocolate", "chocolate" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
