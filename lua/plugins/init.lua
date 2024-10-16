local default_plugins = {
  "nvim-lua/plenary.nvim",
  "ThePrimeagen/harpoon",
  "mhartington/formatter.nvim",
  -- "nvim-treesitter/nvim-treesitter-context",
  "williamboman/nvim-lsp-installer",
  "alvan/vim-closetag",
  "rktjmp/lush.nvim",
  "OmniSharp/omnisharp-vim",
  {
    "supermaven-inc/supermaven-nvim",
  },
  {
    "karb94/neoscroll.nvim",
  },
  {
    "windwp/nvim-ts-autotag",
  },
  {
    "gen740/SmoothCursor.nvim",
    config = function()
      require("smoothcursor").setup()
    end,
  },
  {
    "yuttie/comfortable-motion.vim",
  },
  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  --   config = function() -- Mapping tab is already used by NvChad
  --     vim.g.copilot_no_tab_map = true
  --     vim.g.copilot_assume_mapped = true
  --     vim.g.copilot_tab_fallback = ""
  --     -- The mapping is set to other key, see custom/lua/mappings
  --     -- or run <leader>ch to see copilot mapping section
  --   end,
  -- },
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     {
  --       "rcarriga/nvim-notify",
  --       config = function()
  --         require("notify").setup {
  --           top_down = false,
  --         }
  --       end,
  --     },
  --   },
  -- },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "briones-gabriel/darcula-solid.nvim",
    config = function()
      -- vim.cmd "colorscheme darcula-solid"
    end,
  },
  {
    "kawre/leetcode.nvim",
    cmd = "Leet",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      arg = "leetcode.nvim",
      lang = "python3",
      logging = "true",
      injector = {
        ["python3"] = {
          before = true,
        },
      },
    },
    config = function()
      require("leetcode").setup()
    end,
  },
  {
    "wintermute-cell/gitignore.nvim",
    config = function()
      require("gitignore").setup()
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  { "sindrets/diffview.nvim", lazy = false },
  {
    "tpope/vim-fugitive",
    lazy = false,
    opt = true,
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gedit",
      "Gsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "Glgrep",
      "Gmove",
      "Gdelete",
      "Gremove",
      "Gbrowse",
    },
  },
  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    config = function()
      require("scrollbar").setup()
    end,
  },
  {
    "doums/darcula",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme "darcula-solid"
      -- vim.cmd "set termguicolors"
      -- vim.cmd "highlight Visual guifg=#000000 guibg=#6495ED gui=none"
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {},
  },
  {
    "terryma/vim-expand-region",
    config = function()
      vim.api.nvim_set_keymap("v", "<C-w>", "<Plug>(expand_region_expand)", { noremap = false, silent = true })
      vim.api.nvim_set_keymap("v", "<C-S-w>", "<Plug>(expand_region_shrink)", { noremap = false, silent = true })
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}
      require("telescope").load_extension "projects"
    end,
  },
  {
    "michaelb/sniprun",
    branch = "master",

    build = "sh install.sh",
    config = function()
      require("sniprun").setup {
        repl_enable = { "Python3_original" },
        interpreter_options = {
          Go_original = {
            compiler = "gccgo",
          },
        },
      }
    end,
  },
  -- {
  --   "chrisgrieser/nvim-tinygit",
  --   ft = { "gitrebase", "gitcommit" }, -- so ftplugins are loaded
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-telescope/telescope.nvim", -- either telescope or fzf-lua
  --     -- "ibhagwan/fzf-lua",
  --     "rcarriga/nvim-notify", -- optional, but will lack some features without it
  --   },
  --   config = function()
  --     require("tinygit").smartCommit { pushIfClean = false }
  --     vim.keymap.set("n", "<leader>ga", "<cmd>Gitsigns add_hunk<CR>") -- gitsigns.nvim
  --     vim.keymap.set("n", "<leader>gc", function()
  --       require("tinygit").smartCommit()
  --     end)
  --     vim.keymap.set("n", "<leader>gp", function()
  --       require("tinygit").push()
  --     end)
  --   end,
  -- },
  {
    "f-person/git-blame.nvim",
    config = function()
      require("gitblame").setup {
        enabled = true,
      }
      vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
    end,
  },
  {
    "aznhe21/actions-preview.nvim",
    config = function()
      vim.keymap.set({ "v", "n" }, "gf", require("actions-preview").code_actions)
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup {
        theme = "hyper",
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Files",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },
            {
              desc = " Apps",
              group = "DiagnosticHint",
              action = "Telescope app",
              key = "a",
            },
            {
              desc = " dotfiles",
              group = "Number",
              action = "Telescope dotfiles",
              key = "d",
            },
          },
        },
      }
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  {
    "ziontee113/color-picker.nvim",
    config = function()
      require "color-picker"
    end,
  },
  {
    "EtiamNullam/deferred-clipboard.nvim",
    config = function()
      require("deferred-clipboard").setup {
        lazy = true,
        fallback = "unnamedplus",
      }
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { "kkharji/sqlite.lua", module = "sqlite" },
      { "nvim-telescope/telescope.nvim" },
    },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup {
        prompt_func_return_type = {
          go = false,
          java = false,

          cpp = false,
          c = false,
          h = false,
          hpp = false,
          cxx = false,
        },
        prompt_func_param_type = {
          go = false,
          java = false,

          cpp = false,
          c = false,
          h = false,
          hpp = false,
          cxx = false,
        },
        printf_statements = {},
        print_var_statements = {},
        show_success_message = true, -- shows a message with information about the refactor on success
        -- i.e. [Refactor] Inlined 3 variable occurrences
      }
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },
  { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } },
  {
    "NvChad/base46",
    branch = "v2.0",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "NvChad/ui",
    branch = "v2.0",
    lazy = false,
  },

  {
    "NvChad/nvterm",
    init = function()
      require("core.utils").load_mappings "nvterm"
    end,
    config = function(_, opts)
      require "base46.term"
      require("nvterm").setup(opts)
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "User FilePost",
    config = function(_, opts)
      require("colorizer").setup(opts)

      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      return { override = require "nvchad.icons.devicons" }
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "devicons")
      require("nvim-web-devicons").setup(opts)
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    version = "2.20.7",
    event = "User FilePost",
    opts = function()
      return require("plugins.configs.others").blankline
    end,
    config = function(_, opts)
      require("core.utils").load_mappings "blankline"
      dofile(vim.g.base46_cache .. "blankline")
      require("indent_blankline").setup(opts)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    tag = "v0.9.2",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "plugins.configs.treesitter"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require("plugins.configs.others").gitsigns
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "git")
      require("gitsigns").setup(opts)
    end,
  },

  -- lsp stuff
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function()
      return require "plugins.configs.mason"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "mason")
      require("mason").setup(opts)

      -- custom nvchad cmd to install all mason binaries listed
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})

      vim.g.mason_binaries_list = opts.ensure_installed
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("plugins.configs.others").luasnip(opts)
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "plugins.configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    init = function()
      require("core.utils").load_mappings "comment"
    end,
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },

  -- file managing , picker etc
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function()
      require("core.utils").load_mappings "nvimtree"
    end,
    opts = function()
      local opts = require "plugins.configs.nvimtree"
      opts.view.number = false
      return opts
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    init = function()
      require("core.utils").load_mappings "telescope"
    end,
    opts = function()
      return require "plugins.configs.telescope"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },

  -- Only load whichkey after all the gui
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    init = function()
      require("core.utils").load_mappings "whichkey"
    end,
    cmd = "WhichKey",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
    end,
  },
}

