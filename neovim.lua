vim.cmd("colorscheme murphy")

-- Keymaps
-- Leaders
vim.g.mapleader = " "
vim.keymap.set({"n", "v"}, "<Space>", "<Nop>", {silent = true})
vim.g.maplocalleader = "\\"

-- Indentation
vim.keymap.set("v", "<Tab>", ">gv")         -- Indent selected
vim.keymap.set("v", "<S-Tab>", "<gv")       -- Un-indent selected

-- Splits
vim.keymap.set("n", "<C-d>", "<C-w>k")      -- Move to split above
vim.keymap.set("n", "<C-m>", "<C-w>j")      -- Move to split below
vim.keymap.set("n", "<C-h>", "<C-w>h")      -- Move to split left
vim.keymap.set("n", "<C-s>", "<C-w>l")      -- Move to split right


-- Options
-- Indentation
vim.opt.autoindent = true           -- Newlines match current line indent
vim.opt.breakindent = true          -- Indent wrapped lines
vim.opt.briopt = "min:20,shift:2"   -- Additional breakindent options
vim.opt.expandtab = true            -- Tabs are spaces
vim.opt.shiftwidth = 2              -- Number of spaces to insert on a tab
vim.opt.smartindent = true          -- Automatically indent after open braces and keywords
vim.opt.softtabstop = 2             -- Number of spaces in tab whe editing
vim.opt.tabstop = 2                 -- Number of visual spaces per TAB

-- Searching
vim.opt.hlsearch = true             -- Highlight search matches
vim.opt.ignorecase = true           -- Ignore case in searches by default
vim.opt.incsearch = true            -- Search as characters are entered
vim.opt.smartcase = true            -- Make searches case sensitive if an uppercase is entered

-- UI config
vim.opt.cursorline = false          -- Underline the current line
vim.opt.mouse = "a"                 -- Enable the mouse
vim.opt.number = true               -- Show absolute line number
vim.opt.relativenumber = true       -- Use relative numbers on non-current lines
vim.opt.scrolloff = 4               -- Minimum number of lines visible above or below the cursor
vim.opt.showmode = true             -- Show current mode (insert, visual, etc.)
vim.opt.splitbelow = true           -- Open new vertical splits on the bottom
vim.opt.splitright = true           -- Open new horizontal splits on the right
vim.opt.termguicolors = true        -- Enable 24-bit RGB color in the TUI
