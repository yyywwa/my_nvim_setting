return {
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
  },
  cmd = {
    "clangd",
    "--query-driver=/opt/gcc-15.2/bin/gcc-15.2,/opt/gcc-15.2/bin/g++-15.2", -- 支持 C 和 C++
    "--background-index",
    "--clang-tidy",
    "--log=error",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  root_markers = {
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac", -- AutoTools
  },
  single_file_support = true,
}
