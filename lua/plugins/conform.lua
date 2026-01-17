return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    local conform = require("conform")
    -- 配置 conform
    conform.setup({
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      -- 设置格式化工具
      formatters_by_ft = {
        lua = { "stylua" }, -- Lua 文件使用 stylua
        c = { "clang-format" },
        cpp = { "clang-format" },
        go = { "goimports" },
        rust = { "rustfmt" },
      },
      formatters = {
        stylua = {
          append_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--",
            "$FILENAME",
          },
        },
        clang_format = {
          args = {
            "--style",
            "Google",
          },
        },
      },
    })
  end,
  keys = {
    { "<leader>lf", ":lua require('conform').format({ async = false })<CR>" },
  },
}
