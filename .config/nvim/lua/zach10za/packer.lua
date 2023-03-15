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

    use({"lukas-reineke/indent-blankline.nvim"})

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    use('nvim-lua/plenary.nvim')
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

    -- Split single line arguments into multiple lines.
    use({
        'Wansmer/treesj',
        requires = {'nvim-treesitter'},
        config = function()
            require('treesj').setup()
        end
    })

    -- Per-repo settings
    use({'editorconfig/editorconfig-vim'})

    -- Adds comment abilit
    use({'terrortylor/nvim-comment'})

    -- Highlight f/F jumps
    use({'jinh0/eyeliner.nvim'})

    -- Github Copilot
    use({'github/copilot.vim'})

    -- Note taking.
    use({
        'phaazon/mind.nvim',
        branch = 'v2.2',
        config = function()
            require('mind').setup()
        end
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
