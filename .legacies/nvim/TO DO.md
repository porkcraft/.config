# TO DO
[x] tweak GUI background color and transparency for completion dropdown menu
[ ] keep following Neil's video for cmp engine finalization
[x] find a way to execute python codes
	- done it by installing python310 from Microsoft Store
	- now every installed packages from .exe setup are unable use in MS Store python310
		[x] uninstall .exe setup and see if VS Code still working (reinstall VS Code if need)
			+ instead, I've uninstalled MS Store version and defined path to python3 and it worked
[ ] merge keybindings.lua with which-key.lua
[x] install and configure lua-snip
[x] make lspsaga work
	- did a little keymap tweaks and now it's working, except it's doing it wrong
		[x] fix lsp sega
			- found different fork for lspsaga which is well maintained
[x] make trim white spaces
[x] make diagnosticlc language server work
	[x] check it's repo to get more idea
		- already did but there was no useful imfo there
	+ it has cursorhold cmd error because of lspsaga, now ok with new lspsaga fork
[ ] check lsp diagnostic icons
	[ ] make hint icon hidden in both normal and insert modes

# Log
**28/May/2022**
	- restructured nvim config directories
	- finally .py files can be executed directly from nvim buffer
		+ done it by installing python310 from MS Store
	- now sumneko_lua is able to install from lsp-installer
		+ `nvim-lsp-installer\lua\nvim-lsp-installer\core\managers\powershell\init.lua`
		+ had to replace all `powershell` triggers with `pwsh`

**29/May/2022**
	- finally able to trim white spaces on save by vimscript
	- made a separate configs for all vimscripts

**30/May/2022**
	- did customization for lspconfig
		+ now lsp-installer, lspserver-configs and keymaps are in it
	- luasnip was installed and configured
	- sumneko_lua completion is now working perfactly 
		+ luasnip + global vim declaration
	- blankline plugin was installed and configured

**31/May/2022**
	- lspsaga is now working with a little tweaks done in keymaps
		+ definition pop-ups are still buggy to select them
		+ jump to diagnostics still giving error message

**1/June/2022**
	- did manage to execute python files with .exe python310
		+ just changed the trigger into python instead of python3 and it worked
		+ now every installed py modules can load as full capacity
	- it can't be fully marge keymaps and which-key configs
		+ now I think it's done to the limits that it can
