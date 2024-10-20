-- Nvim Tree
-- This plugin enables you to move through your directories like a tree.
-- It is not a replacement for oil, as it does not allow for the same
-- inplace createion, deletion, and renaming as oil does.
local m = {}
m.default = {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local api = require("nvim-tree.api")
		vim.keymap.set("n", "<leader>tf", api.tree.toggle, { desc = "[T]oggle [F]older Tree" })
		local WIDTH_RATIO = 0.8
		local HEIGHT_RATIO = 0.8
		local function on_attach(bufnr)
			-- This function overwrites the default mappings
			-- If the default mappings should be added again
			-- api.config.mappings.default_on_attach(bufnr)
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			vim.keymap.set("n", "<leader>ff", api.tree.change_root_to_node, opts("CD to folder"))
			vim.keymap.set("n", "<leader>f?", api.node.show_info_popup, opts("Info"))
			vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "<leader>fo", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "<leader>fp", api.node.open.preview, opts("Open Preview"))

			vim.keymap.set("n", "<leader>fr", api.fs.rename_sub, opts("Rename: Omit Filename"))
			vim.keymap.set("n", "<leader>fR", api.fs.rename_full, opts("Rename: Full Path"))
			vim.keymap.set("n", "<leader>fa", api.fs.create, opts("Create File Or Directory"))
			vim.keymap.set("n", "<leader>fd", api.fs.remove, opts("Delete"))

			vim.keymap.set("n", "<leader>gn", api.node.navigate.git.prev, opts("Prev Git"))
			vim.keymap.set("n", "<leader>gp", api.node.navigate.git.next, opts("Next Git"))
			vim.keymap.set("n", "<leader>fg", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
			vim.keymap.set("n", "<leader>fu", api.node.navigate.parent, opts("Parent Directory"))

			vim.keymap.set("n", "<leader>fe", api.tree.expand_all, opts("Expand All"))
			vim.keymap.set("n", "<leader>fE", api.tree.collapse_all, opts("Collapse"))
			vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))

			vim.keymap.set("n", "<leader>fca", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
			vim.keymap.set("n", "<leader>fcr", api.fs.copy.relative_path, opts("Copy Relative Path"))
			-- vim.keymap.set("n", "q", api.tree.close, opts("Close"))
			vim.keymap.set("n", "<leader>fF", api.tree.reload, opts("Refresh"))
			vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
		end
		require("nvim-tree").setup({
			on_attach = on_attach,
			modified = {
				enable = false,
				show_on_dirs = true,
				show_on_open_dirs = true,
			},
			view = {
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = screen_w * WIDTH_RATIO
						local window_h = screen_h * HEIGHT_RATIO
						local window_w_int = math.floor(window_w)
						local window_h_int = math.floor(window_h)
						local center_x = (screen_w - window_w) / 2
						local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
						return {
							border = "rounded",
							relative = "editor",
							row = center_y,
							col = center_x,
							width = window_w_int,
							height = window_h_int,
						}
					end,
				},
				width = function()
					return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
				end,
			},
		})
	end,
}

return m
