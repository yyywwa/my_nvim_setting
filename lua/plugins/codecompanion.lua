return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },

  config = function()
    local code = require("codecompanion")

    local function sf_adapter(model_name)
      return require("codecompanion.adapters").extend("openai", {
        name = model_name,
        url = "https://api.siliconflow.cn/v1/chat/completions",
        env = {
          api_key = "SILICONFLOW_API_KEY", -- 插件会自动从环境变量读取
        },
        schema = {
          model = { default = model_name },
          temperature = { default = 0.2 },
          max_tokens = { default = 2048 },
          top_p = { default = 0.95 },
          frequency_penalty = { default = 0 },
          presence_penalty = { default = 0 },
        },
      })
    end

    code.setup({
      adapters = {
        http = {
          opts = {
            show_defaults = true,
            show_model_choices = true,
          },
          deepseek_sf_free = sf_adapter("deepseek-ai/DeepSeek-R1-0528-Qwen3-8B"),
          deepseek_sf = sf_adapter("deepseek-ai/DeepSeek-V3"),
        },
      },
      -- ================= Interactions =================
      strategies = {
        chat = {
          adapter = "deepseek_sf_free",
        },
        inline = {
          adapter = "deepseek_sf",
        },
      },
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
