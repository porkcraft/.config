-- Error Protection --
local tree_ok, tree = pcall(require, 'nvim-tree')
if not tree_ok then
	return
end

local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height
local width = 30
local height = 20

-- NvimTree Setup --
tree.setup {
	open_on_setup = false,
	open_on_setup_file = false,
--	disable_netrw = true,
	hijack_netrw = true,
	update_focused_file = { enable = true },
	view = {
		adaptive_size = false,
		centralize_selection = false,
		side = 'left',
		width = width,
		mappings = {
			custom_only = false,
			list = {
				{ key = 'ss',            action = 'split' },
				{ key = 'vv',            action = 'vsplit' },
				{ key = { '<CR>', 'l' }, action = 'edit' },
				{ key = 'h',             action = 'close_node' },
				{ key = 'ft',            action = 'live_filter' },
			}
		},
		float = {
			enable = false,
			open_win_config = {
				relative = 'editor',
				border = 'rounded',
				width = width,
				height = height,
				row = (gheight - height) * 0.4,
				col = (gwidth - width) * 0.5,
			}
		}
	},
	renderer = {
		highlight_opened_files = 'none',
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			}
		},
		icons = {
			webdev_colors = true,
			show = {
				folder_arrow = false,
			}
		}
	},
	git = {
		enable = false,
		ignore = true,
	}
}

vim.keymap.set('n', '<A-e>', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true }) -- Toggle Nvim Tree Explorer

-- Close nvim-tree when the current buffer is closed --
vim.cmd [[
   "" Close NvimTree when the current buffer is closed ""
   autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

	"" Hide Cursor in NvimTree ""
	autocmd BufWinEnter NvimTree* setlocal cursorlineopt=line guicursor+=n:Cursor
   autocmd BufEnter,FileType NvimTree* call NvimTreeHideCursor()
   autocmd BufLeave,BufWinLeave,WinClosed NvimTree* call NvimTreeShowCursor()
   function! NvimTreeHideCursor()
   	highlight! Cursor blend=100
   endfunction
   function! NvimTreeShowCursor()
   	highlight! Cursor blend=NONE
   endfunction
]]

--[[
local create_au = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

local close_hack = create_augroup('CloseNvimTreeOnCurrentBufferClosed', { clear = true })
create_au({ 'BufEnter' }, {
	group = close_hack,
	pattern = '*',
	command = "++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"
})

local highlight = vim.api.nvim_set_hl
local hide_cursor = create_augroup('HideCursorInNvimTree', { clear = true })
local function NvimTreeHideCursor()
	highlight(0, 'Cursor', { blend = 100 })
end

local function NvimTreeShowCursor()
	highlight(0, 'Cursor', { blend = NONE })
end

create_au({ 'BufWinEnter' }, {
	group = hide_cursor,
	pattern = 'NvimTree*',
	command = "setlocal cursorlineopt=line guicursor+=n:Cursor"
})
create_au({ 'BufEnter', 'FileType' }, {
	group = hide_cursor,
	pattern = 'NvimTree*',
	callback = function()
		highlight(0, 'Cursor', { blend = 100 })
	end
})
create_au({ 'BufLeave', 'BufWinLeave', 'WinClosed' }, {
	group = hide_cursor,
	pattern = 'NvimTree*',
	callback = function()
		highlight(0, 'Cursor', { blend = NONE })
	end
})]]
