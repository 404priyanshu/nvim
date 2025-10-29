-- ============================================================================
-- Configuration List Generator for init.lua
-- ============================================================================
-- This script generates a comprehensive list of all configurations
-- currently being loaded in the init.lua file

local M = {}

-- List of all core configuration sections
M.core_configurations = {
    { name = "VIM OPTIONS", line = 7, description = "Core Vim/Neovim options and settings" },
    { name = "KEYMAPS", line = 82, description = "Custom keybindings and shortcuts" },
    { name = "AUTOCOMMANDS", line = 181, description = "Automatic commands and event handlers" },
    { name = "UTILITY FUNCTIONS", line = 383, description = "Helper functions (utils, toggle_go_test, etc.)" },
    { name = "MASON VERIFICATION", line = 481, description = "Mason tool verification utilities" },
    { name = "HEALTH CHECK", line = 613, description = "Comprehensive health check for configuration" },
    { name = "MASON PATH INITIALIZATION", line = 708, description = "Early Mason PATH setup for tool management" },
    { name = "STATUSLINE SETUP", line = 783, description = "Custom statusline configuration" },
    { name = "LSP CONFIGURATION", line = 915, description = "Language Server Protocol setup and keybindings" },
    { name = "LSP SERVER CONFIGURATIONS", line = 1330, description = "Individual LSP server settings" },
    { name = "FILETYPE PLUGINS", line = 4775, description = "Filetype-specific settings" },
}

-- List of all LSP servers configured
M.lsp_servers = {
    { name = "lua-ls", description = "Lua language server" },
    { name = "gopls", description = "Go language server" },
    { name = "zls", description = "Zig language server" },
    { name = "ts-ls", description = "TypeScript/JavaScript language server" },
    { name = "rust-analyzer", description = "Rust language server" },
    { name = "intelephense", description = "PHP language server" },
    { name = "tailwindcss", description = "Tailwind CSS language server" },
    { name = "html-ls", description = "HTML language server" },
    { name = "css-ls", description = "CSS language server" },
    { name = "vue-ls", description = "Vue language server" },
}

-- List of all plugins loaded through Lazy.nvim
M.plugins = {
    { name = "lazy.nvim", category = "Plugin Manager", description = "Modern plugin manager for Neovim" },
    { name = "snacks.nvim", category = "UI/Utilities", description = "Collection of small QoL plugins (picker, explorer, notifier, etc.)" },
    { name = "blink.cmp", category = "Completion", description = "Completion plugin with LSP support" },
    { name = "gruvbox-material", category = "Colorscheme", description = "Gruvbox Material theme" },
    { name = "mason.nvim", category = "LSP/Tools", description = "Portable package manager for LSP servers, formatters, linters" },
    { name = "conform.nvim", category = "Formatting", description = "Formatter plugin with multiple formatter support" },
    { name = "nvim-lint", category = "Linting", description = "Async linter plugin" },
    { name = "nvim-treesitter", category = "Syntax", description = "Treesitter configurations and abstraction layer" },
    { name = "nvim-treesitter-textobjects", category = "Syntax", description = "Syntax-aware text objects" },
    { name = "trouble.nvim", category = "Diagnostics", description = "Pretty diagnostics, references, quickfix list" },
    { name = "which-key.nvim", category = "UI", description = "Displays available keybindings in popup" },
    { name = "gitsigns.nvim", category = "Git", description = "Git signs and hunks in sign column" },
    { name = "diffview.nvim", category = "Git", description = "Git diff view and merge tool" },
    { name = "vim-fugitive", category = "Git", description = "Git wrapper for Vim" },
    { name = "vim-rhubarb", category = "Git", description = "GitHub extension for vim-fugitive" },
    { name = "undotree", category = "Utilities", description = "Visualize undo history" },
    { name = "nvim-ts-autotag", category = "Editing", description = "Auto-close and rename HTML tags" },
    { name = "Comment.nvim", category = "Editing", description = "Smart commenting plugin" },
    { name = "nvim-ts-context-commentstring", category = "Editing", description = "Context-aware commentstring" },
    { name = "dressing.nvim", category = "UI", description = "Improve default vim.ui interfaces" },
    { name = "fidget.nvim", category = "UI", description = "LSP progress notifications" },
    { name = "nvim-spectre", category = "Search", description = "Find and replace tool" },
    { name = "vim-sleuth", category = "Editing", description = "Automatically detect indentation" },
    { name = "lazydev.nvim", category = "Development", description = "Lua development setup" },
    { name = "editorconfig-vim", category = "Editing", description = "EditorConfig support" },
    { name = "flash.nvim", category = "Navigation", description = "Enhanced motion navigation" },
    { name = "persistence.nvim", category = "Session", description = "Session management" },
    { name = "mini.nvim", category = "Utilities", description = "Collection of minimal plugins (ai, surround, pairs)" },
    { name = "mini.icons", category = "UI", description = "Icon provider" },
    { name = "vim-kitty", category = "Terminal", description = "Kitty terminal integration" },
    { name = "nui.nvim", category = "UI", description = "UI component library" },
    { name = "showkeys", category = "UI", description = "Show key presses on screen" },
    { name = "nvim-dap", category = "Debugging", description = "Debug Adapter Protocol client" },
    { name = "nvim-dap-ui", category = "Debugging", description = "UI for nvim-dap" },
    { name = "nvim-nio", category = "Debugging", description = "Async IO library for nvim-dap-ui" },
    { name = "nvim-dap-go", category = "Debugging", description = "Go debugger extension for nvim-dap" },
    { name = "nvim-dap-virtual-text", category = "Debugging", description = "Virtual text support for nvim-dap" },
    { name = "supermaven-nvim", category = "AI", description = "AI code completion (disabled)" },
    { name = "codecompanion.nvim", category = "AI", description = "AI coding assistant (disabled)" },
    { name = "avante.nvim", category = "AI", description = "AI chat interface (disabled)" },
    { name = "copilot.lua", category = "AI", description = "GitHub Copilot integration (disabled)" },
    { name = "CopilotChat.nvim", category = "AI", description = "Copilot chat interface (disabled)" },
    { name = "tiny-inline-diagnostic.nvim", category = "Diagnostics", description = "Inline diagnostic messages" },
    { name = "claude-code.nvim", category = "AI", description = "Claude AI integration" },
    { name = "noice.nvim", category = "UI", description = "Enhanced UI for messages, cmdline, popupmenu" },
    { name = "laravel.nvim", category = "Development", description = "Laravel development tools (disabled)" },
    { name = "phprefactoring.nvim", category = "Development", description = "PHP refactoring tools (disabled)" },
    { name = "simplemarkdown.nvim", category = "Development", description = "Markdown utilities (disabled)" },
    { name = "nvim-newfile.nvim", category = "Utilities", description = "Enhanced file creation" },
    { name = "nvim-notes", category = "Utilities", description = "Note-taking plugin" },
}

