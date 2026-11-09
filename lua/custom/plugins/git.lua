vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/kdheepak/lazygit.nvim',
}

vim.g.lazygit_floating_window_scaling_factor = 0.9
vim.g.lazygit_floating_window_use_plenary = 0
vim.g.lazygit_use_neovim_remote = 1 -- open files from lazygit in *this* nvim

vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'Lazy[G]it' })
vim.keymap.set('n', '<leader>gf', '<cmd>LazyGitCurrentFile<cr>', { desc = 'LazyGit current [F]ile' })
vim.keymap.set('n', '<leader>gl', '<cmd>LazyGitLog<cr>', { desc = 'LazyGit [L]og' })
