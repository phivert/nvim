--- keybindings ----

---- system keymaps -----

vim.g.mapleader = " " ---- main key

---- tabs
vim.keymap.set("n", "<leader>t", vim.cmd.tabnew)
vim.keymap.set("n", "<S-t>", vim.cmd.tabc)
vim.keymap.set("n", "<Tab>", vim.cmd.tabnext)

---- split
vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>n", vim.cmd.split)

vim.api.nvim_set_keymap('n', '<leader>$', '<C-w>w', { noremap = true })
vim.keymap.set("n", "<leader>q", vim.cmd.quit)

---- tree explorer ----

vim.keymap.set("n", "<leader>ee", vim.cmd.NvimTreeToggle)

---- terminal ----

vim.keymap.set({"n", "t"}, "²", function () require("nvterm.terminal").toggle('horizontal') end)

---- dap configuration ----

vim.keymap.set("n", "<F2>", function() require'dap'.close() end)
vim.keymap.set("n", "<F5>", function() require'dap'.continue() end)
vim.keymap.set("n", "<F10>", function() require'dap'.step_over() end)
vim.keymap.set("n", "<F6>", function() require'dap'.step_into() end)
vim.keymap.set("n", "<F12>", function() require'dap'.step_out() end)
vim.keymap.set("n", "<leader>b", function() require'dap'.toggle_breakpoint() end)
vim.keymap.set("n", "<F1>", function() require'dapui'.toggle() end)

---- telescope ----

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end)



