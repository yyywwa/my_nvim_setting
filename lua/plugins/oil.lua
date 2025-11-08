return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	keys = {
		{ "<leader>e", ":Oil<CR>" },
	},
	config = function()
		require("oil").setup({
			defualt_file_explorer = false,
			win_options = {
				-- 				winbar = "%!v:lua.get_oil_winbar()",
			},
		})
	end,
}
