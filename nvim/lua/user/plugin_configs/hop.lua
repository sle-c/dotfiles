local M = {}

M.setup = function()
  local hop_ok, hop = pcall(require, 'hop')
  if not hop_ok then
    vim.notify("Cannot load hop")
    return
  end

  hop.setup {}
end

return M
