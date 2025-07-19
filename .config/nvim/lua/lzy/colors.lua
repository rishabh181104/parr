require("onedark").setup({
	-- Main options --
	style = "warmer", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = true, -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- toggle theme style ---
	toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
	toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

	-- Lualine options --
	lualine = {
		transparent = true, -- lualine center bar transparency
	},
})
-- Enable theme
require("onedark").load()

-- -- This is for Rose-pine theme
-- vim.cmd("colorscheme rose-pine")
-- require("nightfox").setup({
-- 	options = {
-- 		transparent = true,
-- 		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
-- 		dim_inactive = true, -- Non focused panes set to alternative background
-- 		module_default = true,
-- 	},
-- })
--
-- -- setup must be called before loading
-- vim.cmd("colorscheme terafox")
-- vim.o.background = "dark"

-- -- Kanagawa ColorScheme
-- require("kanagawa").setup({
-- 	compile = true, -- enable compiling the colorscheme
-- 	undercurl = true, -- enable undercurls
-- 	commentStyle = { italic = true },
-- 	functionStyle = {},
-- 	keywordStyle = { italic = true },
-- 	statementStyle = { bold = true },
-- 	typeStyle = {},
-- 	transparent = true, -- do not set background color
-- 	dimInactive = true, -- dim inactive window `:h hl-NormalNC`
-- 	terminalColors = true, -- define vim.g.terminal_color_{0,17}
-- 	colors = { -- add/modify theme and palette colors
-- 		palette = {},
-- 		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
-- 	},
-- 	overrides = function(colors) -- add/modify highlights
-- 		return {}
-- 	end,
-- 	theme = "wave", -- Load "wave" theme
-- 	background = { -- map the value of 'background' option to a theme
-- 		dark = "dragon", -- try "dragon" !
-- 		light = "lotus",
-- 	},
-- })
--
-- vim.cmd("colorscheme kanagawa")
