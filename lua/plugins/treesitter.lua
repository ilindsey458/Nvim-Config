return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false, -- the main branch doesn't support lazy-loading
	build = ":TSUpdate",
	config = function()
		local languages = {
			"bash",
			"c",
			"cpp",
			"css",
			"diff",
			"html",
			"javascript",
			"json",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"python",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
		}

		-- Install only what's missing, so startup stays fast
		local installed = require("nvim-treesitter.config").get_installed()
		local missing = vim.iter(languages)
			:filter(function(lang)
				return not vim.tbl_contains(installed, lang)
			end)
			:totable()
		if #missing > 0 then
			require("nvim-treesitter").install(missing)
		end

		-- Turn on treesitter highlighting for every filetype that has a parser
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("user-treesitter", { clear = true }),
			callback = function(event)
				pcall(vim.treesitter.start, event.buf) -- no parser? keep Vim's default highlighting
			end,
		})
	end,
}
