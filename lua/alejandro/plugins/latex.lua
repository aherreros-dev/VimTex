return {
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-pdf",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      if vim.fn.has("macunix") == 1 then
        vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
      end

      vim.g.vimtex_complete_enabled = 1
      vim.g.vimtex_complete_close_braces = 1
      vim.g.vimtex_fold_enabled = 1
      vim.g.vimtex_fold_manual = 1
      vim.g.vimtex_syntax_enabled = 1
    end,
  },

  -- LSP de LaTeX (texlab)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        texlab = {
          settings = {
            texlab = {
              build = { onSave = true },
              latexFormatter = "latexindent",
              latexindent = {
                ["local"] = nil,
                modifyLineBreaks = false,
              },
            },
          },
        },
      },
    },
  },
}

