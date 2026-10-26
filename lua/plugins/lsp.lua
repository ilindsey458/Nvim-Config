return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"clangd", -- C / C++
				"basedpyright",
				"ruff", -- Python
				"ts_ls",
				"html",
				"cssls",
				"emmet_language_server", -- Web
				"lua_ls", -- Neovim config
			},
			-- automatic_enable = true is the default: installed servers are enabled for you
		},
	},

	{ "j-hui/fidget.nvim", opts = {} },

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
		},
	},
}
