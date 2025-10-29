# Neovim Configuration - Complete List

This document provides a comprehensive list of all configurations currently being loaded in the `init.lua` file.

---

## 📋 Core Configurations

These are the fundamental configuration sections that form the base of the Neovim setup:

1. **VIM OPTIONS** (Line 7)
   - Core Vim/Neovim options and settings
   - Leader key configuration
   - Editor behavior (indentation, search, clipboard, etc.)
   - UI settings (numbers, signs, colors, etc.)

2. **KEYMAPS** (Line 82)
   - Custom keybindings and shortcuts
   - Visual mode mappings for moving lines
   - Better indenting keymaps
   - Navigation and editing shortcuts

3. **AUTOCOMMANDS** (Line 181)
   - Automatic commands and event handlers
   - Format options management
   - Highlight on yank
   - Cursor position restoration
   - File-specific behaviors
   - LSP attach handlers

4. **UTILITY FUNCTIONS** (Line 383)
   - Helper functions
   - `toggle_go_test()` - Switch between Go test and source files
   - `get_highlighted_line_numbers()` - Get line numbers from visual selection
   - `copyFilePathAndLineNumber()` - Copy file path/GitHub URL with line number

5. **MASON VERIFICATION** (Line 481)
   - Mason tool verification utilities
   - Tool path checking
   - Mason vs system tool detection

6. **HEALTH CHECK** (Line 613)
   - Comprehensive health check for configuration
   - Mason tools verification
   - LSP status checking
   - Formatter and linter verification

7. **MASON PATH INITIALIZATION** (Line 708)
   - Early Mason PATH setup for tool management
   - Ensures Mason tools are found first in PATH
   - Prevents conflicts with system tools

8. **STATUSLINE SETUP** (Line 783)
   - Custom statusline configuration
   - LSP status display
   - Git branch information
   - Formatter and linter indicators
   - Clickable statusline elements

9. **LSP CONFIGURATION** (Line 915)
   - Language Server Protocol setup and keybindings
   - LSP capabilities configuration
   - Diagnostic settings
   - Document highlighting
   - Inlay hints

10. **LSP SERVER CONFIGURATIONS** (Line 1330)
    - Individual LSP server settings
    - Server-specific options and capabilities

11. **FILETYPE PLUGINS** (Line 4775)
    - Filetype-specific settings
    - Go-specific configurations
    - Environment file detection

---

## 󰒋 LSP Servers (10 configured)

Language servers for intelligent code completion, diagnostics, and navigation:

1. **lua-ls** - Lua language server
2. **gopls** - Go language server
3. **zls** - Zig language server
4. **ts-ls** - TypeScript/JavaScript language server
5. **rust-analyzer** - Rust language server
6. **intelephense** - PHP language server
7. **tailwindcss** - Tailwind CSS language server
8. **html-ls** - HTML language server
9. **css-ls** - CSS language server
10. **vue-ls** - Vue language server

---

## 📦 Plugins (52 total)

### Plugin Manager
- **lazy.nvim** - Modern plugin manager for Neovim

### UI/Utilities
- **snacks.nvim** - Collection of small QoL plugins (picker, explorer, notifier, etc.)
- **dressing.nvim** - Improve default vim.ui interfaces
- **fidget.nvim** - LSP progress notifications
- **which-key.nvim** - Displays available keybindings in popup
- **noice.nvim** - Enhanced UI for messages, cmdline, popupmenu
- **nui.nvim** - UI component library
- **mini.icons** - Icon provider
- **showkeys** - Show key presses on screen
- **tiny-inline-diagnostic.nvim** - Inline diagnostic messages

### Completion
- **blink.cmp** - Completion plugin with LSP support

### Colorscheme
- **gruvbox-material** - Gruvbox Material theme

### LSP/Tools
- **mason.nvim** - Portable package manager for LSP servers, formatters, linters

### Formatting
- **conform.nvim** - Formatter plugin with multiple formatter support

### Linting
- **nvim-lint** - Async linter plugin

### Syntax
- **nvim-treesitter** - Treesitter configurations and abstraction layer
- **nvim-treesitter-textobjects** - Syntax-aware text objects

### Diagnostics
- **trouble.nvim** - Pretty diagnostics, references, quickfix list

### Git
- **gitsigns.nvim** - Git signs and hunks in sign column
- **diffview.nvim** - Git diff view and merge tool
- **vim-fugitive** - Git wrapper for Vim
- **vim-rhubarb** - GitHub extension for vim-fugitive
- **undotree** - Visualize undo history

### Editing
- **nvim-ts-autotag** - Auto-close and rename HTML tags
- **Comment.nvim** - Smart commenting plugin
- **nvim-ts-context-commentstring** - Context-aware commentstring
- **vim-sleuth** - Automatically detect indentation
- **editorconfig-vim** - EditorConfig support

### Navigation
- **flash.nvim** - Enhanced motion navigation

### Search
- **nvim-spectre** - Find and replace tool

### Session
- **persistence.nvim** - Session management

### Utilities
- **mini.nvim** - Collection of minimal plugins (ai, surround, pairs)
- **nvim-newfile.nvim** - Enhanced file creation
- **nvim-notes** - Note-taking plugin

### Terminal
- **vim-kitty** - Kitty terminal integration

### Debugging
- **nvim-dap** - Debug Adapter Protocol client
- **nvim-dap-ui** - UI for nvim-dap
- **nvim-nio** - Async IO library for nvim-dap-ui
- **nvim-dap-go** - Go debugger extension for nvim-dap
- **nvim-dap-virtual-text** - Virtual text support for nvim-dap

