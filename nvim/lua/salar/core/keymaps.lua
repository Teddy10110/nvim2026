-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nj", ":nohl<CR>", { desc = "Clear search highlights" })

-- exit out to normal mode

local runners = {
	python = "python3 %s",
	javascript = "node %s",
	php = "php %s",
	java = "java %s", -- single-file programs only
	c = "gcc -g -Wall %s -o /tmp/nvim_run && /tmp/nvim_run",
	cpp = "g++ -std=c++20 -g -Wall %s -o /tmp/nvim_run && /tmp/nvim_run",
	sh = "bash %s",
}

vim.keymap.set("n", "<leader>rr", function()
	local tpl = runners[vim.bo.filetype]
	if not tpl then
		vim.notify("No runner for filetype: " .. vim.bo.filetype, vim.log.levels.WARN)
		return
	end
	vim.cmd("write")
	local cmd = string.format(tpl, vim.fn.shellescape(vim.fn.expand("%:p")))
	Snacks.terminal.open(cmd, { auto_close = false, win = { position = "bottom", height = 0.35 } })
end, { desc = "Run current file" })

-- save file
keymap.set("n", "<C-s>", "<cmd> w <CR>")

-- save file without auto-formatting
-- keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
-- keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease height" })
keymap.set("n", "<C-Left>", ":vertical resize -4<CR>", { desc = "Narrower" })
keymap.set("n", "<C-Right>", ":vertical resize +4<CR>", { desc = "Wider" })

-- tab management
keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" })
keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
keymap.set("n", "<leader>n", "<cmd>tabnew<CR>", { desc = "New tab" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- file explorer
keymap.set("n", "<C-n>", "<cmd>Ex<CR>", { desc = "Open file explorer" })

vim.keymap.set("n", "<leader>ci", "<cmd>Telescope lsp_incoming_calls<CR>")
vim.keymap.set("n", "<leader>co", "<cmd>Telescope lsp_outgoing_calls<CR>")
vim.keymap.set("n", "<leader>ch", "<cmd>Telescope lsp_implementations<CR>")
vim.keymap.set("n", "<leader>cu", "<cmd>Telescope lsp_references<CR>")

keymap.set("n", "<leader>ts", "<cmd>Theme<CR>", { desc = "Select theme" })
keymap.set("n", "<leader>tn", "<cmd>ThemeNext<CR>", { desc = "Next theme" })
keymap.set("n", "<leader>tp", "<cmd>ThemePrev<CR>", { desc = "Previous theme" })

-- terminal related
keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- terminal selecter

keymap.set("n", "<leader>gl", vim.diagnostic.open_float, { desc = "Show diagnostic message" })

-- increment/decrement numbers
-- keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
-- keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

vim.keymap.set("n", "<leader>ft", function()
	-- Check if snacks.nvim is available
	if not pcall(require, "snacks") then
		vim.notify("snacks.nvim is required for this feature!", vim.log.levels.ERROR)
		return
	end

	-- Open the snacks floating filetype select picker
	Snacks.picker.select(vim.fn.getcompletion("", "filetype"), {
		prompt = "Select Language: ",
		kind = "filetype",
		format = function(item)
			return { { item, "SnacksPickerLabel" } }
		end,
	}, function(choice)
		if choice then
			vim.bo.filetype = choice
			vim.notify("Filetype set to: " .. choice)
		end
	end)
end, { desc = "Select language for unsaved buffer" })
