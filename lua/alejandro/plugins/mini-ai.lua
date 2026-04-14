--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  INTELLIGENT TEXT OBJECTS & SELECTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  AI: Improves Vim's default text objects using Treesitter
  
  - Smart selection of functions, classes, conditionals
  - Works with all textobject operators (d, c, v, y, etc.)
  - ai/ii as textobjects for indent blocks
  - al/il as textobjects for Vim lines
  - Better bracket and quote matching
  - Chainable selection growth with v (visual expand)
--]]

return {
  "echasnovski/mini.ai",
  version = false,
  event = "VeryLazy",
  config = function()
    require("mini.ai").setup({
      n_lines = 50,
      custom_textobjects = nil,
      search_method = "cover_or_next",
    })
  end,
}
