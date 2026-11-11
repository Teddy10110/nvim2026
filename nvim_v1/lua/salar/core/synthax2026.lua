-- Applies the VS Code "Dark 2026" syntax colours on top of whatever theme is active.
-- Only the foreground colours of code tokens change. Backgrounds and UI are untouched.

local c = {
	comment = "#8b949e",
	string = "#a5d6ff",
	regex = "#7ee787",
	number = "#79c0ff",
	constant = "#79c0ff",
	keyword = "#ff7b72",
	operator = "#ff7b72",
	preproc = "#ff7b72",
	func = "#d2a8ff",
	type = "#4ec9b0",
	module = "#4ec9b0",
	variable = "#bbbebf",
	member = "#79c0ff",
	param = "#ffa657",
	annotation = "#ffa657",
	tag = "#7ee787",
	attr = "#79c0ff",
	macro = "#48a0c7",
}

local SET_DEFAULT_TEXT = true -- also set the plain text colour (Normal foreground only)

local groups = {
	-- classic syntax groups
	Comment = { fg = c.comment, italic = true },
	SpecialComment = { fg = c.comment },
	String = { fg = c.string },
	Character = { fg = c.string },
	Number = { fg = c.number },
	Float = { fg = c.number },
	Boolean = { fg = c.constant },
	Constant = { fg = c.constant },
	Identifier = { fg = c.variable },
	Function = { fg = c.func },
	Statement = { fg = c.keyword },
	Conditional = { fg = c.keyword },
	Repeat = { fg = c.keyword },
	Label = { fg = c.keyword },
	Exception = { fg = c.keyword },
	Keyword = { fg = c.keyword },
	StorageClass = { fg = c.keyword },
	Operator = { fg = c.operator },
	PreProc = { fg = c.preproc },
	Include = { fg = c.preproc },
	Define = { fg = c.preproc },
	PreCondit = { fg = c.preproc },
	Macro = { fg = c.macro },
	Type = { fg = c.type },
	Structure = { fg = c.type },
	Typedef = { fg = c.type },
	Tag = { fg = c.tag },

	-- treesitter groups
	["@comment"] = { fg = c.comment, italic = true },
	["@comment.documentation"] = { fg = c.comment, italic = true },
	["@string"] = { fg = c.string },
	["@string.regexp"] = { fg = c.regex },
	["@character"] = { fg = c.string },
	["@number"] = { fg = c.number },
	["@number.float"] = { fg = c.number },
	["@boolean"] = { fg = c.constant },
	["@constant"] = { fg = c.constant },
	["@constant.builtin"] = { fg = c.constant },
	["@constant.macro"] = { fg = c.macro },
	["@variable"] = { fg = c.variable },
	["@variable.parameter"] = { fg = c.param },
	["@variable.member"] = { fg = c.member },
	["@property"] = { fg = c.member },
	["@function"] = { fg = c.func },
	["@function.call"] = { fg = c.func },
	["@function.builtin"] = { fg = c.func, italic = true },
	["@function.method"] = { fg = c.func },
	["@function.method.call"] = { fg = c.func },
	["@function.macro"] = { fg = c.macro },
	["@constructor"] = { fg = c.type },
	["@type"] = { fg = c.type },
	["@type.builtin"] = { fg = c.type, italic = true },
	["@type.definition"] = { fg = c.type },
	["@module"] = { fg = c.module },
	["@namespace"] = { fg = c.module },
	["@keyword"] = { fg = c.keyword },
	["@keyword.function"] = { fg = c.keyword },
	["@keyword.return"] = { fg = c.keyword },
	["@keyword.conditional"] = { fg = c.keyword },
	["@keyword.repeat"] = { fg = c.keyword },
	["@keyword.import"] = { fg = c.preproc },
	["@keyword.directive"] = { fg = c.preproc },
	["@keyword.operator"] = { fg = c.keyword },
	["@keyword.exception"] = { fg = c.keyword },
	["@keyword.modifier"] = { fg = c.keyword },
	["@keyword.type"] = { fg = c.keyword },
	["@operator"] = { fg = c.operator },
	["@tag"] = { fg = c.tag },
	["@tag.attribute"] = { fg = c.attr },
	["@attribute"] = { fg = c.annotation },
}

local function apply()
	if vim.g.colors_name == "code-2026" then
		return -- the real theme is active, nothing to copy over it
	end
	for name, spec in pairs(groups) do
		local current = vim.api.nvim_get_hl(0, { name = name, link = false })
		vim.api.nvim_set_hl(0, name, vim.tbl_extend("force", current, spec))
	end
	if SET_DEFAULT_TEXT then
		local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
		vim.api.nvim_set_hl(0, "Normal", vim.tbl_extend("force", normal, { fg = c.variable }))
	end
end

-- re-apply every time a colorscheme loads (also when you switch with :Theme)
vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("Syntax2026", { clear = true }),
	callback = apply,
})

if vim.g.colors_name then
	apply()
end
