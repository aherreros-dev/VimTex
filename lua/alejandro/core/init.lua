require("alejandro.core.options")
require("alejandro.core.keymaps")

-- Configuración básica de vimtex
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'skim'  -- Cambiado a skim para macOS
vim.g.vimtex_compiler_method = 'latexmk'

-- Configuración del compilador latexmk
vim.g.vimtex_compiler_latexmk = {
    build_dir = '',
    callback = 1,
    continuous = 1,
    executable = 'latexmk',
    options = {
        '-pdf',
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
    }
}

-- Configuración para la limpieza de archivos temporales
vim.g.vimtex_compiler_clean_files = {
    '*.aux',
    '*.bbl',
    '*.blg',
    '*.log',
    '*.out',
    '*.toc',
    '*.fdb_latexmk',
    '*.fls',
    '*.synctex.gz'
}

-- Configuraciones adicionales
vim.g.vimtex_view_automatic = 1  -- Abre el PDF automáticamente después de compilar
vim.g.vimtex_quickfix_mode = 0   -- No abrir la ventana quickfix automáticamente

-- Configuración específica para Skim
vim.g.vimtex_view_skim_sync = 1  -- Habilita la sincronización con Skim
vim.g.vimtex_view_skim_activate = 1  -- Activa Skim automáticamente

