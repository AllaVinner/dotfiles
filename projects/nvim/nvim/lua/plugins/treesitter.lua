--[[ 
`tree-sitter` is a tool that creates an abstract syntax tree of you code.
People can then create parsers that uses that AST to, e.g., highlight stuff.
`tree-sitter` can also incrementally update this tree, as a file gets updated.
`nvim-treesitter` is a Neovim plugin which uses the `tree-sitter` interface.

`nvim-treesitter` is based on three features
- language parsers
- queries
- modules

> [!Important]
> **Modules** provide featuers - e.g. highlighting - 
> based on **queries** for syntax objects 
> extracted from a buffer by a **language parser**.

Treesitter uses a different parser for every language.
A parser is generated from a `tree-sitter-cli` and a `grammer.js` file,
which are compiled to a `.so` library.
This file must be place int eh neovim `runtimepath`, `.../parser/<language>.so`.
This can be done with `:TSInstall <language>`.
Run `:checkhelth treesitter`, to see which are where there parsers are installed.
`TSInstallInfo` to get available parsers.
The parser versions need to be in-sync with the `tree-sitter` version.
Make sure of this with `:TSUpdate`.
`TSMuduleInfo` gives you the state parsers.

]]
--
return {
	default = { -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "bash", "c", "html", "lua", "luadoc", "markdown", "vim", "vimdoc", "python" },
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

			-- Prefer git instead of curl in order to improve connectivity in some environments
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)

			-- There are additional nvim-treesitter modules that you can use to interact
			-- with nvim-treesitter. You should go explore a few and see what interests you:
			--
			--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},
}
