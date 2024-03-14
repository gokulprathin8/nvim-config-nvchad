---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["=="] = { ":Mason<CR>", opts = { nowait = true } },

    ["<leader>cp"] = {
      function()
        require("neoclip").start()
      end,
    },

    ["=aa"] = { ":Format<CR>", opts = { nowait = true } },

    ["<leader>ccc"] = { ":PickColor<CR>", opts = { nowait = true } },

    ["<leader>="] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
    },

    ["<leader>m"] = {
      function()
        require("harpoon.mark").add_file()
      end,
    },
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!
vim.api.nvim_set_keymap("n", "<leader>t", ":sp terminal<CR>", { noremap = true, silent = true })

return M
