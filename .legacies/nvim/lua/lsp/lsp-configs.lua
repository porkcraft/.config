-- Error Protection --
local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
	return
end

local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')
if not mason_lsp_ok then
	return
end

local lsp_ok, lsp = pcall(require, 'lspconfig')
if not lsp_ok then
	return
end

local protocol_ok, protocol = pcall(require, 'vim.lsp.protocol')
if not protocol_ok then
	return
end

-- Mason Setup --
local servers = { 'cssls', 'html', 'jsonls', 'powershell_es', 'pyright', 'tsserver' }
mason.setup {
	ensure_installed = servers
}
mason_lsp.setup {}

-- Use an on_attach function to only map the following keys after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Mappings
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

	-- Format on save
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
			pattern = '<buffer>',
			command = 'lua vim.lsp.buf.format()'
		})
	end
end

-- Completion Engine setup using nvim_cmp with LSP source --
local capabilities = require('cmp_nvim_lsp').default_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

-- Setup Installed Servers --
for _, server in pairs(servers) do
	local opt = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	lsp[server].setup(opt)
end

lsp.lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { 'lua' },
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of NeoVim runtime files
				library = vim.api.nvim_get_runtime_file('', true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

-- Diagnostic Icon --
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	-- This sets the spacing and the prefix, obviously.
	virtual_text = {
		spacing = 4,
		prefix = ' '
	}
}
)

vim.diagnostic.config({
	virtual_text = {
		prefix = '●'
	},
	update_in_insert = true,
	float = {
		source = 'always',
	},
})
