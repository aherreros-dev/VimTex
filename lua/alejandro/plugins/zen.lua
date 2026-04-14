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
    opts = {
      dimming = {
        alpha = 0.25, -- amount of dimming
        color = { "Normal", "#ffffff" },
        term_bg = "#000000",
        inactive = false,
      },
      context = 10, -- lines of context to show
      treesitter = true, -- use treesitter for smarter dimming
      exclude = {
        "help", -- don't dim help files
        "NvimTree",
        "which-key",
        "Trouble",
      },
    },
    config = function(_, opts)
      require("twilight").setup(opts)

      vim.keymap.set("n", "<leader>tw", "<cmd>Twilight<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window
        width = 0.85, -- width of the Zen window (percentage of screen width)
        height = 0.85, -- height of the Zen window (percentage of screen height)
        options = {
          signcolumn = "no", -- disable signcolumn (for gitsigns, etc.)
          number = false, -- disable line numbers
          relativenumber = false, -- disable relative line numbers
          cursorline = false, -- disable cursor line
          cursorcolumn = false, -- disable cursor column
          foldcolumn = "0", -- disable fold column
          list = false, -- disable whitespace characters
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
          laststatus = 0, -- turn off the statusline in zen mode
        },
        twilight = { enabled = true }, -- enable twilight when zen mode is active
        gitsigns = { enabled = false }, -- disable gitsigns
        tmux = { enabled = false }, -- disables the tmux statusline
      },
      on_open = function(win)
        -- Add any custom behavior when entering zen mode
      end,
      on_close = function()
        -- Add any custom behavior when exiting zen mode
      end,
    },
    config = function(_, opts)
      require("zen-mode").setup(opts)

      vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { noremap = true, silent = true })
    end,
  },
}
