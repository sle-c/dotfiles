local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not lsp_installer_ok then
  vim.notify("Cannot load lsp installer")
  return
end

-- Register a handler that will be called for all installed server
-- Alternatively, you may also register handlers on specific server instances instead (example below)
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("user.lsp.settings.sumnekolua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  server:setup(opts)
end)
