return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- 注意：这里必须是 nvim-treesitter.configs
    require("nvim-treesitter.configs").setup({
      -- 显式添加 go
      ensure_installed = {
        "cpp",
        "lua",
        "go",
        "vim",
        "vimdoc",
      },
      auto_install = true,
      highlight = {
        enable = true, -- 开启高亮
      },
      indent = {
        enable = true,
      },
      -- 如果你没有安装 nvim-treesitter-textobjects 插件，
      -- 建议先注释掉这一段，或者安装该插件
      -- textobjects = { enable = true },
    })
  end,
}
