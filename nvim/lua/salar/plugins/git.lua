return {
	"tpope/vim-fugitive",
	cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Gclog" },
	keys = {
		{ "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
		{ "<leader>gc", "<cmd>Git commit<CR>", desc = "Git commit" },
		{ "<leader>gp", "<cmd>Git push<CR>", desc = "Git push" },
		{ "<leader>gb", "<cmd>Git blame<CR>", desc = "Git blame" },
		{ "<leader>gd", "<cmd>Gvdiffsplit<CR>", desc = "Git diff (side by side)" },
	},
}
