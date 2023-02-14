-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use({'wbthomason/packer.nvim'})

    -- Sqlite for plugins to persist metadata across sessions.
    use({"kkharji/sqlite.lua"})

    -- FZF (much better than Telescope)
    use({'ibhagwan/fzf-lua'})

    -- Clipboard manager
    use({
        "AckslD/nvim-neoclip.lua",
        requires = {
            {'kkharji/sqlite.lua', module = 'sqlite'},
            {'ibhagwan/fzf-lua'},
        },
    })

    use({"lukas-reineke/indent-blankline.nvim"})

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use('nvim-lua/plenary.nvim')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    -- Status bar
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    })

    -- Highlight instances of the same symbol
    use('RRethy/vim-illuminate')

    -- Session management.
    use({'rmagatti/auto-session'})

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            --{'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            --{'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    -- Python linting
    use({'jose-elias-alvarez/null-ls.nvim'})

    -- Easily surround selection with quotes/brackets/etc.
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({})
        end
    })

    -- Github Copilot
    use({
        'zbirenbaum/copilot.lua',
        cmd = "Copilot",
        event = "InsertEnter",
        config = function ()
            require('copilot').setup({
                suggestion = {
                    enabled = true,
                },
                panel = {
                    enabled = true,
                },
                filetypes = {
                    python = true,
                },
            })
        end,
    })
    -- use({
    --     "zbirenbaum/copilot-cmp",
    --     after = { "copilot.lua" },
    --     config = function()
    --         require('copilot_cmp').setup()
    --     end,
    -- })

    -- Note taking.
    use({
        'phaazon/mind.nvim',
        branch = 'v2.2',
        config = function()
            require('mind').setup()
        end
    })

    -- Navigate buffer with 2 characters.
    use({
        'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end,
    })

    -- Keyboard shortcuts helper.
    use({
        'folke/which-key.nvim',
        config = function()
            require("which-key").setup({})
        end,
    })

    -- Icons
    use({'ryanoasis/vim-devicons'})

    -- Theme
    use({
        'folke/tokyonight.nvim',
        as = 'tokyonight',
        config = function()
            require('tokyonight').setup {
                style = 'night',
                dim_inactive = true,
            }
            vim.cmd('colorscheme tokyonight')
        end
    })

    -- Random
    use({'ThePrimeagen/vim-be-good'})

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)