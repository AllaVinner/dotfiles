return {
	default = {
		"Vigemus/iron.nvim",
		config = function()
			local iron = require("iron.core")
			local view = require("iron.view")

			iron.setup({
				config = {
					-- Whether a repl should be discarded or not
					scratch_repl = true,
					-- Your repl definitions come here
					repl_definition = {
						sh = {
							-- Can be a table or a function that
							-- returns a table (see below)
							command = { "zsh" },
						},
					},
					python = {
						-- command = { "python" }
						command = { "python -m asyncio" }, -- or { "ipython", "--no-autoindent" }
						format = require("iron.fts.common").bracketed_paste_python,
					},
					-- How the repl window will be displayed
					-- See below for more information
					-- repl_open_cmd = require("iron.view").bottom(40),
					-- repl_open_cmd = view.split.vertical.botright(50),
					repl_open_cmd = "belowright 15 split",
				},
				-- Iron doesn't set keymaps by default anymore.
				-- You can set them here or manually add keymaps to the functions in iron.core
				keymaps = {
					-- send_motion = "<leader>rl",
					-- visual_send = "<leader>rl",
					-- send_file = "<leader>rf",
					-- send_line = "<leader>rl",
					-- send_paragraph = "<space>sp",
					-- send_until_cursor = "<space>ju",
					-- send_mark = "<space>jm",
					-- mark_motion = "<space>jm",
					-- mark_visual = "<space>jm",
					-- remove_mark = "<space>jr",
					-- cr = "<space>j<cr>",
					-- interrupt = "<space>j<space>",
					-- exit = "<space>jq",
					-- clear = "<space>jc",
				},
				-- If the highlight is on, you can change how it looks
				-- For the available options, check nvim_set_hl
				highlight = {
					italic = true,
				},
				ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
			})

			-- iron also has a list of commands, see :h iron-commands for all available commands
			vim.keymap.set("n", "<space>ro", "<cmd>IronRepl<cr>", { desc = "[R]EPL [O]pen" })
			vim.keymap.set("n", "<space>rR", "<cmd>IronRestart<cr>", { desc = "[R]EPL [R]restart" })
			-- vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>", { desc = "[R]EPL [F]ocus" })
			vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>", { desc = "[R]EPL [H]ide" })
			vim.keymap.set("n", "<space>rl", iron.send_line, { desc = "[R]EPL Send [L]ine" })
			vim.keymap.set("n", "<space>rf", iron.send_file, { desc = "[R]EPL Send [F]ile" })
			vim.keymap.set("v", "<space>rr", iron.visual_send, { desc = "[R]EPL Visual Send" })
		end,
	},
}
