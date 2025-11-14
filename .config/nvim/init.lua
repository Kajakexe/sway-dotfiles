-- ========================
-- BASIC NEOVIM CONFIG
-- ========================

-- Enable true colors
vim.o.termguicolors = true

-- Set background to match your terminal (dark or light)
vim.o.background = "dark"  -- change to "light" if your terminal is light

-- Make background transparent so it matches terminal
vim.cmd([[highlight Normal guibg=none ctermbg=none]])
vim.cmd([[highlight NormalNC guibg=none ctermbg=none]])

-- ========================
-- OPTIONS
-- ========================

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse support
vim.o.mouse = "a"

-- Tabs & indentation
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true

-- Search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- ========================
-- KEYBINDINGS (example)
-- ========================
vim.g.mapleader = " "  -- set space as leader key

-- Save file with leader + w
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

-- ========================
-- COLORSCHEME
-- ========================
-- You can pick any colorscheme you like
-- Example: vim.cmd("colorscheme gruvbox")

-- ========================
-- PLUGIN SECTION (optional)
-- ========================
-- Later you can add packer.nvim or lazy.nvim here
