return {
	default = {
		"stevearc/oil.nvim",
		opts = {
			view_options = {
				show_hidden = true,
			},
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				view_options = {
					show_hidden = true,
				},
				use_default_keymaps = false,
			})
			local b = require("oil.actions")
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			vim.keymap.set("n", "<leader>p", b.preview.callback, { desc = b.preview.desc })
			vim.keymap.set("n", "<CR>", b.select.callback, { desc = b.select.desc })
			vim.keymap.set("n", "<leader>g?", b.show_help.callback, { desc = b.show_help.desc })
		end,
	},
}
