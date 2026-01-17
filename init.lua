-- 获取当前 Neovim 进程的 PATH 环境变量
local current_path = vim.env.PATH
-- 定义 Mason 的 bin 目录 (如果你也通过 Mason 安装了工具)
local mason_bin_path = vim.fn.stdpath("data") .. "/mason/bin"
-- 将新路径添加到当前 PATH 的前面 (这样它有更高的优先级)
vim.env.PATH = mason_bin_path .. ":" .. current_path
vim.env.LANG = "C"
vim.lsp.set_log_level("error")
vim.opt.termguicolors = true
require("core.lsp")
require("core.basic")
require("core.global")
require("core.keymap")
require("core.lazy-config")
