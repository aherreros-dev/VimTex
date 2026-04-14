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
  config = function()
    require("barbecue").setup({
      theme = "auto",
      exclude_filetypes = { "gitcommit", "fugitive", "Trouble", "packer", "neo-tree" },
      
      show_modified = true,
      
      -- Beautiful separators and symbols
      symbols = {
        separator = "  ",  -- Flecha bonita como separador
        modified = "●",     -- Punto rojo para modificados
      },
      
      -- Define custom theme with colors
      theme = {
        normal = {
          fg = "#abb2bf",
          bg = "#282c34",
        },
        ellipsis = {
          fg = "#808080",
          bg = "#282c34",
        },
        separator = {
          fg = "#61afef",
          bg = "#282c34",
        },
        modified = {
          fg = "#e06c75",
          bg = "#282c34",
        },
      },
      
      -- Enable icons from web-devicons
      show_navic = true,
      
      -- Context separator padding
      context_follow_icon_color = true,
    })

    -- Setup custom highlight groups for better visuals
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_hl(0, "Barbecue", { bg = "#1e222a", fg = "#abb2bf" })
    vim.api.nvim_set_hl(0, "BarbecueSeparator", { bg = "#1e222a", fg = "#61afef" })
    vim.api.nvim_set_hl(0, "BarbecueModified", { bg = "#1e222a", fg = "#e06c75" })
    
    -- Optional: Toggle barbecue with a keymap
    vim.keymap.set("n", "<leader>bc", function()
      vim.cmd("Barbecue")
    end, opts)
  end,
}
