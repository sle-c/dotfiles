local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("Cannot load treesitter")
  return
end

configs.setup {
  ensure_installed = {
    "typescript",
    "go",
    "javascript",
    "graphql",
    "markdown",
    "rust",
    "toml",
    "tsx",
    "yaml",
    "json",
    "html",
    "css",
    "scss",
  },
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "html" },
    additional_vim_regex_highlighting = false,
  },
  hidesig = { enable = true, opacity = 0.6 },
  indent = { enable = true, disable = { "yaml", "ruby" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autopairs = {
    enable = true
  },
}