local config = require("core.utils").load_config()

if #config.plugins > 0 then
  table.insert(default_plugins, { import = config.plugins })
end

require("lazy").setup(default_plugins, config.lazy_nvim)

-- lualine config

-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require "lualine"
local git_blame = require "gitblame"
-- Now don't forget to initialize lualine
lualine.setup {
  sections = {
    lualine_c = {
      { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
    },
  },
}

-- neoclip setup
require("neoclip").setup()

require("formatter").setup {
  logging = false,
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    go = {
      function()
        return {
          exe = "gofmt",
          stdin = true,
        }
      end,
    },
    python = {
      require("formatter.filetypes.python").black,
    },
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
  group = "__formatter__",
  command = ":FormatWrite",
})

require("actions-preview").setup {
  diff = {
    algorithm = "patience",
    ignore_whitespace = true,
  },
  telescope = require("telescope.themes").get_dropdown { winblend = 10 },
}

-- require("treesitter-context").setup {
--   enable = true,
--   max_lines = 0,
--   min_window_height = 0,
--   line_numbers = true,
--   multiline_threshold = 20,
--   trim_scope = "outer",
--   mode = "cursor",
--   separator = nil,
--   zindex = 20,
--   on_attach = nil,
-- }

require("nvim-lsp-installer").setup {}

-- setup for refactoring
require("refactoring").setup()

require("nvim-ts-autotag").setup {
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = true,
  },
}

require("supermaven-nvim").setup {
  keymaps = {
    accept_suggestion = "<C-l>",
    clear_suggestion = "<C-]>",
    accept_word = "<C-j>",
  },
  ignore_filetypes = { cpp = true }, -- or { "cpp", }
  color = {
    suggestion_color = "#D3D3D3",
    cterm = 244,
  },
  log_level = "info", -- set to "off" to disable logging completely
  disable_inline_completion = false, -- disables inline completion for use with cmp
  disable_keymaps = false, -- disables built in keymaps for more manual control
  condition = function()
    return false
  end,
}

require("neoscroll").setup()
local neoscroll = require "neoscroll"
local keymap = {
  ["<C-u>"] = function()
    neoscroll.ctrl_u { duration = 250 }
  end,
  ["<C-d>"] = function()
    neoscroll.ctrl_d { duration = 250 }
  end,
  ["<C-b>"] = function()
    neoscroll.ctrl_b { duration = 450 }
  end,
  ["<C-f>"] = function()
    neoscroll.ctrl_f { duration = 450 }
  end,
  ["<C-y>"] = function()
    neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
  end,
  ["<C-e>"] = function()
    neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
  end,
  ["zt"] = function()
    neoscroll.zt { half_win_duration = 250 }
  end,
  ["zz"] = function()
    neoscroll.zz { half_win_duration = 250 }
  end,
  ["zb"] = function()
    neoscroll.zb { half_win_duration = 250 }
  end,
}
local modes = { "n", "v", "x" }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end

-- Set background to dark and enable true color support
-- vim.opt.background = "light"
-- vim.opt.termguicolors = true

-- Load the color scheme
-- vim.cmd "colorscheme darcula-solid"
