vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move highlighted lines up and down.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in middle when scrolling half pages.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the middle.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Maintain paste buffer when replacing.
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank into system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Replace all instances of highlighted value
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Delete into void.
vim.keymap.set({"n", "v"}, "<leader>d", [[\"_d]])

-- Change "O" to make a new line below but stay in normal mode.
vim.keymap.set("n", "O", "o<esc>")

-- Expand parenthesis.
vim.keymap.set("n", "<leader>x", "f(a<enter><enter><esc>ki<tab>")

