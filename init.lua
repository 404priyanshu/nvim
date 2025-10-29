-- ============================================================================
-- Consolidated Neovim Configuration
-- This file contains the entire Neovim configuration in a single init.lua
-- Converted from a multi-directory structure for simplicity
-- ============================================================================

-- ============================================================================
-- VIM OPTIONS (from lua/config/options.lua)
-- ============================================================================
vim.g.mapleader = " "                                   -- change leader to a space
vim.g.maplocalleader = " "                              -- change localleader to a space

vim.g.loaded_netrw = 1                                  -- disable netrw
vim.g.loaded_netrwPlugin = 1                            --  disable netrw

vim.opt.incsearch = true                                -- make search act like search in modern browsers
vim.opt.backup = false                                  -- creates a backup file
vim.opt.clipboard = "unnamedplus"                       -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1                                   -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                                -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                          -- the encoding written to a file
vim.opt.hlsearch = true                                 -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                               -- ignore case in search patterns
vim.opt.mouse = "a"                                     -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                                  -- pop up menu height
vim.opt.showmode = false                                -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0                                 -- always show tabs
vim.opt.smartcase = true                                -- smart case
vim.opt.smartindent = true                              -- make indenting smarter again
vim.opt.splitbelow = true                               -- force all horizontal splits to go below current window
vim.opt.splitright = true                               -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                                -- creates a swapfile
vim.opt.termguicolors = true                            -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                               -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                                 -- enable persistent undo
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"     -- set an undo directory
vim.opt.updatetime = 100                                -- faster completion (4000ms default)
vim.opt.writebackup = false                             -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                                -- convert tabs to spaces
vim.opt.shiftwidth = 2                                  -- the number of spaces inserted for each indentation
vim.opt.cursorline = false                              -- highlight the current line
vim.opt.number = true                                   -- set numbered lines
vim.opt.breakindent = true                              -- wrap lines with indent
vim.opt.relativenumber = true                           -- set relative numbered lines
vim.opt.numberwidth = 4                                 -- set number column width to 2 {default 4}
vim.opt.signcolumn =
"yes:1"                                                 --  show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                                    -- display lines as one long line
-- vim.opt.scrolloff = 8                                   -- Makes sure there are always eight lines of context
-- vim.opt.sidescrolloff = 8                               -- Makes sure there are always eight lines of context
vim.opt.showcmd = false           -- Don't show the command in the last line
vim.opt.ruler = true              -- Don't show the ruler
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.title = true              -- set the title of window to the value of the titlestring
vim.opt.confirm = true            -- confirm to save changes before exiting modified buffer
vim.opt.fillchars = { eob = " " } -- change the character at the end of buffer
-- vim.opt.winborder = "rounded" -- solid
vim.opt.winborder = "single"      -- https://neovim.io/doc/user/options.html#'winborder'

-- vim.opt.guicursor = ""                          -- set the cursor to be a vertical bar

-- vim.opt.cursorlineopt = "number"              -- set the cursorline
-- vim.opt.tabstop = 2                           -- insert 2 spaces for a tab
-- vim.opt.laststatus = 0 -- Always display the status line

vim.filetype.add({
    extension = {
        env = "dotenv",
    },
    filename = {
        [".env"] = "dotenv",
        ["env"] = "dotenv",
    },
    pattern = {
        ["[jt]sconfig.*.json"] = "jsonc",
        ["%.env%.[%w_.-]+"] = "dotenv",
    },
})

-- ============================================================================
-- KEYMAPS (from lua/config/keymaps.lua)
-- ============================================================================
local opts = { noremap = true, silent = true }
-- local map = vim.keymap.set

-- Keep cursor centered when scrolling
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
--
-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Fast saving
-- vim.keymap.set("n", "<leader>w", ":write!<CR>", { silent = true, desc = "Save file" })
-- vim.keymap.set("n", "<leader>q", ":q!<CR>", opts)

-- Remap for dealing with visual line wraps
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dp')
vim.keymap.set("v", "P", '"_dP')

-- copy everything between { and } including the brackets
-- p puts text after the cursor,
-- P puts text before the cursor.
vim.keymap.set("n", "YY", "va{Vy", opts)

-- Move line on the screen rather than by line in the file
-- vim.keymap.set("n", "j", "gj", opts)
-- vim.keymap.set("n", "k", "gk", opts)

-- Exit on jj and jk
vim.keymap.set("i", "jj", "<ESC>", opts)
vim.keymap.set("i", "jk", "<ESC>", opts)

-- Move to start/end of line
vim.keymap.set({ "n", "x", "o" }, "H", "^", opts)
vim.keymap.set({ "n", "x", "o" }, "L", "g_", opts)

-- Navigate buffers
vim.keymap.set("n", "<Right>", ":bnext<CR>", opts)
vim.keymap.set("n", "<Left>", ":bprevious<CR>", opts)

-- Panes resizing
vim.keymap.set("n", "+", ":vertical resize +5<CR>")
vim.keymap.set("n", "_", ":vertical resize -5<CR>")
vim.keymap.set("n", "=", ":resize +5<CR>")
vim.keymap.set("n", "-", ":resize -5<CR>")

-- Map enter to ciw in normal mode
-- vim.keymap.set("n", "<CR>", "ciw", opts)  -- Commented out: This overwrites word on Enter - too disruptive
-- vim.keymap.set("n", "<BS>", "ci", opts)   -- Commented out: This changes text on Backspace - too disruptive

vim.keymap.set("n", "n", "nzzv", opts)
vim.keymap.set("n", "N", "Nzzv", opts)
vim.keymap.set("n", "*", "*zzv", opts)
vim.keymap.set("n", "#", "#zzv", opts)
vim.keymap.set("n", "g*", "g*zz", opts)
vim.keymap.set("n", "g#", "g#zz", opts)

-- map ; to resume last search
-- map("n", ";", "<cmd>Telescope resume<cr>", opts)

-- search current buffer
-- vim.keymap.set("n", "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>", opts)

-- Split line with X
vim.keymap.set("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { silent = true })

-- ctrl + x to cut full line
vim.keymap.set("n", "<C-x>", "dd", opts)

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", opts)

-- write file in current directory
-- :w %:h/<new-file-name>
vim.keymap.set("n", "<C-n>", ":w %:h/", opts)

-- delete forward
-- w{number}dw
-- delete backward
-- w{number}db

vim.keymap.set("n", "<C-P>", ':lua utils.toggle_go_test()<CR>', opts)

-- Get highlighted line numbers in visual mode
vim.keymap.set("v", "<leader>ln", ':lua utils.get_highlighted_line_numbers()<CR>', opts)

vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", opts)

-- ============================================================================
-- AUTOCOMMANDS (from lua/config/autocmds.lua)
-- ============================================================================
local api = vim.api

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- wrap words "softly" (no carriage return) in mail buffer
api.nvim_create_autocmd("Filetype", {
    pattern = "mail",
    callback = function()
        vim.opt.textwidth = 0
        vim.opt.wrapmargin = 0
        vim.opt.wrap = true
        vim.opt.linebreak = true
        vim.opt.columns = 80
        vim.opt.colorcolumn = "80"
    end,
})

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- go to last loc when opening a buffer
-- this mean that when you open a file, you will be at the last position
api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- auto close brackets
-- this
api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
    pattern = "*",
    command = "set cursorline",
    group = cursorGrp,
})
api.nvim_create_autocmd(
    { "InsertEnter", "WinLeave" },
    { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- Enable spell checking for certain file types
api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    -- { pattern = { "*.txt", "*.md", "*.tex" }, command = [[setlocal spell<cr> setlocal spelllang=en,de<cr>]] }
    {
        pattern = { "*.txt", "*.md", "*.tex" },
        callback = function()
            vim.opt.spell = true
            vim.opt.spelllang = "en"
        end,
    }
)

-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = function()
--     vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
--     vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
--   end,
-- })

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
    pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "man",
        "notify",
        "qf",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- resize neovim split when terminal is resized
vim.api.nvim_command("autocmd VimResized * wincmd =")

-- fix terraform and hcl comment string
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("FixTerraformCommentString", { clear = true }),
    callback = function(ev)
        vim.bo[ev.buf].commentstring = "# %s"
    end,
    pattern = { "terraform", "hcl" },
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end


        map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
        map("gD", vim.lsp.buf.declaration, "Goto Declaration")

        map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

        local wk = require("which-key")
        wk.add({
            { "<leader>la", vim.lsp.buf.code_action,                           desc = "Code Action" },
            { "<leader>lA", vim.lsp.buf.range_code_action,                     desc = "Range Code Actions" },
            { "<leader>ls", vim.lsp.buf.signature_help,                        desc = "Display Signature Information" },
            { "<leader>lr", vim.lsp.buf.rename,                                desc = "Rename all references" },
            { "<leader>lf", vim.lsp.buf.format,                                desc = "Format" },
            { "<leader>lc", utils.copyFilePathAndLineNumber, desc = "Copy File Path and Line Number" },
            { "<leader>Wa", vim.lsp.buf.add_workspace_folder,                  desc = "Workspace Add Folder" },
            { "<leader>Wr", vim.lsp.buf.remove_workspace_folder,               desc = "Workspace Remove Folder" },
            {
                "<leader>Wl",
                function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end,
                desc = "Workspace List Folders",
            },
        })

        local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
                return client:supports_method(method, bufnr)
            else
                return client.supports_method(method, { bufnr = bufnr })
            end
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
                end,
            })
        end


        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
        end
    end,

})

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

-- Enable autoread and set up checking triggers
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = "*",
})

-- ============================================================================
-- UTILITY FUNCTIONS (from lua/config/utils.lua)
-- ============================================================================
local utils = {}


utils.toggle_go_test = function()
  -- Get the current buffer's file name
  local current_file = vim.fn.expand("%:p")
  if string.match(current_file, "_test.go$") then
    -- If the current file ends with '_test.go', try to find the corresponding non-test file
    local non_test_file = string.gsub(current_file, "_test.go$", ".go")
    if vim.fn.filereadable(non_test_file) == 1 then
      -- Open the corresponding non-test file if it exists
      vim.cmd.edit(non_test_file)
    else
      print("No corresponding non-test file found")
    end
  else
    -- If the current file is a non-test file, try to find the corresponding test file
    local test_file = string.gsub(current_file, ".go$", "_test.go")
    if vim.fn.filereadable(test_file) == 1 then
      -- Open the corresponding test file if it exists
      vim.cmd.edit(test_file)
    else
      print("No corresponding test file found")
    end
  end
end

-- Get line numbers for highlighted lines in visual mode
utils.get_highlighted_line_numbers = function()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  if start_line == 0 or end_line == 0 then
    print("No visual selection found")
    return
  end

  -- Ensure start_line is always less than or equal to end_line
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  local line_numbers = {}
  for i = start_line, end_line do
    table.insert(line_numbers, i)
  end

  local result
  if start_line == end_line then
    -- Single line: L80
    result = string.format("L%d", start_line)
  else
    -- Multiple lines: L80-85
    result = string.format("L%d-%d", start_line, end_line)
  end

  print("Line numbers: " .. result)

  -- Copy to clipboard
  vim.fn.setreg("+", result)

  return line_numbers
end

