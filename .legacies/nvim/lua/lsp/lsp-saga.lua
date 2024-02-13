-- Error Protection --
local lspsaga_ok, lspsaga = pcall(require, 'lspsaga')
if not lspsaga_ok then
	return
end

lspsaga.setup{
	border_style = 'rounded',
	saga_winblend = 0,
	max_preview_lines = 15,
	diagnostic_header = { " ", " ", " ", " " }, -- error, warning, info, hint
	code_action_icon = '',
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "i",
		quit = "q",
	},
	symbol_in_winbar = {
		enable = false
	}
}

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
map('n', 'sf', '<cmd>Lspsaga lsp_finder<CR>', opts)
map('n', 'sa', '<cmd>Lspsaga code_action<CR>', opts)
map('n', 'sr', '<cmd>Lspsaga rename<CR>', opts)
map('n', 'sp', '<cmd>Lspsaga peek_definition<CR>', opts)
map('n', 'sh', '<cmd>Lspsaga signature_help<CR>', opts)
map('n', 'sj', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
map('n', 'sk', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
map('n', 'sd', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
map('n', 'so', '<cmd>LSoutlineToggle<CR>', opts)
map('n', '<C-j>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1, "<c-u>")<CR>', opts)
map('n', '<C-k>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1, "<c-d>")<CR>', opts)
