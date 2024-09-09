-- Style plugin
return {
	default = {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			local options = {
				flavour = "frappe",
				transparent_background = true,
			}
			local cat = require("catppuccin")
			cat.setup(options)
			vim.cmd.colorscheme("catppuccin")
			vim.api.nvim_create_user_command("Transparency", function()
				cat.options.transparent_background = not cat.options.transparent_background
				vim.cmd.CatppuccinCompile()
			end, {})
		end,
	},
}
