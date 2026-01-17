return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && "
        .. "cmake --build build --config Release && "
        .. "cmake --install build --prefix build",
    },
  },
  cmd = "Telescope",
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            -- 将回车键改为智能跳转：若已打开则跳到对应 Tab，否则新开 Tab
            ["<CR>"] = actions.select_default,
            -- 如果你偶尔还是想在当前窗口打开，可以把原来的功能绑到 <C-o>
            ["<C-o>"] = actions.select_tab_drop,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })
    telescope.load_extension("fzf")
  end,
  keys = {
    { "<leader>ff", ":Telescope find_files<CR>" },
    { "<leader>fg", ":Telescope live_grep<CR>" },
    { "<leader>fb", ":Telescope buffers<CR>" },
    { "<leader>fh", ":Telescope help_tags<CR>" },
    -- 新增：直接查看并跳转已有的 Tab
    { "<leader>ft", ":Telescope telescope-tabs list_tabs<CR>", desc = "List Tabs" },
  },
}
