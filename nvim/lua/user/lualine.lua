local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then return ''
    elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
       return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
    end
    return str
  end
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local dynamic_hide_in_width = function(width)
  return function()
    return vim.fn.winwidth(0) > width
  end
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
  cond = dynamic_hide_in_width(60),
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = dynamic_hide_in_width(60),
}

local mode = {
  function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    vim.api.nvim_command('hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg)
    return ''
  end,
  color = 'LualineMode',
  padding = { right = 1 },
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
  cond = hide_in_width,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
  cond = dynamic_hide_in_width(60),
}

local location = {
	"location",
	padding = 0,
  cond = hide_in_width
}

local filename = {
  "filename",
  path = 1,
  shorting_target = 40,
  symbols = {
    modified = ' ',      -- Text to show when the file is modified.
    readonly = '[readonly]',      -- Text to show when the file is non-modifiable or readonly.
    unnamed = '[No Name]', -- Text to show for unnamed buffers.
  }
}

local encoding = {
  "encoding",
  cond = hide_in_width,
}

-- cool function for progress
local progress = {
  function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  cond = hide_in_width,
}

local spaces = {
  function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  cond = hide_in_width,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { diagnostics, filename },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { diff, spaces, encoding, filetype },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
    lualine_c = {
      filename,
    },
		lualine_x = { "branch" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
