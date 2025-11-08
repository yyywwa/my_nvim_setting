vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Lua 脚本：生成 compile_commands.json 文件
local function generate_compile_commands()
  -- 1. 检查当前工作目录
  local root_dir = vim.fn.getcwd()
  if vim.fn.filereadable(root_dir .. "/CMakeLists.txt") == 0 then
    print("错误: 在当前目录未找到 CMakeLists.txt。")
    return
  end
  -- ******** 重点修改部分：将构建目录名改为 "build" ********
  local build_dir = "build"
  local json_file = build_dir .. "/compile_commands.json"
  -- 2. 构建 Shell 命令：清理，生成，并创建软链接
  local cmd = string.format(
    [[
        echo "--- 1. 清理并创建构建目录： %s" &&
        rm -rf %s &&
        mkdir -p %s &&
        
        echo "--- 2. 运行 CMake 并生成 JSON 文件..." &&
        cd %s &&
        # '..' 是指向上层目录的 CMakeLists.txt
        # -DCMAKE_EXPORT_COMPILE_COMMANDS=ON 是关键
        cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .. &&
        echo "--- 3. 链接 JSON 文件到根目录..." &&
        cd .. &&
        rm -f compile_commands.json &&
        ln -s %s compile_commands.json &&
        echo "✅ 成功生成 compile_commands.json, 请重启 Language Server"
    ]],
    build_dir,
    build_dir,
    build_dir,
    build_dir,
    json_file
  )
  -- 3. 在 Neovim 中执行 Shell 命令
  local result = vim.fn.system(cmd)
  print(result)
end
-- 4. 导出函数，供快捷键调用
vim.g.generate_compile_commands = generate_compile_commands
