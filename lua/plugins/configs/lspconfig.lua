dofile(vim.g.base46_cache .. "lsp")
require "nvchad.lsp"

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end

  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

require("lspconfig").lua_ls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

require("lspconfig").templ.setup {}

require("lspconfig").html.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  filetypes = { "html", "templ" },
}

require("lspconfig").gopls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  single_file_support = true,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
    java = {
      signatureHelp = { enabled = true },
      completion = { enabled = true },
      source = {
        organizeImports = { enabled = true },
        organizeMembers = { enabled = true },
      },
    },
  },
}

-- require("lspconfig").ruff_lsp.setup {
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
--   init_options = {
--     settings = {
--       args = {},
--     },
--   },
-- }

require("lspconfig").pyright.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  cmd = { "pyright-langserver", "--stdio" },
  filetypes = "python",
  single_file_support = true,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      },
    },
  },
}

require("lspconfig").tailwindcss.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  filetypes = { "templ", "astro", "javascript", "typescript", "react" },
  init_options = { userLanguages = { templ = "html" } },
}

-- require("lspconfig").emmet_langauge_server.setup {}

-- emmet config
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").emmet_ls.setup {
  -- on_attach = on_attach,
  capabilities = M.capabilities,
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
  },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
        auto_close_tags = true,
      },
    },
  },
}

return M
