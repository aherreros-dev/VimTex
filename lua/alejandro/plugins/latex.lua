--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  VIMTEX - LATEX SUPPORT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Comprehensive LaTeX editing with automatic compilation via latexmk.
  Supports PDF viewing (Skim on macOS), code folding, and smart completion.
--]]

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
          "-halt-on-error",
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
      
      -- Enhanced error reporting
      vim.g.vimtex_quickfix_ignore_unknown_warnings = 0
      vim.g.vimtex_quickfix_warnings_enabled = 1
      
      -- Keybindings for LaTeX
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>ll", ":VimtexCompile<CR>", opts)
      vim.keymap.set("n", "<leader>lv", ":VimtexView<CR>", opts)
      vim.keymap.set("n", "<leader>lt", ":VimtexTocToggle<CR>", opts)
      vim.keymap.set("n", "<leader>le", ":VimtexErrors<CR>", opts)
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
              -- Build settings
              build = {
                onSave = true,
                forwardSearchAfterBuild = true,
                executable = "latexmk",
                args = {
                  "-pdf",
                  "-verbose",
                  "-file-line-error",
                  "-synctex=1",
                  "-interaction=nonstopmode",
                  "-halt-on-error",
                },
              },
              -- Forward search for Skim on macOS
              forwardSearch = {
                executable = "open",
                args = { "-a", "Skim", "%p", "-g", "%l" },
              },
              -- Formatter settings
              latexFormatter = "latexindent",
              latexindent = {
                ["local"] = nil,
                modifyLineBreaks = true,
                indent = "2 spaces",
              },
              -- Diagnostics settings for better error detection
              diagnostics = {
                ignoredPatterns = {},
                delay = 300,
              },
              -- Experimental features
              experimental = {
                mathEnvironmentName = true,
              },
            },
          },
        },
      },
    },
  },
}