-- Copy the current file path and line number to the clipboard, use GitHub URL if in a Git repository
utils.copyFilePathAndLineNumber = function()
  local current_file = vim.fn.expand("%:p")
  local current_line = vim.fn.line(".")
  local is_git_repo = vim.fn.system("git rev-parse --is-inside-work-tree"):match("true")

  if is_git_repo then
    local current_repo = vim.fn.systemlist("git remote get-url origin")[1]
    local current_branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1]

    -- Convert Git URL to GitHub web URL format
    current_repo = current_repo:gsub("git@github.com:", "https://github.com/")
    current_repo = current_repo:gsub("%.git$", "")

    -- Remove leading system path to repository root
    local repo_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    if repo_root then
      current_file = current_file:sub(#repo_root + 2)
    end

    local url = string.format("%s/blob/%s/%s#L%s", current_repo, current_branch, current_file, current_line)
    vim.fn.setreg("+", url)
    print("Copied to clipboard: " .. url)
  else
    -- If not in a Git directory, copy the full file path
    vim.fn.setreg("+", current_file .. "#L" .. current_line)
    print("Copied full path to clipboard: " .. current_file .. "#L" .. current_line)
  end
end


-- ============================================================================
-- MASON VERIFICATION (from lua/config/mason-verify.lua)
-- ============================================================================
local mason_verify = {}

-- Mason verification utility

-- Check if a tool is managed by Mason
function mason_verify.is_mason_tool(tool_name)
    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/" .. tool_name
    return vim.fn.executable(mason_bin) == 1
end

-- Get the path of a tool
function mason_verify.get_tool_path(tool_name)
    return vim.fn.exepath(tool_name)
end

-- Check all tools and report which are Mason-managed
function mason_verify.verify_tools()
    -- Debug: Show current PATH
    print("Current Neovim PATH (first 3 entries):")
    local path_entries = vim.split(vim.env.PATH, ":")
    for i = 1, math.min(3, #path_entries) do
        local marker = (string.find(path_entries[i], "mason") and "🔧" or "  ")
        print(string.format("%s %d: %s", marker, i, path_entries[i]))
    end
    print("")
    local mason_tools = {
        -- LSP Servers (Mason-managed)
        "gopls", "lua-language-server", "rust-analyzer",
        "typescript-language-server", "intelephense", "zls",

        -- Formatters (Mason-managed)
        "stylua", "prettier", "goimports", "black", "isort", "shfmt", "pint",

        -- Linters (Mason-managed)
        "golangci-lint", "eslint_d", "luacheck", "shellcheck"
    }

    local system_tools = {
        -- System tools (not managed by Mason)
        "gofmt",   -- Comes with Go installation
        "rustfmt", -- Comes with Rust installation
    }

    print("═══════════════════════════════════")
    print("         MASON TOOL VERIFICATION    ")
    print("═══════════════════════════════════")

    print("\n📦 MASON-MANAGED TOOLS:")
    local mason_found = 0
    local mason_total = 0

    for _, tool in ipairs(mason_tools) do
        mason_total = mason_total + 1
        if vim.fn.executable(tool) == 1 then
            local path = mason_verify.get_tool_path(tool)
            local is_mason = string.find(path, "mason", 1, true) ~= nil
            local status = is_mason and "✅ MASON" or "❌ SYSTEM"

            if is_mason then
                mason_found = mason_found + 1
            end

            print(string.format("%-25s %s", tool, status))
            if not is_mason then
                print(string.format("  └─ %s", path))
            end
        else
            print(string.format("%-25s ❌ NOT FOUND", tool))
        end
    end

    print("\n🔧 SYSTEM TOOLS (Not managed by Mason):")
    for _, tool in ipairs(system_tools) do
        if vim.fn.executable(tool) == 1 then
            local path = mason_verify.get_tool_path(tool)
            print(string.format("%-25s ✅ SYSTEM", tool))
        else
            print(string.format("%-25s ❌ NOT FOUND", tool))
        end
    end

    print("\n═══════════════════════════════════")
    print(string.format("Mason-managed: %d/%d tools", mason_found, mason_total))

    if mason_found == mason_total then
        print("🎉 All Mason tools are properly managed!")
    else
        print("⚠️  Some Mason tools are using system versions")
        print("💡 Try restarting Neovim or run :MasonUpdate")
    end
end

-- Function to fix PATH manually
function mason_verify.fix_path()
    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
    local current_path = vim.env.PATH or ""

    -- Remove any existing Mason bin entries to prevent duplicates
    local path_entries = vim.split(current_path, ":")
    local clean_path_entries = {}
    local mason_found = false

    for _, entry in ipairs(path_entries) do
        if entry == mason_bin then
            mason_found = true
        else
            table.insert(clean_path_entries, entry)
        end
    end

    -- Add Mason bin directory at the beginning
    local new_path = mason_bin .. ":" .. table.concat(clean_path_entries, ":")
    vim.env.PATH = new_path

    if mason_found then
        print("🔄 Cleaned duplicate Mason entries from PATH")
    else
        print("✅ Added Mason bin to PATH: " .. mason_bin)
    end

    -- Note: Neovim will automatically refresh executable paths
    print("🔄 PATH updated - executable paths will refresh automatically")
end

-- Create commands
vim.api.nvim_create_user_command('MasonVerify', mason_verify.verify_tools, { desc = "Verify Mason tool management" })
vim.api.nvim_create_user_command('MasonFixPath', mason_verify.fix_path, { desc = "Fix Mason PATH manually" })


-- ============================================================================
-- HEALTH CHECK (from lua/config/health-check.lua)
-- ============================================================================
local health_check = {}

-- Comprehensive health check for the entire Neovim configuration

function health_check.check_all()
    print("═══════════════════════════════════")
    print("      NEOVIM CONFIGURATION HEALTH   ")
    print("═══════════════════════════════════")
    print("")

    -- Check Mason tools
    print("🔧 MASON TOOLS:")
    local mason_verify = mason_verify
    mason_verify.verify_tools()
    print("")

    -- Check LSP status
    print("󰒋 LSP STATUS:")
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    if #clients > 0 then
        for _, client in ipairs(clients) do
            print("  ✓ " .. client.name .. " (ID: " .. client.id .. ")")
        end
    else
        print("  ⚠ No LSP clients attached to current buffer")
    end
    print("")

    -- Check formatters
    print("󰉿 FORMATTERS:")
    local ok, conform = pcall(require, "conform")
    if ok then
        local formatters = conform.list_formatters_to_run(0)
        if #formatters > 0 then
            for _, formatter in ipairs(formatters) do
                print("  ✓ " .. formatter.name)
            end
        else
            print("  ⚠ No formatters available for " .. vim.bo.filetype)
        end
    else
        print("  ✗ Conform.nvim not loaded")
    end
    print("")

    -- Check linters
    print("󰁨 LINTERS:")
    local ok, lint = pcall(require, "lint")
    if ok then
        local linters = lint.linters_by_ft[vim.bo.filetype] or {}
        if #linters > 0 then
            for _, linter in ipairs(linters) do
                print("  ✓ " .. linter)
            end
        else
            print("  ⚠ No linters configured for " .. vim.bo.filetype)
        end
    else
        print("  ✗ nvim-lint not loaded")
    end
    print("")

    -- Check key plugins
    print("📦 KEY PLUGINS:")
    local plugins_to_check = {
        { name = "mason",      module = "mason" },
        { name = "conform",    module = "conform" },
        { name = "lint",       module = "lint" },
        { name = "trouble",    module = "trouble" },
        { name = "dap",        module = "dap" },
        { name = "treesitter", module = "nvim-treesitter" },
    }

    for _, plugin in ipairs(plugins_to_check) do
        local ok, _ = pcall(require, plugin.module)
        if ok then
            print("  ✓ " .. plugin.name)
        else
            print("  ✗ " .. plugin.name .. " (not loaded)")
        end
    end
    print("")

    print("Run :checkhealth for detailed Neovim health information")
    print("Run :MasonVerify for detailed Mason tool verification")
end

-- Create user command
vim.api.nvim_create_user_command('HealthCheck', health_check.check_all, { desc = "Run comprehensive configuration health check" })


-- ============================================================================
-- MASON PATH INITIALIZATION (from lua/core/mason-path.lua)
-- ============================================================================
-- Early Mason PATH initialization
-- This ensures Mason's bin directory is always first in PATH
--
-- PURPOSE & PROBLEM IT SOLVES:
-- When you install tools via Mason (like golangci-lint, stylua, prettier, etc.),
-- they get installed to ~/.local/share/nvim/mason/bin/. However, if you also have
-- system versions of these tools installed (via brew, apt, etc.), your shell's
-- PATH might find the system version first, leading to:
--
-- - Version conflicts - Using an older system version instead of the Mason version
-- - Configuration issues - Mason tools might be configured differently
-- - Inconsistent behavior - Different versions behaving differently
--
-- THE SOLUTION:
-- This file prepends Mason's bin directory to the PATH environment variable,
-- ensuring Mason tools are found first:
-- Before: PATH = "/usr/local/bin:/usr/bin:/bin"
-- After:  PATH = "/Users/you/.local/share/nvim/mason/bin:/usr/local/bin:/usr/bin:/bin"
--
-- KEY FEATURES:
-- 1. Deduplication: Removes any existing Mason bin entries to prevent duplicates in PATH
-- 2. Early initialization: Runs before other plugins load, ensuring Mason tools are available immediately
-- 3. Directory creation: Creates the Mason bin directory if it doesn't exist yet
-- 4. Clean PATH management: Maintains a clean PATH without multiple Mason entries
--
-- WHY IT'S IMPORTANT:
-- In this configuration, Mason manages 16+ tools:
-- - LSP servers: gopls, lua-language-server, etc.
-- - Formatters: stylua, prettier, goimports, etc.
-- - Linters: golangci-lint, eslint_d, luacheck, etc.
--
-- Without this file, you might end up using system versions instead of Mason versions,
-- which could cause:
-- - The :MasonVerify command showing tools as "not Mason-managed"
-- - Inconsistent formatting/linting behavior
-- - Version-specific bugs or missing features
--
-- INTEGRATION WITH WORKFLOW:
-- This file works together with:
-- - lua/config/mason-verify.lua - Verifies which tools are Mason-managed
-- - lua/plugins/mason.lua - Installs and manages the tools
-- - Your linter/formatter configs - Use the Mason versions consistently
--
-- It's essentially the "foundation" that makes your entire Mason-based toolchain
-- work reliably by ensuring the right tools are found in the right order.

local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
local current_path = vim.env.PATH or ""

-- Remove any existing Mason bin entries to prevent duplicates
local path_entries = vim.split(current_path, ":")
local clean_path_entries = {}
local seen = {}

for _, entry in ipairs(path_entries) do
    -- Skip Mason bin entries and duplicates
    if entry ~= mason_bin and entry ~= "" and not seen[entry] then
        seen[entry] = true
        table.insert(clean_path_entries, entry)
    end
end

-- Add Mason bin directory at the beginning
local new_path = mason_bin .. ":" .. table.concat(clean_path_entries, ":")
vim.env.PATH = new_path

-- Verify Mason bin directory exists
if vim.fn.isdirectory(mason_bin) == 0 then
    -- Mason not installed yet, create placeholder
    vim.fn.mkdir(mason_bin, "p")
end

-- ============================================================================
-- STATUSLINE SETUP (from lua/core/statusline.lua)
-- ============================================================================
local function lsp_status_short()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    if #clients == 0 then
        return ""
    end

    local names = {}
    for _, client in ipairs(clients) do
        table.insert(names, client.name)
    end

    return "󰒋 " .. table.concat(names, ",")
end

local function git_branch()
    local ok, handle = pcall(io.popen, "git branch --show-current 2>/dev/null")
    if not ok or not handle then
        return ""
    end
    local branch = handle:read("*a")
    handle:close()
    if branch and branch ~= "" then
        branch = branch:gsub("\n", "")
        return " 󰊢 " .. branch
    end
    return ""
end

local function formatter_status()
    local ok, conform = pcall(require, "conform")
    if not ok then
        return ""
    end

    local formatters = conform.list_formatters_to_run(0)
    if #formatters == 0 then
        return ""
    end

    local formatter_names = {}
    for _, formatter in ipairs(formatters) do
        table.insert(formatter_names, formatter.name)
    end

    return "󰉿 " .. table.concat(formatter_names, ",")
end

local function linter_status()
    local ok, lint = pcall(require, "lint")
    if not ok then
        return ""
    end

    local linters = lint.linters_by_ft[vim.bo.filetype] or {}
    if #linters == 0 then
        return ""
    end

    return "󰁨 " .. table.concat(linters, ",")
end

local function safe_git_branch()
    local ok, result = pcall(git_branch)
    return ok and result or ""
end

local function safe_lsp_status()
    local ok, result = pcall(lsp_status_short)
    return ok and result or ""
end

local function safe_formatter_status()
    local ok, result = pcall(formatter_status)
    return ok and result or ""
end

local function safe_linter_status()
    local ok, result = pcall(linter_status)
    return ok and result or ""
end

local function open_file_explorer()
    require("snacks").explorer.open()
end

local function open_lsp_symbols()
    require("snacks").picker.lsp_symbols()
end

local function open_git_branches()
    require("snacks").picker.git_branches()
end

_G.git_branch = safe_git_branch
_G.lsp_status = safe_lsp_status
_G.formatter_status = safe_formatter_status
_G.linter_status = safe_linter_status
_G.open_file_explorer = open_file_explorer
_G.open_lsp_symbols = open_lsp_symbols
_G.open_git_branches = open_git_branches

-- local function setup_statusline_colors()
--     vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#d4be98" })
--     vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#7c6f64" })
-- end
--
-- setup_statusline_colors()
-- vim.api.nvim_create_autocmd("ColorScheme", {
--     callback = setup_statusline_colors
-- })
--
vim.opt.statusline = " %@v:lua.open_file_explorer@ 󰉋 %X"
    .. "%@v:lua.open_lsp_symbols@ 󰒕 %X"
    .. "%@v:lua.open_git_branches@ 󰊢 %X"
    .. " %f"
    .. "%m"
    .. "%r"
    .. "%="
    .. "%{v:lua.git_branch()}"
    .. " %{v:lua.linter_status()}"
    .. " %{v:lua.formatter_status()}"
    .. " %{v:lua.lsp_status()}"
    .. " %l:%c"
    .. " %p%% "

vim.opt.fillchars:append({ stl = "─", stlnc = "─" })

-- ============================================================================
-- LSP CONFIGURATION (from lua/core/lsp.lua)
-- ============================================================================
-- ============================================================================
-- LSP Server Definitions
-- ============================================================================
-- Each server config is loaded from lsp/<server-name>.lua
-- These configs are automatically managed by Mason (see lua/plugins/mason.lua)

local servers = {
    "lua-ls",        -- Lua language server
    "gopls",         -- Go language server
    "zls",           -- Zig language server
    "ts-ls",         -- TypeScript/JavaScript language server
    "rust-analyzer", -- Rust language server
    "intelephense",  -- PHP language server
    "tailwindcss",   -- Tailwind CSS language server
    "html-ls",       -- HTML language server
    "css-ls",        -- CSS language server
    "vue-ls",        -- Vue language server
}

-- ============================================================================
-- LSP Capabilities Setup (blink.cmp integration)
-- ============================================================================

local function get_capabilities()
    -- Check if blink.cmp is available
    local has_blink, blink = pcall(require, "blink.cmp")

    if has_blink and blink.get_lsp_capabilities then
        -- Merge default capabilities with blink.cmp capabilities
        return vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            blink.get_lsp_capabilities(),
            {
                -- Additional capabilities can be added here
                workspace = {
                    fileOperations = {
                        didRename = true,
                        willRename = true,
                    },
                },
            }
        )
    else
        -- Fallback to default capabilities if blink.cmp is not available
        return vim.lsp.protocol.make_client_capabilities()
    end
end

-- ============================================================================
-- LSP Keymaps (set on attach)
-- ============================================================================

local function setup_keymaps(bufnr)
    local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc, silent = true })
    end

    -- Navigation
    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
    map("n", "gr", vim.lsp.buf.references, "Go to references")
    map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition")

    -- Information
    map("n", "K", vim.lsp.buf.hover, "Hover documentation")
    map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
    map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")

    -- Code actions
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")

    -- Diagnostics
    map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
    map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
    map("n", "<leader>cd", vim.diagnostic.open_float, "Show diagnostic")
    map("n", "<leader>cl", vim.diagnostic.setloclist, "Diagnostics to loclist")

    -- Workspace
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "List workspace folders")
end

-- ============================================================================
-- LSP Attach Handler
-- ============================================================================

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if not client then return end

        -- Setup keymaps for this buffer
        setup_keymaps(bufnr)

        -- Enable completion triggered by <c-x><c-o>
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Enable inlay hints if supported (Neovim 0.10+)
        if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end

        -- Document highlight on cursor hold
        if client.server_capabilities.documentHighlightProvider then
            local highlight_group = vim.api.nvim_create_augroup("LspDocumentHighlight_" .. bufnr, { clear = true })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = bufnr,
                group = highlight_group,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = bufnr,
                group = highlight_group,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

-- ============================================================================
-- Diagnostic Configuration
-- ============================================================================

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})

-- ============================================================================
-- LSP Server Setup
-- ============================================================================

local capabilities = get_capabilities()

for _, server_name in ipairs(servers) do
    -- Load server-specific config from lsp/<server-name>.lua
    local config_path = vim.fn.stdpath("config") .. "/lsp/" .. server_name .. ".lua"

    if vim.fn.filereadable(config_path) == 1 then
        -- Load the config file
        local ok, server_config = pcall(dofile, config_path)

        if ok and type(server_config) == "table" then
            -- Merge capabilities with server config
            server_config.capabilities = vim.tbl_deep_extend(
                "force",
                capabilities,
                server_config.capabilities or {}
            )

            -- Enable the LSP with the loaded config
            vim.lsp.enable(server_name, server_config)
        else
            -- If config load failed, enable with default config
            vim.notify(
                string.format("Failed to load config for %s, using defaults", server_name),
                vim.log.levels.WARN
            )
            vim.lsp.enable(server_name, { capabilities = capabilities })
        end
    else
        -- No config file, use default config
        vim.lsp.enable(server_name, { capabilities = capabilities })
    end
end

-- ============================================================================
-- Utility Commands
-- ============================================================================

-- LspRestart: Restart LSP clients for current buffer
vim.api.nvim_create_user_command("LspRestart", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    if #clients == 0 then
        vim.notify("No LSP clients attached to restart", vim.log.levels.WARN)
        return
    end

    for _, client in ipairs(clients) do
        vim.notify("Restarting " .. client.name, vim.log.levels.INFO)
        vim.lsp.stop_client(client.id)
    end

    vim.defer_fn(function()
        vim.cmd("edit")
    end, 100)
end, { desc = "Restart LSP clients for current buffer" })

