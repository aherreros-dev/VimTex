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
  opts = {
    color_search = "",
    open_cmd = "noswapfile vnew",
    live_update = false, -- Update live as you type
    line_sep = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
    highlight = {
      ui = "String",
      search = "DiffChange",
      replace = "DiffDelete",
    },
    mapping = {
      ["toggle_line"] = {
        map = "dd",
        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
        desc = "Toggle current line",
      },
      ["enter_file"] = {
        map = "<cr>",
        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
        desc = "Edit file",
      },
      ["send_to_qf"] = {
        map = "<leader>q",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        desc = "Send all items to quickfix",
      },
      ["replace_cmd"] = {
        map = "<leader>c",
        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
        desc = "Input replace vim command",
      },
      ["show_option_menu"] = {
        map = "<leader>o",
        cmd = "<cmd>lua require('spectre').show_options()<CR>",
        desc = "Show options",
      },
      ["run_current_replace"] = {
        map = "<leader>rc",
        cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
        desc = "Replace current line",
      },
      ["run_replace"] = {
        map = "<leader>R",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "Replace all",
      },
      ["change_view_mode"] = {
        map = "<leader>v",
        cmd = "<cmd>lua require('spectre').change_view()<CR>",
        desc = "Change result view mode",
      },
      ["toggle_live_update"] = {
        map = "tu",
        cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
        desc = "Update results as you type",
      },
      ["toggle_ignore_case"] = {
        map = "ti",
        cmd = "<cmd>lua require('spectre').toggle_ignore_case()<CR>",
        desc = "Toggle ignore case",
      },
      ["toggle_ignore_hidden"] = {
        map = "th",
        cmd = "<cmd>lua require('spectre').toggle_ignore_hidden()<CR>",
        desc = "Toggle search hidden files",
      },
      ["resume_last_search"] = {
        map = "<leader>l",
        cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
        desc = "Resume last search",
      },
      ["quit"] = {
        map = "q",
        cmd = "<cmd>lua require('spectre').close()<CR>",
        desc = "Quit Spectre",
      },
    },
  },
  config = function(_, opts)
    require("spectre").setup(opts)

    -- Keybindings for opening Spectre
    local keys = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>S", "<cmd>Spectre<CR>", keys)
    vim.keymap.set("n", "<leader>sw", '<cmd>Spectre<CR><cmd>lua require("spectre").change_view("buf_tab")<CR>', keys)
    vim.keymap.set(
      "v",
      "<leader>sw",
      '<esc><cmd>Spectre<CR><cmd>lua require("spectre").change_view("buf_tab")<CR>',
      keys
    )
  end,
}
