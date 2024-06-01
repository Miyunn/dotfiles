local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

vim.opt.number = true
vim.opt.relativenumber = true

-- Enable system clipboard interactions with yank and paste 
vim.opt.clipboard:append("unnamedplus")
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('v', 'P', '"+p', { noremap = true })
vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- Allow mouse in all vim modes (cause why not)
vim.opt.mouse = "a"

-- Splitting buffer
vim.api.nvim_set_keymap('n', '<leader>hp', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>vp', ':vsplit<CR>', { noremap = true, silent = true })

-- Bidning to set from buffer to buffer 
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
