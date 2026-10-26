return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- load when you first save
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = { "n", "v" },
			desc = "[C]ode [F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,

		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			python = { "ruff_organize_imports", "ruff_format" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			json = { "prettier" },
		},

		format_on_save = function(bufnr)
			local ft = vim.bo[bufnr].filetype
			if ft == "c" or ft == "cpp" then
				local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
				local has_style = vim.fs.find({ ".clang-format", "_clang-format" }, { upward = true, path = dir })[1]
				if not has_style then
					return nil -- no declared style: don't touch the file on save
				end
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
	},
}
