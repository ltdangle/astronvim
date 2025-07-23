-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Allows C-w to escape terminal mode and act as a normal mode prefix
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], {
  noremap = true,
  silent = true,
  desc = "Escape terminal mode for window commands",
})

-- Automatically enter insert mode when opening a terminal
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function() vim.cmd "startinsert" end,
  desc = "Start terminal in insert mode",
})

-- Use Esc to exit terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], {
  desc = "Exit terminal mode",
})

-- Allow sending a literal Esc to the terminal by pressing it twice
vim.keymap.set("t", "<Esc><Esc>", "<Esc>", {
  desc = "Send literal Esc to terminal",
})
