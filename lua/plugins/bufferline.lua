local symbols = require("core.symbols")
return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			close_command = ":BufferLineClose %d",
			right_mouse_command = ":BufferLineClose %d",
			separator_style = "thin",
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diagnostics_dict, _)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and symbols.Error or (e == "warning" and symbols.Warn or symbols.Info)
					s = s .. n .. sym
				end
				return s
			end,
		},
	},
	lazy = false,
	keys = {
		{ "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true },
		{ "<leader>bl", ":BufferLineCycleNext<CR>", silent = true },
		{ "<leader>bp", ":BufferLinePick<CR>", silent = true },
		{ "<leader>bd", ":bdelete<CR>", silent = true },
	},
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				mode = "tabs",
				offsets = {
					{
						filetype = "neo-tree",
						text = "Nvim Tree",
						separator = true,
						text_align = "left",
					},
				},
				diagnostics = "nvim_lsp",
				separator_style = { "", "" },
				modified_icon = "●",
				show_close_icon = false,
				show_buffer_close_icons = true,
			},
		})
	end,
}
