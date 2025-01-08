local set = vim.keymap.set
local del = vim.keymap.del
local methods = vim.lsp.protocol.Methods

del("n", "grn")
del("n", "grr")
del("n", "gri")
del({"n", "x"}, "gra")
del("n", "gO")
del("s", "<C-S>")

local function hover()
	vim.lsp.buf.hover { border = 'rounded', max_height = 30, max_width = 60 }
end

local function inject_keymap(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	if client:supports_method(methods.textDocument_hover) then
		set("n", "K", hover, opts)
	end

	if client:supports_method(methods.textDocument_rename) then
		set("n", "gr", vim.lsp.buf.rename, opts)
	end

	if client:supports_method(methods.textDocument_codeAction) then
		set({"n", "x"}, "ga", vim.lsp.buf.code_action, opts)
	end

	if client:supports_method(methods.textDocument_definition) then
		set("n", "gd", vim.lsp.buf.definition, opts)
	end


	if client:supports_method(methods.textDocument_typeDefinition) then
		set("n", "gD", vim.lsp.buf.type_definition, opts)
	end

	if client:supports_method(methods.textDocument_references) then
		set("n", "gR", vim.lsp.buf.references, opts)
	end

	if client:supports_method(methods.textDocument_implementation) then
		set("n", "gi", vim.lsp.buf.implementation, opts)
	end

	if client:supports_method(methods.textDocument_documentSymbol) then
		set("n", "go", vim.lsp.buf.document_symbol, opts)
	end
end

autocmd("LspAttach", {
	group = augroup("lsp_keymaps", {}),
	callback = function (args)
		local bufnr = args.buf
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		inject_keymap(client, bufnr)
	end
})
