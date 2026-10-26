return {
	settings = {
		basedpyright = {
			disableOrganizeImports = true, -- ruff handles import sorting
			analysis = {
				typeCheckingMode = "standard",
			},
		},
	},
}
