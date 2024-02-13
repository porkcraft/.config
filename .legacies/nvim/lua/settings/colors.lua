local highlight = vim.api.nvim_set_hl
vim.cmd('colorscheme m2k-neosolarized')
highlight(0,'Normal',{guibg=NONE ctermbg=NONE})
highlight(0,'VertSplit',{guibg=NONE})
highlight(0,'LineNr',{guibg=NONE})
highlight(0,'CursorLineNr',{guibg=NONE guifg=#E94E50})
highlight(0,'CursorLine',{guibg=#1A1C23 guifg=NONE})
highlight(0,'GuiCursor',{guibg=#008CFF})
