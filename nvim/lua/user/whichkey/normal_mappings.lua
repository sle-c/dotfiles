local M = {}
local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local keys = {
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["b"] = {
    ":Buffers<cr>",
    "Buffers",
  },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["c"] = { "<cmd>bdelete!<CR>", "Close Buffer" },
  ["f"] = {
    name = "Find",
    ["f"] = { ":Files<CR>", "Find files", },
    ["F"] = { ":RG<CR>", "Find Text RG" },
  },
--
  ["F"] = {
    name = "Format",
    s = {
      name = "Split Join",
      s = { "<cmd>SplitjoinSplit<cr>", "Split" },
      j = { "<cmd>SplitjoinJoin<cr>", "Join" },
    },
  },

  n = {
    name = "Navigation",
    w = { "<cmd>HopWord<cr>", "Hop Word" },
    l = { "<cmd>HopLine<cr>", "Hop Line" },
    L = { "<cmd>HopLineStart<cr>", "Hop Line Start" },
    p = { "<cmd>HopPattern<cr>", "Hop Pattern" },
    c = {
      name = "Hop Char",
      ["1"] = { "<cmd>HopChar1<cr>", "Hop Char 1" },
      ["2"] = { "<cmd>HopChar2<cr>", "Hop Char 2" },
    },
  },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { ":GFiles?<cr>", "Open changed file" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
  },
  s = {
    name = "Search",
    h = { "<cmd>nohlsearch<CR>", "No Highlight" },
    c = { ":Colors<CR>", "Colorscheme" },
    e = { ":Helptags<CR>", "Find Help" },
    r = { ":History<cr>", "Open Recent File" },
    k = { ":Maps<cr>", "Normal mode keymap" },
    C = { ":Commands<cr>", "Commands" },
  },

  t = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },

  y = {
    name = "Yank",
    p = { ":let @+ = expand('%')<cr>", "Yank file Path"},
    l = { ":let @+ = expand('%').':'.line('.')<cr>", "Yank file Path with line number"},
    b = { ":let @+ = expand('%:p')<cr>", "Yank file aBsolute path"},
    n = { ":let @+ = expand('%:t')<cr>", "Yank file name"},
    d = { ":let @+ = expand('%:p:h')<cr>", "Yank directory path"},
  }
}

M.keys = keys
M.opts = opts

return M
