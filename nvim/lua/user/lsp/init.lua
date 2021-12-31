local lsp_ok, _ = pcall(require, "lspconfig")
if not lsp_ok then
  vim.notify("Cannot load lspconfig")
  return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
