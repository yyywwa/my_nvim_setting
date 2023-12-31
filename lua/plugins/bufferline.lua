return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"moll/vim-bbye",
	},
	config = function()
		-- 配置 bufferline
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				close_command = "Bdelete", -- can be a string | function, | false see "Mouse actions"
				right_mouse_command = "bdelete!", -- can be a string | function | false, see "Mouse actions"
				left_mouse_command = "buffer", -- can be a string | function, | false see "Mouse actions"
				middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
				-- 设置 separator 样式
				separator_style = "thin",
				--separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
				--给nvim-tree留出空间
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})

		-----------------------keyKeymap---------------------------------
		-- bufferline
		-- 左右Tab切换
		Keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>", Opt)
		Keymap("n", "<C-l>", ":BufferLineCycleNext<CR>", Opt)
		-- 关闭
		Keymap("n", "<leader>bw", ":Bdelete!<CR>", Opt)
		--"moll/vim-bbye"
		Keymap("n", "<leader>bl", ":BufferLineCloseRight<CR>", Opt)
		Keymap("n", "<leader>bh", ":BufferLineCloseLeft<CR>", Opt)
		Keymap("n", "<leader>bc", ":BufferLinePickClose<CR>", Opt)
		-----------------------keyKeymap---------------------------------
	end,
}
