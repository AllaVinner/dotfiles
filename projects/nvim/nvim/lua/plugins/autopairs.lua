-- Autopairs brackets, quotes,
-- - Creates the corresponding character when insertiing the first
-- - When creating new line inside, it correctly indent and so on
return {
	default = {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
}
