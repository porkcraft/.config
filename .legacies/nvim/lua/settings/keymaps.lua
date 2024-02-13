local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' ' -- Set <Space> as <Leader> key

-- Remaps --
map('i', 'jk', '<ESC>', opts)      -- Use 'jk' for Esc key in Insert Mode
map('i', 'kj', '<ESC>', opts)      -- Use 'kj' for Esc key in Insert Mode
map('v', 'L', '$', opts)           -- Use Shift + l to move to the end of the line
map('n', 'L', '$', opts)           -- Use Shift + l to move to the end of the line
map('v', 'H', '^', opts)           -- Use Shift + l to move to the end of the line
map('n', 'H', '^', opts)           -- Use Shift + l to move to the end of the line
map('n', ';', ':', opts)           -- Use ';;' for Esc key in Visual Mode
vim.cmd [[tnoremap jk <C-\><C-n>]] -- Use 'jk' for Esc key in Terminal Mode
vim.cmd [[tnoremap kj <C-\><C-n>]] -- Use 'kj' for Esc key in Terminal Mode

-- Split Window Movements --
map('n', 'sh', '<cmd>split<Return><C-W>w', opts)  -- Make horizontal Split
map('n', 'sv', '<cmd>vsplit<Return><C-w>w', opts) -- Make vertical Split
map('n', '<A-k>', '<cmd>wincmd k<CR>', opts)      -- Go To Above Split
map('n', '<A-j>', '<cmd>wincmd j<CR>', opts)      -- Go To Below Split
map('n', '<A-h>', '<cmd>wincmd h<CR>', opts)      -- Go To Left Split
map('n', '<A-l>', '<cmd>wincmd l<CR>', opts)      -- Go To Right Split

-- Resize Window --
map('n', '<A-w><left>', '<C-w><', opts)
map('n', '<A-w><right>', '<C-w>>', opts)
map('n', '<A-w><up>', '<C-w>+', opts)
map('n', '<A-w><down>', '<C-w>-', opts)

-- BufferLine --
map('n', '<Leader>n', '<cmd>tabnew<CR>', opts)               -- Create New Buffer
map('n', '<A-o>', '<cmd>BufferLineCycleNext<CR>', opts)      -- Go To Next Buffer
map('n', '<A-i>', '<cmd>BufferLineCyclePrev<CR>', opts)      -- Go To Previous Buffer
map('n', '<A-b>', '<cmd>BufferLinePick<CR>', opts)           -- Pick Buffer With Character
map('n', '<Leader>i', '<cmd>BufferLineCloseLeft<CR>', opts)  -- Close every Buffers to left side
map('n', '<Leader>o', '<cmd>BufferLineCloseRight<CR>', opts) -- Close every Buffers to right side
