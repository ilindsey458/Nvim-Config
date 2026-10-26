return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = false,
		keywords = {
			WARN = { color = "warn" },
			HACK = { color = "hack" },
			NOTE = { alt = {} },
			INFO = { color = "info" },
			TODO = { color = "todo" },
		},
		colors = {
			hint = "#90CEAA",
			warn = "#F1CF8A",
			hack = "#ED7B55",
			info = "#73C0C9",
			todo = "#70A5EB",
		},
	},
}
