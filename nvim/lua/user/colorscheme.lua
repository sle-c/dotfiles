local colorscheme = "tokyonight"

if colorscheme == "tokyonight" then
  -- make it darker
  vim.g.tokyonight_style = "night"
end

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
