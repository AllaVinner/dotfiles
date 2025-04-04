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
-- See toggle_statusline for setting
vim.opt.laststatus = 0
-- vim.opt.laststatus = 2
-- Remove row and column numbers down to the right
-- The is visible in the statusline anyway
vim.opt.ruler = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

vim.opt.showmode = false
-- Don't show recently pressed keys down to the right.
vim.opt.showcmd = false

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

vim.opt.termguicolors = true

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

-- Execute singular Lua lines
vim.keymap.set("n", "<leader>lf", "<cmd>source %<CR>", { desc = "[L]ua execute [F]ile" })
vim.keymap.set("n", "<leader>ll", ":.lua<CR>", { desc = "[L]ua execut [L]ine" })
vim.keymap.set("v", "<leader>ll", ":lua<CR>", { desc = "[L]ua execute visual" })

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

function ShowRegistersInBuffer(input)
	vim.cmd("new")
	vim.cmd("put =execute('registers')")
end
vim.api.nvim_create_user_command("ShowRegisters", ShowRegistersInBuffer, {})

-----------
--- Macros
-----------

-- NOTE: ' and " are different in vim
-- NOTE: Copy pasting from a register does not retain special characers
-- > "lp does. E.g. Esc will render as grayed out ^[ but actually be correct
esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
vim.fn.setreg("l", "iThis is a simple macro" .. esc .. "o<80>kb<Esc>EscESCasdfadsf")
vim.fn.setreg("l", "Th��5is sdfas dfosadfasdciwjoiasdfasdhviwypp")

return m
