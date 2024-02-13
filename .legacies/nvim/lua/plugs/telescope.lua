local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then
	return
end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
	return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup {
	defaults = {
		prompt_prefix = '   ',
		selection_caret = '  ',
		mappings = {
			n = {
				['q'] = actions.close,
				['<TAB>'] = actions.toggle_selection,
				['?'] = actions.which_key,
			}
		}
	},
	extensions = {
		file_browser = {
			theme = 'dropdown',
			hijack_netrw = true,
			mappings = {
				['i'] = {
					['<C-w>'] = function()
						vim.cmd('normal vbd')
					end,
				},
				['n'] = {
					['n'] = fb_actions.create,
					['r'] = fb_actions.rename,
					['d'] = fb_actions.remove,
					['x'] = fb_actions.move,
					['c'] = fb_actions.copy,
					['l'] = fb_actions.open,
					['h'] = fb_actions.goto_parent_dir,
					['e'] = fb_actions.goto_home_dir,
					['w'] = fb_actions.goto_cwd,
					['t'] = fb_actions.change_cwd,
					['f'] = fb_actions.toggle_browser,
					['b'] = fb_actions.toggle_hidden,
					['s'] = fb_actions.toggle_all,
					['/'] = function()
						vim.cmd('startinsert')
					end
				}
			}
		}
	}
}

telescope.load_extension 'file_browser'
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', 'fb', '<cmd>Telescope buffers theme=dropdown<CR>', opts)
map('n', 'fd', '<cmd>Telescope diagnostics theme=dropdown<CR>', opts)
map('n', 'fh', '<cmd>Telescope help_tags theme=ivy<CR>', opts)
map('n', 'fl', '<cmd>Telescope live_grep<CR>', opts)
map('n', 'fr', '<cmd>Telescope oldfiles theme=dropdown<CR>', opts)
map('n', 'ff', function()
	builtin.find_files({
		theme = 'ivy',
		previewer = false,
		layout_config = { height = 20, width = 70 }
	})
end, opts)
map('n', 'fe', function()
	require 'telescope'.extensions.file_browser.file_browser({
		path = '%:p:h',
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = 'normal',
		layout_config = { height = 20, width = 70 }
	})
end, opts)