-- LspStatus: Show brief LSP status
vim.api.nvim_create_user_command("LspStatus", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    if #clients == 0 then
        print("󰅚 No LSP clients attached")
        return
    end

    print("󰒋 LSP Status for buffer " .. bufnr .. ":")
    print("─────────────────────────────────")

    for i, client in ipairs(clients) do
        print(string.format("󰌘 Client %d: %s (ID: %d)", i, client.name, client.id))
        print("  Root: " .. (client.config.root_dir or "N/A"))
        print("  Filetypes: " .. table.concat(client.config.filetypes or {}, ", "))

        local caps = client.server_capabilities
        local features = {}
        if caps.completionProvider then table.insert(features, "completion") end
        if caps.hoverProvider then table.insert(features, "hover") end
        if caps.definitionProvider then table.insert(features, "definition") end
        if caps.referencesProvider then table.insert(features, "references") end
        if caps.renameProvider then table.insert(features, "rename") end
        if caps.codeActionProvider then table.insert(features, "code_action") end
        if caps.documentFormattingProvider then table.insert(features, "formatting") end

        print("  Features: " .. table.concat(features, ", "))
        print("")
    end
end, { desc = "Show brief LSP status" })

-- LspCapabilities: Show all capabilities for attached LSP clients
vim.api.nvim_create_user_command("LspCapabilities", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    if #clients == 0 then
        print("No LSP clients attached")
        return
    end

    for _, client in ipairs(clients) do
        print("Capabilities for " .. client.name .. ":")
        local caps = client.server_capabilities

        local capability_list = {
            { "Completion",                caps.completionProvider },
            { "Hover",                     caps.hoverProvider },
            { "Signature Help",            caps.signatureHelpProvider },
            { "Go to Definition",          caps.definitionProvider },
            { "Go to Declaration",         caps.declarationProvider },
            { "Go to Implementation",      caps.implementationProvider },
            { "Go to Type Definition",     caps.typeDefinitionProvider },
            { "Find References",           caps.referencesProvider },
            { "Document Highlight",        caps.documentHighlightProvider },
            { "Document Symbol",           caps.documentSymbolProvider },
            { "Workspace Symbol",          caps.workspaceSymbolProvider },
            { "Code Action",               caps.codeActionProvider },
            { "Code Lens",                 caps.codeLensProvider },
            { "Document Formatting",       caps.documentFormattingProvider },
            { "Document Range Formatting", caps.documentRangeFormattingProvider },
            { "Rename",                    caps.renameProvider },
            { "Folding Range",             caps.foldingRangeProvider },
            { "Selection Range",           caps.selectionRangeProvider },
            { "Inlay Hint",                caps.inlayHintProvider },
        }

        for _, cap in ipairs(capability_list) do
            local status = cap[2] and "✓" or "✗"
            print(string.format("  %s %s", status, cap[1]))
        end
        print("")
    end
end, { desc = "Show all LSP capabilities" })

-- LspDiagnostics: Show diagnostic counts
vim.api.nvim_create_user_command("LspDiagnostics", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local diagnostics = vim.diagnostic.get(bufnr)

    local counts = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }

    for _, diagnostic in ipairs(diagnostics) do
        local severity = vim.diagnostic.severity[diagnostic.severity]
        counts[severity] = counts[severity] + 1
    end

    print("󰒡 Diagnostics for current buffer:")
    print("  Errors: " .. counts.ERROR)
    print("  Warnings: " .. counts.WARN)
    print("  Info: " .. counts.INFO)
    print("  Hints: " .. counts.HINT)
    print("  Total: " .. #diagnostics)
end, { desc = "Show diagnostic counts for current buffer" })

