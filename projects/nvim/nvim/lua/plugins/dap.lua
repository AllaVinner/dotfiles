return {
	default = {
		"mfussenegger/nvim-dap",
		config = function(_, opts)
			vim.keymap.set(
				"n",
				"<leader>db",
				"<cmd> DapToggleBreakpoint <CR>",
				{ desc = "Toggles breakpoint under cursor" }
			)
		end,
	},
}
