return {
	"mason-org/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mason-org/mason-lspconfig.nvim",
	},
	event = "VeryLazy",
	opts = {},
	config = function(_, opts)
		require("mason").setup(opts)

		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = true,
		})
	end,
}
