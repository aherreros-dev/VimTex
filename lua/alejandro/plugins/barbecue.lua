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
    -- Gruvbox dark theme colors
    local gruvbox_bg = "#282828"
    local gruvbox_fg = "#ebdbb2"
    local gruvbox_aqua = "#83a598"
    local gruvbox_orange = "#fe8019"
    local gruvbox_red = "#fb4934"

    require("barbecue").setup({
      attach_navic = true,
      show_modified = true,
      exclude_filetypes = { "gitcommit", "fugitive", "Trouble", "neo-tree", "toggleterm" },
      
      symbols = {
        separator = " › ",
        modified = " ●",
      },
      
      -- Gruvbox theme
      theme = {
        normal = {
          fg = gruvbox_fg,
          bg = gruvbox_bg,
        },
        separator = {
          fg = gruvbox_aqua,
          bg = gruvbox_bg,
        },
        modified = {
          fg = gruvbox_orange,
          bg = gruvbox_bg,
        },
        dirname = {
          fg = gruvbox_aqua,
          bg = gruvbox_bg,
        },
        basename = {
          bold = true,
          fg = gruvbox_fg,
          bg = gruvbox_bg,
        },
        context = {
          fg = gruvbox_orange,
          bg = gruvbox_bg,
        },
      },
      
      context_follow_icon_color = true,
      include_buftypes = { "", "terminal" },
    })

    -- Highlight groups
    vim.api.nvim_set_hl(0, "BarbecueNormal", { fg = gruvbox_fg, bg = gruvbox_bg })
    vim.api.nvim_set_hl(0, "BarbecueSeparator", { fg = gruvbox_aqua, bg = gruvbox_bg })
    vim.api.nvim_set_hl(0, "BarbecueModified", { fg = gruvbox_orange, bg = gruvbox_bg })
    vim.api.nvim_set_hl(0, "BarbecueDirname", { fg = gruvbox_aqua, bg = gruvbox_bg })
    vim.api.nvim_set_hl(0, "BarbecueBasename", { fg = gruvbox_fg, bg = gruvbox_bg, bold = true })
    vim.api.nvim_set_hl(0, "BarbecueContext", { fg = gruvbox_orange, bg = gruvbox_bg })
  end,
}
