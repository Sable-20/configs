local map = vim.keymap.set

map("n", "hsc", "<ESC>I--<space>", { desc = "Create a haskell single line comment" })
map("n", "hc", "<ESC>I#<space>", { desc = "Create a hashtag comment for languages that use it" })
