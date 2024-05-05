require "core"
local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

vim.opt.guicursor = "n:block,i:block,r:block,c:block,v:block,a:block"

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

-- increase font size

-- return should copy text in V-LINE
vim.api.nvim_set_keymap("v", "<CR>", "y", { noremap = true })

-- remapping dt to df for easy acess
vim.api.nvim_set_keymap("n", "df", "dt", { noremap = true })

-- remap window switch
vim.api.nvim_set_keymap("n", "Q", "<C-w>", { noremap = true })

-- remove highlight
vim.api.nvim_set_keymap("n", "--", ":noh<CR>", { noremap = true })

-- faster arrow navigations
vim.api.nvim_set_keymap("n", "<C-Left>", "b", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-Right>", "e", { noremap = true })

vim.api.nvim_set_keymap(
  "n",
  "<Leader>rel",
  ":lua copy_relative_path_under_cursor()<CR>",
  { noremap = true, silent = true }
)

-- function to copy relative path from nvimtree
local function copy_relative_path_under_cursor()
  if vim.bo.filetype ~= "NvimTree" or vim.fn.win_gettype() ~= "nvim_tree" then
    print "NvimTree is not open or focused."
    return
  end
  local cursor_path = vim.fn.expand "%:p"
  local root_path = vim.fn.nvim_tree_get_path()
  local relative_path = vim.fn.fnamemodify(cursor_path, ":~:" .. root_path)
  vim.fn.setreg("+", relative_path)
  print("Relative path copied to clipboard:", relative_path)
end
