--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  EPIC STARTUP SCREEN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Dashboard: Beautiful and functional home screen
  
  - Stunning ASCII art header
  - Quick access to recent files
  - Shortcuts to common commands
  - Animated loading screen
  - Modern cyberpunk aesthetic
--]]

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local db = require("dashboard")
    local logo = [[
      ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
      ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
      ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
      ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
      ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]

    db.setup({
      theme = "doom",
      config = {
        header = vim.split(logo, "\n"),
        center = {
          {
            icon = " ",
            desc = "Find File",
            action = "Telescope find_files",
            key = "f",
          },
          {
            icon = " ",
            desc = "Recent Files",
            action = "Telescope oldfiles",
            key = "r",
          },
          {
            icon = " ",
            desc = "Find Text",
            action = "Telescope live_grep",
            key = "g",
          },
          {
            icon = " ",
            desc = "New File",
            action = "enew",
            key = "n",
          },
          {
            icon = " ",
            desc = "Projects",
            action = "Telescope projects",
            key = "p",
          },
          {
            icon = " ",
            desc = "Config",
            action = "edit ~/.config/nvim/init.lua",
            key = "c",
          },
          {
            icon = " ",
            desc = "Quit",
            action = "qa",
            key = "q",
          },
        },
        footer = {
          "",
          "🚀 Welcome back! Code faster. Think deeper. Make magic.",
        },
      },
    })

    -- Keybindings for dashboard
    vim.keymap.set("n", "<leader>d", "<cmd>Dashboard<CR>", { noremap = true, silent = true })
  end,
}
