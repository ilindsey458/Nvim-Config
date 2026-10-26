return {
	on_attach = function(client)
		client.server_capabilities.hoverProvider = false -- let basedpyright own hover
	end,
}
