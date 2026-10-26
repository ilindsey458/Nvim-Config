local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear search highlight
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic [Q]uickfix list" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Split navigation
map("n", "<C-h>", "<C-w><C-h>", { desc = "Focus left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Focus right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Focus lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Focus upper window" })

map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })
map("x", "<leader>/", "gc", { remap = true, desc = "Toggle comment" })
