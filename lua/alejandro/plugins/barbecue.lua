--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  BREADCRUMB CONTEXT DISPLAY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Shows the current context (class/function/module) at the top of the window:
  - Always see where you are in the codebase structure
  - Navigate to parent contexts with single click
  - Reduces cognitive load when working in large files
  - Works with Treesitter for accurate AST navigation
--]]

return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- Barbecue theme - matches your colorscheme
    theme = "auto",
    
    -- Create a custom theme that works with your setup
    exclude_filetypes = { "gitcommit", "fugitive", "Trouble", "packer" },
    
    -- Show modified indicator
    show_modified = true,
    
    -- Breadcrumb separator
    symbols = {
      separator = " > ",
    },
  },
  config = function(_, opts)
    require("barbecue").setup(opts)

    -- Keymap to jump to the breadcrumb context
    vim.keymap.set("n", "<leader>bc", function()
      require("barbecue.ui").toggle()
    end, { noremap = true, silent = true })
  end,
}
