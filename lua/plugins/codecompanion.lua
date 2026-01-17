return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    { "stevearc/dressing.nvim", opts = {} },
  },

  config = function()
    local code = require("codecompanion")
    code.setup({
      -- ================= Adapter =================
      adapters = {
        http = {
          opts = {
            show_defaults = true,
            show_model_choices = true, -- ✅ 允许手动切 choice
          },
          deepseek = function()
            return require("codecompanion.adapters").extend("deepseek", {
              name = "deepseek",
              env = {
                api_key = function()
                  return os.getenv("DEEPSEEK_API_KEY")
                end,
              },
              opts = {
                temperature = 0.7,
                max_tokens = 2048,
                top_p = 0.95,
                frequency_penalty = 0,
                presence_penalty = 0,
              },
              schema = {
                model = {
                  -- ===== 默认模型（不思考，省 token）=====
                  default = "deepseek-chat",
                  -- ===== 可选模型 =====
                  -- choices = {
                  --   "deepseek-chat",
                  --   "deepseek-coder",
                  --   ["deepseek-reasoner"] = {
                  --     opts = { can_reason = true }, -- ✅ 明确是思考型
                  --   },
                  -- },
                },
              },
            })
          end,
        },
      },
      -- ================= Interactions =================
      interactions = {
        chat = {
          adapter = "deepseek", -- 默认 chat → deepseek-chat
        },
        inline = {
          adapter = "deepseek", -- inline 也可手动切 coder
        },
      },
      -- ================= UI =================
      display = {
        chat = {
          show_settings = true,
          render_headers = true,
          window = {
            layout = "vertical",
            width = 0.35,
          },
        },
      },
      -- ================= Global =================
      opts = {
        language = "Chinese",
      },
    })
  end,
  -- ================= Keymaps =================
  keys = {
    { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "AI Chat" },
    { "<leader>ap", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI Actions" },
    { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add code to AI chat" },
    { "<leader>ai", ":CodeCompanion ", mode = { "n", "v" }, desc = "AI Inline Instruction" },
  },
}
