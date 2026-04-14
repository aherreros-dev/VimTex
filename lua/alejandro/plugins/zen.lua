--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ZEN MODE & TWILIGHT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Twilight: Dims inactive code, highlights only the current window
  Zen Mode: Distraction-free editing environment
  
  Together they create the ultimate focus mode:
  - Dim surrounding code to reduce mental load
  - Remove UI distractions (line numbers, gutter, etc.)
  - Perfect for deep work sessions and complex problem-solving
  - Toggle on/off instantly with a single command
--]]

return {
  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = function()
      require("twilight").setup({
        dimming = {
          alpha = 0.25,
          color = { "Normal", "#ffffff" },
          inactive = false,
        },
        context = 10,
        treesitter = true,
      })

      vim.keymap.set("n", "<leader>tw", "<cmd>Twilight<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    dependencies = "folke/twilight.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 0.95,
          width = 0.85,
          height = 0.85,
          options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
            cursorline = false,
            cursorcolumn = false,
            foldcolumn = "0",
            list = false,
          },
        },
        plugins = {
          options = {
            enabled = true,
            ruler = false,
            showcmd = false,
            laststatus = 0,
          },
          twilight = { enabled = true },
          gitsigns = { enabled = false },
          tmux = { enabled = false },
        },
      })

      vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { noremap = true, silent = true })
    end,
  },
}
