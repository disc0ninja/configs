-- keybindings.lua

-- Leader
vim.g.mapleader = ' '

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>ff', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fgg', [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true})

-- nvim-tree
vim.api.nvim_set_keymap('n', '<Leader>nn', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
