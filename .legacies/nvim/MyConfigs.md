#### My Neovim Config
From mid-April to May...
After spending almost 2 weeks on this, I finally finished this whole setup. It was
started because I wanted to study Python on Vim but it turned out I learnt vimscripts
and lua languages just from setting Neovim up. It was fantastic that I made it after
all these troubles and timeframe. This text doc is to not forget all this...

#### Config Structure
I used nvim's default config directory: ~\AppData\Local\nvim

 nvim
├──  colors
│	 ├──  color_scheme_1.vim
│	 └──  color_scheme_2.vim
├──  lua
│	 ├──  lsp
│	 │	  ├──  init.lua
│	 │	  ├──  cmp-configs.lua
│	 │	  ├──  lsp-configs.lua
│	 │	  ├──  lsp-installer.lua
│	 │	  └──  lsp-saga.lua
│	 ├──  plugs
│	 │	  ├──  init.lua
│	 │	  ├──  bufferline.lua
│	 │	  ├──  lualine.lua
│	 │	  ├──  nvim.lua
│	 │	  ├──  nvim-autopairs.lua
│	 │	  ├──  nvim-tree.lua
│	 │   ├──  treesitter.lua
│	 │	  └──  which-key.lua
│	 └──  settings
│		  ├──  init.lua
│		  ├──  functions.lua
│		  ├──  keymaps.lua
│		  ├──  options.lua
│		  └──  plugins.lua
├──  CodeDump.md
├──  init.lua
├──  Myconfigs.md
└──  TO DO.md