-- List of formatters configured
M.formatters = {
    { name = "stylua", filetype = "lua", description = "Lua formatter" },
    { name = "prettier", filetype = "javascript, typescript, vue, etc.", description = "Multi-language formatter" },
    { name = "goimports", filetype = "go", description = "Go imports and formatting" },
    { name = "gofmt", filetype = "go", description = "Go formatter (system)" },
    { name = "black", filetype = "python", description = "Python formatter" },
    { name = "isort", filetype = "python", description = "Python import sorter" },
    { name = "shfmt", filetype = "shell", description = "Shell script formatter" },
    { name = "pint", filetype = "php", description = "Laravel/PHP formatter" },
    { name = "rustfmt", filetype = "rust", description = "Rust formatter (system)" },
}

-- List of linters configured
M.linters = {
    { name = "golangci-lint", filetype = "go", description = "Go linter" },
    { name = "eslint_d", filetype = "javascript, typescript", description = "JavaScript/TypeScript linter" },
    { name = "luacheck", filetype = "lua", description = "Lua linter" },
    { name = "shellcheck", filetype = "sh, bash, zsh", description = "Shell script linter" },
    { name = "pint", filetype = "php", description = "Laravel/PHP linter" },
}

-- List of Treesitter parsers
M.treesitter_parsers = {
    "bash", "c", "html", "javascript", "json", "lua", "luadoc", "luap",
    "markdown", "markdown_inline", "python", "query", "regex", "tsx",
    "typescript", "vue", "vim", "vimdoc", "yaml", "rust", "go", "gomod",
    "gowork", "gosum", "terraform", "proto", "zig", "php", "blade"
}

-- List of custom commands
M.custom_commands = {
    { name = "MasonVerify", description = "Verify Mason tool management" },
    { name = "MasonFixPath", description = "Fix Mason PATH manually" },
    { name = "HealthCheck", description = "Run comprehensive configuration health check" },
    { name = "LspRestart", description = "Restart LSP clients for current buffer" },
    { name = "LspStatus", description = "Show brief LSP status" },
    { name = "LspCapabilities", description = "Show all capabilities for attached LSP clients" },
    { name = "LspDiagnostics", description = "Show diagnostic counts for current buffer" },
    { name = "LspInfo", description = "Show comprehensive LSP information" },
}

