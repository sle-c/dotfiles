local M = {}
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

M.setup = function()
  local format_kind_icons = {
    Class = " ",
    Color = " ",
    Constant = "ﲀ ",
    Constructor = " ",
    Enum = "練",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = "",
    Folder = " ",
    Function = " ",
    Interface = "ﰮ ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Operator = "",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = "塞",
    Value = " ",
    Variable = " ",
  }

  local format_source_names = {
    nvim_lsp = "(LSP)",
    emoji = "(Emoji)",
    path = "(Path)",
    calc = "(Calc)",
    cmp_tabnine = "(Tabnine)",
    -- vsnip = "(Snippet)",
    -- luasnip = "(Snippet)",
    buffer = "(Buffer)",
  }

  local format_duplicates = {
    buffer = 1,
    path = 1,
    nvim_lsp = 0,
    -- luasnip = 1,
  }

  local cmp = require 'cmp'

  local confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  }

  cmp.setup({
    formatting = {
      fields = { "kind", "abbr", "menu" },
      kind_icons = format_kind_icons,
      source_names = format_source_names,
      duplicates = format_duplicates,
      duplicates_default = 0,
      format = function(entry, vim_item)
        vim_item.kind = format_kind_icons[vim_item.kind]
        vim_item.menu = format_source_names[entry.source.name]
        vim_item.dup = format_duplicates[entry.source.name]
          or 0
        return vim_item
      end,
    },
    confirm_opts = confirm_opts,
    completion = {
      ---@usage The minimum length of a word to complete on.
      keyword_length = 1,
    },
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

  local lspconfig = require('lspconfig')
  lspconfig['tsserver'].setup {
    capabilities = capabilities
  }
  lspconfig['sorbet'].setup {
    capabilities = capabilities
  }
  lspconfig['solargraph'].setup {
    capabilities = capabilities
  }
end

return M
