-- Error Protection --
local autopairs_ok, autopairs = pcall(require, 'nvim-autopairs')
if not autopairs_ok then
	return
end

local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
	return
end

local cmp_autopairs_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not cmp_autopairs_ok then
	return
end

-- If you want insert `(` after select function or method item
autopairs.setup {}
cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done({
		map_char = { tex = '' }
	})
)
-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
--cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