### AI (Most disabled by default)
- **supermaven-nvim** - AI code completion (disabled)
- **codecompanion.nvim** - AI coding assistant (disabled)
- **avante.nvim** - AI chat interface (disabled)
- **copilot.lua** - GitHub Copilot integration (disabled)
- **CopilotChat.nvim** - Copilot chat interface (disabled)
- **claude-code.nvim** - Claude AI integration

### Development
- **lazydev.nvim** - Lua development setup
- **laravel.nvim** - Laravel development tools (disabled)
- **phprefactoring.nvim** - PHP refactoring tools (disabled)
- **simplemarkdown.nvim** - Markdown utilities (disabled)

---

## 󰉿 Formatters (9 configured)

Code formatters managed by conform.nvim and Mason:

1. **stylua** [lua] - Lua formatter
2. **prettier** [javascript, typescript, vue, etc.] - Multi-language formatter
3. **goimports** [go] - Go imports and formatting
4. **gofmt** [go] - Go formatter (system)
5. **black** [python] - Python formatter
6. **isort** [python] - Python import sorter
7. **shfmt** [shell] - Shell script formatter
8. **pint** [php] - Laravel/PHP formatter
9. **rustfmt** [rust] - Rust formatter (system)

---

## 󰁨 Linters (5 configured)

Code linters managed by nvim-lint and Mason:

1. **golangci-lint** [go] - Go linter
2. **eslint_d** [javascript, typescript] - JavaScript/TypeScript linter
3. **luacheck** [lua] - Lua linter
4. **shellcheck** [sh, bash, zsh] - Shell script linter
5. **pint** [php] - Laravel/PHP linter

---

## 🌳 Treesitter Parsers (30 configured)

Syntax parsers for enhanced highlighting and text objects:

```
bash            c               html            javascript      json            lua
luadoc          luap            markdown        markdown_inline python          query
regex           tsx             typescript      vue             vim             vimdoc
yaml            rust            go              gomod           gowork          gosum
terraform       proto           zig             php             blade
```

---

## ⌨️ Custom Commands (8 available)

User-defined commands for configuration management:

1. **:MasonVerify** - Verify Mason tool management
2. **:MasonFixPath** - Fix Mason PATH manually
3. **:HealthCheck** - Run comprehensive configuration health check
4. **:LspRestart** - Restart LSP clients for current buffer
5. **:LspStatus** - Show brief LSP status
6. **:LspCapabilities** - Show all capabilities for attached LSP clients
7. **:LspDiagnostics** - Show diagnostic counts for current buffer
8. **:LspInfo** - Show comprehensive LSP information

---

## 📊 Summary

| Category                  | Count |
|---------------------------|-------|
| Core Configurations       | 11    |
| LSP Servers              | 10    |
| Plugins                  | 52    |
| Formatters               | 9     |
| Linters                  | 5     |
| Treesitter Parsers       | 30    |
| Custom Commands          | 8     |

---

## 📝 Configuration Structure

The `init.lua` file is organized as a consolidated configuration (4799 lines) that includes:

### Previous Multi-Directory Structure (Consolidated)
The configuration was previously split across multiple directories but has been consolidated into a single file:

- `lua/config/options.lua` → Lines 7-79
- `lua/config/keymaps.lua` → Lines 82-179
- `lua/config/autocmds.lua` → Lines 181-381
- `lua/config/utils.lua` → Lines 383-479
- `lua/config/mason-verify.lua` → Lines 481-611
- `lua/config/health-check.lua` → Lines 613-706
- `lua/core/mason-path.lua` → Lines 708-781
- `lua/core/statusline.lua` → Lines 783-913
- `lua/core/lsp.lua` → Lines 915-1328
- `lsp/*.lua` → Lines 1330-1546 (Inline LSP server configs)
- `lua/plugins/*.lua` → Lines 2554-4773 (All plugin configurations)
- `ftplugin/*.lua` → Lines 4775-4798 (Filetype-specific settings)

### Key Features

1. **All-in-One Configuration**: Everything is in a single `init.lua` file
2. **Mason-First Tool Management**: All tools are managed through Mason with proper PATH priority
3. **Modern Plugin Ecosystem**: Uses lazy.nvim for efficient plugin loading
4. **Comprehensive LSP Setup**: 10 language servers with full configuration
5. **Formatting & Linting**: Automated code quality with conform.nvim and nvim-lint
6. **Enhanced Editing**: Treesitter, text objects, auto-pairing, comments
7. **Git Integration**: Full git workflow support with gitsigns and fugitive
8. **Debugging Support**: DAP configuration for Go and potentially other languages
9. **Health Monitoring**: Built-in health checks and verification commands

---

## 🔧 How to Use This List

### View Configuration Details
```vim
:edit ~/.config/nvim/init.lua
```

### Run Health Checks
```vim
:HealthCheck        " Custom comprehensive health check
:checkhealth        " Neovim's built-in health check
:MasonVerify        " Verify Mason tool management
```

### View LSP Information
```vim
:LspInfo            " Comprehensive LSP information
:LspStatus          " Brief LSP status
:LspCapabilities    " Full capability list
```

### Manage Plugins
```vim
:Lazy               " Open Lazy plugin manager UI
:Lazy sync          " Update all plugins
:Lazy clean         " Remove unused plugins
```

---

*Generated from init.lua - A consolidated Neovim configuration*
