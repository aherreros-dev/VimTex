--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  COLOR SCHEME
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Catppuccin Mocha con overrides inspirados en Aura Theme:
  fondo azul/morado muy oscuro + colores neon (rosa, verde, púrpura).
--]]

return {
  -- CUSTOM TOKYO NIGHT THEME
  --{
    --"folke/tokyonight.nvim",
    --priority = 1000, -- make sure to load this before all the other start plugins
      --config = function()
      --local bg = "#011628"
      --local bg_dark = "#011423"
      --local bg_highlight = "#143652"
      --local bg_search = "#0A64AC"
      --local bg_visual = "#275378"
      --local fg = "#CBE0F0"
      --local fg_dark = "#B4D0E9"
      --local fg_gutter = "#627E97"
      --local border = "#547998"

      --require("tokyonight").setup({
        --style = "night",
        --on_colors = function(colors)
          --colors.bg = bg
          --colors.bg_dark = bg_dark
          --colors.bg_float = bg_dark
          --colors.bg_highlight = bg_highlight
          --colors.bg_popup = bg_dark
          --colors.bg_search = bg_search
          --colors.bg_sidebar = bg_dark
          --colors.bg_statusline = bg_dark
          --colors.bg_visual = bg_visual
          --colors.border = border
          --colors.fg = fg
          --colors.fg_dark = fg_dark
          --colors.fg_float = fg
          --colors.fg_gutter = fg_gutter
          --colors.fg_sidebar = fg_dark
        --end,
      --})
      -- load the colorscheme here
      --vim.cmd([[colorscheme tokyonight]])
    --end,
  --},

  -- GRUVBOX THEME (desactivado, conservado para recuperar)
  --{
  --"morhetz/gruvbox",
  --priority = 1000,
  --config = function()
  --  vim.o.background = "dark"
  --  vim.cmd([[colorscheme gruvbox]])
  --end,
  --},

  -- AURA THEME (catppuccin mocha con colores Aura)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = { dark = "mocha" },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = { enabled = false },
        color_overrides = {
          mocha = {
            -- Fondos Aura: azul/morado muy oscuro
            base    = "#15141b",
            mantle  = "#0f0e15",
            crust   = "#0a0910",
            -- Superficies
            surface0 = "#1d1c24",
            surface1 = "#252430",
            surface2 = "#302e3d",
            -- Overlays / comentarios
            overlay0 = "#6d6d6d",
            overlay1 = "#8a8a9a",
            overlay2 = "#a0a0b0",
            -- Texto
            text     = "#edecee",
            subtext1 = "#d8d7da",
            subtext0 = "#c4c3c8",
            -- Colores neon Aura
            mauve    = "#a277ff",  -- púrpura neon (accent principal)
            lavender = "#a277ff",
            pink     = "#f694ff",  -- rosa neon
            flamingo = "#f694ff",
            rosewater= "#ff6767",
            red      = "#ff6767",  -- rojo Aura
            maroon   = "#ff6767",
            peach    = "#ffca85",  -- naranja Aura
            yellow   = "#ffca85",
            green    = "#61ffca",  -- verde/cian neon Aura
            teal     = "#61ffca",
            sky      = "#82e2ff",  -- azul claro Aura
            sapphire = "#82e2ff",
            blue     = "#82e2ff",
          },
        },
        integrations = {
          cmp           = true,
          gitsigns      = true,
          nvimtree      = true,
          treesitter    = true,
          telescope     = { enabled = true },
          which_key     = true,
          indent_blankline = { enabled = true },
          lsp_trouble   = true,
          bufferline    = true,
          noice         = true,
          dashboard     = true,
          barbecue      = { dim_dirname = true, bold_basename = true },
          native_lsp = {
            enabled = true,
            underlines = {
              errors      = { "undercurl" },
              hints       = { "undercurl" },
              warnings    = { "undercurl" },
              information = { "undercurl" },
            },
          },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
