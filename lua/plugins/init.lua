return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		disabled = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	disabled = true,
	-- 	opts = {},
	-- 	config = function()
	-- 		vim.cmd.colorscheme("tokyonight-day")
	-- 	end,
	-- },
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	lazy = false,
	-- 	disabled = true,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			color_overrides = {
	-- 				latte = {
	-- 					mauve = "#8c1aff",
	-- 				},
	-- 			},
	-- 		})
	-- 		vim.cmd.colorscheme("catppuccin-latte")
	-- 	end,
	-- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	priority = 1000,
	-- 	disabled = true,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("kanagawa")
	-- 	end,
	-- },
	{
		enabled = false,
		"m4xshen/hardtime.nvim",
		opts = {},
	},
	{
		"echasnovski/mini.indentscope",
		config = function()
			require("mini.indentscope").setup({ symbol = "|" })
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = true,
		event = "BufEnter",
	},
	{
		"lervag/vimtex",
		lazy = false,
	},
}
