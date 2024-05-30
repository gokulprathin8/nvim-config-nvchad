local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "pyright",
  "gopls",
  "templ",
  "jdtls",
  "bashls",
  "jsonls",
  "tailwindcss",
  "emmet_ls",
  "templ",
  "cmake",
  -- "efm",
  "omnisharp",
  -- "emmet_language_server",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
