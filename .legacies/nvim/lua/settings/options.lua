local options = {
	-- Visual --
	guifont = 'Hack NF',
	number = true,        -- Linenumbers
	relativenumber = false, -- Relative linenumbers
	showmode = false,     -- Command panel modes
	title = true,
	showcmd = true,
	cmdheight = 0,
	showtabline = 0,
	-- Highlight --
	termguicolors = true, -- Terminal GUI colors
	background = 'dark',
	cursorline = true,  -- Line highlight on cursor
	winblend = 0,
	wildoptions = 'pum',
	pumblend = 0,
	-- Behavior --
	compatible = false,
	clipboard = 'unnamedplus', -- Allows access to system clipboard
	ignorecase = true,       -- Case sensitive
	showmatch = true,        -- Highlight matching on cursor hover
	splitbelow = true,       -- Default position for HSplits
	splitright = true,       -- Default position for VSplits
	autoindent = true,
	smartindent = true,
	smarttab = true,
	tabstop = 3,
	shiftwidth = 3,
	softtabstop = 3,
	scrolloff = 6,
	sidescrolloff = 12,
	wrap = false,   -- Line wrapping
	mouse = 'a',    -- Mouse clicking
	swapfile = false, -- Swapfile creation
	backup = false, -- Buffer backup
	-- Vim Specific --
	fileencoding = 'UTF-8',
	wildmode = 'longest,full',
	updatetime = 300, -- Completion Delay, 4000ms default
	timeoutlen = 200, -- Timeout between keystrokes
	--shell = 'pwsh',
}
for k, option in pairs(options) do
	vim.opt[k] = option
end

-- disable some builtin vim plugins
local default_plugins = {
	'2html_plugin',
	'getscript',
	'getscriptPlugin',
	'gzip',
	'logipat',
	'netrw',
	'netrwPlugin',
	'netrwSettings',
	'netrwFileHandlers',
	'matchit',
	'tar',
	'tarPlugin',
	'rrhelper',
	'spellfile_plugin',
	'vimball',
	'vimballPlugin',
	'zip',
	'zipPlugin',
	'tutor',
	'rplugin',
	'syntax',
	'synmenu',
	'optwin',
	'compiler',
	'bugreport',
	'ftplugin',
}
for _, plugin in pairs(default_plugins) do
	vim.g['loaded_' .. plugin] = 1
end

local python3_path = '~/AppData/Local/Programs/Python/Python311/Python.EXE'
vim.g.python3_host_prog = python3_path
