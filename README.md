# Neovim Configuration

A comprehensive Neovim configuration consolidated into a single `init.lua` file.

## Structure

This configuration uses a **single-file approach** for simplicity and portability. Everything is contained in `init.lua` (~4,800 lines), organized into clear sections:

- **VIM Options** - All Neovim settings and preferences
- **Keymaps** - Custom key bindings and shortcuts
- **Autocommands** - Event handlers and automation
- **Utility Functions** - Helper functions for custom workflows
- **LSP Configuration** - Complete language server setup with 10+ LSP servers
- **Plugin Configurations** - 19 plugins with full inline configurations
- **Statusline** - Custom statusline setup
- **Filetype Settings** - Language-specific configurations

## Features

- 🚀 **Plugin Manager**: Lazy.nvim for efficient plugin management
- 🎨 **Themes**: Multiple colorscheme options (Gruvbox Material, Catppuccin, Nordic)
- 📝 **LSP Support**: Full LSP integration for 10+ languages (Go, Lua, TypeScript, Rust, PHP, etc.)
- 🔍 **Fuzzy Finding**: Snacks.nvim picker for files, grep, and more
- 🎯 **Code Quality**: Formatters (conform.nvim) and linters (nvim-lint)
- 🐛 **Debugging**: DAP support with UI
- 🤖 **AI Integration**: Optional AI assistants (Claude, Supermaven, Avante)
- ⚡ **Performance**: Optimized with disabled unnecessary plugins

## Installation

1. Clone this repository to your Neovim config directory:
   ```bash
   git clone https://github.com/404priyanshu/nvim ~/.config/nvim
   ```

2. Open Neovim - plugins will be automatically installed on first launch:
   ```bash
   nvim
   ```

3. Wait for Lazy.nvim to install all plugins and Mason to install LSP servers

## Quick Commands

- `:Mason` - Manage LSP servers, formatters, and linters
- `:Lazy` - Manage plugins
- `:HealthCheck` - Run configuration health check
- `:MasonVerify` - Verify Mason tool management
- `<leader><space>` - Smart find files
- `<leader>/` - Grep in project
- `<leader>e` - File explorer

## Customization

Since everything is in a single file, customization is straightforward:
1. Open `init.lua`
2. Use section markers (e.g., `-- VIM OPTIONS`, `-- KEYMAPS`) to navigate
3. Make your changes
4. Restart Neovim

Always a WIP.
