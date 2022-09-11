-- keybindings.lua

-- Leader
vim.g.mapleader = ' '

-- Reload
vim.api.nvim_set_keymap('n', '<Leader>ll', ':source ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })

-- splits
vim.api.nvim_set_keymap('n', '<Leader>;', ':vne<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<Leader>'", ':new<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>j', '<C-w><C-j>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', '<C-w><C-k>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>l', '<C-w><C-l>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', '<C-w><C-h>', { noremap = true, silent = true })

-- resizing
vim.api.nvim_set_keymap('n', '<Leader><S-j>', ':res -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><S-k>', ':res +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><S-h>', ':vert :res -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><S-l>', ':vert :res +5<CR>', { noremap = true, silent = true })

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>ff', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgg', [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true })

-- nvim-tree
vim.api.nvim_set_keymap('n', '<Leader>nn', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- buffers
vim.api.nvim_set_keymap('n', '<Leader>bn', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bb', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bd', ':bd%<CR>', { noremap = true, silent = true })
