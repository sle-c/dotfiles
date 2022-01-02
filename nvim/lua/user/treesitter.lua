local ok, configs = pcall(require, "nvim-treesitter.config")
if not ok then
  vim.notify("Cannot load treesitter")
  return
end

configs.setup {
  ensure_installed = {
    "typescript",
    "ruby",
    "go",
    "javascript",
    "graphql",
    "svelte",
    "markdown",
    "rust",
    "toml",
    "tsx",
    "yaml",
    "json",
    "html",
    "css",
  },
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "html" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autopairs = {
    enable = true
  },
}
