return {
	"smoka7/hop.nvim",
	opts = {},
	config = function()
		require("hop").setup({
			hint_position = require("hop.hint").HintPosition.END,
		})
	end,
	keys = {
		{ "<leader>hp", ":HopWord<CR>", silent = true },
	},
}