-- Function to print all configurations
function M.print_all()
    print("═══════════════════════════════════════════════════════════════")
    print("         NEOVIM CONFIGURATION - COMPLETE LIST")
    print("═══════════════════════════════════════════════════════════════")
    print()

    -- Core Configurations
    print("📋 CORE CONFIGURATIONS:")
    print("─────────────────────────────────────────────────────────────")
    for i, config in ipairs(M.core_configurations) do
        print(string.format("%2d. %-35s (Line %4d)", i, config.name, config.line))
        print(string.format("    %s", config.description))
    end
    print()

    -- LSP Servers
    print("󰒋 LSP SERVERS (" .. #M.lsp_servers .. " configured):")
    print("─────────────────────────────────────────────────────────────")
    for i, server in ipairs(M.lsp_servers) do
        print(string.format("%2d. %-25s - %s", i, server.name, server.description))
    end
    print()

    -- Plugins by Category
    print("📦 PLUGINS (" .. #M.plugins .. " total):")
    print("─────────────────────────────────────────────────────────────")
    
    -- Group plugins by category
    local categories = {}
    for _, plugin in ipairs(M.plugins) do
        if not categories[plugin.category] then
            categories[plugin.category] = {}
        end
        table.insert(categories[plugin.category], plugin)
    end
    
    -- Print plugins by category
    local category_order = {
        "Plugin Manager", "UI", "UI/Utilities", "Completion", "Colorscheme",
        "LSP/Tools", "Formatting", "Linting", "Syntax", "Diagnostics",
        "Git", "Editing", "Navigation", "Search", "Session", "Utilities",
        "Terminal", "Debugging", "AI", "Development"
    }
    
    for _, category in ipairs(category_order) do
        if categories[category] then
            print()
            print("  " .. category .. ":")
            for _, plugin in ipairs(categories[category]) do
                local status = string.find(plugin.description, "disabled") and " (disabled)" or ""
                print(string.format("    • %-30s - %s%s", plugin.name, plugin.description, status))
            end
        end
    end
    print()

    -- Formatters
    print("󰉿 FORMATTERS (" .. #M.formatters .. " configured):")
    print("─────────────────────────────────────────────────────────────")
    for i, formatter in ipairs(M.formatters) do
        print(string.format("%2d. %-20s [%s] - %s", i, formatter.name, formatter.filetype, formatter.description))
    end
    print()

    -- Linters
    print("󰁨 LINTERS (" .. #M.linters .. " configured):")
    print("─────────────────────────────────────────────────────────────")
    for i, linter in ipairs(M.linters) do
        print(string.format("%2d. %-20s [%s] - %s", i, linter.name, linter.filetype, linter.description))
    end
    print()

    -- Treesitter Parsers
    print("🌳 TREESITTER PARSERS (" .. #M.treesitter_parsers .. " configured):")
    print("─────────────────────────────────────────────────────────────")
    local parsers_per_line = 6
    local line = "    "
    for i, parser in ipairs(M.treesitter_parsers) do
        line = line .. string.format("%-15s", parser)
        if i % parsers_per_line == 0 then
            print(line)
            line = "    "
        end
    end
    if line ~= "    " then
        print(line)
    end
    print()

    -- Custom Commands
    print("⌨️  CUSTOM COMMANDS (" .. #M.custom_commands .. " available):")
    print("─────────────────────────────────────────────────────────────")
    for i, cmd in ipairs(M.custom_commands) do
        print(string.format("%2d. :%-25s - %s", i, cmd.name, cmd.description))
    end
    print()

    -- Summary
    print("═══════════════════════════════════════════════════════════════")
    print("SUMMARY:")
    print(string.format("  • Core Configurations:  %2d", #M.core_configurations))
    print(string.format("  • LSP Servers:          %2d", #M.lsp_servers))
    print(string.format("  • Plugins:              %2d", #M.plugins))
    print(string.format("  • Formatters:           %2d", #M.formatters))
    print(string.format("  • Linters:              %2d", #M.linters))
    print(string.format("  • Treesitter Parsers:   %2d", #M.treesitter_parsers))
    print(string.format("  • Custom Commands:      %2d", #M.custom_commands))
    print("═══════════════════════════════════════════════════════════════")
end

-- Create a user command to run this
vim.api.nvim_create_user_command('ListConfigurations', M.print_all, { 
    desc = "List all configurations currently loaded in init.lua" 
})

-- Run immediately when sourced
M.print_all()

return M
