-- Error Protection --
local treesitter_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not treesitter_ok then
	return
end

treesitter.setup {
	ensure_installed = { 'json', 'css', 'javascript', 'html', 'lua', 'python', 'markdown', 'markdown_inline', 'sql', 'vim' },
	highlight = {
		enable = true,
		additional_vim_regec_highlighting = true,
	},
	incremental_selection = {
		enable = false,
		keymaps = {
			init_selection = '',
			node_incremental = '',
			scope_incremental = '',
			node_decremental = '',
		},
	},
	autopairs = {
		enable = true,
	}
}
