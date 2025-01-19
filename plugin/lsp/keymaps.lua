local set = vim.keymap.set
local methods = vim.lsp.protocol.Methods

local function with(f, args)
	return function()
		return f(args)
	end
end

local function attach_keymaps(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	if client:supports_method(methods.textDocument_hover) then
		set("n", "K", with(vim.lsp.buf.hover, { border = 'rounded', max_height = 30, max_width = 60 }), opts)
	end

	if client:supports_method(methods.textDocument_rename) then
		set("n", "<LEADER>r", vim.lsp.buf.rename, opts)
	end

	if client:supports_method(methods.textDocument_codeAction) then
		set({ "n", "x" }, "<LEADER>a", vim.lsp.buf.code_action, opts)
	end

	if client:supports_method(methods.textDocument_typeDefinition) then
		set("n", "gD", with(vim.lsp.buf.type_definition, { reuse_win = true }), opts)
	end

	if client:supports_method(methods.textDocument_references) then
		set("n", "g]", vim.lsp.buf.references, opts)
	end

	if client:supports_method(methods.textDocument_implementation) then
		set("n", "<LEADER>i", vim.lsp.buf.implementation, opts)
	end

	if client:supports_method(methods.textDocument_signatureHelp) then
		set("i", "<C-s>", with(vim.lsp.buf.signature_help, { border = 'rounded', max_width = 60 }), opts)
	end
end

autocmd("LspAttach", {
	group = augroup("lsp_keymaps", {}),
	callback = function(args)
		local bufnr = args.buf
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		attach_keymaps(client, bufnr)
	end
})
