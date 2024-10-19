local m = {}
-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
-- You can run try this out directroy by running something like `:set number`
-- You can look for help by running `:help number`.
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = false
-- Remove the statusline
vim.opt.laststatus = 0
-- vim.opt.laststatus = 2

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Disable Swapfiles
vim.opt.swapfile = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
-- Specially usefull with `zt` and `zb` keys.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
-- error previous / next
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>dm", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>dh", vim.diagnostic.hide, { desc = "Hide Diagnostics" })
vim.keymap.set("n", "<leader>ds", vim.diagnostic.show, { desc = "Show Diagnostics" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-c>", "<C-\\><C-n>", { desc = "Exit terminal mode. Works in tmux." })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
--  MIGHT NEED TO BE UNCOMMENTED IF WE ARE NOT IN TMUX ...
if not os.getenv("TMUX") then
	vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
	vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
	vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
	vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
end

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- Print contents of `tbl`, with indentation.
-- `indent` sets the initial level of indentation.
local function tprint(tbl, indent)
	if not indent then
		indent = 0
	end
	for k, v in pairs(tbl) do
		local formatting = string.rep("  ", indent) .. k .. ": "
		if type(v) == "table" then
			print(formatting)
			tprint(v, indent + 1)
		elseif type(v) == "boolean" then
			print(formatting .. tostring(v))
		else
			print(formatting .. v)
		end
	end
end

vim.api.nvim_create_user_command("Cdhere", "cd %:h", {})
vim.api.nvim_create_user_command("Cdnvim", "cd ~/.config/nvim", {})
vim.api.nvim_create_user_command("CapturePaste", function(input)
	local args = input.args or ""
	vim.cmd("r " .. args)
end, { nargs = "?", desc = "Capture output of command and paste" })
vim.api.nvim_create_user_command("CaptureHorizontal", function(input)
	local args = input.args or ""
	vim.cmd("new | r " .. args)
end, { nargs = "?", desc = "Capture output of command and open in new buffer." })
vim.api.nvim_create_user_command("CaptureVertical", function(input)
	local args = input.args or ""
	vim.cmd("vnew | r " .. args)
end, { nargs = "?", desc = "Capture output of command and open in new buffer." })

local zen_on = false
local configured_fillchars = vim.opt.fillchars
local function toggle_zen_mode()
	zen_on = not zen_on
	if zen_on then
		vim.opt.number = false
		vim.cmd("NoNeckPain")
		-- Set to remove the fill characters of the side buffers and buffer separators
		vim.opt.fillchars = { eob = " ", vert = " ", horiz = " " }
	else
		vim.opt.number = true
		vim.cmd("NoNeckPain")
		vim.opt.fillchars = configured_fillchars
	end
end
vim.api.nvim_create_user_command("Zen", toggle_zen_mode, { desc = "Toggles zenmode on and off" })
vim.keymap.set("n", "<leader>zz", toggle_zen_mode, { desc = "Toggle zen mode" })

return m
