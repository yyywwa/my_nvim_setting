local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-----------------------windows------------------------------------
keymap("n", "s", "", opts)
-- windows 分屏快捷键
-- 上下
keymap("n", "sv", ":vsp<CR>", opts)
--左右
keymap("n", "sh", ":sp<CR>", opts)
-- 关闭当前
keymap("n", "sc", "<C-w>c", opts)
-- 关闭其他
keymap("n", "so", "<C-w>o", opts)
-- Alt + hjkl  窗口之间跳转
-- keymap("n", "<leader>h", "w | <C-w>h", opts)
-- keymap("n", "<leader>j", "w | <C-w>j", opts)
-- keymap("n", "<leader>k", "w | <C-w>k", opts)
-- keymap("n", "<leader>l", "w | <C-w>l", opts)
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)
-- 左右比例控制
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "s,", ":vertical resize -20<CR>", opts)
keymap("n", "s.", ":vertical resize +20<CR>", opts)
-- 上下比例
keymap("n", "sj", ":resize +10<CR>", opts)
keymap("n", "sk", ":resize -10<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- 等比例
keymap("n", "s=", "<C-w>=", opts)
-----------------------windows------------------------------------
