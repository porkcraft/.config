-- Error Protection --
local wkey_ok, wkey = pcall(require, 'which-key')
if not wkey_ok then
	return
end

vim.g.mapleader = ' '

local opts = {
	prefix = '<Leader>',
	noremap = true,
	silent = true
}

wkey.setup {
	spelling = { enabled = false, suggestions = 20 },
	popup_mappings = {
		scroll_down = '<A-j>', -- binding to scroll down inside the popup
		scroll_up = '<A-k>', -- binding to scroll up inside the popup	},
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 40 }, -- min and max width of the columns
		spacing = 5,                -- spacing between columns
		align = 'center',           -- align columns left, center or right
	},
}

local mappings = {
	q = { '<cmd>q<CR>', 'Quit' },
	Q = { '<cmd>wq<CR>', 'Save & Quit' },
	w = { '<cmd>w<CR>', 'Write' },
	c = { '<cmd>bdelete<CR>', 'Close' },
	x = { '<cmd>q!<CR>', 'Quit Without Saving' },
	X = { '<cmd>x<CR>', 'Save & Quit All Buffers' },
	n = { '<cmd>tabnew<CR>', 'New Buffer' },
	f = {
		name = 'Files',
		r = { '<cmd>Telescope oldfiles theme=dropdown<CR>', 'Recent Files' },
		l = { '<cmd>Telescope live_grep<CR>', 'Live Grep' },
		b = { '<cmd>Telescope buffers<CR>', 'Find Buffers' },
		h = { '<cmd>Telescope help_tags<CR>', 'Find Help Tags' },
		d = { '<cmd>Telescope diagnostics theme=dropdown<CR>', 'List Diagnostics' },
		f = { '<cmd>Telescope find_files<CR>', 'Find Files[Preview]' },
	},
	h = {
		name = 'Highlight & Refresh',
		h = { '<cmd>nohlsearch<CR>', 'Turn Off Highlights' },
		e = { '<cmd>so %<CR>', 'Editor' },
		n = { '<cmd>NvimTreeRefresh<CR>', 'NvimTree' },
	},
	l = {
		name = 'LSP',
		i = { '<cmd>LspInfo<CR>', 'LSP Info' },
		k = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },
	},
	p = {
		name = 'Prompts',
		p = { '<cmd>10sp term://pwsh<CR> i', 'PowerShell' },
		i = { '<cmd>10sp term://ipython<CR> i', 'IPython' },
		P = { '<cmd>bo 10sp term://pwsh<CR> i', 'PowerShell' },
		c = { '<cmd>bo 10sp term://cmd<CR> i', 'Command Prompt' }
	},
	r = {
		name = 'Run',
		p = { '<cmd>15sp<CR> <cmd>term python %<CR> <cmd>startinsert<CR>', 'Run Python' },
		v = {
			name = 'Vertical Split',
			p = { '<cmd>30vs<CR> <cmd>term python %<CR> <cmd>startinsert<CR>', 'Run Python' },
		}
	},
	u = {
		name = 'Updateables',
		m = {
			name = 'Mason',
			i = { '<cmd>Mason<CR>', 'Mason Info' },
		},
		p = {
			name = 'Packer',
			s = { '<cmd>PackerSync<CR>', 'Sync Plugins' },
			u = { '<cmd>PackerUpdate<CR>', 'Update Plugins' },
			c = { '<cmd>PackerClean<CR>', 'Clean Plugins' },
			i = { '<cmd>PackerStatus<CR>', 'Plugins Info' },
		},
		t = {
			name = 'TreeSitter',
			i = { '<cmd>TSModuleInfo<CR>', 'TreeSitter Info' },
			s = { '<cmd>TSUpdateSync<CR>', 'TreeSitter Sync' },
		}
	}
}
wkey.register(mappings, opts)
