return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add options here
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	vim.keymap.set("n", "<leader>x", "<cmd>Noice dismiss<CR>", { desc = "Dismiss Noice Message Popups" }),
}
