---@type MappingsTable
local M = {}

M.general = {
  i = {
    -- ["<C-l>"] = {
    --   function()
    --     vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
    --   end,
    --   "Copilot Accept",
    --   { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    -- },
  },
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["=="] = { ":Mason<CR>", opts = { nowait = true } },

    ["=ga"] = { ":G add -A<CR>", opts = { nowait = true } },

    ["=gp"] = { ":G push<CR>", opts = { nowait = true } },

    ["=gc"] = { ":G commit<CR>", opts = { nowait = true } },

    ["<leader>cp"] = { ":Telescope neoclip<CR>", opts = { nowait = true } },

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
      function() end,
      "formatting",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },

    ["<S-Up>"] = { ":move '<-2<CR>gv=gv", "Move Lines up in V-Line" },

    ["<S-Down>"] = { ":move '>+1<CR>gv=gv", "Move Lines down in V-Line" },

    ["<A-Up>"] = { ":move '<-2<CR>gv=gv", "Move Lines up in V-Line" },

    ["<A-Down>"] = { ":move '>+1<CR>gv=gv", "Move Lines down in V-Line" },

    ["<leader>rf"] = { ":Refactor extract<CR>", opts = { nowait = true } },

    ["<leader>re"] = { ":Refactor extract<CR>", opts = { nowait = true } },

    ["<leader>rv"] = { ":Refactor extract_var", opts = { nowait = true } },

    ["<leader>rb"] = { ":Refactor extract_block", opts = { nowait = true } },
  },
}

-- more keybinds!
vim.api.nvim_set_keymap("n", "<leader>t", ":sp terminal<CR>", { noremap = true, silent = true })

return M
