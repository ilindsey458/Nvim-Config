local opt = vim.opt

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
-- opt.expandtab = true        -- uncomment to insert spaces instead of tabs

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Behavior
opt.mouse = "a"
opt.clipboard = "unnamedplus" -- share clipboard with the OS
opt.undofile = true -- persistent undo across sessions
opt.breakindent = true
opt.wrap = true
opt.updatetime = 250
opt.timeoutlen = 300 -- which-key popup appears sooner

-- Search
opt.ignorecase = true
opt.smartcase = true -- case-sensitive only if you type a capital
opt.hlsearch = true
opt.inccommand = "split" -- live preview of :s substitutions

-- UI
opt.termguicolors = false -- your original value; most themes want true, flip it if colors look off
opt.winborder = "single"
opt.showmode = false -- the statusline shows the mode instead
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 15
opt.splitright = true
opt.splitbelow = true
