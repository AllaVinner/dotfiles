local lazy = require("plugins.lazy")

lazy.setup_plugins({
	require("plugins.sleuth").default,
	require("plugins.treesitter").default,
	require("plugins.comment").default,
	require("plugins.gitsigns").default,
	require("plugins.which-key").default,
	require("plugins.telescope").default,
	require("plugins.none-ls").default,
	require("plugins.dap").default,
	require("plugins.dap-ui").default,
	require("plugins.tmux-navigator").default,
	require("plugins.nio").default,
	require("plugins.oil").default,
	require("plugins.rust").default,
	require("plugins.crates").default,
	require("plugins.iron").default,
	require("plugins.conform").default,
	-- require("plugins.tokyonight").default,
	require("plugins.catppuccin").default,
	require("plugins.todo-comments").default,
	require("plugins.mini").default,
	require("plugins.cmp").default,
	require("plugins.lspconfig").default,
	require("plugins.no-neck-pain").default,
	require("plugins.nvim-tree").default,
})

require("options.basic")
