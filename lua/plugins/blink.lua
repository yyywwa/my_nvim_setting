return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  event = "VeryLazy",
  opts = {
    completion = {
      documentation = {
        auto_show = true,
      },
    },
    keymap = {
      preset = "default",
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Esc>"] = { "hide", "fallback" },
      ["<PageUp>"] = { "scroll_documentation_up", "fallback" },
      ["<PageDown>"] = { "scroll_documentation_down", "fallback" },
    },
    sources = {
      default = {
        "path",
        "snippets",
        "buffer",
        "lsp",
      },
    },
  },
  cmdline = {
    keymap = { preset = "inherit" },
    completion = {
      ghost_text = { enabled = true },
      menu = {
        auto_show = function()
          return vim.fn.getcmdtype() == ":"
        end,
      },
    },
  },
}
