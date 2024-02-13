require('lualine').setup { options = { theme = 'gruvbox' } }
local colors = {
	black        = '#1c1e26',
	white        = '#6C6F93',
	red          = '#AE101B',
	green        = '#09F7A0',
	blue         = '#25B2BC',
	yellow       = '#F09383',
	gray         = '#E95678',
	darkgray     = '#1A1C23',
	lightgray    = '#2E303E',
	inactivegray = '#1A1C23',
	pureblack    = '#000000',
	purewhite    = '#BABABA',
}

return {
	normal = {
		a = { bg = colors.red, fg = colors.pureblack, gui = 'bold' },
		b = { bg = colors.lightgray, fg = colors.purewhite },
		c = { bg = colors.darkgray, fg = colors.white },
	},
	insert = {
		a = { bg = colors.blue, fg = colors.pureblack, gui = 'bold' },
		b = { bg = colors.lightgray, fg = colors.purewhite },
		c = { bg = colors.darkgray, fg = colors.white },
	},
	visual = {
		a = { bg = colors.yellow, fg = colors.pureblack, gui = 'bold' },
		b = { bg = colors.lightgray, fg = colors.purewhite },
		c = { bg = colors.darkgray, fg = colors.white },
	},
	replace = {
		a = { bg = colors.red, fg = colors.pureblack, gui = 'bold' },
		b = { bg = colors.lightgray, fg = colors.purewhite },
		c = { bg = colors.darkgray, fg = colors.white },
	},
	command = {
		a = { bg = colors.green, fg = colors.pureblack, gui = 'bold' },
		b = { bg = colors.lightgray, fg = colors.purewhite },
		c = { bg = colors.darkgray, fg = colors.white },
	},
	inactive = {
		a = { bg = colors.inactivegray, fg = colors.white, gui = 'bold' },
		b = { bg = colors.inactivegray, fg = colors.white },
		c = { bg = colors.inactivegray, fg = colors.white },
	},
}
