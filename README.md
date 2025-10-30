# Neovim Configuration for LaTeX

[![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)
[![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org/)
[![LaTeX](https://img.shields.io/badge/latex-%23008080.svg?style=for-the-badge&logo=latex&logoColor=white)](https://www.latex-project.org/)

A Neovim configuration optimized for academic writing and LaTeX document preparation.

## Features

- **LaTeX Support**: Full VimTeX integration with live preview and auto-compilation
- **LSP Integration**: Code completion, diagnostics, and navigation
- **Modern UI**: Beautiful dashboard, statusline, and file explorer
- **Session Management**: Automatic workspace persistence
- **Fuzzy Finding**: Fast file and text search with Telescope
- **Syntax Highlighting**: Tree-sitter powered parsing

## Installation

### Prerequisites

- Neovim >= 0.9.0
- Git
- Node.js (for LSP)
- LaTeX distribution (TeX Live, MiKTeX, or MacTeX)
- latexmk
- PDF viewer (zathura, skim, or evince)

### Quick Install

**Backup your current config first!**

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this configuration
git clone https://github.com/aherreros-dev/VimTex.git ~/.config/nvim

# Start Neovim (plugins will install automatically)
nvim
```

### Manual Install

If you want to review the configuration first:

```bash
git clone https://github.com/aherreros-dev/VimTex.git
cd VimTex
# Review files, then copy to ~/.config/nvim
```

## Plugin List

### Core
- **lazy.nvim** - Plugin manager

### UI
- **alpha.lua** - Dashboard
- **lualine.lua** - Statusline
- **bufferline.lua** - Buffer tabs
- **nvim-tree.lua** - File explorer
- **telescope.lua** - Fuzzy finder
- **which-key.lua** - Keybinding hints
- **dressing.lua** - Better UI elements
- **colorscheme.lua** - Theme

### LaTeX
- **latex.lua** - VimTeX integration
- **latex-format.lua** - Code formatting
- **live_preview.lua** - Real-time PDF preview

### Editing
- **nvim-cmp.lua** - Autocompletion
- **autopairs.lua** - Auto close brackets
- **surround.lua** - Surround text objects
- **comment.lua** - Toggle comments
- **substitute.lua** - Enhanced substitution
- **indent-blankline.lua** - Indentation guides
- **todo-comments.lua** - Highlight TODOs

### Development
- **lsp.lua** - Language server protocol
- **treesitter.lua** - Syntax parsing
- **prettier.lua** - Code formatter

### Utilities
- **auto-session.lua** - Session management
- **vim-maximizer.lua** - Window maximizer

## Key Bindings

Leader key: `Space`

| Key | Action |
|-----|--------|
| `Space ee` | Toggle file explorer |
| `Space ff` | Find file |
| `Space fs` | Find word |
| `Space wr` | Restore session |
| `q` | Quit |

### LaTeX Commands

| Key | Action |
|-----|--------|
| `\ll` | Start/stop compilation |
| `\lv` | View PDF |
| `\lt` | Table of contents |
| `\le` | Show errors |

See `:help vimtex` for more commands.

## Configuration Structure

```
~/.config/nvim/
├── init.lua
├── lazy-lock.json
└── lua/alejandro/
    ├── core/
    │   ├── init.lua
    │   ├── keymaps.lua
    │   └── options.lua
    ├── plugins/
    │   ├── *.lua (plugin configs)
    │   └── init.lua
    └── lazy.lua
```

## Maintenance

Update plugins:
```vim
:Lazy sync
```

Check health:
```vim
:checkhealth
:checkhealth vimtex
```

## License

Configuration provided as-is. Individual plugins maintain their respective licenses.

---

**Last Updated**: 2025-10-30
