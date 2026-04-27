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
        executable = vim.env.HOME .. "/.local/bin/latexmk-auto",
        options = {
          "-pdf",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      vim.g.vimtex_complete_enabled = 1
      vim.g.vimtex_complete_close_braces = 1
      vim.g.vimtex_fold_enabled = 1
      vim.g.vimtex_fold_manual = 1
      vim.g.vimtex_syntax_enabled = 1

      -- Auto-start continuous compilation when opening a tex file.
      -- latexmk stays running and picks up every save automatically.
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",
        callback = function()
          vim.defer_fn(function()
            local ok, state = pcall(function() return vim.b.vimtex end)
            if ok and state then
              vim.cmd("VimtexCompile")
            end
          end, 300)
        end,
      })

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
              build = {
                onSave = false,
                forwardSearchAfterBuild = false,
                executable = "latexmk",
                args = { "-pdf", "-synctex=1", "-interaction=nonstopmode" },
              },
              forwardSearch = {
                executable = "open",
                args = { "-a", "Skim", "%p", "-g", "%l" },
              },
              latexFormatter = "latexindent",
              diagnostics = { delay = 300 },
            },
          },
        },
      },
    },
  },
}
