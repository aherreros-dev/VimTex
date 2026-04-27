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
  event = "BufReadPost",
  config = function()
    -- GRUVBOX theme (desactivado, conservado para recuperar)
    --[[
    local gruvbox_bg     = "#282828"
    local gruvbox_fg     = "#ebdbb2"
    local gruvbox_aqua   = "#83a598"
    local gruvbox_orange = "#fe8019"
    local gruvbox_red    = "#fb4934"
    -- theme = { normal = { fg=gruvbox_fg, bg=gruvbox_bg }, ... }
    ]]

    -- AURA theme colors
    local aura_bg     = "#15141b"
    local aura_fg     = "#edecee"
    local aura_purple = "#a277ff"
    local aura_pink   = "#f694ff"
    local aura_cyan   = "#61ffca"
    local aura_dim    = "#6d6d6d"

    require("barbecue").setup({
      attach_navic = true,
      show_modified = true,
      exclude_filetypes = { "gitcommit", "fugitive", "Trouble", "neo-tree", "toggleterm" },

      symbols = {
        separator = " › ",
        modified  = " ●",
      },

      -- Aura theme
      theme = {
        normal    = { fg = aura_fg,     bg = aura_bg },
        separator = { fg = aura_purple, bg = aura_bg },
        modified  = { fg = aura_pink,   bg = aura_bg },
        dirname   = { fg = aura_dim,    bg = aura_bg },
        basename  = { fg = aura_fg,     bg = aura_bg, bold = true },
        context   = { fg = aura_cyan,   bg = aura_bg },
      },

      context_follow_icon_color = true,
      include_buftypes = { "", "terminal" },
    })

    vim.api.nvim_set_hl(0, "BarbecueNormal",    { fg = aura_fg,     bg = aura_bg })
    vim.api.nvim_set_hl(0, "BarbecueSeparator", { fg = aura_purple, bg = aura_bg })
    vim.api.nvim_set_hl(0, "BarbecueModified",  { fg = aura_pink,   bg = aura_bg })
    vim.api.nvim_set_hl(0, "BarbecueDirname",   { fg = aura_dim,    bg = aura_bg })
    vim.api.nvim_set_hl(0, "BarbecueBasename",  { fg = aura_fg,     bg = aura_bg, bold = true })
    vim.api.nvim_set_hl(0, "BarbecueContext",   { fg = aura_cyan,   bg = aura_bg })
  end,
}
