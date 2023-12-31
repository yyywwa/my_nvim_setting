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

require("lazy").setup({

	--导入(配置超过10行)
	{
		import = "plugins",
	},

	--下面的utf-8/linux/ 标志
	{
		"nvim-lualine/lualine.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},

	--翻译
	{
		"voldikss/vim-translator",
		version = "*",
		config = function()
			vim.g.translator_sourcelang = "en"
			vim.g.translator_targetlang = "zh-CN"
			------key---------
			Keymap("n", "<leader>t", "<Plug>Translate", Opt)
			Keymap("v", "<leader>t", "<Plug>TranslateV", Opt)
		end,
	},

	--括号自动补全
	{
		"windwp/nvim-autopairs",
		version = "*",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	--缩进显示
	{
		"lukas-reineke/indent-blankline.nvim",
		version = "*",
		config = function()
			require("indent_blankline").setup({
				-- for example, context is off by default, use this to turn it on
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	},
	--终端
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-\>]],
				-- 打开新终端后自动进入插入模式
				start_in_insert = true,
				-- 在当前buffer的下方打开新终端
				direction = "float",
			})
		end,
	},
})
