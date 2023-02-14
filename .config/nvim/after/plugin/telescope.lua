-- Disable while testing fzf
--[[

local builtin = require('telescope.builtin')
local previewers = require('telescope.previewers')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function ()
    builtin.live_grep({max_results=10, grep_open_files=true})
end, {})

-- Load fzf-native extension.
require('telescope').setup{
    defaults = {
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        file_ignore_patterns = {
            'tests/',
            'deprecated/',
            '*.ipynb',
        },
    },
    extensions = {
        fzf = {
            fuzzy = false,
            case_mode = 'respect_case',
        },
    },
}

-- Extensions.
require('telescope').load_extension('fzf')
]]--

