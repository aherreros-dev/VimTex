--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  MODERN UI NOTIFICATIONS & CMDLINE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Noice: Transforms the UI with stunning visual effects
  
  - Beautiful command line with gradient and animations
  - Elegant notifications with smooth transitions
  - Modern message rendering with transparency effects
  - Vim command history visualizer
  - Cyberpunk aesthetic throughout
--]]

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = {
        silent = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
    cmdline = {
      view = "cmdline_popup",
      format = {
        cmdline = { pattern = "^:", icon = " 󰘳 ", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " 󰈞 ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " 󰈞 ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = " 󰈷 ", lang = "bash" },
        lua = { pattern = "^:%s*lua%s+", icon = " 󰟒 ", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
      },
    },
    messages = {
      enabled = true,
      view = "notify",
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
      view_search = "virtualtext",
    },
    popupmenu = {
      enabled = true,
      backend = "nui",
      kind_icons = true,
    },
    redirect = {
      view = "popup",
      filter = { event = "msg_show" },
    },
    document_highlight = {
      enabled = true,
    },
    health = {
      checker = true,
    },
  },
  config = function(_, opts)
    require("noice").setup(opts)

    -- Keybindings
    vim.keymap.set("c", "<S-Enter>", function()
      require("noice").redirect(vim.fn.getcmdline())
    end, { remap = true })

    -- Dismiss Noice message
    vim.keymap.set("n", "<leader>nd", function()
      require("noice").dismiss({ skip_history = true })
    end, { noremap = true, silent = true })

    -- Show message history
    vim.keymap.set("n", "<leader>nh", "<cmd>NoiceHistory<CR>", { noremap = true, silent = true })
  end,
}
