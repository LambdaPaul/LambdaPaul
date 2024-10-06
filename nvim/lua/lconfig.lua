vim.g.mapleader = ' '

vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.scrolloff = 8
vim.opt.laststatus = 2
vim.opt.colorcolumn = '80'
vim.opt.signcolumn = 'no'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
    },
})

local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('junegunn/fzf', { ['do'] = function() vim.call('fzf#install') end })
Plug 'junegunn/fzf.vim'

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'nvim-lualine/lualine.nvim'

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'delphinus/cmp-ctags'
Plug 'onsails/lspkind.nvim'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

Plug('williamboman/mason.nvim', { ['do'] = ':MasonUpdate' })
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'stevearc/conform.nvim'

Plug 'folke/trouble.nvim'
Plug 'b0o/schemastore.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'andymass/vim-matchup'
Plug 'goolord/alpha-nvim'

Plug 'windwp/nvim-autopairs'
Plug 'mbbill/undotree'

Plug 'max397574/better-escape.nvim'

Plug 'tzachar/highlight-undo.nvim'
Plug 'folke/which-key.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'tanvirtin/monokai.nvim'
Plug 'folke/noice.nvim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'

Plug 'github/copilot.vim'


vim.call('plug#end')
