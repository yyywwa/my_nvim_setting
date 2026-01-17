return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    -- 1. 定义一个变量来保存当前 Nvim 实例生成的会话名
    -- 使用随机数或时间戳，确保同时打开多个 Nvim 实例时不会互相冲突
    local zellij_session_name = "nvim_tt_" .. os.time() .. "_" .. math.random(1000, 9999)

    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      start_in_insert = true,
      shade_terminals = false,
      direction = "float",
      -- 2. 启动时强制给 zellij 指定这个唯一的 session 名
      shell = string.format("fish -c 'SHELL=fish zellij -s %s'", zellij_session_name),
      float_opts = {
        border = "curved",
      },
    })

    -- 3. 核心：监听 Vim 退出事件
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        -- 仅删除该 Nvim 实例保存的那个特定会话
        -- -f 表示强制执行，即使会话还在 EXITED 状态也能删干净
        local cmd = string.format("zellij delete-session -f %s", zellij_session_name)

        -- 使用 os.execute 执行，并不显示输出以免阻塞退出
        os.execute(cmd .. " > /dev/null 2>&1")
      end,
    })
  end,
}
