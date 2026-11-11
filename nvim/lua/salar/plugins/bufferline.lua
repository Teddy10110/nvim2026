return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
    'moll/vim-bbye',
    'nvim-tree/nvim-web-devicons',
 },

	config = function()
		local bufferline = require("bufferline")

		local function hl(name)
			return vim.api.nvim_get_hl(0, { name = name, link = false })
		end

		local function fg_or_nil(group)
			local value = hl(group)
			return value and value.fg or nil
		end

		local function sync_fill_highlight()
			local tabline_fill = hl("TabLineFill")
			local tabline = hl("TabLine")
			local normal = hl("Normal")
			local fill_bg = (tabline_fill and tabline_fill.bg) or (tabline and tabline.bg) or (normal and normal.bg)

			if fill_bg then
				vim.api.nvim_set_hl(0, "BufferLineFill", { bg = fill_bg })
			end
		end

		local function sync_tab_highlights()
			local normal = hl("Normal")
			local tabline = hl("TabLine")
			local tabline_sel = hl("TabLineSel")

			if not normal then
				return
			end

			local base_bg = (tabline and tabline.bg) or normal.bg
			local base_fg = (tabline and tabline.fg) or normal.fg
			local selected_bg = (tabline_sel and tabline_sel.bg) or normal.bg or base_bg
			local selected_fg = (tabline_sel and tabline_sel.fg) or normal.fg

			vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = base_bg, fg = base_fg })
			vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { bg = base_bg, fg = base_fg })
			vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bg = selected_bg, fg = selected_fg, bold = true })
			vim.api.nvim_set_hl(0, "BufferLineDuplicate", { bg = base_bg, fg = base_fg })
			vim.api.nvim_set_hl(0, "BufferLineDuplicateVisible", { bg = base_bg, fg = base_fg })
			vim.api.nvim_set_hl(0, "BufferLineDuplicateSelected", { bg = selected_bg, fg = selected_fg, bold = true })
			vim.api.nvim_set_hl(0, "BufferLineModified", { bg = base_bg, fg = fg_or_nil("DiagnosticWarn") or base_fg })
			vim.api.nvim_set_hl(0, "BufferLineModifiedVisible", { bg = base_bg, fg = fg_or_nil("DiagnosticWarn") or base_fg })
			vim.api.nvim_set_hl(0, "BufferLineModifiedSelected", { bg = selected_bg, fg = fg_or_nil("DiagnosticWarn") or selected_fg })
			vim.api.nvim_set_hl(0, "BufferLineSeparator", { bg = base_bg, fg = base_bg })
			vim.api.nvim_set_hl(0, "BufferLineSeparatorVisible", { bg = base_bg, fg = base_bg })
			vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { bg = selected_bg, fg = selected_bg })
			vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { bg = selected_bg, fg = fg_or_nil("Special") or selected_fg })
		end

		local options = {
			options = {
				mode = "buffers",
				-- separator_style = "thin",
				always_show_bufferline = true,
				sort_by = "insert_after_current",
				-- diagnostics = false,
				-- diagnosmodified_icon = "",
				-- diagnosshow_buffer_close_icons = false,
				-- diagnosshow_close_icon = false,
				themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
                                numbers = 'none', -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
                                close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
                                buffer_close_icon = '𝘅',
                                close_icon = '𝘅',
                                path_components = 1, -- Show only the file name without the directory
                                modified_icon = '●',
                                left_trunc_marker = '',
                                right_trunc_marker = '',
                                max_name_length = 30,
                                max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
                                tab_size = 21,
                                diagnostics = false,
                                diagnostics_update_in_insert = false,
                                color_icons = true,
                                show_buffer_icons = true,
                                show_buffer_close_icons = true,
                                show_close_icon = true,
                                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                                separator_style = { '│', '│' }, -- | "thick" | "thin" | { 'any', 'any' },
                                enforce_regular_tabs = true,
                                -- always_show_bufferline = true,
                                show_tab_indicators = false,
                                indicator = {
                                  -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
                                  style = 'none', -- Options: 'icon', 'underline', 'none'
                                },
                                icon_pinned = '󰐃',
                                minimum_padding = 1,
                                maximum_padding = 5,
                                maximum_length = 15,
                                --sort_by = 'insert_at_end',
                                },
                                highlights = {
                                  separator = {
                                    fg = '#434C5E',
                                  },
                                  buffer_selected = {
                                    bold = true,
                                    italic = false,
                                  },
                                  -- separator_selected = {},
                                  -- tab_selected = {},
                                  -- background = {},
                                  -- indicator_selected = {},
                                  -- fill = {},

			             },
		                  }

		bufferline.setup(options)
		sync_fill_highlight()
		sync_tab_highlights()

		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("SalarBufferlineThemeSync", { clear = true }),
			callback = function()
				bufferline.setup(options)
				sync_fill_highlight()
				sync_tab_highlights()
			end,
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>h", ":BufferLineMovePrev<CR>", { silent = true, desc = "Move buffer left" })
		vim.keymap.set("n", "<leader>l", ":BufferLineMoveNext<CR>", { silent = true, desc = "Move buffer right" })
	end,
}
