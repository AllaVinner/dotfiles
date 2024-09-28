-- Adds git related signs to the gutter, as well as utilities for managing changes
local m = {}
m.default = {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
	},
	config = function()
		require("gitsigns").setup({
			signcolumn = false, -- toggle with `toggle_signs`
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "<leader>gn", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "[G]it [N]ext hunk" })

				map("n", "<leader>gp", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "[G]it [P]revious hunk" })

				-- -- Actions
				map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "[G]it [S]tage hunk" })
				map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "[G]it [S]tage buffer" })
				map("v", "<leader>gs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "[G]it [S]tage selected hunk" })
				map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "[G]it [U]ndo staged hunk" })
				map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "[G]it [R]eset hunk" })
				map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "[G]it [R]eset buffer" })
				map("v", "<leader>gr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "[G]it [R]eset hunk" })
				map("n", "<leader>gh", gitsigns.preview_hunk_inline, { desc = "[G]it [H]unk inline" })
				map("n", "<leader>gH", gitsigns.preview_hunk, { desc = "[G]it [H]unk" })
				map("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "[G]it [B]lame line" })
				map("n", "<leader>gB", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "[G]it [B]lame full" })
				map("n", "<leader>gD", gitsigns.diffthis, { desc = "[G]it [D]Diff hunk" })
				map("n", "<leader>gt", gitsigns.toggle_signs, { desc = "[G]it [T]oggle signs" })
				-- map("n", "<leader>hD", function()
				-- 	gitsigns.diffthis("~")
				-- end)
				-- map("n", "<leader>gd", gitsigns.toggle_deleted, { desc = "[G]it [R]eset hunk" })

				-- Text object
				-- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		})
	end,
}

return m
