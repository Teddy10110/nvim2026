return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	event = "VeryLazy",
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()

		local set = vim.keymap.set

		-- word under cursor (normal mode) or selected text (visual mode)
		set({ "n", "x" }, "<A-d>", function()
			mc.matchAddCursor(1)
		end, { desc = "Add next match" })
		set({ "n", "x" }, "<A-s>", function()
			mc.matchSkipCursor(1)
		end, { desc = "Skip next match" })
		set({ "n", "x" }, "<A-p>", function()
			mc.matchAddCursor(-1)
		end, { desc = "Add previous match" })
		set({ "n", "x" }, "<A-a>", function()
			mc.matchAllAddCursors()
		end, { desc = "Select all matches" })

		-- extend the cursor to the line above / below (same column)
		set({ "n", "x" }, "<C-A-S-Up>", function()
			mc.lineAddCursor(-1)
		end, { desc = "Add cursor above" })
		set({ "n", "x" }, "<C-A-S-Down>", function()
			mc.lineAddCursor(1)
		end, { desc = "Add cursor below" })

		-- fallback keys in case your system swallows the three-key combo
		set({ "n", "x" }, "<A-Up>", function()
			mc.lineAddCursor(-1)
		end, { desc = "Add cursor above" })
		set({ "n", "x" }, "<A-Down>", function()
			mc.lineAddCursor(1)
		end, { desc = "Add cursor below" })

		-- keys that only exist while you have multiple cursors
		mc.addKeymapLayer(function(layer_set)
			layer_set({ "n", "x" }, "<Left>", mc.prevCursor)
			layer_set({ "n", "x" }, "<Right>", mc.nextCursor)
			layer_set("n", "<Esc>", function()
				if not mc.cursorsEnabled() then
					mc.enableCursors()
				else
					mc.clearCursors()
				end
			end)
		end)
	end,
}
