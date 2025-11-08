return {
  "nvimdev/lspsaga.nvim",
  cmd = "Lspsaga",
  opts = {
    finder = {
      keys = {
        toggle_or_open = "<CR>",
      },
    },
  },
  keys = {
    { "<leader>lr", ":Lspsaga rename<CR>" },
    { "<leader>lc", ":Lspsaga code_action<CR>" },
    { "gd", ":Lspsaga goto_definition<CR>" },
    { "gh", ":Lspsaga hover_doc<CR>" },
    { "<leader>lR", ":Lspsaga finder<CR>" },
    { "<leader>ln", ":Lspsaga diagnostic_jump_next<CR>" },
    { "<leader>lp", ":Lspsaga diagnostic_jump_prev<CR>" },
    { "<leader>cj", ":lua vim.g.generate_compile_commands()<CR>", desc = "Generate compile_commands.json" },
  },
}
