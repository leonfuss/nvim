vim.lsp.set_log_level(0)

local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, buffer)
	require("lsp.format").on_attach(client, buffer)
	require("lsp.keymaps").on_attach(client, buffer)
end)

lsp_zero.set_sign_icons({
	error = " ",
	warn = " ",
	hint = " ",
	info = " ",
})

require("neodev").setup({})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer" },
	handlers = {
		lsp_zero.default_setup,
		rust_analyzer = lsp_zero.noop(),
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

require("lspconfig").texlab.setup({
	settings = {
		texlab = {
			rootDirectory = ".",
			build = {
				onSave = true,
			},
			forwardSearch = {
				args = { "%l", "%p", "%f" },
				executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
			},
			experimental = {
				mathEnvironments = { "align*" },
				enumEnvironments = { "enumerate" },
			},
		},
	},
})

local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
			require("mini.pairs").map_buf(0, "i", "<", { action = "closeopen", pair = "<>" })
		end,
		rustfmt = {
			extraArgs = { "+nightly" },
		},
	},
})
