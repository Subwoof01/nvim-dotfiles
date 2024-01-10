local config = require "plugins.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.biome.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "biome", "lsp-proxy" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
  },
  root_dir = lspconfig.util.root_pattern("package.json", "node_modules", ".git", "biome.json"),
  single_file_support = true,
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
}
