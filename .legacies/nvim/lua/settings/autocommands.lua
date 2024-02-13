local create_au = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

local cursorline_hack = create_augroup('ShowCursorlineOnlyOnActivePane', { clear = true })
create_au({ 'VimEnter', 'WinEnter', 'BufWinEnter' }, {
	group = cursorline_hack,
	pattern = '*',
	command = 'setlocal cursorline'
})
create_au({ 'WinLeave' }, {
	group = cursorline_hack,
	pattern = '*',
	command = 'setlocal nocursorline'
})

local cursorline_fix = create_augroup('CursorlineFixOnPlugins', { clear = true })
create_au({ 'FileType' }, {
	group = cursorline_fix,
	pattern = 'TelescopePrompt*',
	command = 'setlocal nocursorline'
})
create_au({ 'WinLeave' }, {
	group = cursorline_fix,
	pattern = 'NvimTree*',
	command = 'setlocal cursorline'
})

local general = create_augroup('General', { clear = true })
create_au({ 'TermOpen' }, {
	group = general,
	pattern = '*',
	command = 'setlocal nonumber norelativenumber'
})
create_au({ 'BufWritePre' }, {
	group = general,
	pattern = '*',
	command = [[:%s/\s\+$//e]]
})
