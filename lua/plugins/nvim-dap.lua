return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  -- 使用 keys 定义快捷键，实现按键触发懒加载
  keys = {
    {
      "<leader>dj",
      function()
        require("dap").continue()
      end,
      desc = "Debug: Start/Continue",
    },
    {
      "<leader>dn",
      function()
        require("dap").step_over()
      end,
      desc = "Debug: Step Over",
    },
    {
      "<leader>ds",
      function()
        require("dap").step_into()
      end,
      desc = "Debug: Step Into",
    },
    {
      "<leader>df",
      function()
        require("dap").step_out()
      end,
      desc = "Debug: Step Out",
    },
    {
      "<leader>b",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Debug: Toggle Breakpoint",
    },
    {
      "<leader>B",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Debug: Set Breakpoint",
    },
    {
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      desc = "Debug: Toggle UI",
    },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    -- GDB 15 原生 DAP 适配器
    -- dap.adapters.gdb = {
    --   type = "executable",
    --   command = "gdb",
    --   args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
    -- }
    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      -- 自动获取 mason 安装的路径 (Linux 示例)
      command = "/home/ike/.local/share/nvim/mason/bin/OpenDebugAD7",
    }

    -- C/C++ 配置
    local c_config = {
      {
        name = "Launch (GDB 15)",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        justMyCode = true,
        stopAtBeginningOfMainSubprogram = false,
      },
    }
    dap.configurations.c = c_config
    dap.configurations.cpp = c_config

    -- 自动 UI 交互
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
