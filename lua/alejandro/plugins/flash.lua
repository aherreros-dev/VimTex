--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  EFFICIENT MOTION & SELECTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Flash: Lightning-fast motion using visual search labels
  
  - Leap to any location with minimal keystrokes
  - Smart label generation for immediate jumps
  - Works with both motions and text objects
  - Replaces/complements f/F/t/T for better efficiency
  - Seamless integration with operators (d, c, y, etc.)
--]]

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    labels = "abcdefghijklmnopqrstuvwxyz",
    search = {
      multi_window = true,
      forward = true,
      wrap = true,
      incremental = false,
    },
    jump = {
      jumplist = true,
      pos = "start", -- 'start' or 'end'
      history = true,
      register = true,
      nohlsearch = false,
    },
    label = {
      uppercase = true,
      before = true,
      after = true,
      reuse = "lowercase",
    },
    highlight = {
      backdrop = true,
      matches = true,
      priority = 5000,
    },
    action = nil,
    pattern = "", -- shown in the label window when using incremental search
    prompt = "Flash: ",
    win_opts = {
      relative = "editor",
      width = 20,
      height = 1,
      row = -1,
      col = 0,
      zindex = 1000,
    },
    modes = {
      search = {
        enabled = true,
      },
      char = {
        enabled = true,
        -- dynamic configuration
        config = function(opts)
          -- autohide flash when in operator-pending mode
          opts.autohide =
            opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")
        end,
      },
    },
  },
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash jump",
    },
    {
      "S",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Flash Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
