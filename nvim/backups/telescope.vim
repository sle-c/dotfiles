" nnoremap <silent> <C-p> <Cmd>Telescope find_files prompt_prefix=🔍<CR>
nnoremap <silent> ;r <Cmd>Telescope live_grep<CR>
nnoremap <silent> \\ <Cmd>Telescope buffers<CR>
nnoremap <silent> ;; <Cmd>Telescope help_tags<CR>
nnoremap <silent> <leader>fw <Cmd>Telescope grep_string<CR>

lua << EOF
local actions = require('telescope.actions')

-- don't preview binaries
local previewers = require('telescope.previewers')
local Job = require('plenary.job')
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = 'file',
    args = { '--mime-type', '-b', filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], '/')[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
        end)
      end
    end
  }):sync()
end

require('telescope').setup {
  defaults = {
    buffer_previewer_maker = new_maker,
    mappings = {
      n = {
        ["q"] = actions.close,
      },
      i = {
        ["<C-p>"] = require('telescope.actions').cycle_history_prev,
      },
    },
    -- path_display = {
    --  "smart",
    -- },
  },
  pickers = {
    find_files = {
      theme = "ivy",
      previewer = false,
    }
  },
}
EOF
