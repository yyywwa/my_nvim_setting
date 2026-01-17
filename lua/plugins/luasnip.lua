return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  config = function()
    vim.keymap.set({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
    require("luasnip").setup({
      -- 当你光标移出片段范围时，自动解除 Snippet 状态
      region_check_events = "CursorMoved",
      -- 当你删除片段时，自动从跳转列表中移除
      delete_check_events = "InsertLeave",
    })
  end,
  keys = {
    {
      "<C-K>",
      function()
        ls.expand()
      end,
      { silent = true },
    },
    {
      "<C-L>",
      function()
        ls.jump(1)
      end,
      { silent = true },
    },
    {
      "<C-J>",
      function()
        ls.jump(-1)
      end,
      { silent = true },
    },
  },
}
