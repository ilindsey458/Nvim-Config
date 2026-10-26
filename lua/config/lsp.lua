vim.diagnostic.config({
	severity_sort = true,
	virtual_text = true,
	float = { source = "if_many" },
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
	callback = function(event)
		local function map(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		local function tb(picker)
			return function()
				require("telescope.builtin")[picker]()
			end
		end

		map("gd", tb("lsp_definitions"), "[G]oto [D]efinition")
		map("gD", tb("lsp_declaration"), "[G]oto [D]eclaration")
		map("grr", tb("lsp_references"), "[G]oto [R]eferences")
		map("gri", tb("lsp_implementations"), "[G]oto [I]mplementation")
		map("<leader>D", tb("lsp_type_definitions"), "Type [D]efinition")
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if not client then
			return
		end

		-- Highlight other uses of the word under the cursor
		if client:supports_method("textDocument/documentHighlight", event.buf) then
			local hl = vim.api.nvim_create_augroup("user-lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = hl,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = hl,
				callback = vim.lsp.buf.clear_references,
			})
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("user-lsp-detach", { clear = false }),
				buffer = event.buf,
				callback = function(e2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "user-lsp-highlight", buffer = e2.buf })
				end,
			})
		end

		-- Toggle inlay hints (if the server provides them)
		if client:supports_method("textDocument/inlayHint", event.buf) then
			map("<leader>th", function()
				local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
				vim.lsp.inlay_hint.enable(not enabled, { bufnr = event.buf })
			end, "[T]oggle Inlay [H]ints")
		end
	end,
})
