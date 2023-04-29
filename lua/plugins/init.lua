return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
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
