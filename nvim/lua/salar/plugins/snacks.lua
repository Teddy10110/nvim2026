return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- Enable the specific features you selected
		notifier = { enabled = true },
		picker = { enabled = true },
	},

	keys = {
		-- 1. Picker Keymaps (Find files and grep text like Telescope)
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep Text",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent Files",
		},

		-- 3. Notifier Keymaps (Manage notification popups)
		{
			"<leader>nd",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"<leader>nh",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>tt",
			function()
				Snacks.terminal(nil, { win = { position = "float", border = "rounded", width = 0.8, height = 0.8 } })
			end,
			desc = "Floating terminal",
		},
		{
			"<A-t>",
			function()
				Snacks.terminal(nil, { win = { position = "float", border = "rounded", width = 0.8, height = 0.8 } })
			end,
			mode = { "n", "t" },
			desc = "Floating terminal (works inside terminal too)",
		},
	},
}