-- LspInfo: Comprehensive LSP information
vim.api.nvim_create_user_command("LspInfo", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    print("═══════════════════════════════════")
    print("           LSP INFORMATION          ")
    print("═══════════════════════════════════")
    print("")

    print("󰈙 Language client log: " .. vim.lsp.get_log_path())
    print("󰈔 Detected filetype: " .. vim.bo.filetype)
    print("󰈮 Buffer: " .. bufnr)
    print("󰈔 Root directory: " .. (vim.fn.getcwd() or "N/A"))
    print("")

    if #clients == 0 then
        print("󰅚 No LSP clients attached to buffer " .. bufnr)
        print("")
        print("Possible reasons:")
        print("  • No language server installed for " .. vim.bo.filetype)
        print("  • Language server not configured")
        print("  • Not in a project root directory")
        print("  • File type not recognized")
        return
    end

    print("󰒋 LSP clients attached to buffer " .. bufnr .. ":")
    print("─────────────────────────────────")

    for i, client in ipairs(clients) do
        print(string.format("󰌘 Client %d: %s", i, client.name))
        print("  ID: " .. client.id)
        print("  Root dir: " .. (client.config.root_dir or "Not set"))
        print("  Command: " .. table.concat(client.config.cmd or {}, " "))
        print("  Filetypes: " .. table.concat(client.config.filetypes or {}, ", "))

        if client.is_stopped() then
            print("  Status: 󰅚 Stopped")
        else
            print("  Status: 󰄬 Running")
        end

        if client.workspace_folders and #client.workspace_folders > 0 then
            print("  Workspace folders:")
            for _, folder in ipairs(client.workspace_folders) do
                print("    • " .. folder.name)
            end
        end

        local attached_buffers = {}
        for buf, _ in pairs(client.attached_buffers or {}) do
            table.insert(attached_buffers, buf)
        end
        print("  Attached buffers: " .. #attached_buffers)

        local caps = client.server_capabilities
        local key_features = {}
        if caps.completionProvider then table.insert(key_features, "completion") end
        if caps.hoverProvider then table.insert(key_features, "hover") end
        if caps.definitionProvider then table.insert(key_features, "definition") end
        if caps.documentFormattingProvider then table.insert(key_features, "formatting") end
        if caps.codeActionProvider then table.insert(key_features, "code_action") end

        if #key_features > 0 then
            print("  Key features: " .. table.concat(key_features, ", "))
        end

        print("")
    end

    local diagnostics = vim.diagnostic.get(bufnr)
    if #diagnostics > 0 then
        print("󰒡 Diagnostics Summary:")
        local counts = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }

        for _, diagnostic in ipairs(diagnostics) do
            local severity = vim.diagnostic.severity[diagnostic.severity]
            counts[severity] = counts[severity] + 1
        end

        print("  󰅚 Errors: " .. counts.ERROR)
        print("  󰀪 Warnings: " .. counts.WARN)
        print("  󰋽 Info: " .. counts.INFO)
        print("  󰌶 Hints: " .. counts.HINT)
        print("  Total: " .. #diagnostics)
    else
        print("󰄬 No diagnostics")
    end

    print("")
    print("Use :LspLog to view detailed logs")
    print("Use :LspCapabilities for full capability list")
end, { desc = "Show comprehensive LSP information" })

-- ============================================================================
-- LSP SERVER CONFIGURATIONS (from lsp/*.lua)
-- ============================================================================
-- Override the file-based LSP loading with inline configurations

do
    -- Inline LSP server configurations
    local lsp_inline_configs = {}

    -- lua-ls
    lsp_inline_configs["lua-ls"] = return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        '.luarc.json',
        '.luarc.jsonc',
        '.luacheckrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml',
        '.git',
    },
    settings = {
        Lua = {
            diagnostics = {
                disable = { "missing-fields" },
                globals = {
                    "vim",
                    "Snacks",
                },
            },
            hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
            },
        },
    },
}


    -- gopls
    lsp_inline_configs["gopls"] = return {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl', 'gosum' },
    root_markers = { 'go.mod', 'go.work', '.git' },
    settings = {
        gopls = {
            gofumpt = true,
            codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
            },
            hints = {
                assignVariableTypes = false,
                compositeLiteralFields = false,
                compositeLiteralTypes = false,
                constantValues = false,
                functionTypeParameters = false,
                parameterNames = false,
                rangeVariableTypes = false,
            },
            analyses = {
                -- NOTE: To temporarily enable disabled analyzers for specific debugging:
                -- :lua vim.lsp.stop_client(vim.lsp.get_clients({name = "gopls"}))
                -- Then edit this file and save, LSP will restart with new settings

                -- Essential analyzers for catching common issues
                nilness = true,      -- Check for nil pointer dereferences
                unusedparams = true, -- Find unused function parameters
                unusedwrite = true,  -- Find unused writes to variables
                useany = true,       -- Suggest using 'any' instead of 'interface{}'
                unreachable = true,  -- Find unreachable code
                unusedresult = true, -- Check for unused results of calls to certain functions

                -- Helpful but not critical (enable as needed)
                simplifyslice = true,        -- Simplify slice expressions
                simplifyrange = true,        -- Simplify range loops
                simplifycompositelit = true, -- Simplify composite literals

                -- Performance-intensive analyzers (disabled for better performance)
                shadow = false,    -- Check for shadowed variables (can be slow)
                printf = false,    -- Check printf-style functions (can be slow)
                structtag = false, -- Check struct tags (can be slow)
                -- fieldalignment = false,  -- Check struct field alignment (very slow)
                -- unusedvariable = false,  -- Can be slow on large codebases

                -- Less commonly needed analyzers (disabled)
                modernize = false,
                stylecheck = false,
                appends = false,
                asmdecl = false,
                assign = false,
                atomic = false,
                atomicalign = false,
                bools = false,
                buildtag = false,
                cgocall = false,
                composite = false,
                composites = false,
                contextcheck = false,
                copylocks = false,
                deba = false,
                deepequalerrors = false,
                defers = false,
                deprecated = false,
                directive = false,
                embed = false,
                errorsas = false,
                fillreturns = false,
                framepointer = false,
                gofix = false,
                hostport = false,
                httpresponse = false,
                ifaceassert = false,
                infertypeargs = false,
                loopclosure = false,
                lostcancel = false,
                nilfunc = false,
                nonewvars = false,
                noresultvalues = false,
                shift = false,
                sigchanyzer = false,
                slog = false,
                sortslice = false,
                stdmethods = false,
                stdversion = false,
                stringintconv = false,
                testinggoroutine = false,
                tests = false,
                timeformat = false,
                unmarshal = false,
                unsafeptr = false,
                unusedfunc = false,
                unusedvariable = false,
                waitgroup = false,
                yield = false,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = false,
        },
    },
}


    -- zls
    lsp_inline_configs["zls"] = return {
    cmd = { "zls" },
    filetypes = { "zig", "zir" },
    root_markers = { "zls.json", "build.zig", ".git" },
}


    -- ts-ls
    lsp_inline_configs["ts-ls"] = return {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        -- "vue"
    },
    root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
    settings = {
        typescript = {
            -- Remove tsdk setting to allow auto-detection
            tsserver = {
                useSyntaxServer = false,
            },
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
        javascript = {
            -- Remove tsdk setting to allow auto-detection
        },
    },
}


    -- rust-analyzer
    lsp_inline_configs["rust-analyzer"] = return {
    cmd = { "rust-analyzer" },
    root_markers = { "Cargo.lock" },
    filetypes = { "rust" },
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },
            diagnostics = {
                enable = true,
            },
        },
    },
}


    -- intelephense
    lsp_inline_configs["intelephense"] = local get_intelephense_license = function()
    local f = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))
    local content = f:read("*a")
    f:close()
    return string.gsub(content, "%s+", "")
end

return {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php", "blade" },
    root_markers = { "composer.json", ".git" },
    init_options = {
        licenceKey = get_intelephense_license(),
    },
}


    -- tailwindcss
    lsp_inline_configs["tailwindcss"] = return {
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "html",
        "blade",
        "css",
        "scss",
    },
    root_markers = {
        "tailwind.config.js",
        "tailwind.config.cjs",
        "tailwind.config.mjs",
        "tailwind.config.ts",
        "postcss.config.js",
        "postcss.config.ts",
        "package.json",
        ".git",
    },
    settings = {
        tailwindCSS = {
            emmetCompletions = true,
            validate = true,
            lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidScreen = "error",
                invalidVariant = "error",
                invalidConfigPath = "error",
                invalidTailwindDirective = "error",
                recommendedVariantOrder = "warning",
            },
            -- Tailwind class attributes configuration
            classAttributes = { "class", "className", "classList", "ngClass", ":class" },

            -- Experimental regex patterns to detect Tailwind classes in various syntaxes
            experimental = {
                classRegex = {
                    -- tw`...` or tw("...")
                    "tw`([^`]*)`",
                    "tw\\(([^)]*)\\)",

                    -- @apply directive inside SCSS / CSS
                    "@apply\\s+([^;]*)",

                    -- class and className attributes (HTML, JSX, Vue, Blade with :class)
                    'class="([^"]*)"',
                    'className="([^"]*)"',
                    ':class="([^"]*)"',

                    -- Laravel @class directive e.g. @class([ ... ])
                    "@class\\(([^)]*)\\)",
                },
            },
        },
    },
}


    -- html-ls
    lsp_inline_configs["html-ls"] = return {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = {
        "html",
        "blade",
        "javascriptreact",
        "typescriptreact",
        "svelte",
    },
    root_markers = { "index.html", ".git" },
    init_options = { provideFormatter = true },
}


    -- css-ls
    lsp_inline_configs["css-ls"] = return {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    root_markers = { "package.json", ".git" },
    settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true },
    },
}


    -- vue-ls
    lsp_inline_configs["vue-ls"] = -- Function to get TypeScript SDK path (prefer local, fallback to global)
local function get_typescript_sdk()
    local local_sdk = vim.fn.getcwd() .. '/node_modules/typescript/lib'
    if vim.fn.isdirectory(local_sdk) == 1 then
        return local_sdk
    end

    -- Try global installation
    local global_root = vim.fn.system('npm root -g'):gsub('\n', ''):gsub('\r', '')
    local global_sdk = global_root .. '/typescript/lib'
    if vim.fn.isdirectory(global_sdk) == 1 then
        return global_sdk
    end

    -- If both fail, return nil to let vue-language-server find it automatically
    return nil
end

return {
    cmd = { "vue-language-server", "--stdio" },
    filetypes = { "vue" },
    root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
    init_options = {
        vue = {
            hybridMode = false, -- Disable for inlay hints support
        },
        -- Only set typescript config if we have a valid TypeScript installation
        typescript = get_typescript_sdk() and {
            tsdk = get_typescript_sdk(),
        } or nil,
    },
    settings = {
        -- Remove TypeScript-specific settings to avoid conflicts with ts-ls
        -- Let the TypeScript Language Server handle TypeScript features
    },
}


    -- Apply inline LSP configurations (replaces file-based loading)
    local original_servers = servers  -- Save the servers list
    for _, server_name in ipairs(original_servers) do
        local server_config = lsp_inline_configs[server_name]
        if server_config then
            server_config.capabilities = vim.tbl_deep_extend(
                "force",
                capabilities,
                server_config.capabilities or {}
            )
            vim.lsp.enable(server_name, server_config)
        else
            vim.lsp.enable(server_name, { capabilities = capabilities })
        end
    end
end


-- ============================================================================
-- LAZY.NVIM PLUGIN MANAGER SETUP
-- ============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- PLUGIN CONFIGURATIONS
-- ============================================================================
-- All plugins from lua/plugins/*.lua are defined inline

require("lazy").setup({
  -- From lua/plugins/mason.lua
{
    {
        "williamboman/mason.nvim",
        lazy = false, -- Load immediately to ensure PATH is set
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        opts = {
            ensure_installed = {
                -- LSP servers (matching your vim.lsp.enable() config)
                "lua-language-server",         -- Lua LSP
                "gopls",                       -- Go LSP
                "zls",                         -- Zig LSP
                "typescript-language-server",  -- TypeScript LSP
                "rust-analyzer",               -- Rust LSP
                "intelephense",                -- PHP LSP
                "tailwindcss-language-server", -- Tailwind CSS LSP
                "html-lsp",                    -- HTML LSP
                "css-lsp",                     -- CSS LSP
                "vue-language-server",         -- Vue LSP

                -- Formatters (for conform.nvim and general use)
                "stylua",
                "goimports",
                -- Note: gofmt comes with Go installation, not managed by Mason
                "prettier",
                "black",
                "isort",

                -- Linters and diagnostics
                "golangci-lint",
                "eslint_d",
                "luacheck", -- Lua linting
                "pint",     -- Laravel Pint for PHP (formatting & linting)

                -- Additional useful tools
                "delve",      -- Go debugger
                "shfmt",      -- Shell formatter
                "shellcheck", -- Shell linter

                -- Optional but useful additions
                -- "markdownlint", -- Markdown linting
                -- "yamllint",     -- YAML linting
                -- "jsonlint",     -- JSON linting
            },
        },
        config = function(_, opts)
            -- PATH is handled by core.mason-path for consistency
            require("mason").setup(opts)

            -- Auto-install ensure_installed tools with better error handling
            local mr = require("mason-registry")
            local function ensure_installed()
                for _, tool in ipairs(opts.ensure_installed) do
                    if mr.has_package(tool) then
                        local p = mr.get_package(tool)
                        if not p:is_installed() then
                            vim.notify("Mason: Installing " .. tool .. "...", vim.log.levels.INFO)
                            p:install():once("closed", function()
                                if p:is_installed() then
                                    vim.notify("Mason: Successfully installed " .. tool, vim.log.levels.INFO)
                                else
                                    vim.notify("Mason: Failed to install " .. tool, vim.log.levels.ERROR)
                                end
                            end)
                        end
                    else
                        vim.notify("Mason: Package '" .. tool .. "' not found", vim.log.levels.WARN)
                    end
                end
            end

            if mr.refresh then
                mr.refresh(ensure_installed)
            else
                ensure_installed()
            end
        end,
    },,

  -- From lua/plugins/colorschemes.lua
{
  {
    "sainnhe/gruvbox-material",
    enabled = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "bright"
      vim.g.gruvbox_material_statusline_style = "mix" -- Options: "original", "material", "mix", "afterglow"
      vim.g.gruvbox_material_cursor = "auto"

      -- vim.g.gruvbox_material_colors_override = { bg0 = '#16181A' } -- #0e1010
      -- vim.g.gruvbox_material_better_performance = 1

      vim.cmd.colorscheme("gruvbox-material")

      -- Custom statusline highlights
      -- vim.api.nvim_set_hl(0, "StatusLine", {
      --   bg = "#1C2021", -- Dark gray background
      --   fg = "#ebdbb2", -- Light text
      --   bold = false
      -- })
      --
      -- vim.api.nvim_set_hl(0, "StatusLineNC", {
      --   bg = "#1C2021", -- Darker background for inactive windows
      --   fg = "#928374", -- Muted text
      --   bold = false
      -- })
    end,
  },
  {
    'adibhanna/forest-night.nvim',
    priority = 1000,
    config = function()
      -- vim.cmd('colorscheme forest-night')
    end,
  },
  {
    "RRethy/base16-nvim",
    enabled = false,
    config = function()
      vim.cmd('colorscheme base16-ayu-mirage')

      -- Get the base16 colors after setting the colorscheme
      local colors = require('base16-colorscheme').colors

      -- Map base16 colors to catppuccin-like names for easier reference
      local ayu_colors = {
        -- Background colors
        base = colors.base00,     -- main background
        mantle = colors.base01,   -- darker background for floating windows
        surface0 = colors.base02, -- surface color
        surface1 = colors.base03, -- lighter surface
        surface2 = colors.base04, -- even lighter surface

        -- Text colors
        text = colors.base05,     -- main text
        subtext1 = colors.base04, -- dimmer text
        subtext0 = colors.base03, -- even dimmer text

        -- Overlay colors
        overlay0 = colors.base03,
        overlay1 = colors.base04,
        overlay2 = colors.base06,

        -- Accent colors
        red = colors.base08,    -- red accent
        peach = colors.base09,  -- orange/peach accent
        yellow = colors.base0A, -- yellow accent
        green = colors.base0B,  -- green accent
        teal = colors.base0C,   -- teal/cyan accent
        blue = colors.base0D,   -- blue accent
        mauve = colors.base0E,  -- purple/mauve accent
      }

      -- Apply all the custom highlight groups
      local highlights = {
        -- Completion menu styling
        Pmenu = { bg = ayu_colors.mantle, fg = ayu_colors.text },
        PmenuSel = { bg = ayu_colors.surface0, fg = ayu_colors.text },
        PmenuSbar = { bg = ayu_colors.surface0 },
        PmenuThumb = { bg = ayu_colors.surface2 },
        PmenuExtra = { bg = ayu_colors.mantle, fg = ayu_colors.subtext1 },

        -- Floating windows
        NormalFloat = { bg = ayu_colors.mantle },
        FloatBorder = { bg = ayu_colors.mantle, fg = ayu_colors.surface2 },
        FloatTitle = { bg = ayu_colors.mantle, fg = ayu_colors.text },

        -- Blink.cmp specific highlighting
        BlinkCmpMenu = { bg = ayu_colors.mantle, fg = ayu_colors.text },
        BlinkCmpMenuBorder = { bg = ayu_colors.mantle, fg = ayu_colors.surface2 },
        BlinkCmpMenuSelection = { bg = ayu_colors.surface0, fg = ayu_colors.text },
        BlinkCmpScrollBarThumb = { bg = ayu_colors.surface2 },
        BlinkCmpScrollBarGutter = { bg = ayu_colors.surface0 },
        BlinkCmpLabel = { bg = ayu_colors.mantle, fg = ayu_colors.text },
        BlinkCmpLabelDeprecated = { bg = ayu_colors.mantle, fg = ayu_colors.overlay0, strikethrough = true },
        BlinkCmpLabelDetail = { bg = ayu_colors.mantle, fg = ayu_colors.subtext1 },
        BlinkCmpLabelDescription = { bg = ayu_colors.mantle, fg = ayu_colors.subtext1 },
        BlinkCmpKind = { bg = ayu_colors.mantle, fg = ayu_colors.peach },
        BlinkCmpSource = { bg = ayu_colors.mantle, fg = ayu_colors.overlay1 },
        BlinkCmpGhostText = { fg = ayu_colors.overlay0, italic = true },
        BlinkCmpDoc = { bg = ayu_colors.mantle, fg = ayu_colors.text },
        BlinkCmpDocBorder = { bg = ayu_colors.mantle, fg = ayu_colors.surface2 },
        BlinkCmpDocSeparator = { bg = ayu_colors.mantle, fg = ayu_colors.surface1 },
        BlinkCmpDocCursorLine = { bg = ayu_colors.surface0 },
        BlinkCmpSignatureHelp = { bg = ayu_colors.mantle, fg = ayu_colors.text },
        BlinkCmpSignatureHelpBorder = { bg = ayu_colors.mantle, fg = ayu_colors.surface2 },
        BlinkCmpSignatureHelpActiveParameter = { bg = ayu_colors.surface0, fg = ayu_colors.peach, bold = true },

        -- Snacks.nvim picker NvChad style
        SnacksPicker = { bg = ayu_colors.base },
        SnacksPickerBorder = { fg = ayu_colors.surface0, bg = ayu_colors.base },
        SnacksPickerPreview = { bg = ayu_colors.base },
        SnacksPickerPreviewBorder = { fg = ayu_colors.base, bg = ayu_colors.base },
        SnacksPickerPreviewTitle = { fg = ayu_colors.base, bg = ayu_colors.green },
        SnacksPickerBoxBorder = { fg = ayu_colors.base, bg = ayu_colors.base },
        SnacksPickerInputBorder = { fg = ayu_colors.surface2, bg = ayu_colors.base },
        SnacksPickerInputSearch = { fg = ayu_colors.text, bg = ayu_colors.base },
        SnacksPickerList = { bg = ayu_colors.base },
        SnacksPickerListBorder = { fg = ayu_colors.base, bg = ayu_colors.base },
        SnacksPickerListTitle = { fg = ayu_colors.base, bg = ayu_colors.base },

        -- Additional picker elements
        SnacksPickerDir = { fg = ayu_colors.blue },
        SnacksPickerFile = { fg = ayu_colors.text },
        SnacksPickerMatch = { fg = ayu_colors.peach, bold = true },
        SnacksPickerCursor = { bg = ayu_colors.surface0, fg = ayu_colors.text },
        SnacksPickerSelected = { bg = ayu_colors.surface0, fg = ayu_colors.text },
        SnacksPickerIcon = { fg = ayu_colors.blue },
        SnacksPickerSource = { fg = ayu_colors.overlay1 },
        SnacksPickerCount = { fg = ayu_colors.overlay1 },
        SnacksPickerFooter = { fg = ayu_colors.overlay1 },
        SnacksPickerHeader = { fg = ayu_colors.text, bold = true },
        SnacksPickerSpecial = { fg = ayu_colors.peach },
        SnacksPickerIndent = { fg = ayu_colors.surface1 },
        SnacksPickerMulti = { fg = ayu_colors.peach },
        SnacksPickerTitle = { fg = ayu_colors.text, bold = true },
        SnacksPickerPrompt = { fg = ayu_colors.text },

        -- Snacks core components
        SnacksNotifierNormal = { bg = ayu_colors.mantle, fg = ayu_colors.text },
        SnacksNotifierBorder = { bg = ayu_colors.mantle, fg = ayu_colors.surface2 },
        SnacksNotifierTitle = { bg = ayu_colors.mantle, fg = ayu_colors.text, bold = true },
        SnacksNotifierIcon = { bg = ayu_colors.mantle, fg = ayu_colors.blue },
        SnacksNotifierIconInfo = { bg = ayu_colors.mantle, fg = ayu_colors.blue },
        SnacksNotifierIconWarn = { bg = ayu_colors.mantle, fg = ayu_colors.yellow },
        SnacksNotifierIconError = { bg = ayu_colors.mantle, fg = ayu_colors.red },

        -- Snacks Dashboard
        SnacksDashboardNormal = { bg = ayu_colors.base, fg = ayu_colors.text },
        SnacksDashboardDesc = { bg = ayu_colors.base, fg = ayu_colors.subtext1 },
        SnacksDashboardFile = { bg = ayu_colors.base, fg = ayu_colors.text },
        SnacksDashboardDir = { bg = ayu_colors.base, fg = ayu_colors.blue },
        SnacksDashboardFooter = { bg = ayu_colors.base, fg = ayu_colors.overlay1 },
        SnacksDashboardHeader = { bg = ayu_colors.base, fg = ayu_colors.text, bold = true },
        SnacksDashboardIcon = { bg = ayu_colors.base, fg = ayu_colors.blue },
        SnacksDashboardKey = { bg = ayu_colors.base, fg = ayu_colors.peach },
        SnacksDashboardTerminal = { bg = ayu_colors.base, fg = ayu_colors.text },
        SnacksDashboardSpecial = { bg = ayu_colors.base, fg = ayu_colors.peach },

        -- Snacks Terminal
        SnacksTerminalNormal = { bg = ayu_colors.mantle, fg = ayu_colors.text },
        SnacksTerminalBorder = { bg = ayu_colors.mantle, fg = ayu_colors.surface2 },
        SnacksTerminalTitle = { bg = ayu_colors.mantle, fg = ayu_colors.text, bold = true },

        -- Other UI elements
        CmpItemMenu = { fg = ayu_colors.surface2 },
        CursorLineNr = { fg = ayu_colors.text },
        GitSignsChange = { fg = ayu_colors.peach },
        LineNr = { fg = ayu_colors.overlay0 },
        LspInfoBorder = { link = "FloatBorder" },
        VertSplit = { bg = ayu_colors.base, fg = ayu_colors.surface0 },
        WhichKeyFloat = { bg = ayu_colors.mantle },
        YankHighlight = { bg = ayu_colors.surface2 },
        FidgetTask = { fg = ayu_colors.subtext1 },
        FidgetTitle = { fg = ayu_colors.peach },

        -- Indent guides
        IblIndent = { fg = ayu_colors.surface0 },
        IblScope = { fg = ayu_colors.overlay0 },

        -- Syntax highlighting
        Boolean = { fg = ayu_colors.mauve },
        Number = { fg = ayu_colors.mauve },
        Float = { fg = ayu_colors.mauve },

        PreProc = { fg = ayu_colors.mauve },
        PreCondit = { fg = ayu_colors.mauve },
        Include = { fg = ayu_colors.mauve },
        Define = { fg = ayu_colors.mauve },
        Conditional = { fg = ayu_colors.red },
        Repeat = { fg = ayu_colors.red },
        Keyword = { fg = ayu_colors.red },
        Typedef = { fg = ayu_colors.red },
        Exception = { fg = ayu_colors.red },
        Statement = { fg = ayu_colors.red },

        Error = { fg = ayu_colors.red },
        StorageClass = { fg = ayu_colors.peach },
        Tag = { fg = ayu_colors.peach },
        Label = { fg = ayu_colors.peach },
        Structure = { fg = ayu_colors.peach },
        Operator = { fg = ayu_colors.peach },
        Title = { fg = ayu_colors.peach },
        Special = { fg = ayu_colors.yellow },
        SpecialChar = { fg = ayu_colors.yellow },
        Type = { fg = ayu_colors.yellow, bold = true },
        Function = { fg = ayu_colors.green, bold = true },
        Delimiter = { fg = ayu_colors.subtext1 },
        Ignore = { fg = ayu_colors.subtext1 },
        Macro = { fg = ayu_colors.teal },

        -- Treesitter highlights
        TSAnnotation = { fg = ayu_colors.mauve },
        TSAttribute = { fg = ayu_colors.mauve },
        TSBoolean = { fg = ayu_colors.mauve },
        TSCharacter = { fg = ayu_colors.teal },
        TSCharacterSpecial = { link = "SpecialChar" },
        TSComment = { link = "Comment" },
        TSConditional = { fg = ayu_colors.red },
        TSConstBuiltin = { fg = ayu_colors.mauve },
        TSConstMacro = { fg = ayu_colors.mauve },
        TSConstant = { fg = ayu_colors.text },
        TSConstructor = { fg = ayu_colors.green },
        TSDebug = { link = "Debug" },
        TSDefine = { link = "Define" },
        TSEnvironment = { link = "Macro" },
        TSEnvironmentName = { link = "Type" },
        TSError = { link = "Error" },
        TSException = { fg = ayu_colors.red },
        TSField = { fg = ayu_colors.blue },
        TSFloat = { fg = ayu_colors.mauve },
        TSFuncBuiltin = { fg = ayu_colors.green },
        TSFuncMacro = { fg = ayu_colors.green },
        TSFunction = { fg = ayu_colors.green },
        TSFunctionCall = { fg = ayu_colors.green },
        TSInclude = { fg = ayu_colors.red },
        TSKeyword = { fg = ayu_colors.red },
        TSKeywordFunction = { fg = ayu_colors.red },
        TSKeywordOperator = { fg = ayu_colors.peach },
        TSKeywordReturn = { fg = ayu_colors.red },
        TSLabel = { fg = ayu_colors.peach },
        TSLiteral = { link = "String" },
        TSMath = { fg = ayu_colors.blue },
        TSMethod = { fg = ayu_colors.green },
        TSMethodCall = { fg = ayu_colors.green },
        TSNamespace = { fg = ayu_colors.yellow },
        TSNone = { fg = ayu_colors.text },
        TSNumber = { fg = ayu_colors.mauve },
        TSOperator = { fg = ayu_colors.peach },
        TSParameter = { fg = ayu_colors.text },
        TSParameterReference = { fg = ayu_colors.text },
        TSPreProc = { link = "PreProc" },
        TSProperty = { fg = ayu_colors.blue },
        TSPunctBracket = { fg = ayu_colors.text },
        TSPunctDelimiter = { link = "Delimiter" },
        TSPunctSpecial = { fg = ayu_colors.blue },
        TSRepeat = { fg = ayu_colors.red },
        TSStorageClass = { fg = ayu_colors.peach },
        TSStorageClassLifetime = { fg = ayu_colors.peach },
        TSStrike = { fg = ayu_colors.subtext1 },
        TSString = { fg = ayu_colors.teal },
        TSStringEscape = { fg = ayu_colors.green },
        TSStringRegex = { fg = ayu_colors.green },
        TSStringSpecial = { link = "SpecialChar" },
        TSSymbol = { fg = ayu_colors.text },
        TSTag = { fg = ayu_colors.peach },
        TSTagAttribute = { fg = ayu_colors.green },
        TSTagDelimiter = { fg = ayu_colors.green },
        TSText = { fg = ayu_colors.green },
        TSTextReference = { link = "Constant" },
        TSTitle = { link = "Title" },
        TSTodo = { link = "Todo" },
        TSType = { fg = ayu_colors.yellow, bold = true },
        TSTypeBuiltin = { fg = ayu_colors.yellow, bold = true },
        TSTypeDefinition = { fg = ayu_colors.yellow, bold = true },
        TSTypeQualifier = { fg = ayu_colors.peach, bold = true },
        TSURI = { fg = ayu_colors.blue },
        TSVariable = { fg = ayu_colors.text },
        TSVariableBuiltin = { fg = ayu_colors.mauve },
      }

      -- Apply all highlights
      for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
      end
    end
  },
  {
    "catppuccin/nvim",
    priority = 150,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        background = {
          light = "latte",
          dark = "mocha",
        },
        color_overrides = {
          latte = {
            rosewater = "#c14a4a",
            flamingo = "#c14a4a",
            red = "#c14a4a",
            maroon = "#c14a4a",
            pink = "#945e80",
            mauve = "#945e80",
            peach = "#c35e0a",
            yellow = "#b47109",
            green = "#6c782e",
            teal = "#4c7a5d",
            sky = "#4c7a5d",
            sapphire = "#4c7a5d",
            blue = "#45707a",
            lavender = "#45707a",
            text = "#654735",
            subtext1 = "#73503c",
            subtext0 = "#805942",
            overlay2 = "#8c6249",
            overlay1 = "#8c856d",
            overlay0 = "#a69d81",
            surface2 = "#bfb695",
            surface1 = "#d1c7a3",
            surface0 = "#e3dec3",
            base = "#f9f5d7",
            mantle = "#f0ebce",
            crust = "#e8e3c8",
          },
          mocha = {
            rosewater = "#ea6962",
            flamingo = "#ea6962",
            red = "#ea6962",
            maroon = "#ea6962",
            pink = "#d3869b",
            mauve = "#d3869b",
            peach = "#e78a4e",
            yellow = "#d8a657",
            green = "#a9b665",
            teal = "#89b482",
            sky = "#89b482",
            sapphire = "#89b482",
            blue = "#7daea3",
            lavender = "#7daea3",
            text = "#ebdbb2",
            subtext1 = "#d5c4a1",
            subtext0 = "#bdae93",
            overlay2 = "#a89984",
            overlay1 = "#928374",
            overlay0 = "#595959",
            surface2 = "#4d4d4d",
            surface1 = "#404040",
            surface0 = "#292929",
            base = "#1d2021",
            mantle = "#191b1c",
            crust = "#141617",
          },
        },
        transparent_background = false,
        show_end_of_buffer = false,
        integration_default = false,
        no_bold = true,
        no_italic = true,
        no_underline = true,
        integrations = {
          blink_cmp = {
            style = 'bordered',
          },
          snacks = {
            enabled = true,
            -- indent_scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
          },
          -- barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
          -- cmp = true,
          gitsigns = true,
          -- hop = true,
          -- illuminate = { enabled = true },
          native_lsp = { enabled = true, inlay_hints = { background = true } },
          -- neogit = true,
          -- neotree = true,
          semantic_tokens = true,
          treesitter = true,
          treesitter_context = true,
          -- vimwiki = true,
          which_key = true,
          -- aerial = true,
          fidget = true,
          mason = true,
          neotest = true,
          dap_ui = true,
          -- telescope = {
          --   enabled = true,
          --   style = "nvchad",
          -- },
        },
        highlight_overrides = {
          all = function(colors)
            return {
              -- Completion menu styling
              Pmenu = { bg = colors.mantle, fg = colors.text },
              PmenuSel = { bg = colors.surface0, fg = colors.text },
              PmenuSbar = { bg = colors.surface0 },
              PmenuThumb = { bg = colors.surface2 },
              PmenuExtra = { bg = colors.mantle, fg = colors.subtext1 },

              -- Floating windows
              NormalFloat = { bg = colors.mantle },
              FloatBorder = { bg = colors.mantle, fg = colors.surface2 },
              FloatTitle = { bg = colors.mantle, fg = colors.text },

              -- Blink.cmp specific highlighting
              BlinkCmpMenu = { bg = colors.mantle, fg = colors.text },
              BlinkCmpMenuBorder = { bg = colors.mantle, fg = colors.surface2 },
              BlinkCmpMenuSelection = { bg = colors.surface0, fg = colors.text },
              BlinkCmpScrollBarThumb = { bg = colors.surface2 },
              BlinkCmpScrollBarGutter = { bg = colors.surface0 },
              BlinkCmpLabel = { bg = colors.mantle, fg = colors.text },
              BlinkCmpLabelDeprecated = { bg = colors.mantle, fg = colors.overlay0, strikethrough = true },
              BlinkCmpLabelDetail = { bg = colors.mantle, fg = colors.subtext1 },
              BlinkCmpLabelDescription = { bg = colors.mantle, fg = colors.subtext1 },
              BlinkCmpKind = { bg = colors.mantle, fg = colors.peach },
              BlinkCmpSource = { bg = colors.mantle, fg = colors.overlay1 },
              BlinkCmpGhostText = { fg = colors.overlay0, italic = true },
              BlinkCmpDoc = { bg = colors.mantle, fg = colors.text },
              BlinkCmpDocBorder = { bg = colors.mantle, fg = colors.surface2 },
              BlinkCmpDocSeparator = { bg = colors.mantle, fg = colors.surface1 },
              BlinkCmpDocCursorLine = { bg = colors.surface0 },
              BlinkCmpSignatureHelp = { bg = colors.mantle, fg = colors.text },
              BlinkCmpSignatureHelpBorder = { bg = colors.mantle, fg = colors.surface2 },
              BlinkCmpSignatureHelpActiveParameter = { bg = colors.surface0, fg = colors.peach, bold = true },

              -- Snacks.nvim picker NvChad style
              SnacksPicker = { bg = colors.base },
              SnacksPickerBorder = { fg = colors.surface0, bg = colors.base },
              SnacksPickerPreview = { bg = colors.base },
              SnacksPickerPreviewBorder = { fg = colors.base, bg = colors.base },
              SnacksPickerPreviewTitle = { fg = colors.base, bg = colors.green },
              SnacksPickerBoxBorder = { fg = colors.base, bg = colors.base },
              SnacksPickerInputBorder = { fg = colors.surface2, bg = colors.base },
              SnacksPickerInputSearch = { fg = colors.text, bg = colors.base },
              SnacksPickerList = { bg = colors.base },
              SnacksPickerListBorder = { fg = colors.base, bg = colors.base },
              SnacksPickerListTitle = { fg = colors.base, bg = colors.base },

              -- Additional picker elements
              SnacksPickerDir = { fg = colors.blue },
              SnacksPickerFile = { fg = colors.text },
              SnacksPickerMatch = { fg = colors.peach, bold = true },
              SnacksPickerCursor = { bg = colors.surface0, fg = colors.text },
              SnacksPickerSelected = { bg = colors.surface0, fg = colors.text },
              SnacksPickerIcon = { fg = colors.blue },
              SnacksPickerSource = { fg = colors.overlay1 },
              SnacksPickerCount = { fg = colors.overlay1 },
              SnacksPickerFooter = { fg = colors.overlay1 },
              SnacksPickerHeader = { fg = colors.text, bold = true },
              SnacksPickerSpecial = { fg = colors.peach },
              SnacksPickerIndent = { fg = colors.surface1 },
              SnacksPickerMulti = { fg = colors.peach },
              SnacksPickerTitle = { fg = colors.text, bold = true },
              SnacksPickerPrompt = { fg = colors.text },

              -- Snacks core components
              SnacksNotifierNormal = { bg = colors.mantle, fg = colors.text },
              SnacksNotifierBorder = { bg = colors.mantle, fg = colors.surface2 },
              SnacksNotifierTitle = { bg = colors.mantle, fg = colors.text, bold = true },
              SnacksNotifierIcon = { bg = colors.mantle, fg = colors.blue },
              SnacksNotifierIconInfo = { bg = colors.mantle, fg = colors.blue },
              SnacksNotifierIconWarn = { bg = colors.mantle, fg = colors.yellow },
              SnacksNotifierIconError = { bg = colors.mantle, fg = colors.red },

              -- Snacks Dashboard
              SnacksDashboardNormal = { bg = colors.base, fg = colors.text },
              SnacksDashboardDesc = { bg = colors.base, fg = colors.subtext1 },
              SnacksDashboardFile = { bg = colors.base, fg = colors.text },
              SnacksDashboardDir = { bg = colors.base, fg = colors.blue },
              SnacksDashboardFooter = { bg = colors.base, fg = colors.overlay1 },
              SnacksDashboardHeader = { bg = colors.base, fg = colors.text, bold = true },
              SnacksDashboardIcon = { bg = colors.base, fg = colors.blue },
              SnacksDashboardKey = { bg = colors.base, fg = colors.peach },
              SnacksDashboardTerminal = { bg = colors.base, fg = colors.text },
              SnacksDashboardSpecial = { bg = colors.base, fg = colors.peach },

              -- Snacks Terminal
              SnacksTerminalNormal = { bg = colors.mantle, fg = colors.text },
              SnacksTerminalBorder = { bg = colors.mantle, fg = colors.surface2 },
              SnacksTerminalTitle = { bg = colors.mantle, fg = colors.text, bold = true },

              CmpItemMenu = { fg = colors.surface2 },
              CursorLineNr = { fg = colors.text },
              GitSignsChange = { fg = colors.peach },
              LineNr = { fg = colors.overlay0 },
              LspInfoBorder = { link = "FloatBorder" },
              VertSplit = { bg = colors.base, fg = colors.surface0 },
              WhichKeyFloat = { bg = colors.mantle },
              YankHighlight = { bg = colors.surface2 },
              FidgetTask = { fg = colors.subtext1 },
              FidgetTitle = { fg = colors.peach },

              IblIndent = { fg = colors.surface0 },
              IblScope = { fg = colors.overlay0 },

              Boolean = { fg = colors.mauve },
              Number = { fg = colors.mauve },
              Float = { fg = colors.mauve },

              PreProc = { fg = colors.mauve },
              PreCondit = { fg = colors.mauve },
              Include = { fg = colors.mauve },
              Define = { fg = colors.mauve },
              Conditional = { fg = colors.red },
              Repeat = { fg = colors.red },
              Keyword = { fg = colors.red },
              Typedef = { fg = colors.red },
              Exception = { fg = colors.red },
              Statement = { fg = colors.red },

              Error = { fg = colors.red },
              StorageClass = { fg = colors.peach },
              Tag = { fg = colors.peach },
              Label = { fg = colors.peach },
              Structure = { fg = colors.peach },
              Operator = { fg = colors.peach },
              Title = { fg = colors.peach },
              Special = { fg = colors.yellow },
              SpecialChar = { fg = colors.yellow },
              Type = { fg = colors.yellow, style = { "bold" } },
              Function = { fg = colors.green, style = { "bold" } },
              Delimiter = { fg = colors.subtext1 },
              Ignore = { fg = colors.subtext1 },
              Macro = { fg = colors.teal },

              TSAnnotation = { fg = colors.mauve },
              TSAttribute = { fg = colors.mauve },
              TSBoolean = { fg = colors.mauve },
              TSCharacter = { fg = colors.teal },
              TSCharacterSpecial = { link = "SpecialChar" },
              TSComment = { link = "Comment" },
              TSConditional = { fg = colors.red },
              TSConstBuiltin = { fg = colors.mauve },
              TSConstMacro = { fg = colors.mauve },
              TSConstant = { fg = colors.text },
              TSConstructor = { fg = colors.green },
              TSDebug = { link = "Debug" },
              TSDefine = { link = "Define" },
              TSEnvironment = { link = "Macro" },
              TSEnvironmentName = { link = "Type" },
              TSError = { link = "Error" },
              TSException = { fg = colors.red },
              TSField = { fg = colors.blue },
              TSFloat = { fg = colors.mauve },
              TSFuncBuiltin = { fg = colors.green },
              TSFuncMacro = { fg = colors.green },
              TSFunction = { fg = colors.green },
              TSFunctionCall = { fg = colors.green },
              TSInclude = { fg = colors.red },
              TSKeyword = { fg = colors.red },
              TSKeywordFunction = { fg = colors.red },
              TSKeywordOperator = { fg = colors.peach },
              TSKeywordReturn = { fg = colors.red },
              TSLabel = { fg = colors.peach },
              TSLiteral = { link = "String" },
              TSMath = { fg = colors.blue },
              TSMethod = { fg = colors.green },
              TSMethodCall = { fg = colors.green },
              TSNamespace = { fg = colors.yellow },
              TSNone = { fg = colors.text },
              TSNumber = { fg = colors.mauve },
              TSOperator = { fg = colors.peach },
              TSParameter = { fg = colors.text },
              TSParameterReference = { fg = colors.text },
              TSPreProc = { link = "PreProc" },
              TSProperty = { fg = colors.blue },
              TSPunctBracket = { fg = colors.text },
              TSPunctDelimiter = { link = "Delimiter" },
              TSPunctSpecial = { fg = colors.blue },
              TSRepeat = { fg = colors.red },
              TSStorageClass = { fg = colors.peach },
              TSStorageClassLifetime = { fg = colors.peach },
              TSStrike = { fg = colors.subtext1 },
              TSString = { fg = colors.teal },
              TSStringEscape = { fg = colors.green },
              TSStringRegex = { fg = colors.green },
              TSStringSpecial = { link = "SpecialChar" },
              TSSymbol = { fg = colors.text },
              TSTag = { fg = colors.peach },
              TSTagAttribute = { fg = colors.green },
              TSTagDelimiter = { fg = colors.green },
              TSText = { fg = colors.green },
              TSTextReference = { link = "Constant" },
              TSTitle = { link = "Title" },
              TSTodo = { link = "Todo" },
              TSType = { fg = colors.yellow, style = { "bold" } },
              TSTypeBuiltin = { fg = colors.yellow, style = { "bold" } },
              TSTypeDefinition = { fg = colors.yellow, style = { "bold" } },
              TSTypeQualifier = { fg = colors.peach, style = { "bold" } },
              TSURI = { fg = colors.blue },
              TSVariable = { fg = colors.text },
              TSVariableBuiltin = { fg = colors.mauve },

              ["@annotation"] = { link = "TSAnnotation" },
              ["@attribute"] = { link = "TSAttribute" },
              ["@boolean"] = { link = "TSBoolean" },
              ["@character"] = { link = "TSCharacter" },
              ["@character.special"] = { link = "TSCharacterSpecial" },
              ["@comment"] = { link = "TSComment" },
              ["@conceal"] = { link = "Grey" },
              ["@conditional"] = { link = "TSConditional" },
              ["@constant"] = { link = "TSConstant" },
              ["@constant.builtin"] = { link = "TSConstBuiltin" },
              ["@constant.macro"] = { link = "TSConstMacro" },
              ["@constructor"] = { link = "TSConstructor" },
              ["@debug"] = { link = "TSDebug" },
              ["@define"] = { link = "TSDefine" },
              ["@error"] = { link = "TSError" },
              ["@exception"] = { link = "TSException" },
              ["@field"] = { link = "TSField" },
              ["@float"] = { link = "TSFloat" },
              ["@function"] = { link = "TSFunction" },
              ["@function.builtin"] = { link = "TSFuncBuiltin" },
              ["@function.call"] = { link = "TSFunctionCall" },
              ["@function.macro"] = { link = "TSFuncMacro" },
              ["@include"] = { link = "TSInclude" },
              ["@keyword"] = { link = "TSKeyword" },
              ["@keyword.function"] = { link = "TSKeywordFunction" },
              ["@keyword.operator"] = { link = "TSKeywordOperator" },
              ["@keyword.return"] = { link = "TSKeywordReturn" },
              ["@label"] = { link = "TSLabel" },
              ["@math"] = { link = "TSMath" },
              ["@method"] = { link = "TSMethod" },
              ["@method.call"] = { link = "TSMethodCall" },
              ["@namespace"] = { link = "TSNamespace" },
              ["@none"] = { link = "TSNone" },
              ["@number"] = { link = "TSNumber" },
              ["@operator"] = { link = "TSOperator" },
              ["@parameter"] = { link = "TSParameter" },
              ["@parameter.reference"] = { link = "TSParameterReference" },
              ["@preproc"] = { link = "TSPreProc" },
              ["@property"] = { link = "TSProperty" },
              ["@punctuation.bracket"] = { link = "TSPunctBracket" },
              ["@punctuation.delimiter"] = { link = "TSPunctDelimiter" },
              ["@punctuation.special"] = { link = "TSPunctSpecial" },
              ["@repeat"] = { link = "TSRepeat" },
              ["@storageclass"] = { link = "TSStorageClass" },
              ["@storageclass.lifetime"] = { link = "TSStorageClassLifetime" },
              ["@strike"] = { link = "TSStrike" },
              ["@string"] = { link = "TSString" },
              ["@string.escape"] = { link = "TSStringEscape" },
              ["@string.regex"] = { link = "TSStringRegex" },
              ["@string.special"] = { link = "TSStringSpecial" },
              ["@symbol"] = { link = "TSSymbol" },
              ["@tag"] = { link = "TSTag" },
              ["@tag.attribute"] = { link = "TSTagAttribute" },
              ["@tag.delimiter"] = { link = "TSTagDelimiter" },
              ["@text"] = { link = "TSText" },
              ["@text.danger"] = { link = "TSDanger" },
              ["@text.diff.add"] = { link = "diffAdded" },
              ["@text.diff.delete"] = { link = "diffRemoved" },
              ["@text.emphasis"] = { link = "TSEmphasis" },
              ["@text.environment"] = { link = "TSEnvironment" },
              ["@text.environment.name"] = { link = "TSEnvironmentName" },
              ["@text.literal"] = { link = "TSLiteral" },
              ["@text.math"] = { link = "TSMath" },
              ["@text.note"] = { link = "TSNote" },
              ["@text.reference"] = { link = "TSTextReference" },
              ["@text.strike"] = { link = "TSStrike" },
              ["@text.strong"] = { link = "TSStrong" },
              ["@text.title"] = { link = "TSTitle" },
              ["@text.todo"] = { link = "TSTodo" },
              ["@text.todo.checked"] = { link = "Green" },
              ["@text.todo.unchecked"] = { link = "Ignore" },
              ["@text.underline"] = { link = "TSUnderline" },
              ["@text.uri"] = { link = "TSURI" },
              ["@text.warning"] = { link = "TSWarning" },
              ["@todo"] = { link = "TSTodo" },
              ["@type"] = { link = "TSType" },
              ["@type.builtin"] = { link = "TSTypeBuiltin" },
              ["@type.definition"] = { link = "TSTypeDefinition" },
              ["@type.qualifier"] = { link = "TSTypeQualifier" },
              ["@uri"] = { link = "TSURI" },
              ["@variable"] = { link = "TSVariable" },
              ["@variable.builtin"] = { link = "TSVariableBuiltin" },

              ["@lsp.type.class"] = { link = "TSType" },
              ["@lsp.type.comment"] = { link = "TSComment" },
              ["@lsp.type.decorator"] = { link = "TSFunction" },
              ["@lsp.type.enum"] = { link = "TSType" },
              ["@lsp.type.enumMember"] = { link = "TSProperty" },
              ["@lsp.type.events"] = { link = "TSLabel" },
              ["@lsp.type.function"] = { link = "TSFunction" },
              ["@lsp.type.interface"] = { link = "TSType" },
              ["@lsp.type.keyword"] = { link = "TSKeyword" },
              ["@lsp.type.macro"] = { link = "TSConstMacro" },
              ["@lsp.type.method"] = { link = "TSMethod" },
              ["@lsp.type.modifier"] = { link = "TSTypeQualifier" },
              ["@lsp.type.namespace"] = { link = "TSNamespace" },
              ["@lsp.type.number"] = { link = "TSNumber" },
              ["@lsp.type.operator"] = { link = "TSOperator" },
              ["@lsp.type.parameter"] = { link = "TSParameter" },
              ["@lsp.type.property"] = { link = "TSProperty" },
              ["@lsp.type.regexp"] = { link = "TSStringRegex" },
              ["@lsp.type.string"] = { link = "TSString" },
              ["@lsp.type.struct"] = { link = "TSType" },
              ["@lsp.type.type"] = { link = "TSType" },
              ["@lsp.type.typeParameter"] = { link = "TSTypeDefinition" },
              ["@lsp.type.variable"] = { link = "TSVariable" },
            }
          end,
          latte = function(colors)
            return {
              IblIndent = { fg = colors.mantle },
              IblScope = { fg = colors.surface1 },

              LineNr = { fg = colors.surface1 },
            }
          end,
        },
      })
      -- vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, bg = "none", fg = "#eedaad" })
      -- vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "none", fg = "#eedaad" })
      -- vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "none", fg = "#eedaad" })

      -- vim.api.nvim_command("colorscheme catppuccin")
    end,
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').setup({
        -- This callback can be used to override the colors used in the base palette.
        on_palette = function(palette) end,
        -- This callback can be used to override the colors used in the extended palette.
        after_palette = function(palette) end,
        -- This callback can be used to override highlights before they are applied.
        on_highlight = function(highlights, palette) end,
        -- Enable bold keywords.
        bold_keywords = false,
        -- Enable italic comments.
        italic_comments = false,
        -- Enable editor background transparency.
        transparent = {
          -- Enable transparent background.
          bg = false,
          -- Enable transparent background for floating windows.
          float = false,
        },
        -- Enable brighter float border.
        bright_border = false,
        -- Reduce the overall amount of blue in the theme (diverges from base Nord).
        reduced_blue = true,
        -- Swap the dark background with the normal one.
        swap_backgrounds = false,
        -- Cursorline options.  Also includes visual/selection.
        cursorline = {
          -- Bold font in cursorline.
          bold = false,
          -- Bold cursorline number.
          bold_number = true,
          -- Available styles: 'dark', 'light'.
          theme = 'dark',
          -- Blending the cursorline bg with the buffer bg.
          blend = 0.85,
        },
        noice = {
          -- Available styles: `classic`, `flat`.
          style = 'flat',
        },
        telescope = {
          -- Available styles: `classic`, `flat`.
          style = 'flat',
        },
        leap = {
          -- Dims the backdrop when using leap.
          dim_backdrop = false,
        },
        ts_context = {
          -- Enables dark background for treesitter-context window
          dark_background = true,
        }
      })
      -- require('nordic').load()
    end
  },

  -- From lua/plugins/snacks.lua
{
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = false },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = {
      enabled = true,
      sources = {
        files = { hidden = true },
      },
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      },
    },
  },
  keys = {
    -- Top Pickers & Explorer
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Search Notifications",
    },
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    -- find
    {
      "<leader>o",
      function()
        Snacks.picker.buffers({
          win = {
            input = {
              keys = {
                ["dd"] = "bufdelete",
                ["<c-d>"] = { "bufdelete", mode = { "n", "i" } },
              },
            },
            list = { keys = { ["dd"] = "bufdelete" } },
          },
        })
      end,
      desc = "Buffers",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Config File",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find Git Files",
    },
    {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Projects",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
    -- git
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git Branches",
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Git Log Line",
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>gS",
      function()
        Snacks.picker.git_stash()
      end,
      desc = "Git Stash",
    },
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Git Diff (Hunks)",
    },
    {
      "<leader>gf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Git Log File",
    },
    -- Grep
    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<C-s>",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>st",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>sw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },
    -- search
    {
      '<leader>s"',
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>s/",
      function()
        Snacks.picker.search_history()
      end,
      desc = "Search History",
    },
    {
      "<leader>sa",
      function()
        Snacks.picker.autocmds()
      end,
      desc = "Autocmds",
    },
    -- Removed duplicate mapping for <leader>sb (already defined at line 175-180)
    {
      "<leader>sc",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sC",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>sD",
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "Buffer Diagnostics",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>sH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Highlights",
    },
    {
      "<leader>si",
      function()
        Snacks.picker.icons()
      end,
      desc = "Icons",
    },
    {
      "<leader>sj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Jumps",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sl",
      function()
        Snacks.picker.loclist()
      end,
      desc = "Location List",
    },
    {
      "<leader>sm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>sM",
      function()
        Snacks.picker.man()
      end,
      desc = "Man Pages",
    },
    {
      "<leader>sp",
      function()
        Snacks.picker.lazy()
      end,
      desc = "Search for Plugin Spec",
    },
    {
      "<leader>sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Quickfix List",
    },
    {
      "<leader>sR",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume",
    },
    {
      "<leader>su",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo History",
    },
    {
      "<leader>uC",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Colorschemes",
    },
    -- LSP
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    },
    {
      "<leader>p",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>WS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },
    -- Other
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },
    {
      "<leader>Z",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Toggle Zoom",
    },
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
    {
      "<leader>n",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
    {
      "Q",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
    {
      "<leader>cR",
      function()
        Snacks.rename.rename_file()
      end,
      desc = "Rename File",
    },
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse",
      mode = { "n", "v" },
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<c-/>",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle Terminal",
    },
    {
      "<c-_>",
      function()
        Snacks.terminal()
      end,
      desc = "which_key_ignore",
    },
    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle
            .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,,

  -- From lua/plugins/blink.lua
{
    { "L3MON4D3/LuaSnip", keys = {} },
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        -- event = "InsertEnter",
        version = "*",
        config = function()
            -- vim.cmd('highlight Pmenu guibg=none')
            -- vim.cmd('highlight PmenuExtra guibg=none')
            -- vim.cmd('highlight FloatBorder guibg=none')
            -- vim.cmd('highlight NormalFloat guibg=none')

            require("blink.cmp").setup({
                snippets = { preset = "luasnip" },
                signature = { enabled = true },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "normal",
                },
                sources = {
                    default = { "lsp", "path", "snippets", "lazydev", "buffer" },
                    providers = {
                        lazydev = {
                            name = "LazyDev",
                            module = "lazydev.integrations.blink",
                            score_offset = 100,
                        },
                        -- laravel = {
                        --     name = "laravel",
                        --     module = "laravel.blink_source",
                        -- },
                        cmdline = {
                            min_keyword_length = 2,
                        },
                    },
                },
                keymap = {
                    ["<C-f>"] = {},
                },
                cmdline = {
                    enabled = false,
                    completion = { menu = { auto_show = true } },
                    keymap = {
                        ["<CR>"] = { "accept_and_enter", "fallback" },
                    },
                },
                completion = {
                    menu = {
                        border = nil,
                        scrolloff = 1,
                        scrollbar = false,
                        draw = {
                            columns = {
                                { "kind_icon" },
                                { "label",      "label_description", gap = 1 },
                                { "kind" },
                                { "source_name" },
                            },
                        },
                    },
                    documentation = {
                        window = {
                            border = nil,
                            scrollbar = false,
                            winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                        },
                        auto_show = true,
                        auto_show_delay_ms = 500,
                    },
                },
            })

            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },,

  -- From lua/plugins/conform.lua
{
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true }, function(err, did_edit)
                    if not err and did_edit then
                        vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
                    end
                end)
            end,
            mode = { "n", "v" },
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            -- Go
            go = { "goimports", "gofmt" },

            -- Lua
            lua = { "stylua" },

            -- Web technologies
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            json = { "prettier" },
            jsonc = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },

            -- Python
            python = { "isort", "black" },

            -- PHP/Laravel
            php = { "pint" },

            -- Shell
            sh = { "shfmt" },
            bash = { "shfmt" },

            -- Other (system tools)
            rust = { "rustfmt" }, -- comes with Rust installation

            -- Additional file types (uncomment as needed)
            -- markdown = { "markdownlint" },
            -- yaml = { "yamllint" },
            -- toml = { "taplo" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        -- format_on_save = {
        --     timeout_ms = 1000,
        --     lsp_format = "fallback",
        -- },

    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,,

  -- From lua/plugins/nvim-lint.lua
{
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        -- Configure custom linters using Mason-managed tools
        local mason_bin_dir = vim.fn.stdpath("data") .. "/mason/bin"

        -- Customize golangcilint to ignore exit codes (golangci-lint exits with code 1-3 when issues are found)
        local golangcilint = require('lint').linters.golangcilint
        golangcilint.ignore_exitcode = true

        -- Configure Laravel Pint for linting (using --test mode)
        local pint_cmd = vim.fn.executable(mason_bin_dir .. "/pint") == 1
            and mason_bin_dir .. "/pint"
            or "pint"

        lint.linters.pint = {
            cmd = pint_cmd,
            stdin = false,
            args = { "--test" },
            stream = "stderr", -- Pint outputs diagnostics to stderr
            ignore_exitcode = true,
            parser = function(output, bufnr)
                local diagnostics = {}

                if not output or output == "" then
                    return diagnostics
                end

                -- Check if output contains style issues
                -- Pint outputs human-readable format by default when there are issues
                if string.find(output, "FAIL") or string.find(output, "differs") then
                    table.insert(diagnostics, {
                        lnum = 0,
                        col = 0,
                        message = "Code style issues found - run formatter to fix",
                        severity = vim.diagnostic.severity.WARN,
                        source = "pint"
                    })
                end

                return diagnostics
            end,
        }

        -- Configure linters by filetype (using Mason-managed tools)
        lint.linters_by_ft = {
            -- Go
            go = { "golangcilint" },

            -- JavaScript/TypeScript
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },

            -- Lua
            lua = { "luacheck" },

            -- Shell
            sh = { "shellcheck" },
            bash = { "shellcheck" },
            zsh = { "shellcheck" },

            -- PHP/Laravel
            php = { "pint" },

            -- You can add more linters here as needed
            -- python = { "flake8", "mypy" },
            -- rust = { "clippy" },
        }

        -- Auto-lint on save and text changes
        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                -- Only lint if linters are available for this filetype
                local linters = lint.linters_by_ft[vim.bo.filetype]
                if linters and #linters > 0 then
                    lint.try_lint()
                end
            end,
        })

        -- Manual linting command
        vim.keymap.set("n", "<leader>ll", function()
            lint.try_lint()
            vim.notify("Linting...", vim.log.levels.INFO, { title = "nvim-lint" })
        end, { desc = "Trigger linting for current file" })

        -- Show linter status
        vim.keymap.set("n", "<leader>li", function()
            local linters = lint.linters_by_ft[vim.bo.filetype] or {}
            if #linters == 0 then
                print("No linters configured for filetype: " .. vim.bo.filetype)
            else
                print("Linters for " .. vim.bo.filetype .. ": " .. table.concat(linters, ", "))

                -- Show which tools are being used
                if vim.bo.filetype == "php" then
                    if string.find(pint_cmd, "mason") then
                        print("Using Mason pint: " .. pint_cmd)
                    else
                        print("Using system pint: " .. pint_cmd)
                    end
                end
            end
        end, { desc = "Show available linters for current filetype" })
    end,,

  -- From lua/plugins/nvim-treesitter.lua
{
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                sync_install = false,
                modules = {},
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                auto_install = false,
                ensure_installed = {
                    "bash",
                    "c",
                    "html",
                    "javascript",
                    "json",
                    "lua",
                    "luadoc",
                    "luap",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "query",
                    "regex",
                    "tsx",
                    "typescript",
                    "vue",
                    "vim",
                    "vimdoc",
                    "yaml",
                    "rust",
                    "go",
                    "gomod",
                    "gowork",
                    "gosum",
                    "terraform",
                    "proto",
                    "zig",
                    "php",
                    "blade",
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>vv",
                        node_incremental = "+",
                        scope_incremental = false,
                        node_decremental = "_",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = { query = "@function.outer", desc = "around a function" },
                            ["if"] = { query = "@function.inner", desc = "inner part of a function" },
                            ["ac"] = { query = "@class.outer", desc = "around a class" },
                            ["ic"] = { query = "@class.inner", desc = "inner part of a class" },
                            ["ai"] = { query = "@conditional.outer", desc = "around an if statement" },
                            ["ii"] = { query = "@conditional.inner", desc = "inner part of an if statement" },
                            ["al"] = { query = "@loop.outer", desc = "around a loop" },
                            ["il"] = { query = "@loop.inner", desc = "inner part of a loop" },
                            ["ap"] = { query = "@parameter.outer", desc = "around parameter" },
                            ["ip"] = { query = "@parameter.inner", desc = "inside a parameter" },
                        },
                        selection_modes = {
                            ["@parameter.outer"] = "v",   -- charwise
                            ["@parameter.inner"] = "v",   -- charwise
                            ["@function.outer"] = "v",    -- charwise
                            ["@conditional.outer"] = "V", -- linewise
                            ["@loop.outer"] = "V",        -- linewise
                            ["@class.outer"] = "<c-v>",   -- blockwise
                        },
                        include_surrounding_whitespace = false,
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_previous_start = {
                            ["[f"] = { query = "@function.outer", desc = "Previous function" },
                            ["[c"] = { query = "@class.outer", desc = "Previous class" },
                            ["[p"] = { query = "@parameter.inner", desc = "Previous parameter" },
                        },
                        goto_next_start = {
                            ["]f"] = { query = "@function.outer", desc = "Next function" },
                            ["]c"] = { query = "@class.outer", desc = "Next class" },
                            ["]p"] = { query = "@parameter.inner", desc = "Next parameter" },
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>a"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>A"] = "@parameter.inner",
                        },
                    },
                },
            })
        end,
    },,

  -- From lua/plugins/trouble.lua
{
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  lazy = true,
  specs = {
    "folke/snacks.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts or {}, {
        picker = {
          actions = require("trouble.sources.snacks").actions,
          win = {
            input = {
              keys = {
                ["<c-t>"] = {
                  "trouble_open",
                  mode = { "n", "i" },
                },
              },
            },
          },
        },
      })
    end,
  },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
  config = function()
    require("trouble").setup({
      -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
      mode = "workspace_diagnostics",
      position = "bottom", -- position of the list can be: bottom, top, left, right
      height = 15,
      padding = false,
      action_keys = {
        -- key mappings for actions in the trouble list
        close = "q",                -- close the list
        cancel = "<esc>",           -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r",              -- manually refresh
        jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" },   -- open buffer in new split
        open_vsplit = { "<c-v>" },  -- open buffer in new vsplit
        open_tab = { "<c-t>" },     -- open buffer in new tab
        jump_close = { "o" },       -- jump to the diagnostic and close the list
        toggle_mode = "m",          -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P",       -- toggle auto_preview
        hover = "K",                -- opens a small popup with the full multiline message
        preview = "p",              -- preview the diagnostic location
        close_folds = { "zM" },     -- close all folds
        open_folds = { "zR" },      -- open all folds
        toggle_fold = { "za" },     -- toggle fold of current file
      },
      auto_jump = {},
      use_diagnostic_signs = true,
    })
  end,,

  -- From lua/plugins/which-key.lua
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = 300,
    icons = {
      rules = false,
      breadcrumb = " ", -- symbol used in the command line area that shows your active key combo
      separator = "󱦰  ", -- symbol used between a key and it's label
      group = "󰹍 ", -- symbol prepended to a group
    },
    plugins = {
      spelling = {
        enabled = false,
      },
    },
    win = {
      height = {
        max = math.huge,
      },
    },
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>f", group = "Find" },
        { "<leader>G", group = "Git" },
        { "<leader>g", group = "Gitsigns" },
        { "<leader>R", group = "Replace" },
        { "<leader>l", group = "LSP" },
        { "<leader>c", group = "LSP (Trouble)" },
        { "<leader>t", group = "Test" },
        { "<leader>D", group = "Debugger" },
        { "<leader>s", group = "Search" },
        { "<leader>x", group = "diagnostics/quickfix (Trouble)" },
        { "<leader>u", group = "Toggle Features" },
        { "<leader>W", group = "Workspace" },
        { "[",         group = "prev" },
        { "]",         group = "next" },
        { "g",         group = "goto" },
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },,

  -- From lua/plugins/git.lua
{
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- local icons = require('config.icons')
      require("gitsigns").setup({
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signs_staged = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        sign_priority = 6,
        status_formatter = nil,
        update_debounce = 200,
        max_file_length = 40000,
        preview_config = {
          border = "rounded",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        -- yadm = { enable = false },

        on_attach = function(bufnr)
          vim.keymap.set(
            "n",
            "<leader>H",
            require("gitsigns").preview_hunk,
            { buffer = bufnr, desc = "Preview git hunk" }
          )

          vim.keymap.set("n", "]]", require("gitsigns").next_hunk, { buffer = bufnr, desc = "Next git hunk" })

          vim.keymap.set("n", "[[", require("gitsigns").prev_hunk, { buffer = bufnr, desc = "Previous git hunk" })
        end,
      })
    end,
    keys = {
      {
        "<leader>Gk",
        function()
          require("gitsigns").prev_hunk({ navigation_message = false })
        end,
        desc = "Prev Hunk",
      },
      {
        "<leader>Gl",
        function()
          require("gitsigns").blame_line()
        end,
        desc = "Blame",
      },
      {
        "<leader>Gp",
        function()
          require("gitsigns").preview_hunk()
        end,
        desc = "Preview Hunk",
      },
      {
        "<leader>Gr",
        function()
          require("gitsigns").reset_hunk()
        end,
        desc = "Reset Hunk",
      },
      {
        "<leader>GR",
        function()
          require("gitsigns").reset_buffer()
        end,
        desc = "Reset Buffer",
      },
      {
        "<leader>Gj",
        function()
          require("gitsigns").next_hunk({ navigation_message = false })
        end,
        desc = "Next Hunk",
      },
      {
        "<leader>Gs",
        function()
          require("gitsigns").stage_hunk()
        end,
        desc = "Stage Hunk",
      },
      {
        "<leader>Gu",
        function()
          require("gitsigns").undo_stage_hunk()
        end,
        desc = "Undo Stage Hunk",
      },
      -- {
      --   "<leader>Go", require("telescope.builtin").git_status,
      --   desc = "Open changed file"
      -- },
      -- {
      --   "<leader>Gb", require("telescope.builtin").git_branches,
      --   desc = "Checkout branch"
      -- },
      -- {
      --   "<leader>Gc", require("telescope.builtin").git_commits,
      --   desc = "Checkout commit"
      -- },
      -- {
      --   "<leader>GC", require("telescope.builtin").git_bcommits,
      --   desc = "Checkout commit(for current file)"
      -- },
      {
        "<leader>Gd",
        function()
          vim.cmd("Gitsigns diffthis HEAD")
        end,
        desc = "Git Diff HEAD",
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  },
  -- Git related plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- not git, but it's okay
  {
    "mbbill/undotree",
    keys = {
      {
        "<leader>GU",
        ":UndotreeToggle<CR>",
        desc = "Toggle UndoTree",
      },
    },
  },,

  -- From lua/plugins/extra.lua
{
  -- Autotags
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },

  -- comments
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
  { "joosepalviste/nvim-ts-context-commentstring", lazy = true },

  -- Neovim plugin to improve the default vim.ui interfaces
  {
    "stevearc/dressing.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    config = function()
      require("dressing").setup()
    end,
  },

  -- Neovim notifications and LSP progress messages
  {
    "j-hui/fidget.nvim",
  },

  -- find and replace
  {
    "windwp/nvim-spectre",
    enabled = true,
    event = "BufRead",
    keys = {
      {
        "<leader>Rr",
        function()
          require("spectre").open()
        end,
        desc = "Replace",
      },
      {
        "<leader>Rw",
        function()
          require("spectre").open_visual({ select_word = true })
        end,
        desc = "Replace Word",
      },
      {
        "<leader>Rf",
        function()
          require("spectre").open_file_search()
        end,
        desc = "Replace Buffer",
      },
    },
  },

  -- Heuristically set buffer options
  {
    "tpope/vim-sleuth",
  },

  {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    -- {
    --   "saghen/blink.cmp",
    --   opts = {
    --     sources = {
    --       -- add lazydev to your completion providers
    --       default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    --       providers = {
    --         lazydev = {
    --           name = "LazyDev",
    --           module = "lazydev.integrations.blink",
    --           -- make lazydev completions top priority (see `:h blink.cmp`)
    --           score_offset = 100,
    --         },
    --       },
    --     },
    --   },
    -- }
  },

  -- editor config support
  {
    "editorconfig/editorconfig-vim",
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },

  -- {
  --   "utilyre/barbecue.nvim",
  --   name = "barbecue",
  --   version = "*",
  --   dependencies = {
  --     "SmiteshP/nvim-navic",
  --     "nvim-tree/nvim-web-devicons", -- optional dependency
  --   },
  --   opts = {
  --     -- configurations go here
  --   },
  --   config = function()
  --     require("barbecue").setup({
  --       create_autocmd = false, -- prevent barbecue from updating itself automatically
  --     })
  --
  --     vim.api.nvim_create_autocmd({
  --       "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  --       "BufWinEnter",
  --       "CursorHold",
  --       "InsertLeave",
  --
  --       -- include this if you have set `show_modified` to `true`
  --       -- "BufModifiedSet",
  --     }, {
  --       group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  --       callback = function()
  --         require("barbecue.ui").update()
  --       end,
  --     })
  --   end,
  -- },
  -- persist sessions
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {},
  },

  {
    "echasnovski/mini.nvim",
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require("mini.ai").setup({ n_lines = 500 })

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require("mini.surround").setup()

      require("mini.pairs").setup()

      -- local statusline = require("mini.statusline")
      -- statusline.setup({
      --   use_icons = vim.g.have_nerd_font,
      -- })
      -- ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return "%2l:%-2v"
      -- end
    end,
  },

  {
    "echasnovski/mini.icons",
    enabled = true,
    opts = {},
    lazy = true,
  },

  {
    "fladson/vim-kitty",
    "MunifTanjim/nui.nvim",
  },
  {
    "nvchad/showkeys",
    cmd = "ShowkeysToggle",
    opts = {
      timeout = 1,
      maxkeys = 6,
      -- bottom-left, bottom-right, bottom-center, top-left, top-right, top-center
      position = "bottom-right",
    },

    keys = {
      {
        "<leader>ut",
        function()
          vim.cmd("ShowkeysToggle")
        end,
        desc = "Show key presses",
      },
    },
  },,

  -- From lua/plugins/dap.lua
{
    'mfussenegger/nvim-dap',
    dependencies = {
        -- Creates a beautiful debugger UI
        'rcarriga/nvim-dap-ui',

        -- Required dependency for nvim-dap-ui
        'nvim-neotest/nvim-nio',

        -- optional
        -- 'mason-org/mason.nvim',
        -- 'jay-babu/mason-nvim-dap.nvim',

        -- Language-specific debuggers
        'leoluz/nvim-dap-go', -- Golang

        -- Shows variable values inline as virtual text
        'theHamsta/nvim-dap-virtual-text',
    },
    keys = {
        {
            '<leader>Dc',
            function()
                require('dap').continue()
            end,
            desc = 'Debug: Start/Continue',
        },
        {
            '<leader>Dsi',
            function()
                require('dap').step_into()
            end,
            desc = 'Debug: Step Into',
        },
        {
            '<leader>DsO',
            function()
                require('dap').step_over()
            end,
            desc = 'Debug: Step Over',
        },
        {
            '<leader>Dso',
            function()
                require('dap').step_out()
            end,
            desc = 'Debug: Step Out',
        },
        {
            '<leader>Db',
            function()
                require('dap').toggle_breakpoint()
            end,
            desc = 'Debug: Toggle Breakpoint',
        },
        {
            '<leader>DB',
            function()
                require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end,
            desc = 'Debug: Set Conditional Breakpoint',
        },
        {
            '<leader>Dt',
            function()
                require('dapui').toggle()
            end,
            desc = 'Debug: Toggle UI',
        },
        {
            '<leader>Dl',
            function()
                require('dap').run_last()
            end,
            desc = 'Debug: Run Last Configuration',
        },
    },
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        -- optional
        -- require('mason-nvim-dap').setup {
        --     automatic_installation = true,
        --     handlers = {},
        --     ensure_installed = {
        --         'delve',
        --     },
        -- }

        -- Dap UI setup
        dapui.setup {
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }

        -- Automatically open/close DAP UI
        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Setup virtual text to show variable values inline
        require("nvim-dap-virtual-text").setup()

        require('dap-go').setup({
            delve = {
                -- Use Mason's delve installation with fallback to system delve
                path = function()
                    local mason_delve = vim.fn.stdpath("data") .. "/mason/bin/dlv"
                    if vim.fn.executable(mason_delve) == 1 then
                        return mason_delve
                    end
                    -- Fallback to system delve
                    return vim.fn.exepath("dlv") ~= "" and vim.fn.exepath("dlv") or "dlv"
                end,

                -- On Windows delve must be run attached or it crashes.
                -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
                -- detached = vim.fn.has 'win32' == 0,
            }
        })
    end,,

  -- From lua/plugins/ai.lua
{
    -- Amp Plugin
    -- {
    --     "sourcegraph/amp.nvim",
    --     branch = "main",
    --     lazy = false,
    --     opts = { auto_start = true, log_level = "info" },
    -- },
    {
        "supermaven-inc/supermaven-nvim",
        enabled = false,
        config = function()
            require("supermaven-nvim").setup({})
        end,
    },
    {
        "olimorris/codecompanion.nvim",
        enabled = false,
        opts = {
            extensions = {
                history = {
                    enabled = true,
                    opts = {
                        keymap = "gh",
                        auto_generate_title = true,
                        continue_last_chat = false,
                        delete_on_clearing_chat = false,
                        picker = "snacks",
                        enable_logging = false,
                        dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
                    },
                },
                -- mcphub = {
                --   callback = "mcphub.extensions.codecompanion",
                --   opts = {
                --     make_vars = true,
                --     make_slash_commands = true,
                --     show_result_in_chat = true,
                --   },
                -- },
                vectorcode = {
                    opts = {
                        add_tool = true,
                    },
                },
            },
            adapters = {
                copilot = function()
                    return require("codecompanion.adapters").extend("copilot", {
                        schema = {
                            model = {
                                default = "gemini-2.5-pro",
                            },
                        },
                    })
                end,
            }
        },
        keys = {
            { "<leader>ic", "<cmd>CodeCompanion<cr>",        desc = "CodeCompanion" },
            { "<leader>iC", "<cmd>CodeCompanionChat<cr>",    desc = "CodeCompanion Chat" },
            { "<leader>ia", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
            { "<leader>id", "<cmd>CodeCompanionCmd<cr>",     desc = "CodeCompanion CMD" },
        },
        dependencies = {
            "j-hui/fidget.nvim",
            "ravitemer/codecompanion-history.nvim", -- Save and load conversation history
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- {
            --     "Davidyz/VectorCode", -- Index and search code in your repositories
            --     version = "*",
            --     build = "pipx upgrade vectorcode",
            --     dependencies = { "nvim-lua/plenary.nvim" },
            -- },
        },
        config = function()
            require("codecompanion").setup({
                strategies = {
                    chat = {
                        adapter = "copilot",
                    },
                    inline = {
                        adapter = "copilot",
                    },
                    cmd = {
                        adapter = "copilot",
                    }
                },
                display = {
                    action_palette = {
                        width = 95,
                        height = 10,
                        prompt = "Prompt ",                     -- Prompt used for interactive LLM calls
                        provider = "snacks",                    -- Can be "default", "telescope", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
                        opts = {
                            show_default_actions = true,        -- Show the default actions in the action palette?
                            show_default_prompt_library = true, -- Show the default prompt library in the action palette?
                        },
                    },
                },
            })
        end
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        enabled = false,
        lazy = false,
        version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
        opts = {
            -- add any opts here
            -- for example
            provider = "copilot",
            copilot = {
                -- model = "claude-3.7-sonnet-thought",
                model = "claude-3.7-sonnet",
                temperature = 1,
                max_tokens = 20000,
            }
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            -- "echasnovski/mini.pick", -- for file_selector provider mini.pick
            -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
            -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
            -- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
    {
        "zbirenbaum/copilot.lua",
        enabled = false,
        cmd = "Copilot",
        build = ":Copilot auth",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = true,
                    auto_refresh = true,
                    keymap = {
                        jump_next = "<c-j>",
                        jump_prev = "<c-k>",
                        accept = "<c-a>",
                        refresh = "r",
                        open = "<M-CR>",
                    },
                    layout = {
                        position = "bottom", -- | top | left | right
                        ratio = 0.4,
                    },
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<c-a>",
                        accept_word = false,
                        accept_line = false,
                        next = "<c-j>",
                        prev = "<c-k>",
                        dismiss = "<C-e>",
                    },
                },
            })
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        enabled = false,
        dependencies = {
            { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken",                            -- Only on MacOS or Linux
        opts = {
            -- See Configuration section for options
        },
        -- See Commands section for default commands if you want to lazy load on them
    },,

  -- From lua/plugins/tiny-inline-diagnostic.lua
{
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000,    -- needs to be loaded in first
    config = function()
      -- Default configuration
      require("tiny-inline-diagnostic").setup({
        -- Style preset for diagnostic messages
        -- Available options:
        -- "modern", "classic", "minimal", "powerline",
        -- "ghost", "simple", "nonerdfont", "amongus"
        preset = "classic",

        transparent_bg = false,     -- Set the background of the diagnostic to transparent
        transparent_cursorline = false, -- Set the background of the cursorline to transparent (only one the first diagnostic)

        hi = {
          error = "DiagnosticError", -- Highlight group for error messages
          warn = "DiagnosticWarn", -- Highlight group for warning messages
          info = "DiagnosticInfo", -- Highlight group for informational messages
          hint = "DiagnosticHint", -- Highlight group for hint or suggestion messages
          arrow = "NonText",       -- Highlight group for diagnostic arrows

          -- Background color for diagnostics
          -- Can be a highlight group or a hexadecimal color (#RRGGBB)
          background = "CursorLine",

          -- Color blending option for the diagnostic background
          -- Use "None" or a hexadecimal color (#RRGGBB) to blend with another color
          mixing_color = "None",
        },

        options = {
          -- Display the source of the diagnostic (e.g., basedpyright, vsserver, lua_ls etc.)
          show_source = {
            enabled = false,
            if_many = false,
          },

          -- Use icons defined in the diagnostic configuration
          use_icons_from_diagnostic = false,

          -- Set the arrow icon to the same color as the first diagnostic severity
          set_arrow_to_diag_color = false,

          -- Add messages to diagnostics when multiline diagnostics are enabled
          -- If set to false, only signs will be displayed
          add_messages = true,

          -- Time (in milliseconds) to throttle updates while moving the cursor
          -- Increase this value for better performance if your computer is slow
          -- or set to 0 for immediate updates and better visual
          throttle = 20,

          -- Minimum message length before wrapping to a new line
          softwrap = 30,

          -- Configuration for multiline diagnostics
          -- Can either be a boolean or a table with the following options:
          --  multilines = {
          --      enabled = false,
          --      always_show = false,
          -- }
          -- If it set as true, it will enable the feature with this options:
          --  multilines = {
          --      enabled = true,
          --      always_show = false,
          -- }
          multilines = {
            -- Enable multiline diagnostic messages
            enabled = false,

            -- Always show messages on all lines for multiline diagnostics
            always_show = false,
          },

          -- Display all diagnostic messages on the cursor line
          show_all_diags_on_cursorline = false,

          -- Enable diagnostics in Insert mode
          -- If enabled, it is better to set the `throttle` option to 0 to avoid visual artifacts
          enable_on_insert = false,

          -- Enable diagnostics in Select mode (e.g when auto inserting with Blink)
          enable_on_select = false,

          overflow = {
            -- Manage how diagnostic messages handle overflow
            -- Options:
            -- "wrap" - Split long messages into multiple lines
            -- "none" - Do not truncate messages
            -- "oneline" - Keep the message on a single line, even if it's long
            mode = "wrap",

            -- Trigger wrapping to occur this many characters earlier when mode == "wrap".
            -- Increase this value appropriately if you notice that the last few characters
            -- of wrapped diagnostics are sometimes obscured.
            padding = 0,
          },

          -- Configuration for breaking long messages into separate lines
          break_line = {
            -- Enable the feature to break messages after a specific length
            enabled = false,

            -- Number of characters after which to break the line
            after = 30,
          },

          -- Custom format function for diagnostic messages
          -- Example:
          -- format = function(diagnostic)
          --     return diagnostic.message .. " [" .. diagnostic.source .. "]"
          -- end
          format = nil,


          virt_texts = {
            -- Priority for virtual text display
            priority = 2048,
          },

          -- Filter diagnostics by severity
          -- Available severities:
          -- vim.diagnostic.severity.ERROR
          -- vim.diagnostic.severity.WARN
          -- vim.diagnostic.severity.INFO
          -- vim.diagnostic.severity.HINT
          severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.INFO,
            vim.diagnostic.severity.HINT,
          },

          -- Events to attach diagnostics to buffers
          -- You should not change this unless the plugin does not work with your configuration
          overwrite_events = nil,
        },
        disabled_ft = {}                               -- List of filetypes to disable the plugin
      })
      vim.diagnostic.config({ virtual_text = false })  -- Only if needed in your configuration, if you already have native LSP diagnostics
    end
  },

  -- From lua/plugins/claudecode.lua
{
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup({
      -- Terminal window settings
      window = {
        split_ratio = 0.3,  -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
        position = "vertical", -- Position of the window: "botright", "topleft", "vertical", "float", etc.
        enter_insert = true, -- Whether to enter insert mode when opening Claude Code
        hide_numbers = true, -- Hide line numbers in the terminal window
        hide_signcolumn = true, -- Hide the sign column in the terminal window

        -- Floating window configuration (only applies when position = "float")
        float = {
          width = "80%",   -- Width: number of columns or percentage string
          height = "80%",  -- Height: number of rows or percentage string
          row = "center",  -- Row position: number, "center", or percentage string
          col = "center",  -- Column position: number, "center", or percentage string
          relative = "editor", -- Relative to: "editor" or "cursor"
          border = "rounded", -- Border style: "none", "single", "double", "rounded", "solid", "shadow"
        },
      },
      -- File refresh settings
      refresh = {
        enable = true,         -- Enable file change detection
        updatetime = 100,      -- updatetime when Claude Code is active (milliseconds)
        timer_interval = 1000, -- How often to check for file changes (milliseconds)
        show_notifications = true, -- Show notification when files are reloaded
      },
      -- Git project settings
      git = {
        use_git_root = true, -- Set CWD to git root when opening Claude Code (if in git project)
      },
      -- Shell-specific settings
      shell = {
        separator = '&&', -- Command separator used in shell commands
        pushd_cmd = 'pushd', -- Command to push directory onto stack (e.g., 'pushd' for bash/zsh, 'enter' for nushell)
        popd_cmd = 'popd', -- Command to pop directory from stack (e.g., 'popd' for bash/zsh, 'exit' for nushell)
      },
      -- Command settings
      command = "claude --dangerously-skip-permissions", -- Command used to launch Claude Code
      -- Command variants
      command_variants = {
        -- Conversation management
        continue = "--continue", -- Resume the most recent conversation
        resume = "--resume", -- Display an interactive conversation picker

        -- Output options
        verbose = "--verbose", -- Enable verbose logging with full turn-by-turn output
      },
      -- Keymaps
      keymaps = {
        toggle = {
          normal = "<C-,>",      -- Normal mode keymap for toggling Claude Code, false to disable
          terminal = "<C-,>",    -- Terminal mode keymap for toggling Claude Code, false to disable
          variants = {
            continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
            verbose = "<leader>cV", -- Normal mode keymap for Claude Code with verbose flag
          },
        },
        window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
        scrolling = true,     -- Enable scrolling keymaps (<C-f/b>) for page up/down
      }
    })
  end,

  -- From lua/plugins/noice.lua
{
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {},
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = {
          silent = true,
        },
      },
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
    })
  end,,

  -- From lua/plugins/devplugins.lua
{
  {
    'adibhanna/laravel.nvim',
    enabled = false,
    -- dir = "~/Developer/opensource/laravel.nvim",
    ft = { 'php', 'blade' },
    dependencies = {
      'folke/snacks.nvim', -- Optional: for enhanced UI
    },
    config = function()
      require('laravel').setup({
        notifications = false,
        debug = false,
        keymaps = true
      })
    end,
  },

  {
    -- dir = "~/Developer/opensource/phprefactoring.nvim",
    'adibhanna/phprefactoring.nvim',
    enabled = false,
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    ft = 'php',
    config = function()
      require('phprefactoring').setup()
    end,
  },
  {
    dir = "~/Developer/opensource/simplemarkdown.nvim",
    enabled = false,
    ft = 'markdown',
    config = function()
      require('simplemarkdown').setup()
    end
  },
  -- {
  --   dir = "~/Developer/opensource/forest-night.nvim",
  --   config = function()
  --     -- vim.cmd('colorscheme forest-night')
  --   end
  -- },

  -- From lua/plugins/nvim-newfile.lua
{
    "adibhanna/nvim-newfile.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
        require("nvim-newfile").setup({
            notifications = {
                enabled = false, -- Set to false to disable file creation notifications
            },
        })
    end,,

  -- From lua/plugins/nvim-notes.lua
{
  'adibhanna/nvim-notes',
  dependencies = {
    'MunifTanjim/nui.nvim', -- Required for UI components
  },
  config = function()
    require('nvim-notes').setup({
      vault_path = '~/notes', -- Where to store notes
    })
  end,,

}, {
  install = {
    missing = true,
    colorscheme = { "habamax" }
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  ui = {},
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})


-- ============================================================================
-- FILETYPE PLUGINS (from ftplugin/ and plugin/)
-- ============================================================================
-- Go filetype settings (from ftplugin/go.lua)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        vim.o.tabstop = 4
    end
})

-- Filetype additions (from plugin/ft.lua)
-- if a file is a .env or .envrc file, set the filetype to sh
vim.filetype.add({
  filename = {
    [".env"] = "sh",
    [".envrc"] = "sh",
    ["*.env"] = "sh",
    ["*.envrc"] = "sh"
  }
})

-- ============================================================================
-- END OF CONFIGURATION
-- ============================================================================
