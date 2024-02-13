-- Error Protection --
local lualine_ok, lualine = pcall(require, 'lualine')
if not lualine_ok then
	return
end

-- My Red Theme over Horizon --
local my_red = require 'lualine.themes.horizon'
local n_red = my_red.normal
local i_red = my_red.insert
local v_red = my_red.visual
n_red.a.bg = '#AE101B'
n_red.a.fg = '#000000'
n_red.b.bg = '#2E303E'
n_red.b.fg = '#BABABA'
n_red.c.bg = '#222222'
i_red.a.bg = '#377D22'
i_red.a.fg = '#000000'
i_red.b.bg = '#2E303E'
i_red.b.fg = '#BABABA'
i_red.c.bg = '#222222'
v_red.a.bg = '#D324E6'
v_red.a.fg = '#000000'
v_red.c.bg = '#222222'

-- Custom Symbols --
local thick_pointy = { left = '', right = '' }
local thin_pointy = { left = '', right = '' }
local thick_slash = { left = '', right = '' }
local thin_slash = { left = '', right = '' }

lualine.setup {
	options = {
		theme = my_red,
		icons_enabled = true,
		globalstatus = true,
		section_separators = thick_slash,
		component_separators = thin_slash,
		disabled_filetypes = {}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = { {
			'filename',
			file_status = true, -- displays file status (readonly status, modified status)
			path = 1,     -- 0 = filename, 1 = relative, 2 = absolute
		} },
		lualine_x = { {
			'diagnostics',
			sources = { 'nvim_diagnostic' },
			symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
		},
			'encoding',
			'filetype'
		},
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = { {
			'filename',
			file_status = true, -- displays file status (readonly status, modified status)
			path = 1      -- 0 = just filename, 1 = relative path, 2 = absolute path
		} },
		lualine_x = { {
			'diagnostics',
			sources = { 'nvim_diagnostic' },
			symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
		},
			'encoding',
			'filetype'
		},
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
}
