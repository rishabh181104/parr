-- ============================================================================
-- Neovim Main Initialization File
-- Professional, Modular, and Readable Configuration
-- ============================================================================

-- Set <Space> as the leader key
vim.g.mapleader = " "

-- --------------------------------------------------------------------------
-- Load Plugin Settings (modular, each file configures a plugin)
-- --------------------------------------------------------------------------
local lzy = {
	"lazy",
	"settings",
	"autoindent",
	"autopairs",
	"colorizer",
	"colors",
	"conform",
	"copilot-cmp",
	"copilot",
	"debugger",
	"fzf-lua",
	"gitsigns",
	"harpoon",
	"jupyter",
	"lsp",
	"lualine",
	"noice",
	"nvim-lint",
	"oil",
	"regex",
	"sql",
	"treesitter",
	"whichkey",
	"notify",
}

-- Filetype autocmd for bspwmrc/sxhkdrc (shell syntax)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "bspwmrc", "sxhkdrc" },
	command = "set filetype=sh",
})

-- Load each plugin setting module safely
for _, module in ipairs(lzy) do
	local ok, err = pcall(require, "lzy." .. module)
	if not ok then
		vim.notify("Error loading lzy/" .. module .. ": " .. err, vim.log.levels.ERROR)
	end
end
