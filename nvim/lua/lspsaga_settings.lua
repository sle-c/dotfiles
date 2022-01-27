local M = {}

M.setup = function ()
  local saga = require 'lspsaga'
  saga.init_lsp_saga()
end

return M
