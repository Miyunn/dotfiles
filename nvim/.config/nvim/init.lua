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
vim.api.nvim_set_keymap("n", "<leader>rn", ":set relativenumber!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>nn", ":set number!<CR>", { noremap = true, silent = true })

-- Enable system clipboard interactions with yank and paste
vim.opt.clipboard:append("unnamedplus")
vim.api.nvim_set_keymap("n", "p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("v", "P", '"+p', { noremap = true })
vim.api.nvim_set_keymap("n", "y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

-- Allow mouse in all vim modes (cause why not)
-- vim.opt.mouse = "a"

-- Splitting buffer
vim.api.nvim_set_keymap("n", "<leader>hp", ":split<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>vp", ":vsplit<CR>", { noremap = true, silent = true })

-- Bidning to set from buffer to buffer
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local float_opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    }

    if not vim.b.diagnostics_pos then
      vim.b.diagnostics_pos = { nil, nil }
    end

    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    if
        (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
        and #vim.diagnostic.get() > 0
    then
      vim.diagnostic.open_float(nil, float_opts)
    end

    vim.b.diagnostics_pos = cursor_pos
  end,
})
