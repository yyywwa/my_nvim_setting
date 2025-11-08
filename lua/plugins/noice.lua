return {
  "folke/noice.nvim",
  event = "VeryLazy", -- 确保它尽可能晚地加载
  dependencies = {
    -- 这是一个可选的依赖，用于更平滑的动画效果，推荐添加
    "nui.nvim",
  },
  --enabled = false,
  opts = {
    -- 消息显示设置 (Messages)
    messages = {
      -- 将所有消息移动到右下角，类似于浮动通知
      view = "notify",
    },

    -- 命令提示行设置 (Cmdline)
    cmdline = {
      -- 将命令提示行移到弹出窗口（popup）中，更美观
      view = "cmdline_popup",
      -- 弹出窗口的位置和大小设置
      opts = {
        border = {
          style = "rounded", -- 使用圆角边框
        },
        -- 宽度和高度可以根据您的喜好调整
      },
    },

    -- 启用历史命令记录
    lsp = {
      progress = {
        enabled = true,
        -- 将 LSP 进度条放在右下角
        view = "mini",
      },
    },

    -- 是否启用内置的迷你浮动窗口来显示诊断信息
    presets = {
      bottom_search = true, -- 启用底部搜索/替换预览
      command_palette = true, -- 启用命令面板 (Cmdline)
      long_message_to_split = true, -- 将长消息自动放到分屏
      inc_rename = false, -- 不在重命名时使用 Noice 界面
      lsp_doc_border = true, -- 不给 LSP 文档添加边框
    },
  },
  -- 确保在 Neovim 启动时调用 setup
  --config = function(_, opts)
  --  require("noice").setup(opts)
  --end,
}
