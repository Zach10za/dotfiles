local fzf = require('fzf-lua')

fzf.setup({})

vim.keymap.set('n', '<leader>ff', fzf.files, {})
vim.keymap.set('n', '<leader>fg', fzf.live_grep, {})
vim.keymap.set('n', '<leader>fb', fzf.buffers, {})
vim.keymap.set('n', '<leader>ft', fzf.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fo', fzf.lsp_workspace_symbols, {})
