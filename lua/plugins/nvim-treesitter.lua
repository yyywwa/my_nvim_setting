return {
	-- 插件仓库地址
	"nvim-treesitter/nvim-treesitter",

	-- 在加载插件时运行
	branch = "master",
	build = ":TSUpdate",
	-- 在 Lazy.nvim 中建议使用 'VeryLazy' 事件，以确保尽可能晚地加载
	-- 如果你的主题插件需要它，可能需要改为更早的事件
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-treesitter").setup({
			-- 确保 Tree-sitter 插件已成功安装和更新
			ensure_installed = {
				"cpp",
				"lua",
				-- 您可以根据需要添加更多语言，例如 "python", "go" 等
			},
			-- 自动安装缺失的解析器
			auto_install = true,
			-- 配置功能模块
			highlight = {
				enable = true, -- 启用语法高亮
				-- 禁用特定语言的高亮，例如：
				-- disable = { "c", "rust" },
			},
			-- 启用智能代码折叠
			indent = {
				enable = true,
				-- 禁用特定语言的缩进，例如：
				-- disable = { "python", "css" },
			},

			-- 启用结构化文本对象 (例如 'iaf' for inside a function)
			textobjects = {
				enable = true,
				-- 在这里可以添加其他 textobjects 插件的配置，例如 nvim-treesitter-textobjects
			},
		})
	end,
}
