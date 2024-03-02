return {
 "catppuccin/nvim",
 lazy = false,
 name = "catppuccin", 
 priority = 1000,
 config = function()
   flavour = "frappe", -- Other theme options (latte, frappe, mocha)
  -- background = { -- :h background
  --     light = "frappe",
  --     dark = "frappe",
  -- },

  -- dim_inactive = {
  --   enabled = false,
  --   shade = "dark",
  --   percentage = 0.15,
  -- },

  -- no_italic = false, 
  -- no_bold = false,
  -- no_underline = false,

  -- styles = {
  --     comments = { "italic" },
  --     conditionals = { "italic" },
  --   }

vim.cmd.colorscheme "catppuccin-frappe"

end
}
