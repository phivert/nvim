---- behaviour ----
-- clipboard
vim.g.clipboard = {
	name = 'wsl clipboard',
  copy =  { ["+"] = { "clip.exe" },   ["*"] = { "clip.exe" } },
  paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" } },
  cache_enabled = true
}
-- swapfile
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- search highlights
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- colors
vim.opt.termguicolors = true

---- format ----
-- indentaton
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- line numbers
vim.opt.nu = true
-- relative line number
vim.opt.rnu = true
-- endline wrap
vim.opt.wrap = true
-- scroll limit
vim.opt.scrolloff =8
-- breakpoint
vim.opt.signcolumn = "yes"
-- filename
vim.opt.isfname:append("@-@")
