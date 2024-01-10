local M = {
  formatters_by_ft = {
    javascript = { "biome" },
    typescript = { "biome" },
    lua = { "stylua" },
  },
}

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

return M
