-- Plugin for setting buffer in center of screen.
-- Used as part of my zen mode
local m = {}
m.default = {
	{
		"shortcuts/no-neck-pain.nvim",
		version = "*",
		buffers = {
			wo = {
				fillchars = "eob: ",
			},
		},
	},
}

return m
