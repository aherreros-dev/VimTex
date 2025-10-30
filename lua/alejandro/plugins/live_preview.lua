return {
  {
    "brianhuster/live-preview.nvim",
    dependencies = {
      -- opcional: uno de estos pickers si los quieres
      "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua",
      -- "echasnovski/mini.pick",
      -- "folke/snacks.nvim",
    },
    cmd = { "LivePreview", "StopPreview" },
    keys = {
      { "<leader>lp", "<cmd>LivePreview<CR>", desc = "Live Preview (abrir navegador)" },
      { "<leader>lP", "<cmd>StopPreview<CR>", desc = "Live Preview: parar" },
    },
    opts = {
      port = 5500,
      autokill = false,
      browser = "open -b org.mozilla.firefoxdeveloperedition",
      dynamic_root = true, -- usa el directorio del archivo actual como raíz
      sync_scroll = false,
      telescope = false,
    },
    config = function(_, opts)
      require("live-preview").setup(opts)

      -- Guardado automático para HTML: refresca la vista al escribir
      vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "InsertLeave" }, {
        pattern = { "*.html", "*.htm" },
        callback = function()
          if vim.bo.modified then
            pcall(vim.cmd, "silent write")
          end
        end,
      })
    end,
  },
}
