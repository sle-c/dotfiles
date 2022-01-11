local M = {}

local opts = {
  mode = "v", -- Visual mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = false, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local keys = {
  ["F"] = {
    name = "Format",
    t = {
      name = "Tabularize",
      [","] = { ":Tabularize /,<cr>", "Align by ','"},
      [":"] = { ":Tabularize /:<cr>", "Align by ':'"},
      ["="] = { ":Tabularize /=<cr>", "Align by '='"},
      ["#"] = { ":Tabularize /#<cr>", "Align by '#'"},
      ["/"] = { ":Tabularize /\\/\\/<cr>", "Align by '//'"},
      ["-"] = { ":Tabularize /--<cr>", "Align by '--'"},
    }
  },
}

M.keys = keys
M.opts = opts

return M
