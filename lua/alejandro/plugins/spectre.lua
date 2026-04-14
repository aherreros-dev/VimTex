--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ADVANCED FIND & REPLACE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Find and replace across multiple files with live preview:
  - Search in entire project or specific folders
  - Real-time preview of replacements before applying
  - Replace individual matches or entire files
  - Much more powerful than Vim's native :substitute command
  - Perfect for refactoring and large-scale changes
--]]

return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local spectre = require("spectre")
    
    spectre.setup({
      color_search = "",
      open_cmd = "noswapfile vnew",
      live_update = false,
    })

    -- Keybindings
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>S", "<cmd>Spectre<CR>", opts)
    vim.keymap.set("v", "<leader>S", "<esc><cmd>Spectre<CR>", opts)
  end,
}
