--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  EPIC STARTUP SCREEN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Dashboard: Beautiful and functional home screen
  
  - Stunning ASCII art header
  - Quick access to recent files
  - Shortcuts to common commands
  - Modern cyberpunk aesthetic
--]]

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local db = require("dashboard")

    db.setup({
      theme = "doom",
      config = {
        header = {
          "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
          "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
          "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
          "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        },
        center = {
          {
            icon = "  ",
            desc = "Find File",
            action = "Telescope find_files",
            key = "f",
          },
          {
            icon = "  ",
            desc = "Recent Files",
            action = "Telescope oldfiles",
            key = "r",
          },
          {
            icon = "  ",
            desc = "Find Text",
            action = "Telescope live_grep",
            key = "g",
          },
          {
            icon = "  ",
            desc = "New File",
            action = "enew",
            key = "n",
          },
          {
            icon = "  ",
            desc = "Projects",
            action = "Telescope projects",
            key = "p",
          },
        },
        footer = { "🚀 Welcome back! Code faster. Think deeper. Make magic." },
      },
    })
  end,
}
