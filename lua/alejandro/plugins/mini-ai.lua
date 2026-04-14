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
      n_lines = 50, -- How many lines to scan ahead/behind for textobjects
      custom_textobjects = nil,
      search_method = "cover_or_next",
      {
        id = "b", -- brackets
        desc = "Balanced brackets",
      },
      {
        id = "q", -- quotes
        desc = "Quotes",
      },
      {
        id = "t", -- tags
        desc = "Tag",
      },
    })

    -- Optional: enhance vim motions with mini.move
    -- Move lines and blocks with Alt+hjkl
    require("mini.move").setup({
      mappings = {
        -- move with arrows or alt+hjkl
        left = "<M-h>",
        right = "<M-l>",
        down = "<M-j>",
        up = "<M-k>",
        line_left = "<M-h>",
        line_right = "<M-l>",
        line_down = "<M-j>",
        line_up = "<M-k>",
      },
      options = {
        reindent_linewise = true,
      },
    })
  end,
}
