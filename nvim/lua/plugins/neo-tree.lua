return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal right<CR>', { silent = true })
    vim.keymap.set('n', '<leader>E', ':Neotree filesystem close<CR>', { silent = true })
    vim.cmd('Neotree filesystem reveal right')
  end
}
