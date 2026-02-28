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

vim.opt.autochdir = true

-- =====================
-- Bottom Terminal Toggle
-- =====================

local terminal_buf = nil
local terminal_win = nil

vim.keymap.set("n", "<leader>tt", function()
  -- If terminal is open → close it
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_close(terminal_win, true)
    terminal_win = nil
    return
  end

  -- Open horizontal split at bottom
  vim.cmd("split")
  vim.cmd("wincmd J")
  vim.cmd("resize 15") -- height

  -- Reuse terminal if exists
  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    terminal_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(terminal_win, terminal_buf)
  else
    vim.cmd("terminal")
    terminal_buf = vim.api.nvim_get_current_buf()
    terminal_win = vim.api.nvim_get_current_win()
  end

  vim.cmd("startinsert")
end, { desc = "Toggle Bottom Terminal" })


vim.api.nvim_create_user_command("Rename", function(opts)
  local old = vim.fn.expand("%")
  local new = opts.args
  vim.cmd("saveas " .. new)
  vim.cmd("silent !rm " .. old)
  vim.cmd("bd " .. old)
end, { nargs = 1 })
