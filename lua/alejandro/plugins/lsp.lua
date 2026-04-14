return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    
    -- Obtener capacidades mejoradas si tienes nvim-cmp instalado
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if has_cmp then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    -- Función on_attach para keymaps
    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      
      -- Keymaps útiles
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end

    -- Configuración de signos de diagnóstico
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Configurar texlab para LaTeX
    lspconfig.texlab.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        texlab = {
          build = {
            onSave = true,
          },
          latexFormatter = "latexindent",
          latexindent = {
            modifyLineBreaks = false,
          },
        },
      },
    })

    -- Configurar lua_ls para Neovim
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    -- Agrega más servidores LSP aquí según necesites
    -- Ejemplos:
    -- lspconfig.pyright.setup({ capabilities = capabilities, on_attach = on_attach })
    -- lspconfig.tsserver.setup({ capabilities = capabilities, on_attach = on_attach })
  end,
}
