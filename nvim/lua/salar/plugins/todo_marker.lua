return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = { "n", "v" },
			desc = "Format buffer / selection",
		},
	},
	config = function()
		-- filetypes that must NOT be formatted by conform
		local skip = {
			c = true,
			cpp = true,
			objc = true,
			objcpp = true,
			cuda = true, -- clangd handles these (lspconfig.lua)
			markdown = true, -- keeps your Obsidian notes untouched
			text = true,
		}

		require("conform").setup({
			formatters_by_ft = {
				-- web
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				less = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				graphql = { "prettier" },
				-- svelte, haskell, typst: no entry, so the language server formats them (fallback)

				-- other languages
				lua = { "stylua" },
				python = { "ruff_organize_imports", "ruff_format" },
				rust = { "rustfmt" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				gdscript = { "gdscript-formatter", "gdformat" },
			},

			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				if skip[vim.bo[bufnr].filetype] then
					return
				end
				return { timeout_ms = 1500, lsp_format = "fallback" }
			end,
		})

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				vim.b.disable_autoformat = true -- this buffer only
			else
				vim.g.disable_autoformat = true -- everywhere
			end
		end, { bang = true, desc = "Disable format on save (! = this buffer only)" })

		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, { desc = "Re-enable format on save" })
	end,
}
