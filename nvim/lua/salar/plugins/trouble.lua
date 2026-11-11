return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		filters = {
			ignore_qt_compiler_arg = function(item, enabled)
				if not enabled then
					return true
				end

				local message = item.item and item.item.message or ""
				return not message:match("^Unknown argument:%s*['\"]?%-mno%-direct%-extern%-access['\"]?")
			end,
		},
		modes = {
			diagnostics = {
				filter = {
					["not"] = {
						ignore_qt_compiler_arg = true,
					},
				},
			},
		},
	},
	cmd = "Trouble",
	keys = {
		{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
		{
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Open trouble document diagnostics",
		},
		{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
		{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
	},
}
