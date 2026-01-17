return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000,
  config = function(_, opts)
    require("everforest").setup(opts)
    vim.cmd.colorscheme("everforest")
  end,
}
