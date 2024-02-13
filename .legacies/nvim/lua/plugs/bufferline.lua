vim.opt.termguicolors = true
-- Error Protection --
local alright, bufferline = pcall(require, 'bufferline')
if not alright then return end

local base = '#AE101B' --#2E303E
local base_sec = '#660910'
local transparent = ''
local text_active = '#BABABA'
local text_inactive = '#8083AD'
local red = '#E94E50'

bufferline.setup {
	options = {
		mode = 'buffers',
		always_show_bufferline = true,
		separator_style = 'slant',
		color_icons = true,
		show_tab_indicators = false,
		show_buffer_close_icons = false,
		show_close_icon = false,
		close_icon = '⠍⠊⠝⠍⠊⠝ ⠅⠓⠁⠝⠞',
		offsets = {
			{
				filetype = 'NvimTree',
				text = 'NvimTree',
				text_align = 'center',
				highlight = 'Directory',
				separator = true
			},
			{ filetype = 'pwsh' },
			{
				filetype = 'lspsagaoutline',
				text = 'LSP Saga Outline',
				text_align = 'center',
				highlight = 'Directory',
				separator = true
			}
		}
	},
	highlights = {
		separator = { fg = base, bg = base_sec },
		separator_selected = { fg = base, bg = transparent },
		separator_visible = { fg = base, bg = transparent },
		background = { fg = text_inactive, bg = base_sec, bold = false, italic = true },
		buffer_selected = { fg = text_active, bg = transparent, bold = true, italic = false },
		close_button = { fg = base, bg = base },
		close_button_visible = { fg = base, bg = base },
		close_button_selected = { fg = base, bg = base },
		modified = { fg = red, bg = base_sec },
		modified_selected = { fg = red, bg = transparent },
		modified_visible = { fg = red, bg = transparent },
		pick = { fg = red, bg = base },
		fill = { bg = base },
		duplicate_visible = { fg = text_inactive, bg = base_sec },
		pick_visible = { fg = text_inactive, bg = base_sec }
	}
}
