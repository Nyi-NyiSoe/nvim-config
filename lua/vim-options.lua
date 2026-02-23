-- =====================
-- Leader (MUST be first)
-- =====================
vim.g.mapleader = " "

-- =====================
-- Editor settings
-- =====================
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Terminal on right
vim.keymap.set("n", "<leader>tt", function()
  vim.cmd("vsplit")
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, { desc = "Terminal Right Split" })
