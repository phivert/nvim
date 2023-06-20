vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ee", vim.cmd.NvimTreeToggle)

vim.keymap.set({"n", "t"}, "²", function () require("nvterm.terminal").toggle('horizontal') end)

vim.keymap.set("n", "<leader>t", vim.cmd.tabnew)
vim.keymap.set("n", "<S-t>", vim.cmd.tabc)
vim.keymap.set("n", "<Tab>", vim.cmd.tabnext)

vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>b", vim.cmd.split)

vim.api.nvim_set_keymap('n', '<leader>$', '<C-w>w', { noremap = true })

vim.keymap.set("n", "<leader>q", vim.cmd.quit)

