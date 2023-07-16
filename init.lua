vim.g.mapleader = " "
vim.g.maplocalleader = " "

local default_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("i", "jk", "<esc>", default_opts)
vim.api.nvim_set_keymap("i", "kj", "<esc>", default_opts)
vim.api.nvim_set_keymap("n", "j", "gj", default_opts)
vim.api.nvim_set_keymap("n", "k", "gk", default_opts)

local options = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	completeopt = { "menuone", "noselect" },
	fileencoding = "utf-8",
	hidden = true,
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	pumheight = 10,
	showtabline = 2,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	timeoutlen = 100,
	undofile = true,
	updatetime = 300,
	shiftwidth = 2,
	tabstop = 2,
	number = true,
	relativenumber = true,
	numberwidth = 2,
	signcolumn = "yes",
	scrolloff = 6,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("autocommands")
