return {
	{
		"decaycs/decay.nvim",
		name = "decay",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("decay-default")
		end,
	},
	{ "olimorris/onedarkpro.nvim", name = "onedark", lazy = true },
}
