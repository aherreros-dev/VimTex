--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  LINE & BLOCK MOVEMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Mini.move: Move lines and blocks seamlessly with Alt+hjkl
  
  - Move single lines or entire blocks up/down/left/right
  - Intelligent indentation handling
  - No need for dd + p or complex rearrangements
  - Fast refactoring for reorganizing code structure
--]]

return {
  "echasnovski/mini.move",
  version = false,
  event = "VeryLazy",
  config = function()
    require("mini.move").setup({
      mappings = {
        -- Move with Alt + hjkl
        left = "<M-h>",
        right = "<M-l>",
        down = "<M-j>",
        up = "<M-k>",
        -- Move line motions
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
