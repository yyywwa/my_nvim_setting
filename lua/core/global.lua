-- ⚙️ 简化并修正后的 generate_compile_commands 函数
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function generate_compile_commands(lang)
    -- 项目根目录
    local root_dir = vim.fn.getcwd()
    local build_dir_name = "build"
    
    -- 检查 CMakeLists.txt
    if vim.fn.filereadable(root_dir .. "/CMakeLists.txt") == 0 then
        print("❌ 错误: 在当前目录 (" .. root_dir .. ") 未找到 CMakeLists.txt。")
        return
    end

    local lang_lower = (lang or "c++"):lower()
    local use_c = lang_lower == "c"
    local use_cxx = lang_lower == "c++"
    local gcc_rpath = "/opt/gcc-15.2/lib64"

    -- 1. 构造 CMake 命令
    local cmake_cmd = "cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
    if use_c then
        cmake_cmd = cmake_cmd .. ' -DCMAKE_C_COMPILER="/opt/gcc-15.2/bin/gcc-15.2"'
    end
    if use_cxx then
        cmake_cmd = cmake_cmd .. ' -DCMAKE_CXX_COMPILER="/opt/gcc-15.2/bin/g++-15.2"'
        -- 链接标志通常不影响 clangd，但为了构建的完整性保留
        cmake_cmd = cmake_cmd .. ' -DCMAKE_CXX_LINK_FLAGS="-Wl,-rpath,' .. gcc_rpath .. '"'
    end
    -- 由于我们会在 build 目录下执行，所以源目录是 ".."
    cmake_cmd = cmake_cmd .. " .."

    -- 2. 构造完整的 Shell 命令序列 (使用同步执行 vim.fn.system)
    local cmd = string.format(
        [[
        echo "--- 清理并创建构建目录: %s" &&
        rm -rf %s &&
        mkdir -p %s &&
        echo "--- 运行 CMake 并生成 compile_commands.json..." &&
        cd %s && %s &&
        echo "--- 复制 compile_commands.json 到项目根目录..." &&
        cp compile_commands.json %s &&
        echo "✅ 完成"
        ]],
        build_dir_name,             -- 打印消息
        build_dir_name,             -- rm -rf
        build_dir_name,             -- mkdir -p
        build_dir_name,             -- cd build_dir_name
        cmake_cmd,                  -- 运行 cmake ..
        root_dir                    -- cp file to root_dir
    )

    print("⏳ 正在执行构建和文件复制命令 (Neovim将暂时卡住)...")
    
    -- 3. 同步执行命令
    local result = vim.fn.system(cmd)
    
    -- 4. 检查结果并给出提示
    if vim.v.shell_error ~= 0 then
        print("❌ 错误: 命令执行失败。请检查输出和路径。")
    else
        print("✅ 成功生成 compile_commands.json，请重启 Language Server")
    end
    
    print("--- Shell 输出 ---")
    print(result)
end

vim.g.generate_compile_commands = generate_compile_commands
