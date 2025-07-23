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
