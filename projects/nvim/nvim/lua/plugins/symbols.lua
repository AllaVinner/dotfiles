-- Plugin for showing symbols in a tree
local m = {}
m.default = {
	"oskarrrrrrr/symbols.nvim",
	config = function()
		local r = require("symbols.recipes")
		require("symbols").setup(r.DefaultFilters, r.AsciiSymbols, {
			-- custom settings here
			-- e.g. hide_cursor = false
			sidebar = {
				close_on_goto = true,
			},
		})
		vim.keymap.set("n", "<leader>ts", ":SymbolsToggle<CR>", { desc = "[T]oggle [S]ymbols" })
	end,
}

return m
