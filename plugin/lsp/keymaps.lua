local set = vim.keymap.set
local methods = vim.lsp.protocol.Methods

local function hover()
	vim.lsp.buf.hover { border = 'rounded', max_height = 30, max_width = 60 }
end

local function signture_help()
	vim.lsp.buf.signature_help {border = 'rounded', max_width = 60}
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

	if client:supports_method(methods.textDocument_typeDefinition) then
		set("n", "gD", vim.lsp.buf.type_definition, opts)
	end

	if client:supports_method(methods.textDocument_references) then
		set("n", "[I", vim.lsp.buf.references, opts)
	end

	if client:supports_method(methods.textDocument_implementation) then
		set("n", "gi", vim.lsp.buf.implementation, opts)
	end

	if client:supports_method(methods.textDocument_signatureHelp) then
		set("i", "<C-s>", signture_help, opts)
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
