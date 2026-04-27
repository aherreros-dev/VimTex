--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  STATUSLINE (LUALINE)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Beautiful status bar displaying mode, file info, git status, and more.
  Appears at the bottom of the editor window.
--]]

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    -- GRUVBOX THEME (desactivado, conservado para recuperar)
    --[[
    lualine.setup({
      options = { theme = "gruvbox" },
      sections = {
        lualine_x = {
          { lazy_status.updates, cond = lazy_status.has_updates, color = { fg = "#fabd2f" } },
          { "encoding" }, { "fileformat" }, { "filetype" },
        },
      },
    })
    ]]

    -- AURA THEME — colores neon sobre fondo oscuro Aura
    local aura_colors = {
      bg       = "#15141b",
      bg_dark  = "#0f0e15",
      surface  = "#1d1c24",
      fg       = "#edecee",
      comment  = "#6d6d6d",
      purple   = "#a277ff",  -- accent principal Aura
      pink     = "#f694ff",  -- rosa neon
      cyan     = "#61ffca",  -- verde/cian neon
      blue     = "#82e2ff",  -- azul claro
      orange   = "#ffca85",  -- naranja/amarillo
      red      = "#ff6767",  -- rojo
    }

    local aura_theme = {
      normal = {
        a = { bg = aura_colors.purple, fg = aura_colors.bg, gui = "bold" },
        b = { bg = aura_colors.surface, fg = aura_colors.fg },
        c = { bg = aura_colors.bg, fg = aura_colors.comment },
      },
      insert = {
        a = { bg = aura_colors.cyan, fg = aura_colors.bg, gui = "bold" },
        b = { bg = aura_colors.surface, fg = aura_colors.fg },
        c = { bg = aura_colors.bg, fg = aura_colors.comment },
      },
      visual = {
        a = { bg = aura_colors.pink, fg = aura_colors.bg, gui = "bold" },
        b = { bg = aura_colors.surface, fg = aura_colors.fg },
        c = { bg = aura_colors.bg, fg = aura_colors.comment },
      },
      command = {
        a = { bg = aura_colors.orange, fg = aura_colors.bg, gui = "bold" },
        b = { bg = aura_colors.surface, fg = aura_colors.fg },
        c = { bg = aura_colors.bg, fg = aura_colors.comment },
      },
      replace = {
        a = { bg = aura_colors.red, fg = aura_colors.bg, gui = "bold" },
        b = { bg = aura_colors.surface, fg = aura_colors.fg },
        c = { bg = aura_colors.bg, fg = aura_colors.comment },
      },
      inactive = {
        a = { bg = aura_colors.bg_dark, fg = aura_colors.comment, gui = "bold" },
        b = { bg = aura_colors.bg_dark, fg = aura_colors.comment },
        c = { bg = aura_colors.bg_dark, fg = aura_colors.comment },
      },
    }

    lualine.setup({
      options = {
        theme = aura_theme,
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = aura_colors.orange },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
