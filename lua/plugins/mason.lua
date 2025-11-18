return {
  "mason-org/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mason-org/mason-lspconfig.nvim",
  },
  event = "VeryLazy",
  opts = {
    ensure_installed = {
      "gopls", -- Go 语言 LSP
      "lua_ls", -- Lua 语言 LSP (用于 Neovim 配置)
      "clangd", -- C/C++ 语言 LSP
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = true,
    })
  end,
}
