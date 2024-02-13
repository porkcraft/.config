local blankline_ok, blankline = pcall(require, 'indent_blankline')
if not blankline_ok then
	return
end

vim.opt.list = true
vim.cmd [[
   highlight IndentBlanklineIndent guifg=#3D3D3D gui=nocombine
	highlight IndentBlanklineContextChar guifg=#657B83 gui=nocombine
]]

blankline.setup {
	space_char_blankline = ' ',
	show_tab_indicators = false,
	char_highlight_list = { 'IndentBlanklineIndent' },
	show_current_context = true,
}
