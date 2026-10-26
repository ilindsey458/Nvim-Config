return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "mason-org/mason.nvim" },
	opts = {
		ensure_installed = {
			"clang-format",
			"prettier",
			"stylua",
			-- ruff is already installed through the LSP list
		},
	},
}
