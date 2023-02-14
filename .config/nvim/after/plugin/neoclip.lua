-- Clipboard manager.

local neoclip = require('neoclip')

-- Set shortcut to open neoclip
vim.keymap.set('n', '<leader>pp', require('neoclip.fzf'), {})

neoclip.setup({
    -- Save history in SQLite so it persists across sessions.
    enable_persistent_history = true,
    -- Sync history to SQLite on every yank.
    continuous_sync = true,
})


